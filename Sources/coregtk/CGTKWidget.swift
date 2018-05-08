/*
 * CGTKWidget.swift
 * This file is part of CoreGTK
 *
 * Copyright (C) 2017 - Tyler Burton
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

/*
 * Modified by the CoreGTK Team, 2016. See the AUTHORS file for a
 * list of people on the CoreGTK Team.
 * See the ChangeLog files for a list of changes.
 *
 */

@_exported import CGtk

/// GtkWidget is the base class all widgets in GTK+ derive from. It manages the
/// widget lifecycle, states and style.
/// # Height-for-width Geometry Management # {#geometry-management}
/// GTK+ uses a height-for-width (and width-for-height) geometry management
/// system. Height-for-width means that a widget can change how much
/// vertical space it needs, depending on the amount of horizontal space
/// that it is given (and similar for width-for-height). The most common
/// example is a label that reflows to fill up the available width, wraps
/// to fewer lines, and therefore needs less height.
/// Height-for-width geometry management is implemented in GTK+ by way
/// of five virtual methods:
/// - #GtkWidgetClass.get_request_mode()
/// - #GtkWidgetClass.get_preferred_width()
/// - #GtkWidgetClass.get_preferred_height()
/// - #GtkWidgetClass.get_preferred_height_for_width()
/// - #GtkWidgetClass.get_preferred_width_for_height()
/// - #GtkWidgetClass.get_preferred_height_and_baseline_for_width()
/// There are some important things to keep in mind when implementing
/// height-for-width and when using it in container implementations.
/// The geometry management system will query a widget hierarchy in
/// only one orientation at a time. When widgets are initially queried
/// for their minimum sizes it is generally done in two initial passes
/// in the #GtkSizeRequestMode chosen by the toplevel.
/// For example, when queried in the normal
/// %GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH mode:
/// First, the default minimum and natural width for each widget
/// in the interface will be computed using gtk_widget_get_preferred_width().
/// Because the preferred widths for each container depend on the preferred
/// widths of their children, this information propagates up the hierarchy,
/// and finally a minimum and natural width is determined for the entire
/// toplevel. Next, the toplevel will use the minimum width to query for the
/// minimum height contextual to that width using
/// gtk_widget_get_preferred_height_for_width(), which will also be a highly
/// recursive operation. The minimum height for the minimum width is normally
/// used to set the minimum size constraint on the toplevel
/// (unless gtk_window_set_geometry_hints() is explicitly used instead).
/// After the toplevel window has initially requested its size in both
/// dimensions it can go on to allocate itself a reasonable size (or a size
/// previously specified with gtk_window_set_default_size()). During the
/// recursive allocation process it’s important to note that request cycles
/// will be recursively executed while container widgets allocate their children.
/// Each container widget, once allocated a size, will go on to first share the
/// space in one orientation among its children and then request each child's
/// height for its target allocated width or its width for allocated height,
/// depending. In this way a #GtkWidget will typically be requested its size
/// a number of times before actually being allocated a size. The size a
/// widget is finally allocated can of course differ from the size it has
/// requested. For this reason, #GtkWidget caches a  small number of results
/// to avoid re-querying for the same sizes in one allocation cycle.
/// See
/// [GtkContainer’s geometry management section][container-geometry-management]
/// to learn more about how height-for-width allocations are performed
/// by container widgets.
/// If a widget does move content around to intelligently use up the
/// allocated size then it must support the request in both
/// #GtkSizeRequestModes even if the widget in question only
/// trades sizes in a single orientation.
/// For instance, a #GtkLabel that does height-for-width word wrapping
/// will not expect to have #GtkWidgetClass.get_preferred_height() called
/// because that call is specific to a width-for-height request. In this
/// case the label must return the height required for its own minimum
/// possible width. By following this rule any widget that handles
/// height-for-width or width-for-height requests will always be allocated
/// at least enough space to fit its own content.
/// Here are some examples of how a %GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH widget
/// generally deals with width-for-height requests, for #GtkWidgetClass.get_preferred_height()
/// it will do:
/// |[<!-- language="C" -->
/// static void
/// foo_widget_get_preferred_height (GtkWidget *widget,
/// gint *min_height,
/// gint *nat_height)
/// {
/// if (i_am_in_height_for_width_mode)
/// {
/// gint min_width, nat_width;
/// GTK_WIDGET_GET_CLASS (widget)->get_preferred_width (widget,
/// &min_width,
/// &nat_width);
/// GTK_WIDGET_GET_CLASS (widget)->get_preferred_height_for_width
/// (widget,
/// min_width,
/// min_height,
/// nat_height);
/// }
/// else
/// {
/// ... some widgets do both. For instance, if a GtkLabel is
/// rotated to 90 degrees it will return the minimum and
/// natural height for the rotated label here.
/// }
/// }
/// ]|
/// And in #GtkWidgetClass.get_preferred_width_for_height() it will simply return
/// the minimum and natural width:
/// |[<!-- language="C" -->
/// static void
/// foo_widget_get_preferred_width_for_height (GtkWidget *widget,
/// gint for_height,
/// gint *min_width,
/// gint *nat_width)
/// {
/// if (i_am_in_height_for_width_mode)
/// {
/// GTK_WIDGET_GET_CLASS (widget)->get_preferred_width (widget,
/// min_width,
/// nat_width);
/// }
/// else
/// {
/// ... again if a widget is sometimes operating in
/// width-for-height mode (like a rotated GtkLabel) it can go
/// ahead and do its real width for height calculation here.
/// }
/// }
/// ]|
/// Often a widget needs to get its own request during size request or
/// allocation. For example, when computing height it may need to also
/// compute width. Or when deciding how to use an allocation, the widget
/// may need to know its natural size. In these cases, the widget should
/// be careful to call its virtual methods directly, like this:
/// |[<!-- language="C" -->
/// GTK_WIDGET_GET_CLASS(widget)->get_preferred_width (widget,
/// &min,
/// &natural);
/// ]|
/// It will not work to use the wrapper functions, such as
/// gtk_widget_get_preferred_width() inside your own size request
/// implementation. These return a request adjusted by #GtkSizeGroup
/// and by the #GtkWidgetClass.adjust_size_request() virtual method. If a
/// widget used the wrappers inside its virtual method implementations,
/// then the adjustments (such as widget margins) would be applied
/// twice. GTK+ therefore does not allow this and will warn if you try
/// to do it.
/// Of course if you are getting the size request for
/// another widget, such as a child of a
/// container, you must use the wrapper APIs.
/// Otherwise, you would not properly consider widget margins,
/// #GtkSizeGroup, and so forth.
/// Since 3.10 GTK+ also supports baseline vertical alignment of widgets. This
/// means that widgets are positioned such that the typographical baseline of
/// widgets in the same row are aligned. This happens if a widget supports baselines,
/// has a vertical alignment of %GTK_ALIGN_BASELINE, and is inside a container
/// that supports baselines and has a natural “row” that it aligns to the baseline,
/// or a baseline assigned to it by the grandparent.
/// Baseline alignment support for a widget is done by the #GtkWidgetClass.get_preferred_height_and_baseline_for_width()
/// virtual function. It allows you to report a baseline in combination with the
/// minimum and natural height. If there is no baseline you can return -1 to indicate
/// this. The default implementation of this virtual function calls into the
/// #GtkWidgetClass.get_preferred_height() and #GtkWidgetClass.get_preferred_height_for_width(),
/// so if baselines are not supported it doesn’t need to be implemented.
/// If a widget ends up baseline aligned it will be allocated all the space in the parent
/// as if it was %GTK_ALIGN_FILL, but the selected baseline can be found via gtk_widget_get_allocated_baseline().
/// If this has a value other than -1 you need to align the widget such that the baseline
/// appears at the position.
/// # Style Properties
/// #GtkWidget introduces “style
/// properties” - these are basically object properties that are stored
/// not on the object, but in the style object associated to the widget. Style
/// properties are set in [resource files][gtk3-Resource-Files].
/// This mechanism is used for configuring such things as the location of the
/// scrollbar arrows through the theme, giving theme authors more control over the
/// look of applications without the need to write a theme engine in C.
/// Use gtk_widget_class_install_style_property() to install style properties for
/// a widget class, gtk_widget_class_find_style_property() or
/// gtk_widget_class_list_style_properties() to get information about existing
/// style properties and gtk_widget_style_get_property(), gtk_widget_style_get() or
/// gtk_widget_style_get_valist() to obtain the value of a style property.
/// # GtkWidget as GtkBuildable
/// The GtkWidget implementation of the GtkBuildable interface supports a
/// custom <accelerator> element, which has attributes named ”key”, ”modifiers”
/// and ”signal” and allows to specify accelerators.
/// An example of a UI definition fragment specifying an accelerator:
/// |[
/// <object class="GtkButton">
/// <accelerator key="q" modifiers="GDK_CONTROL_MASK" signal="clicked"/>
/// </object>
/// ]|
/// In addition to accelerators, GtkWidget also support a custom <accessible>
/// element, which supports actions and relations. Properties on the accessible
/// implementation of an object can be set by accessing the internal child
/// “accessible” of a #GtkWidget.
/// An example of a UI definition fragment specifying an accessible:
/// |[
/// <object class="GtkButton" id="label1"/>
/// <property name="label">I am a Label for a Button</property>
/// </object>
/// <object class="GtkButton" id="button1">
/// <accessibility>
/// <action action_name="click" translatable="yes">Click the button.</action>
/// <relation target="label1" type="labelled-by"/>
/// </accessibility>
/// <child internal-child="accessible">
/// <object class="AtkObject" id="a11y-button1">
/// <property name="accessible-name">Clickable Button</property>
/// </object>
/// </child>
/// </object>
/// ]|
/// Finally, GtkWidget allows style information such as style classes to
/// be associated with widgets, using the custom <style> element:
/// |[
/// <object class="GtkButton" id="button1">
/// <style>
/// <class name="my-special-button-class"/>
/// <class name="dark-button"/>
/// </style>
/// </object>
/// ]|
/// # Building composite widgets from template XML ## {#composite-templates}
/// GtkWidget exposes some facilities to automate the procedure
/// of creating composite widgets using #GtkBuilder interface description
/// language.
/// To create composite widgets with #GtkBuilder XML, one must associate
/// the interface description with the widget class at class initialization
/// time using gtk_widget_class_set_template().
/// The interface description semantics expected in composite template descriptions
/// is slightly different from regular #GtkBuilder XML.
/// Unlike regular interface descriptions, gtk_widget_class_set_template() will
/// expect a <template> tag as a direct child of the toplevel <interface>
/// tag. The <template> tag must specify the “class” attribute which must be
/// the type name of the widget. Optionally, the “parent” attribute may be
/// specified to specify the direct parent type of the widget type, this is
/// ignored by the GtkBuilder but required for Glade to introspect what kind
/// of properties and internal children exist for a given type when the actual
/// type does not exist.
/// The XML which is contained inside the <template> tag behaves as if it were
/// added to the <object> tag defining @widget itself. You may set properties
/// on @widget by inserting <property> tags into the <template> tag, and also
/// add <child> tags to add children and extend @widget in the normal way you
/// would with <object> tags.
/// Additionally, <object> tags can also be added before and after the initial
/// <template> tag in the normal way, allowing one to define auxiliary objects
/// which might be referenced by other widgets declared as children of the
/// <template> tag.
/// An example of a GtkBuilder Template Definition:
/// |[
/// <interface>
/// <template class="FooWidget" parent="GtkBox">
/// <property name="orientation">GTK_ORIENTATION_HORIZONTAL</property>
/// <property name="spacing">4</property>
/// <child>
/// <object class="GtkButton" id="hello_button">
/// <property name="label">Hello World</property>
/// <signal name="clicked" handler="hello_button_clicked" object="FooWidget" swapped="yes"/>
/// </object>
/// </child>
/// <child>
/// <object class="GtkButton" id="goodbye_button">
/// <property name="label">Goodbye World</property>
/// </object>
/// </child>
/// </template>
/// </interface>
/// ]|
/// Typically, you'll place the template fragment into a file that is
/// bundled with your project, using #GResource. In order to load the
/// template, you need to call gtk_widget_class_set_template_from_resource()
/// from the class initialization of your #GtkWidget type:
/// |[<!-- language="C" -->
/// static void
/// foo_widget_class_init (FooWidgetClass *klass)
/// {
/// // ...
/// gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
/// "/com/example/ui/foowidget.ui");
/// }
/// ]|
/// You will also need to call gtk_widget_init_template() from the instance
/// initialization function:
/// |[<!-- language="C" -->
/// static void
/// foo_widget_init (FooWidget *self)
/// {
/// // ...
/// gtk_widget_init_template (GTK_WIDGET (self));
/// }
/// ]|
/// You can access widgets defined in the template using the
/// gtk_widget_get_template_child() function, but you will typically declare
/// a pointer in the instance private data structure of your type using the same
/// name as the widget in the template definition, and call
/// gtk_widget_class_bind_template_child_private() with that name, e.g.
/// |[<!-- language="C" -->
/// typedef struct {
/// GtkWidget *hello_button;
/// GtkWidget *goodbye_button;
/// } FooWidgetPrivate;
/// G_DEFINE_TYPE_WITH_PRIVATE (FooWidget, foo_widget, GTK_TYPE_BOX)
/// static void
/// foo_widget_class_init (FooWidgetClass *klass)
/// {
/// // ...
/// gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
/// "/com/example/ui/foowidget.ui");
/// gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),
/// FooWidget, hello_button);
/// gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),
/// FooWidget, goodbye_button);
/// }
/// static void
/// foo_widget_init (FooWidget *widget)
/// {
/// }
/// ]|
/// You can also use gtk_widget_class_bind_template_callback() to connect a signal
/// callback defined in the template with a function visible in the scope of the
/// class, e.g.
/// |[<!-- language="C" -->
/// // the signal handler has the instance and user data swapped
/// // because of the swapped="yes" attribute in the template XML
/// static void
/// hello_button_clicked (FooWidget *self,
/// GtkButton *button)
/// {
/// g_print ("Hello, world!\n");
/// }
/// static void
/// foo_widget_class_init (FooWidgetClass *klass)
/// {
/// // ...
/// gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
/// "/com/example/ui/foowidget.ui");
/// gtk_widget_class_bind_template_callback (GTK_WIDGET_CLASS (klass), hello_button_clicked);
/// }
/// ]|


open class CGTKWidget : CGTKBase, CGTKBuildable {
	/// Obtains the current default reading direction. See
	/// gtk_widget_set_default_direction().
	/// - Returns: GtkTextDirection (GtkTextDirection)
	open class func getDefaultDirection() -> GtkTextDirection {
		return gtk_widget_get_default_direction()
	}

	/// Returns the default style used by all widgets initially.
	/// - Returns: UnsafeMutablePointer<GtkStyle>! (GtkStyle*)
	open class func getDefaultStyle() -> UnsafeMutablePointer<GtkStyle>! {
		return gtk_widget_get_default_style()
	}

	/// Cancels the effect of a previous call to gtk_widget_push_composite_child().
	open class func popCompositeChild() -> Swift.Void {
		gtk_widget_pop_composite_child()
	}

	/// Makes all newly-created widgets as composite children until
	/// the corresponding gtk_widget_pop_composite_child() call.
	/// A composite child is a child that’s an implementation detail of the
	/// container it’s inside and should not be visible to people using the
	/// container. Composite children aren’t treated differently by GTK+ (but
	/// see gtk_container_foreach() vs. gtk_container_forall()), but e.g. GUI
	/// builders might want to treat them in a different way.
	open class func pushCompositeChild() -> Swift.Void {
		gtk_widget_push_composite_child()
	}

	/// Sets the default reading direction for widgets where the
	/// direction has not been explicitly set by gtk_widget_set_direction().
	/// - Parameters:
	///	- dir: GtkTextDirection (GtkTextDirection)
	open class func setDefaultDirection(dir: GtkTextDirection) -> Swift.Void {
		gtk_widget_set_default_direction(dir)
	}

	/// For widgets that can be “activated” (buttons, menu items, etc.)
	/// this function activates them. Activation is what happens when you
	/// press Enter on a widget during key navigation. If @widget isn't
	/// activatable, the function returns %FALSE.
	/// - Returns: Bool (gboolean)
	open func activate() -> Bool {
		return gtk_widget_activate(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Installs an accelerator for this @widget in @accel_group that causes
	/// @accel_signal to be emitted if the accelerator is activated.
	/// The @accel_group needs to be added to the widget’s toplevel via
	/// gtk_window_add_accel_group(), and the signal must be of type %G_SIGNAL_ACTION.
	/// Accelerators added through this function are not user changeable during
	/// runtime. If you want to support accelerators that can be changed by the
	/// user, use gtk_accel_map_add_entry() and gtk_widget_set_accel_path() or
	/// gtk_menu_item_set_accel_path() instead.
	/// - Parameters:
	///	- accelSignal: String (const gchar*)
	///	- accelGroup: UnsafeMutablePointer<GtkAccelGroup>! (GtkAccelGroup*)
	///	- accelKey: guint (guint)
	///	- accelMods: GdkModifierType (GdkModifierType)
	///	- accelFlags: GtkAccelFlags (GtkAccelFlags)
	open func addAccelerator(accelSignal: String, accelGroup: UnsafeMutablePointer<GtkAccelGroup>!, accelKey: guint, accelMods: GdkModifierType, accelFlags: GtkAccelFlags) -> Swift.Void {
		gtk_widget_add_accelerator(GTK_WIDGET(self.GOBJECT), accelSignal, accelGroup, accelKey, accelMods, accelFlags)
	}

	/// Adds the device events in the bitfield @events to the event mask for
	/// @widget. See gtk_widget_set_device_events() for details.
	/// - Parameters:
	///	- device: OpaquePointer! (GdkDevice*)
	///	- events: GdkEventMask (GdkEventMask)
	open func addDeviceEvents(device: OpaquePointer!, events: GdkEventMask) -> Swift.Void {
		gtk_widget_add_device_events(GTK_WIDGET(self.GOBJECT), device, events)
	}

	/// Adds the events in the bitfield @events to the event mask for
	/// @widget. See gtk_widget_set_events() and the
	/// [input handling overview][event-masks] for details.
	/// - Parameters:
	///	- events: gint (gint)
	open func addEvents(_ events: gint) -> Swift.Void {
		gtk_widget_add_events(GTK_WIDGET(self.GOBJECT), events)
	}

	/// Adds a widget to the list of mnemonic labels for
	/// this widget. (See gtk_widget_list_mnemonic_labels()). Note the
	/// list of mnemonic labels for the widget is cleared when the
	/// widget is destroyed, so the caller must make sure to update
	/// its internal state at this point as well, by using a connection
	/// to the #GtkWidget::destroy signal or a weak notifier.
	/// - Parameters:
	///	- label: CGTKWidget (GtkWidget*)
	open func addMnemonicLabel(_ label: CGTKWidget) -> Swift.Void {
		gtk_widget_add_mnemonic_label(GTK_WIDGET(self.GOBJECT), label.WIDGET)
	}

	/// Queues an animation frame update and adds a callback to be called
	/// before each frame. Until the tick callback is removed, it will be
	/// called frequently (usually at the frame rate of the output device
	/// or as quickly as the application can be repainted, whichever is
	/// slower). For this reason, is most suitable for handling graphics
	/// that change every frame or every few frames. The tick callback does
	/// not automatically imply a relayout or repaint. If you want a
	/// repaint or relayout, and aren’t changing widget properties that
	/// would trigger that (for example, changing the text of a #GtkLabel),
	/// then you will have to call gtk_widget_queue_resize() or
	/// gtk_widget_queue_draw_area() yourself.
	/// gdk_frame_clock_get_frame_time() should generally be used for timing
	/// continuous animations and
	/// gdk_frame_timings_get_predicted_presentation_time() if you are
	/// trying to display isolated frames at particular times.
	/// This is a more convenient alternative to connecting directly to the
	/// #GdkFrameClock::update signal of #GdkFrameClock, since you don't
	/// have to worry about when a #GdkFrameClock is assigned to a widget.
	/// - Parameters:
	///	- callback: @escaping GtkTickCallback (GtkTickCallback)
	///	- userData: gpointer? (gpointer)
	///	- notify: @escaping GDestroyNotify (GDestroyNotify)
	/// - Returns: guint (guint)
	open func addTickCallback(_ callback: @escaping GtkTickCallback, userData: gpointer?, notify: @escaping GDestroyNotify) -> guint {
		return gtk_widget_add_tick_callback(GTK_WIDGET(self.GOBJECT), callback, userData, notify)
	}

	/// Determines whether an accelerator that activates the signal
	/// identified by @signal_id can currently be activated.
	/// This is done by emitting the #GtkWidget::can-activate-accel
	/// signal on @widget; if the signal isn’t overridden by a
	/// handler or in a derived widget, then the default check is
	/// that the widget must be sensitive, and the widget and all
	/// its ancestors mapped.
	/// - Parameters:
	///	- signalId: guint (guint)
	/// - Returns: Bool (gboolean)
	open func canActivateAccel(signalId: guint) -> Bool {
		return gtk_widget_can_activate_accel(GTK_WIDGET(self.GOBJECT), signalId) != 0 ? true : false
	}

	/// This function is used by custom widget implementations; if you're
	/// writing an app, you’d use gtk_widget_grab_focus() to move the focus
	/// to a particular widget, and gtk_container_set_focus_chain() to
	/// change the focus tab order. So you may want to investigate those
	/// functions instead.
	/// gtk_widget_child_focus() is called by containers as the user moves
	/// around the window using keyboard shortcuts. @direction indicates
	/// what kind of motion is taking place (up, down, left, right, tab
	/// forward, tab backward). gtk_widget_child_focus() emits the
	/// #GtkWidget::focus signal; widgets override the default handler
	/// for this signal in order to implement appropriate focus behavior.
	/// The default ::focus handler for a widget should return %TRUE if
	/// moving in @direction left the focus on a focusable location inside
	/// that widget, and %FALSE if moving in @direction moved the focus
	/// outside the widget. If returning %TRUE, widgets normally
	/// call gtk_widget_grab_focus() to place the focus accordingly;
	/// if returning %FALSE, they don’t modify the current focus location.
	/// - Parameters:
	///	- direction: GtkDirectionType (GtkDirectionType)
	/// - Returns: Bool (gboolean)
	open func childFocus(direction: GtkDirectionType) -> Bool {
		return gtk_widget_child_focus(GTK_WIDGET(self.GOBJECT), direction) != 0 ? true : false
	}

	/// Emits a #GtkWidget::child-notify signal for the
	/// [child property][child-properties] @child_property
	/// on @widget.
	/// This is the analogue of g_object_notify() for child properties.
	/// Also see gtk_container_child_notify().
	/// - Parameters:
	///	- childProperty: String (const gchar*)
	open func childNotify(childProperty: String) -> Swift.Void {
		gtk_widget_child_notify(GTK_WIDGET(self.GOBJECT), childProperty)
	}

	/// Same as gtk_widget_path(), but always uses the name of a widget’s type,
	/// never uses a custom name set with gtk_widget_set_name().
	/// - Parameters:
	///	- pathLength: UnsafeMutablePointer<UInt32>! (guint*)
	///	- path: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! (UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!)
	///	- pathReversed: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! (UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!)
	open func classPath(pathLength: UnsafeMutablePointer<UInt32>!, path: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!, pathReversed: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!) -> Swift.Void {
		gtk_widget_class_path(GTK_WIDGET(self.GOBJECT), pathLength, path, pathReversed)
	}

	/// Computes whether a container should give this widget extra space
	/// when possible. Containers should check this, rather than
	/// looking at gtk_widget_get_hexpand() or gtk_widget_get_vexpand().
	/// This function already checks whether the widget is visible, so
	/// visibility does not need to be checked separately. Non-visible
	/// widgets are not expanded.
	/// The computed expand value uses either the expand setting explicitly
	/// set on the widget itself, or, if none has been explicitly set,
	/// the widget may expand if some of its children do.
	/// - Parameters:
	///	- orientation: GtkOrientation (GtkOrientation)
	/// - Returns: Bool (gboolean)
	open func computeExpand(orientation: GtkOrientation) -> Bool {
		return gtk_widget_compute_expand(GTK_WIDGET(self.GOBJECT), orientation) != 0 ? true : false
	}

	/// Creates a new #PangoContext with the appropriate font map,
	/// font options, font description, and base direction for drawing
	/// text for this widget. See also gtk_widget_get_pango_context().
	/// - Returns: OpaquePointer (PangoContext*)
	open func createPangoContext() -> OpaquePointer {
		return gtk_widget_create_pango_context(GTK_WIDGET(self.GOBJECT))
	}

	/// Creates a new #PangoLayout with the appropriate font map,
	/// font description, and base direction for drawing text for
	/// this widget.
	/// If you keep a #PangoLayout created in this way around, you need
	/// to re-create it when the widget #PangoContext is replaced.
	/// This can be tracked by using the #GtkWidget::screen-changed signal
	/// on the widget.
	/// - Parameters:
	///	- text: String? (const gchar*)
	/// - Returns: OpaquePointer (PangoLayout*)
	open func createPangoLayout(text: String?) -> OpaquePointer {
		return gtk_widget_create_pango_layout(GTK_WIDGET(self.GOBJECT), text)
	}

	/// Destroys a widget.
	/// When a widget is destroyed all references it holds on other objects
	/// will be released:
	/// - if the widget is inside a container, it will be removed from its
	/// parent
	/// - if the widget is a container, all its children will be destroyed,
	/// recursively
	/// - if the widget is a top level, it will be removed from the list
	/// of top level widgets that GTK+ maintains internally
	/// It's expected that all references held on the widget will also
	/// be released; you should connect to the #GtkWidget::destroy signal
	/// if you hold a reference to @widget and you wish to remove it when
	/// this function is called. It is not necessary to do so if you are
	/// implementing a #GtkContainer, as you'll be able to use the
	/// #GtkContainerClass.remove() virtual function for that.
	/// It's important to notice that gtk_widget_destroy() will only cause
	/// the @widget to be finalized if no additional references, acquired
	/// using g_object_ref(), are held on it. In case additional references
	/// are in place, the @widget will be in an "inert" state after calling
	/// this function; @widget will still point to valid memory, allowing you
	/// to release the references you hold, but you may not query the widget's
	/// own state.
	/// You should typically call this function on top level widgets, and
	/// rarely on child widgets.
	/// See also: gtk_container_remove()
	open func destroy() -> Swift.Void {
		gtk_widget_destroy(GTK_WIDGET(self.GOBJECT))
	}

	/// This function sets *@widget_pointer to %NULL if @widget_pointer !=
	/// %NULL.  It’s intended to be used as a callback connected to the
	/// “destroy” signal of a widget. You connect gtk_widget_destroyed()
	/// as a signal handler, and pass the address of your widget variable
	/// as user data. Then when the widget is destroyed, the variable will
	/// be set to %NULL. Useful for example to avoid multiple copies
	/// of the same dialog.
	/// - Parameters:
	///	- widgetPointer: UnsafeMutablePointer<UnsafeMutablePointer<GtkWidget>?>! (GtkWidget**)
	open func destroyed(widgetPointer: UnsafeMutablePointer<UnsafeMutablePointer<GtkWidget>?>!) -> Swift.Void {
		gtk_widget_destroyed(GTK_WIDGET(self.GOBJECT), widgetPointer)
	}

	/// Returns %TRUE if @device has been shadowed by a GTK+
	/// device grab on another widget, so it would stop sending
	/// events to @widget. This may be used in the
	/// #GtkWidget::grab-notify signal to check for specific
	/// devices. See gtk_device_grab_add().
	/// - Parameters:
	///	- device: OpaquePointer! (GdkDevice*)
	/// - Returns: Bool (gboolean)
	open func deviceIsShadowed(device: OpaquePointer!) -> Bool {
		return gtk_widget_device_is_shadowed(GTK_WIDGET(self.GOBJECT), device) != 0 ? true : false
	}

	/// func gtkDragBegin(targets: OpaquePointer!, actions: GdkDragAction, button: gint, event: UnsafeMutablePointer<GdkEvent>!) -> OpaquePointer -> OpaquePointer
	/// - Parameters:
	///	- targets: OpaquePointer! (GtkTargetList*)
	///	- actions: GdkDragAction (GdkDragAction)
	///	- button: gint (gint)
	///	- event: UnsafeMutablePointer<GdkEvent>! (GdkEvent*)
	/// - Returns: OpaquePointer (GdkDragContext*)
	open func gtkDragBegin(targets: OpaquePointer!, actions: GdkDragAction, button: gint, event: UnsafeMutablePointer<GdkEvent>!) -> OpaquePointer {
		return gtk_drag_begin(GTK_WIDGET(self.GOBJECT), targets, actions, button, event)
	}

	/// func gtkDragBeginWithCoordinates(targets: OpaquePointer!, actions: GdkDragAction, button: gint, event: UnsafeMutablePointer<GdkEvent>!, x: gint, y: gint) -> OpaquePointer -> OpaquePointer
	/// - Parameters:
	///	- targets: OpaquePointer! (GtkTargetList*)
	///	- actions: GdkDragAction (GdkDragAction)
	///	- button: gint (gint)
	///	- event: UnsafeMutablePointer<GdkEvent>! (GdkEvent*)
	///	- x: gint (gint)
	///	- y: gint (gint)
	/// - Returns: OpaquePointer (GdkDragContext*)
	open func gtkDragBeginWithCoordinates(targets: OpaquePointer!, actions: GdkDragAction, button: gint, event: UnsafeMutablePointer<GdkEvent>!, x: gint, y: gint) -> OpaquePointer {
		return gtk_drag_begin_with_coordinates(GTK_WIDGET(self.GOBJECT), targets, actions, button, event, x, y)
	}

	/// func gtkDragCheckThreshold(startX: gint, startY: gint, currentX: gint, currentY: gint) -> Bool -> Bool
	/// - Parameters:
	///	- startX: gint (gint)
	///	- startY: gint (gint)
	///	- currentX: gint (gint)
	///	- currentY: gint (gint)
	/// - Returns: Bool (gboolean)
	open func gtkDragCheckThreshold(startX: gint, startY: gint, currentX: gint, currentY: gint) -> Bool {
		return gtk_drag_check_threshold(GTK_WIDGET(self.GOBJECT), startX, startY, currentX, currentY) != 0 ? true : false
	}

	/// func gtkDragDestAddImageTargets() -> Swift.Void -> void
	open func gtkDragDestAddImageTargets() -> Swift.Void {
		gtk_drag_dest_add_image_targets(GTK_WIDGET(self.GOBJECT))
	}

	/// func gtkDragDestAddTextTargets() -> Swift.Void -> void
	open func gtkDragDestAddTextTargets() -> Swift.Void {
		gtk_drag_dest_add_text_targets(GTK_WIDGET(self.GOBJECT))
	}

	/// func gtkDragDestAddUriTargets() -> Swift.Void -> void
	open func gtkDragDestAddUriTargets() -> Swift.Void {
		gtk_drag_dest_add_uri_targets(GTK_WIDGET(self.GOBJECT))
	}

	/// func gtkDragDestFindTarget(context: OpaquePointer!, targetList: OpaquePointer?) -> GdkAtom -> GdkAtom
	/// - Parameters:
	///	- context: OpaquePointer! (GdkDragContext*)
	///	- targetList: OpaquePointer? (GtkTargetList*)
	/// - Returns: GdkAtom (GdkAtom)
	open func gtkDragDestFindTarget(context: OpaquePointer!, targetList: OpaquePointer?) -> GdkAtom {
		return gtk_drag_dest_find_target(GTK_WIDGET(self.GOBJECT), context, targetList)
	}

	/// func gtkDragDestGetTargetList() -> OpaquePointer -> OpaquePointer
	/// - Returns: OpaquePointer (GtkTargetList*)
	open func gtkDragDestGetTargetList() -> OpaquePointer {
		return gtk_drag_dest_get_target_list(GTK_WIDGET(self.GOBJECT))
	}

	/// func gtkDragDestGetTrackMotion() -> Bool -> Bool
	/// - Returns: Bool (gboolean)
	open func gtkDragDestGetTrackMotion() -> Bool {
		return gtk_drag_dest_get_track_motion(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// func gtkDragDestSet(flags: GtkDestDefaults, targets: UnsafeMutablePointer<GtkTargetEntry>?, ntargets: gint, actions: GdkDragAction) -> Swift.Void -> void
	/// - Parameters:
	///	- flags: GtkDestDefaults (GtkDestDefaults)
	///	- targets: UnsafeMutablePointer<GtkTargetEntry>? (GtkTargetEntry*)
	///	- ntargets: gint (gint)
	///	- actions: GdkDragAction (GdkDragAction)
	open func gtkDragDestSet(flags: GtkDestDefaults, targets: UnsafeMutablePointer<GtkTargetEntry>?, ntargets: gint, actions: GdkDragAction) -> Swift.Void {
		gtk_drag_dest_set(GTK_WIDGET(self.GOBJECT), flags, targets, ntargets, actions)
	}

	/// func gtkDragDestSetProxy(proxyWindow: OpaquePointer!, gtkProtocol: GdkDragProtocol, useCoordinates: Bool) -> Swift.Void -> void
	/// - Parameters:
	///	- proxyWindow: OpaquePointer! (GdkWindow*)
	///	- gtkProtocol: GdkDragProtocol (GdkDragProtocol)
	///	- useCoordinates: Bool (gboolean)
	open func gtkDragDestSetProxy(proxyWindow: OpaquePointer!, gtkProtocol: GdkDragProtocol, useCoordinates: Bool) -> Swift.Void {
		gtk_drag_dest_set_proxy(GTK_WIDGET(self.GOBJECT), proxyWindow, gtkProtocol, useCoordinates ? 1 : 0)
	}

	/// func gtkDragDestSetTargetList(_ targetList: OpaquePointer?) -> Swift.Void -> void
	/// - Parameters:
	///	- targetList: OpaquePointer? (GtkTargetList*)
	open func gtkDragDestSetTargetList(_ targetList: OpaquePointer?) -> Swift.Void {
		gtk_drag_dest_set_target_list(GTK_WIDGET(self.GOBJECT), targetList)
	}

	/// func gtkDragDestSetTrackMotion(_ trackMotion: Bool) -> Swift.Void -> void
	/// - Parameters:
	///	- trackMotion: Bool (gboolean)
	open func gtkDragDestSetTrackMotion(_ trackMotion: Bool) -> Swift.Void {
		gtk_drag_dest_set_track_motion(GTK_WIDGET(self.GOBJECT), trackMotion ? 1 : 0)
	}

	/// func gtkDragDestUnset() -> Swift.Void -> void
	open func gtkDragDestUnset() -> Swift.Void {
		gtk_drag_dest_unset(GTK_WIDGET(self.GOBJECT))
	}

	/// func gtkDragGetData(context: OpaquePointer!, target: GdkAtom, time: guint32) -> Swift.Void -> void
	/// - Parameters:
	///	- context: OpaquePointer! (GdkDragContext*)
	///	- target: GdkAtom (GdkAtom)
	///	- time: guint32 (guint32)
	open func gtkDragGetData(context: OpaquePointer!, target: GdkAtom, time: guint32) -> Swift.Void {
		gtk_drag_get_data(GTK_WIDGET(self.GOBJECT), context, target, time)
	}

	/// func gtkDragHighlight() -> Swift.Void -> void
	open func gtkDragHighlight() -> Swift.Void {
		gtk_drag_highlight(GTK_WIDGET(self.GOBJECT))
	}

	/// Add the writable image targets supported by #GtkSelectionData to
	/// the target list of the drag source. The targets
	/// are added with @info = 0. If you need another value,
	/// use gtk_target_list_add_image_targets() and
	/// gtk_drag_source_set_target_list().
	open func gtkDragSourceAddImageTargets() -> Swift.Void {
		gtk_drag_source_add_image_targets(GTK_WIDGET(self.GOBJECT))
	}

	/// Add the text targets supported by #GtkSelectionData to
	/// the target list of the drag source.  The targets
	/// are added with @info = 0. If you need another value,
	/// use gtk_target_list_add_text_targets() and
	/// gtk_drag_source_set_target_list().
	open func gtkDragSourceAddTextTargets() -> Swift.Void {
		gtk_drag_source_add_text_targets(GTK_WIDGET(self.GOBJECT))
	}

	/// Add the URI targets supported by #GtkSelectionData to
	/// the target list of the drag source.  The targets
	/// are added with @info = 0. If you need another value,
	/// use gtk_target_list_add_uri_targets() and
	/// gtk_drag_source_set_target_list().
	open func gtkDragSourceAddUriTargets() -> Swift.Void {
		gtk_drag_source_add_uri_targets(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets the list of targets this widget can provide for
	/// drag-and-drop.
	/// - Returns: OpaquePointer? (GtkTargetList*)
	open func gtkDragSourceGetTargetList() -> OpaquePointer? {
		return gtk_drag_source_get_target_list(GTK_WIDGET(self.GOBJECT))
	}

	/// Sets up a widget so that GTK+ will start a drag operation when the user
	/// clicks and drags on the widget. The widget must have a window.
	/// - Parameters:
	///	- startButtonMask: GdkModifierType (GdkModifierType)
	///	- targets: UnsafeMutablePointer<GtkTargetEntry>? (GtkTargetEntry*)
	///	- ntargets: gint (gint)
	///	- actions: GdkDragAction (GdkDragAction)
	open func gtkDragSourceSet(startButtonMask: GdkModifierType, targets: UnsafeMutablePointer<GtkTargetEntry>?, ntargets: gint, actions: GdkDragAction) -> Swift.Void {
		gtk_drag_source_set(GTK_WIDGET(self.GOBJECT), startButtonMask, targets, ntargets, actions)
	}

	/// Sets the icon that will be used for drags from a particular source
	/// to @icon. See the docs for #GtkIconTheme for more details.
	/// - Parameters:
	///	- icon: OpaquePointer! (GIcon*)
	open func gtkDragSourceSetIconGicon(icon: OpaquePointer!) -> Swift.Void {
		gtk_drag_source_set_icon_gicon(GTK_WIDGET(self.GOBJECT), icon)
	}

	/// Sets the icon that will be used for drags from a particular source
	/// to a themed icon. See the docs for #GtkIconTheme for more details.
	/// - Parameters:
	///	- iconName: String (const gchar*)
	open func gtkDragSourceSetIconName(_ iconName: String) -> Swift.Void {
		gtk_drag_source_set_icon_name(GTK_WIDGET(self.GOBJECT), iconName)
	}

	/// Sets the icon that will be used for drags from a particular widget
	/// from a #GdkPixbuf. GTK+ retains a reference for @pixbuf and will
	/// release it when it is no longer needed.
	/// - Parameters:
	///	- pixbuf: OpaquePointer! (GdkPixbuf*)
	open func gtkDragSourceSetIconPixbuf(_ pixbuf: OpaquePointer!) -> Swift.Void {
		gtk_drag_source_set_icon_pixbuf(GTK_WIDGET(self.GOBJECT), pixbuf)
	}

	/// Sets the icon that will be used for drags from a particular source
	/// to a stock icon.
	/// - Parameters:
	///	- stockId: String (const gchar*)
	open func gtkDragSourceSetIconStock(stockId: String) -> Swift.Void {
		gtk_drag_source_set_icon_stock(GTK_WIDGET(self.GOBJECT), stockId)
	}

	/// Changes the target types that this widget offers for drag-and-drop.
	/// The widget must first be made into a drag source with
	/// gtk_drag_source_set().
	/// - Parameters:
	///	- targetList: OpaquePointer? (GtkTargetList*)
	open func gtkDragSourceSetTargetList(_ targetList: OpaquePointer?) -> Swift.Void {
		gtk_drag_source_set_target_list(GTK_WIDGET(self.GOBJECT), targetList)
	}

	/// Undoes the effects of gtk_drag_source_set().
	open func gtkDragSourceUnset() -> Swift.Void {
		gtk_drag_source_unset(GTK_WIDGET(self.GOBJECT))
	}

	/// func gtkDragUnhighlight() -> Swift.Void -> void
	open func gtkDragUnhighlight() -> Swift.Void {
		gtk_drag_unhighlight(GTK_WIDGET(self.GOBJECT))
	}

	/// Draws @widget to @cr. The top left corner of the widget will be
	/// drawn to the currently set origin point of @cr.
	/// You should pass a cairo context as @cr argument that is in an
	/// original state. Otherwise the resulting drawing is undefined. For
	/// example changing the operator using cairo_set_operator() or the
	/// line width using cairo_set_line_width() might have unwanted side
	/// effects.
	/// You may however change the context’s transform matrix - like with
	/// cairo_scale(), cairo_translate() or cairo_set_matrix() and clip
	/// region with cairo_clip() prior to calling this function. Also, it
	/// is fine to modify the context with cairo_save() and
	/// cairo_push_group() prior to calling this function.
	/// Note that special-purpose widgets may contain special code for
	/// rendering to the screen and might appear differently on screen
	/// and when rendered using gtk_widget_draw().
	/// - Parameters:
	///	- cr: OpaquePointer! (cairo_t*)
	open func draw(cr: OpaquePointer!) -> Swift.Void {
		gtk_widget_draw(GTK_WIDGET(self.GOBJECT), cr)
	}

	/// Ensures that @widget has a style (@widget->style).
	/// Not a very useful function; most of the time, if you
	/// want the style, the widget is realized, and realized
	/// widgets are guaranteed to have a style already.
	open func ensureStyle() -> Swift.Void {
		gtk_widget_ensure_style(GTK_WIDGET(self.GOBJECT))
	}

	/// Notifies the user about an input-related error on this widget.
	/// If the #GtkSettings:gtk-error-bell setting is %TRUE, it calls
	/// gdk_window_beep(), otherwise it does nothing.
	/// Note that the effect of gdk_window_beep() can be configured in many
	/// ways, depending on the windowing backend and the desktop environment
	/// or window manager that is used.
	open func errorBell() -> Swift.Void {
		gtk_widget_error_bell(GTK_WIDGET(self.GOBJECT))
	}

	/// Rarely-used function. This function is used to emit
	/// the event signals on a widget (those signals should never
	/// be emitted without using this function to do so).
	/// If you want to synthesize an event though, don’t use this function;
	/// instead, use gtk_main_do_event() so the event will behave as if
	/// it were in the event queue. Don’t synthesize expose events; instead,
	/// use gdk_window_invalidate_rect() to invalidate a region of the
	/// window.
	/// - Parameters:
	///	- event: UnsafeMutablePointer<GdkEvent>! (GdkEvent*)
	/// - Returns: Bool (gboolean)
	open func event(event: UnsafeMutablePointer<GdkEvent>!) -> Bool {
		return gtk_widget_event(GTK_WIDGET(self.GOBJECT), event) != 0 ? true : false
	}

	/// Stops emission of #GtkWidget::child-notify signals on @widget. The
	/// signals are queued until gtk_widget_thaw_child_notify() is called
	/// on @widget.
	/// This is the analogue of g_object_freeze_notify() for child properties.
	open func freezeChildNotify() -> Swift.Void {
		gtk_widget_freeze_child_notify(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the accessible object that describes the widget to an
	/// assistive technology.
	/// If accessibility support is not available, this #AtkObject
	/// instance may be a no-op. Likewise, if no class-specific #AtkObject
	/// implementation is available for the widget instance in question,
	/// it will inherit an #AtkObject implementation from the first ancestor
	/// class for which such an implementation is defined.
	/// The documentation of the
	/// [ATK](http://developer.gnome.org/atk/stable/)
	/// library contains more information about accessible objects and their uses.
	/// - Returns: UnsafeMutablePointer<AtkObject>! (AtkObject*)
	open func getAccessible() -> UnsafeMutablePointer<AtkObject>! {
		return gtk_widget_get_accessible(GTK_WIDGET(self.GOBJECT))
	}

	/// Retrieves the #GActionGroup that was registered using @prefix. The resulting
	/// #GActionGroup may have been registered to @widget or any #GtkWidget in its
	/// ancestry.
	/// If no action group was found matching @prefix, then %NULL is returned.
	/// - Parameters:
	///	- prefix: String (const gchar*)
	/// - Returns: OpaquePointer? (GActionGroup*)
	open func getActionGroup(prefix: String) -> OpaquePointer? {
		return gtk_widget_get_action_group(GTK_WIDGET(self.GOBJECT), prefix)
	}

	/// Returns the baseline that has currently been allocated to @widget.
	/// This function is intended to be used when implementing handlers
	/// for the #GtkWidget::draw function, and when allocating child
	/// widgets in #GtkWidget::size_allocate.
	/// - Returns: Int32 (int)
	open func getAllocatedBaseline() -> Int32 {
		return gtk_widget_get_allocated_baseline(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the height that has currently been allocated to @widget.
	/// This function is intended to be used when implementing handlers
	/// for the #GtkWidget::draw function.
	/// - Returns: Int32 (int)
	open func getAllocatedHeight() -> Int32 {
		return gtk_widget_get_allocated_height(GTK_WIDGET(self.GOBJECT))
	}

	/// Retrieves the widget’s allocated size.
	/// This function returns the last values passed to
	/// gtk_widget_size_allocate_with_baseline(). The value differs from
	/// the size returned in gtk_widget_get_allocation() in that functions
	/// like gtk_widget_set_halign() can adjust the allocation, but not
	/// the value returned by this function.
	/// If a widget is not visible, its allocated size is 0.
	/// - Parameters:
	///	- allocation: UnsafeMutablePointer<GtkAllocation>! (GtkAllocation*)
	///	- baseline: UnsafeMutablePointer<Int32>? = nil (int*)
	open func getAllocatedSize(allocation: UnsafeMutablePointer<GtkAllocation>!, baseline: UnsafeMutablePointer<Int32>? = nil) -> Swift.Void {
		gtk_widget_get_allocated_size(GTK_WIDGET(self.GOBJECT), allocation, baseline)
	}

	/// Returns the width that has currently been allocated to @widget.
	/// This function is intended to be used when implementing handlers
	/// for the #GtkWidget::draw function.
	/// - Returns: Int32 (int)
	open func getAllocatedWidth() -> Int32 {
		return gtk_widget_get_allocated_width(GTK_WIDGET(self.GOBJECT))
	}

	/// Retrieves the widget’s allocation.
	/// Note, when implementing a #GtkContainer: a widget’s allocation will
	/// be its “adjusted” allocation, that is, the widget’s parent
	/// container typically calls gtk_widget_size_allocate() with an
	/// allocation, and that allocation is then adjusted (to handle margin
	/// and alignment for example) before assignment to the widget.
	/// gtk_widget_get_allocation() returns the adjusted allocation that
	/// was actually assigned to the widget. The adjusted allocation is
	/// guaranteed to be completely contained within the
	/// gtk_widget_size_allocate() allocation, however. So a #GtkContainer
	/// is guaranteed that its children stay inside the assigned bounds,
	/// but not that they have exactly the bounds the container assigned.
	/// There is no way to get the original allocation assigned by
	/// gtk_widget_size_allocate(), since it isn’t stored; if a container
	/// implementation needs that information it will have to track it itself.
	/// - Parameters:
	///	- allocation: UnsafeMutablePointer<GtkAllocation>! (GtkAllocation*)
	open func getAllocation(_ allocation: UnsafeMutablePointer<GtkAllocation>!) -> Swift.Void {
		gtk_widget_get_allocation(GTK_WIDGET(self.GOBJECT), allocation)
	}

	/// Gets the first ancestor of @widget with type @widget_type. For example,
	/// `gtk_widget_get_ancestor (widget, GTK_TYPE_BOX)` gets
	/// the first #GtkBox that’s an ancestor of @widget. No reference will be
	/// added to the returned widget; it should not be unreferenced. See note
	/// about checking for a toplevel #GtkWindow in the docs for
	/// gtk_widget_get_toplevel().
	/// Note that unlike gtk_widget_is_ancestor(), gtk_widget_get_ancestor()
	/// considers @widget to be an ancestor of itself.
	/// - Parameters:
	///	- widgetType: GType (GType)
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getAncestor<T>(widgetType: GType) -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_widget_get_ancestor(GTK_WIDGET(self.GOBJECT), widgetType))
	}

	/// Determines whether the application intends to draw on the widget in
	/// an #GtkWidget::draw handler.
	/// See gtk_widget_set_app_paintable()
	/// - Returns: Bool (gboolean)
	open func getAppPaintable() -> Bool {
		return gtk_widget_get_app_paintable(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines whether @widget can be a default widget. See
	/// gtk_widget_set_can_default().
	/// - Returns: Bool (gboolean)
	open func getCanDefault() -> Bool {
		return gtk_widget_get_can_default(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines whether @widget can own the input focus. See
	/// gtk_widget_set_can_focus().
	/// - Returns: Bool (gboolean)
	open func getCanFocus() -> Bool {
		return gtk_widget_get_can_focus(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// This function is only for use in widget implementations. Obtains
	/// @widget->requisition, unless someone has forced a particular
	/// geometry on the widget (e.g. with gtk_widget_set_size_request()),
	/// in which case it returns that geometry instead of the widget's
	/// requisition.
	/// This function differs from gtk_widget_size_request() in that
	/// it retrieves the last size request value from @widget->requisition,
	/// while gtk_widget_size_request() actually calls the "size_request" method
	/// on @widget to compute the size request and fill in @widget->requisition,
	/// and only then returns @widget->requisition.
	/// Because this function does not call the “size_request” method, it
	/// can only be used when you know that @widget->requisition is
	/// up-to-date, that is, gtk_widget_size_request() has been called
	/// since the last time a resize was queued. In general, only container
	/// implementations have this information; applications should use
	/// gtk_widget_size_request().
	/// - Parameters:
	///	- requisition: UnsafeMutablePointer<GtkRequisition>! (GtkRequisition*)
	open func getChildRequisition(_ requisition: UnsafeMutablePointer<GtkRequisition>!) -> Swift.Void {
		gtk_widget_get_child_requisition(GTK_WIDGET(self.GOBJECT), requisition)
	}

	/// Gets the value set with gtk_widget_set_child_visible().
	/// If you feel a need to use this function, your code probably
	/// needs reorganization.
	/// This function is only useful for container implementations and
	/// never should be called by an application.
	/// - Returns: Bool (gboolean)
	open func getChildVisible() -> Bool {
		return gtk_widget_get_child_visible(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Retrieves the widget’s clip area.
	/// The clip area is the area in which all of @widget's drawing will
	/// happen. Other toolkits call it the bounding box.
	/// Historically, in GTK+ the clip area has been equal to the allocation
	/// retrieved via gtk_widget_get_allocation().
	/// - Parameters:
	///	- clip: UnsafeMutablePointer<GtkAllocation>! (GtkAllocation*)
	open func getClip(_ clip: UnsafeMutablePointer<GtkAllocation>!) -> Swift.Void {
		gtk_widget_get_clip(GTK_WIDGET(self.GOBJECT), clip)
	}

	/// Returns the clipboard object for the given selection to
	/// be used with @widget. @widget must have a #GdkDisplay
	/// associated with it, so must be attached to a toplevel
	/// window.
	/// - Parameters:
	///	- selection: GdkAtom (GdkAtom)
	/// - Returns: OpaquePointer (GtkClipboard*)
	open func getClipboard(selection: GdkAtom) -> OpaquePointer {
		return gtk_widget_get_clipboard(GTK_WIDGET(self.GOBJECT), selection)
	}

	/// Obtains the composite name of a widget.
	/// - Returns: String? (gchar*)
	open func getCompositeName() -> String? {
		return {
			let ptr = gtk_widget_get_composite_name(GTK_WIDGET(self.GOBJECT))
			defer {
				if ptr != nil {
					g_free(ptr)
				}
			}
			return ptr != nil ? String(utf8String: ptr!) : nil
		}()
	}

	/// Returns whether @device can interact with @widget and its
	/// children. See gtk_widget_set_device_enabled().
	/// - Parameters:
	///	- device: OpaquePointer! (GdkDevice*)
	/// - Returns: Bool (gboolean)
	open func getDeviceEnabled(device: OpaquePointer!) -> Bool {
		return gtk_widget_get_device_enabled(GTK_WIDGET(self.GOBJECT), device) != 0 ? true : false
	}

	/// Returns the events mask for the widget corresponding to an specific device. These
	/// are the events that the widget will receive when @device operates on it.
	/// - Parameters:
	///	- device: OpaquePointer! (GdkDevice*)
	/// - Returns: GdkEventMask (GdkEventMask)
	open func getDeviceEvents(device: OpaquePointer!) -> GdkEventMask {
		return gtk_widget_get_device_events(GTK_WIDGET(self.GOBJECT), device)
	}

	/// Gets the reading direction for a particular widget. See
	/// gtk_widget_set_direction().
	/// - Returns: GtkTextDirection (GtkTextDirection)
	open func getDirection() -> GtkTextDirection {
		return gtk_widget_get_direction(GTK_WIDGET(self.GOBJECT))
	}

	/// Get the #GdkDisplay for the toplevel window associated with
	/// this widget. This function can only be called after the widget
	/// has been added to a widget hierarchy with a #GtkWindow at the top.
	/// In general, you should only create display specific
	/// resources when a widget has been realized, and you should
	/// free those resources when the widget is unrealized.
	/// - Returns: OpaquePointer (GdkDisplay*)
	open func getDisplay() -> OpaquePointer {
		return gtk_widget_get_display(GTK_WIDGET(self.GOBJECT))
	}

	/// Determines whether the widget is double buffered.
	/// See gtk_widget_set_double_buffered()
	/// - Returns: Bool (gboolean)
	open func getDoubleBuffered() -> Bool {
		return gtk_widget_get_double_buffered(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the event mask (see #GdkEventMask) for the widget. These are the
	/// events that the widget will receive.
	/// Note: Internally, the widget event mask will be the logical OR of the event
	/// mask set through gtk_widget_set_events() or gtk_widget_add_events(), and the
	/// event mask necessary to cater for every #GtkEventController created for the
	/// widget.
	/// - Returns: gint (gint)
	open func getEvents() -> gint {
		return gtk_widget_get_events(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns whether the widget should grab focus when it is clicked with the mouse.
	/// See gtk_widget_set_focus_on_click().
	/// - Returns: Bool (gboolean)
	open func getFocusOnClick() -> Bool {
		return gtk_widget_get_focus_on_click(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the font map that has been set with gtk_widget_set_font_map().
	/// - Returns: OpaquePointer? (PangoFontMap*)
	open func getFontMap() -> OpaquePointer? {
		return gtk_widget_get_font_map(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the #cairo_font_options_t used for Pango rendering. When not set,
	/// the defaults font options for the #GdkScreen will be used.
	/// - Returns: OpaquePointer? (const cairo_font_options_t*)
	open func getFontOptions() -> OpaquePointer? {
		return gtk_widget_get_font_options(GTK_WIDGET(self.GOBJECT))
	}

	/// Obtains the frame clock for a widget. The frame clock is a global
	/// “ticker” that can be used to drive animations and repaints.  The
	/// most common reason to get the frame clock is to call
	/// gdk_frame_clock_get_frame_time(), in order to get a time to use for
	/// animating. For example you might record the start of the animation
	/// with an initial value from gdk_frame_clock_get_frame_time(), and
	/// then update the animation by calling
	/// gdk_frame_clock_get_frame_time() again during each repaint.
	/// gdk_frame_clock_request_phase() will result in a new frame on the
	/// clock, but won’t necessarily repaint any widgets. To repaint a
	/// widget, you have to use gtk_widget_queue_draw() which invalidates
	/// the widget (thus scheduling it to receive a draw on the next
	/// frame). gtk_widget_queue_draw() will also end up requesting a frame
	/// on the appropriate frame clock.
	/// A widget’s frame clock will not change while the widget is
	/// mapped. Reparenting a widget (which implies a temporary unmap) can
	/// change the widget’s frame clock.
	/// Unrealized widgets do not have a frame clock.
	/// - Returns: OpaquePointer? (GdkFrameClock*)
	open func getFrameClock() -> OpaquePointer? {
		return gtk_widget_get_frame_clock(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets the value of the #GtkWidget:halign property.
	/// For backwards compatibility reasons this method will never return
	/// %GTK_ALIGN_BASELINE, but instead it will convert it to
	/// %GTK_ALIGN_FILL. Baselines are not supported for horizontal
	/// alignment.
	/// - Returns: GtkAlign (GtkAlign)
	open func getHalign() -> GtkAlign {
		return gtk_widget_get_halign(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the current value of the has-tooltip property.  See
	/// #GtkWidget:has-tooltip for more information.
	/// - Returns: Bool (gboolean)
	open func getHasTooltip() -> Bool {
		return gtk_widget_get_has_tooltip(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines whether @widget has a #GdkWindow of its own. See
	/// gtk_widget_set_has_window().
	/// - Returns: Bool (gboolean)
	open func getHasWindow() -> Bool {
		return gtk_widget_get_has_window(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets whether the widget would like any available extra horizontal
	/// space. When a user resizes a #GtkWindow, widgets with expand=TRUE
	/// generally receive the extra space. For example, a list or
	/// scrollable area or document in your window would often be set to
	/// expand.
	/// Containers should use gtk_widget_compute_expand() rather than
	/// this function, to see whether a widget, or any of its children,
	/// has the expand flag set. If any child of a widget wants to
	/// expand, the parent may ask to expand also.
	/// This function only looks at the widget’s own hexpand flag, rather
	/// than computing whether the entire widget tree rooted at this widget
	/// wants to expand.
	/// - Returns: Bool (gboolean)
	open func getHexpand() -> Bool {
		return gtk_widget_get_hexpand(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets whether gtk_widget_set_hexpand() has been used to
	/// explicitly set the expand flag on this widget.
	/// If hexpand is set, then it overrides any computed
	/// expand value based on child widgets. If hexpand is not
	/// set, then the expand value depends on whether any
	/// children of the widget would like to expand.
	/// There are few reasons to use this function, but it’s here
	/// for completeness and consistency.
	/// - Returns: Bool (gboolean)
	open func getHexpandSet() -> Bool {
		return gtk_widget_get_hexpand_set(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Whether the widget is mapped.
	/// - Returns: Bool (gboolean)
	open func getMapped() -> Bool {
		return gtk_widget_get_mapped(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the value of the #GtkWidget:margin-bottom property.
	/// - Returns: gint (gint)
	open func getMarginBottom() -> gint {
		return gtk_widget_get_margin_bottom(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets the value of the #GtkWidget:margin-end property.
	/// - Returns: gint (gint)
	open func getMarginEnd() -> gint {
		return gtk_widget_get_margin_end(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets the value of the #GtkWidget:margin-left property.
	/// - Returns: gint (gint)
	open func getMarginLeft() -> gint {
		return gtk_widget_get_margin_left(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets the value of the #GtkWidget:margin-right property.
	/// - Returns: gint (gint)
	open func getMarginRight() -> gint {
		return gtk_widget_get_margin_right(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets the value of the #GtkWidget:margin-start property.
	/// - Returns: gint (gint)
	open func getMarginStart() -> gint {
		return gtk_widget_get_margin_start(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets the value of the #GtkWidget:margin-top property.
	/// - Returns: gint (gint)
	open func getMarginTop() -> gint {
		return gtk_widget_get_margin_top(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the modifier mask the @widget’s windowing system backend
	/// uses for a particular purpose.
	/// See gdk_keymap_get_modifier_mask().
	/// - Parameters:
	///	- intent: GdkModifierIntent (GdkModifierIntent)
	/// - Returns: GdkModifierType (GdkModifierType)
	open func getModifierMask(intent: GdkModifierIntent) -> GdkModifierType {
		return gtk_widget_get_modifier_mask(GTK_WIDGET(self.GOBJECT), intent)
	}

	/// Returns the current modifier style for the widget. (As set by
	/// gtk_widget_modify_style().) If no style has previously set, a new
	/// #GtkRcStyle will be created with all values unset, and set as the
	/// modifier style for the widget. If you make changes to this rc
	/// style, you must call gtk_widget_modify_style(), passing in the
	/// returned rc style, to make sure that your changes take effect.
	/// Caution: passing the style back to gtk_widget_modify_style() will
	/// normally end up destroying it, because gtk_widget_modify_style() copies
	/// the passed-in style and sets the copy as the new modifier style,
	/// thus dropping any reference to the old modifier style. Add a reference
	/// to the modifier style if you want to keep it alive.
	/// - Returns: UnsafeMutablePointer<GtkRcStyle>! (GtkRcStyle*)
	open func getModifierStyle() -> UnsafeMutablePointer<GtkRcStyle>! {
		return gtk_widget_get_modifier_style(GTK_WIDGET(self.GOBJECT))
	}

	/// Retrieves the name of a widget. See gtk_widget_set_name() for the
	/// significance of widget names.
	/// - Returns: String? (const gchar*)
	open func getName() -> String? {
		return String(utf8String: gtk_widget_get_name(GTK_WIDGET(self.GOBJECT)))
	}

	/// Returns the current value of the #GtkWidget:no-show-all property,
	/// which determines whether calls to gtk_widget_show_all()
	/// will affect this widget.
	/// - Returns: Bool (gboolean)
	open func getNoShowAll() -> Bool {
		return gtk_widget_get_no_show_all(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Fetches the requested opacity for this widget.
	/// See gtk_widget_set_opacity().
	/// - Returns: Double (double)
	open func getOpacity() -> Double {
		return gtk_widget_get_opacity(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets a #PangoContext with the appropriate font map, font description,
	/// and base direction for this widget. Unlike the context returned
	/// by gtk_widget_create_pango_context(), this context is owned by
	/// the widget (it can be used until the screen for the widget changes
	/// or the widget is removed from its toplevel), and will be updated to
	/// match any changes to the widget’s attributes. This can be tracked
	/// by using the #GtkWidget::screen-changed signal on the widget.
	/// - Returns: OpaquePointer (PangoContext*)
	open func getPangoContext() -> OpaquePointer {
		return gtk_widget_get_pango_context(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the parent container of @widget.
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getParent<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_widget_get_parent(GTK_WIDGET(self.GOBJECT)))
	}

	/// Gets @widget’s parent window, or %NULL if it does not have one.
	/// - Returns: OpaquePointer? (GdkWindow*)
	open func getParentWindow() -> OpaquePointer? {
		return gtk_widget_get_parent_window(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the #GtkWidgetPath representing @widget, if the widget
	/// is not connected to a toplevel widget, a partial path will be
	/// created.
	/// - Returns: OpaquePointer (GtkWidgetPath*)
	open func getPath() -> OpaquePointer {
		return gtk_widget_get_path(GTK_WIDGET(self.GOBJECT))
	}

	/// Obtains the location of the mouse pointer in widget coordinates.
	/// Widget coordinates are a bit odd; for historical reasons, they are
	/// defined as @widget->window coordinates for widgets that return %TRUE for
	/// gtk_widget_get_has_window(); and are relative to @widget->allocation.x,
	/// @widget->allocation.y otherwise.
	/// - Parameters:
	///	- x: UnsafeMutablePointer<Int32>! (gint*)
	///	- y: UnsafeMutablePointer<Int32>! (gint*)
	open func getPointer(x: UnsafeMutablePointer<Int32>!, y: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_widget_get_pointer(GTK_WIDGET(self.GOBJECT), x, y)
	}

	/// Retrieves a widget’s initial minimum and natural height.
	/// This call is specific to width-for-height requests.
	/// The returned request will be modified by the
	/// GtkWidgetClass::adjust_size_request virtual method and by any
	/// #GtkSizeGroups that have been applied. That is, the returned request
	/// is the one that should be used for layout, not necessarily the one
	/// returned by the widget itself.
	/// - Parameters:
	///	- minimumHeight: UnsafeMutablePointer<Int32>! (gint*)
	///	- naturalHeight: UnsafeMutablePointer<Int32>! (gint*)
	open func getPreferredHeight(minimumHeight: UnsafeMutablePointer<Int32>!, naturalHeight: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_widget_get_preferred_height(GTK_WIDGET(self.GOBJECT), minimumHeight, naturalHeight)
	}

	/// Retrieves a widget’s minimum and natural height and the corresponding baselines if it would be given
	/// the specified @width, or the default height if @width is -1. The baselines may be -1 which means
	/// that no baseline is requested for this widget.
	/// The returned request will be modified by the
	/// GtkWidgetClass::adjust_size_request and GtkWidgetClass::adjust_baseline_request virtual methods
	/// and by any #GtkSizeGroups that have been applied. That is, the returned request
	/// is the one that should be used for layout, not necessarily the one
	/// returned by the widget itself.
	/// - Parameters:
	///	- width: gint (gint)
	///	- minimumHeight: UnsafeMutablePointer<Int32>! (gint*)
	///	- naturalHeight: UnsafeMutablePointer<Int32>! (gint*)
	///	- minimumBaseline: UnsafeMutablePointer<Int32>! (gint*)
	///	- naturalBaseline: UnsafeMutablePointer<Int32>! (gint*)
	open func getPreferredHeightAndBaselineForWidth(_ width: gint, minimumHeight: UnsafeMutablePointer<Int32>!, naturalHeight: UnsafeMutablePointer<Int32>!, minimumBaseline: UnsafeMutablePointer<Int32>!, naturalBaseline: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_widget_get_preferred_height_and_baseline_for_width(GTK_WIDGET(self.GOBJECT), width, minimumHeight, naturalHeight, minimumBaseline, naturalBaseline)
	}

	/// Retrieves a widget’s minimum and natural height if it would be given
	/// the specified @width.
	/// The returned request will be modified by the
	/// GtkWidgetClass::adjust_size_request virtual method and by any
	/// #GtkSizeGroups that have been applied. That is, the returned request
	/// is the one that should be used for layout, not necessarily the one
	/// returned by the widget itself.
	/// - Parameters:
	///	- width: gint (gint)
	///	- minimumHeight: UnsafeMutablePointer<Int32>! (gint*)
	///	- naturalHeight: UnsafeMutablePointer<Int32>! (gint*)
	open func getPreferredHeightForWidth(_ width: gint, minimumHeight: UnsafeMutablePointer<Int32>!, naturalHeight: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_widget_get_preferred_height_for_width(GTK_WIDGET(self.GOBJECT), width, minimumHeight, naturalHeight)
	}

	/// Retrieves the minimum and natural size of a widget, taking
	/// into account the widget’s preference for height-for-width management.
	/// This is used to retrieve a suitable size by container widgets which do
	/// not impose any restrictions on the child placement. It can be used
	/// to deduce toplevel window and menu sizes as well as child widgets in
	/// free-form containers such as GtkLayout.
	/// Handle with care. Note that the natural height of a height-for-width
	/// widget will generally be a smaller size than the minimum height, since the required
	/// height for the natural width is generally smaller than the required height for
	/// the minimum width.
	/// Use gtk_widget_get_preferred_height_and_baseline_for_width() if you want to support
	/// baseline alignment.
	/// - Parameters:
	///	- minimumSize: UnsafeMutablePointer<GtkRequisition>? = nil (GtkRequisition*)
	///	- naturalSize: UnsafeMutablePointer<GtkRequisition>? = nil (GtkRequisition*)
	open func getPreferredSize(minimumSize: UnsafeMutablePointer<GtkRequisition>? = nil, naturalSize: UnsafeMutablePointer<GtkRequisition>? = nil) -> Swift.Void {
		gtk_widget_get_preferred_size(GTK_WIDGET(self.GOBJECT), minimumSize, naturalSize)
	}

	/// Retrieves a widget’s initial minimum and natural width.
	/// This call is specific to height-for-width requests.
	/// The returned request will be modified by the
	/// GtkWidgetClass::adjust_size_request virtual method and by any
	/// #GtkSizeGroups that have been applied. That is, the returned request
	/// is the one that should be used for layout, not necessarily the one
	/// returned by the widget itself.
	/// - Parameters:
	///	- minimumWidth: UnsafeMutablePointer<Int32>! (gint*)
	///	- naturalWidth: UnsafeMutablePointer<Int32>! (gint*)
	open func getPreferredWidth(minimumWidth: UnsafeMutablePointer<Int32>!, naturalWidth: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_widget_get_preferred_width(GTK_WIDGET(self.GOBJECT), minimumWidth, naturalWidth)
	}

	/// Retrieves a widget’s minimum and natural width if it would be given
	/// the specified @height.
	/// The returned request will be modified by the
	/// GtkWidgetClass::adjust_size_request virtual method and by any
	/// #GtkSizeGroups that have been applied. That is, the returned request
	/// is the one that should be used for layout, not necessarily the one
	/// returned by the widget itself.
	/// - Parameters:
	///	- height: gint (gint)
	///	- minimumWidth: UnsafeMutablePointer<Int32>! (gint*)
	///	- naturalWidth: UnsafeMutablePointer<Int32>! (gint*)
	open func getPreferredWidthForHeight(_ height: gint, minimumWidth: UnsafeMutablePointer<Int32>!, naturalWidth: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_widget_get_preferred_width_for_height(GTK_WIDGET(self.GOBJECT), height, minimumWidth, naturalWidth)
	}

	/// Determines whether @widget is realized.
	/// - Returns: Bool (gboolean)
	open func getRealized() -> Bool {
		return gtk_widget_get_realized(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines whether @widget is always treated as the default widget
	/// within its toplevel when it has the focus, even if another widget
	/// is the default.
	/// See gtk_widget_set_receives_default().
	/// - Returns: Bool (gboolean)
	open func getReceivesDefault() -> Bool {
		return gtk_widget_get_receives_default(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets whether the widget prefers a height-for-width layout
	/// or a width-for-height layout.
	/// #GtkBin widgets generally propagate the preference of
	/// their child, container widgets need to request something either in
	/// context of their children or in context of their allocation
	/// capabilities.
	/// - Returns: GtkSizeRequestMode (GtkSizeRequestMode)
	open func getRequestMode() -> GtkSizeRequestMode {
		return gtk_widget_get_request_mode(GTK_WIDGET(self.GOBJECT))
	}

	/// Retrieves the widget’s requisition.
	/// This function should only be used by widget implementations in
	/// order to figure whether the widget’s requisition has actually
	/// changed after some internal state change (so that they can call
	/// gtk_widget_queue_resize() instead of gtk_widget_queue_draw()).
	/// Normally, gtk_widget_size_request() should be used.
	/// - Parameters:
	///	- requisition: UnsafeMutablePointer<GtkRequisition>! (GtkRequisition*)
	open func getRequisition(_ requisition: UnsafeMutablePointer<GtkRequisition>!) -> Swift.Void {
		gtk_widget_get_requisition(GTK_WIDGET(self.GOBJECT), requisition)
	}

	/// Get the root window where this widget is located. This function can
	/// only be called after the widget has been added to a widget
	/// hierarchy with #GtkWindow at the top.
	/// The root window is useful for such purposes as creating a popup
	/// #GdkWindow associated with the window. In general, you should only
	/// create display specific resources when a widget has been realized,
	/// and you should free those resources when the widget is unrealized.
	/// - Returns: OpaquePointer (GdkWindow*)
	open func getRootWindow() -> OpaquePointer {
		return gtk_widget_get_root_window(GTK_WIDGET(self.GOBJECT))
	}

	/// Retrieves the internal scale factor that maps from window coordinates
	/// to the actual device pixels. On traditional systems this is 1, on
	/// high density outputs, it can be a higher value (typically 2).
	/// See gdk_window_get_scale_factor().
	/// - Returns: gint (gint)
	open func getScaleFactor() -> gint {
		return gtk_widget_get_scale_factor(GTK_WIDGET(self.GOBJECT))
	}

	/// Get the #GdkScreen from the toplevel window associated with
	/// this widget. This function can only be called after the widget
	/// has been added to a widget hierarchy with a #GtkWindow
	/// at the top.
	/// In general, you should only create screen specific
	/// resources when a widget has been realized, and you should
	/// free those resources when the widget is unrealized.
	/// - Returns: OpaquePointer (GdkScreen*)
	open func getScreen() -> OpaquePointer {
		return gtk_widget_get_screen(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the widget’s sensitivity (in the sense of returning
	/// the value that has been set using gtk_widget_set_sensitive()).
	/// The effective sensitivity of a widget is however determined by both its
	/// own and its parent widget’s sensitivity. See gtk_widget_is_sensitive().
	/// - Returns: Bool (gboolean)
	open func getSensitive() -> Bool {
		return gtk_widget_get_sensitive(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the settings object holding the settings used for this widget.
	/// Note that this function can only be called when the #GtkWidget
	/// is attached to a toplevel, since the settings object is specific
	/// to a particular #GdkScreen.
	/// - Returns: UnsafeMutablePointer<GtkSettings>! (GtkSettings*)
	open func getSettings() -> UnsafeMutablePointer<GtkSettings>! {
		return gtk_widget_get_settings(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets the size request that was explicitly set for the widget using
	/// gtk_widget_set_size_request(). A value of -1 stored in @width or
	/// @height indicates that that dimension has not been set explicitly
	/// and the natural requisition of the widget will be used instead. See
	/// gtk_widget_set_size_request(). To get the size a widget will
	/// actually request, call gtk_widget_get_preferred_size() instead of
	/// this function.
	/// - Parameters:
	///	- width: UnsafeMutablePointer<Int32>! (gint*)
	///	- height: UnsafeMutablePointer<Int32>! (gint*)
	open func getSizeRequest(width: UnsafeMutablePointer<Int32>!, height: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_widget_get_size_request(GTK_WIDGET(self.GOBJECT), width, height)
	}

	/// Returns the widget’s state. See gtk_widget_set_state().
	/// - Returns: GtkStateType (GtkStateType)
	open func getState() -> GtkStateType {
		return gtk_widget_get_state(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the widget state as a flag set. It is worth mentioning
	/// that the effective %GTK_STATE_FLAG_INSENSITIVE state will be
	/// returned, that is, also based on parent insensitivity, even if
	/// @widget itself is sensitive.
	/// Also note that if you are looking for a way to obtain the
	/// #GtkStateFlags to pass to a #GtkStyleContext method, you
	/// should look at gtk_style_context_get_state().
	/// - Returns: GtkStateFlags (GtkStateFlags)
	open func getStateFlags() -> GtkStateFlags {
		return gtk_widget_get_state_flags(GTK_WIDGET(self.GOBJECT))
	}

	/// Simply an accessor function that returns @widget->style.
	/// - Returns: UnsafeMutablePointer<GtkStyle>! (GtkStyle*)
	open func getStyle() -> UnsafeMutablePointer<GtkStyle>! {
		return gtk_widget_get_style(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the style context associated to @widget. The returned object is
	/// guaranteed to be the same for the lifetime of @widget.
	/// - Returns: UnsafeMutablePointer<GtkStyleContext>! (GtkStyleContext*)
	open func getStyleContext() -> UnsafeMutablePointer<GtkStyleContext>! {
		return gtk_widget_get_style_context(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns %TRUE if @widget is multiple pointer aware. See
	/// gtk_widget_set_support_multidevice() for more information.
	/// - Returns: Bool (gboolean)
	open func getSupportMultidevice() -> Bool {
		return gtk_widget_get_support_multidevice(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Fetch an object build from the template XML for @widget_type in this @widget instance.
	/// This will only report children which were previously declared with
	/// gtk_widget_class_bind_template_child_full() or one of its
	/// variants.
	/// This function is only meant to be called for code which is private to the @widget_type which
	/// declared the child and is meant for language bindings which cannot easily make use
	/// of the GObject structure offsets.
	/// - Parameters:
	///	- widgetType: GType (GType)
	///	- name: String (const gchar*)
	/// - Returns: UnsafeMutablePointer<GObject>! (GObject*)
	open func getTemplateChild(widgetType: GType, name: String) -> UnsafeMutablePointer<GObject>! {
		return gtk_widget_get_template_child(GTK_WIDGET(self.GOBJECT), widgetType, name)
	}

	/// Gets the contents of the tooltip for @widget.
	/// - Returns: String? (gchar*)
	open func getTooltipMarkup() -> String? {
		return {
			let ptr = gtk_widget_get_tooltip_markup(GTK_WIDGET(self.GOBJECT))
			defer {
				if ptr != nil {
					g_free(ptr)
				}
			}
			return ptr != nil ? String(utf8String: ptr!) : nil
		}()
	}

	/// Gets the contents of the tooltip for @widget.
	/// - Returns: String? (gchar*)
	open func getTooltipText() -> String? {
		return {
			let ptr = gtk_widget_get_tooltip_text(GTK_WIDGET(self.GOBJECT))
			defer {
				if ptr != nil {
					g_free(ptr)
				}
			}
			return ptr != nil ? String(utf8String: ptr!) : nil
		}()
	}

	/// Returns the #GtkWindow of the current tooltip. This can be the
	/// GtkWindow created by default, or the custom tooltip window set
	/// using gtk_widget_set_tooltip_window().
	/// - Returns: CGTKWindow (GtkWindow*)
	open func getTooltipWindow<T>() -> T where T: CGTKWindow {
		return T.init(withGObject: gtk_widget_get_tooltip_window(GTK_WIDGET(self.GOBJECT)))!
	}

	/// This function returns the topmost widget in the container hierarchy
	/// @widget is a part of. If @widget has no parent widgets, it will be
	/// returned as the topmost widget. No reference will be added to the
	/// returned widget; it should not be unreferenced.
	/// Note the difference in behavior vs. gtk_widget_get_ancestor();
	/// `gtk_widget_get_ancestor (widget, GTK_TYPE_WINDOW)`
	/// would return
	/// %NULL if @widget wasn’t inside a toplevel window, and if the
	/// window was inside a #GtkWindow-derived widget which was in turn
	/// inside the toplevel #GtkWindow. While the second case may
	/// seem unlikely, it actually happens when a #GtkPlug is embedded
	/// inside a #GtkSocket within the same application.
	/// To reliably find the toplevel #GtkWindow, use
	/// gtk_widget_get_toplevel() and call GTK_IS_WINDOW()
	/// on the result. For instance, to get the title of a widget's toplevel
	/// window, one might use:
	/// |[<!-- language="C" -->
	/// static const char *
	/// get_widget_toplevel_title (GtkWidget *widget)
	/// {
	/// GtkWidget *toplevel = gtk_widget_get_toplevel (widget);
	/// if (GTK_IS_WINDOW (toplevel))
	/// {
	/// return gtk_window_get_title (GTK_WINDOW (toplevel));
	/// }
	/// return NULL;
	/// }
	/// ]|
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getToplevel<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_widget_get_toplevel(GTK_WIDGET(self.GOBJECT)))!
	}

	/// Gets the value of the #GtkWidget:valign property.
	/// For backwards compatibility reasons this method will never return
	/// %GTK_ALIGN_BASELINE, but instead it will convert it to
	/// %GTK_ALIGN_FILL. If your widget want to support baseline aligned
	/// children it must use gtk_widget_get_valign_with_baseline(), or
	/// `g_object_get (widget, "valign", &value, NULL)`, which will
	/// also report the true value.
	/// - Returns: GtkAlign (GtkAlign)
	open func getValign() -> GtkAlign {
		return gtk_widget_get_valign(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets the value of the #GtkWidget:valign property, including
	/// %GTK_ALIGN_BASELINE.
	/// - Returns: GtkAlign (GtkAlign)
	open func getValignWithBaseline() -> GtkAlign {
		return gtk_widget_get_valign_with_baseline(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets whether the widget would like any available extra vertical
	/// space.
	/// See gtk_widget_get_hexpand() for more detail.
	/// - Returns: Bool (gboolean)
	open func getVexpand() -> Bool {
		return gtk_widget_get_vexpand(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets whether gtk_widget_set_vexpand() has been used to
	/// explicitly set the expand flag on this widget.
	/// See gtk_widget_get_hexpand_set() for more detail.
	/// - Returns: Bool (gboolean)
	open func getVexpandSet() -> Bool {
		return gtk_widget_get_vexpand_set(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines whether the widget is visible. If you want to
	/// take into account whether the widget’s parent is also marked as
	/// visible, use gtk_widget_is_visible() instead.
	/// This function does not check if the widget is obscured in any way.
	/// See gtk_widget_set_visible().
	/// - Returns: Bool (gboolean)
	open func getVisible() -> Bool {
		return gtk_widget_get_visible(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the visual that will be used to render @widget.
	/// - Returns: OpaquePointer (GdkVisual*)
	open func getVisual() -> OpaquePointer {
		return gtk_widget_get_visual(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns the widget’s window if it is realized, %NULL otherwise
	/// - Returns: OpaquePointer? (GdkWindow*)
	open func getWindow() -> OpaquePointer? {
		return gtk_widget_get_window(GTK_WIDGET(self.GOBJECT))
	}

	/// Makes @widget the current grabbed widget.
	/// This means that interaction with other widgets in the same
	/// application is blocked and mouse as well as keyboard events
	/// are delivered to this widget.
	/// If @widget is not sensitive, it is not set as the current
	/// grabbed widget and this function does nothing.
	open func gtkGrabAdd() -> Swift.Void {
		gtk_grab_add(GTK_WIDGET(self.GOBJECT))
	}

	/// Causes @widget to become the default widget. @widget must be able to be
	/// a default widget; typically you would ensure this yourself
	/// by calling gtk_widget_set_can_default() with a %TRUE value.
	/// The default widget is activated when
	/// the user presses Enter in a window. Default widgets must be
	/// activatable, that is, gtk_widget_activate() should affect them. Note
	/// that #GtkEntry widgets require the “activates-default” property
	/// set to %TRUE before they activate the default widget when Enter
	/// is pressed and the #GtkEntry is focused.
	open func grabDefault() -> Swift.Void {
		gtk_widget_grab_default(GTK_WIDGET(self.GOBJECT))
	}

	/// Causes @widget to have the keyboard focus for the #GtkWindow it's
	/// inside. @widget must be a focusable widget, such as a #GtkEntry;
	/// something like #GtkFrame won’t work.
	/// More precisely, it must have the %GTK_CAN_FOCUS flag set. Use
	/// gtk_widget_set_can_focus() to modify that flag.
	/// The widget also needs to be realized and mapped. This is indicated by the
	/// related signals. Grabbing the focus immediately after creating the widget
	/// will likely fail and cause critical warnings.
	open func grabFocus() -> Swift.Void {
		gtk_widget_grab_focus(GTK_WIDGET(self.GOBJECT))
	}

	/// Removes the grab from the given widget.
	/// You have to pair calls to gtk_grab_add() and gtk_grab_remove().
	/// If @widget does not have the grab, this function does nothing.
	open func gtkGrabRemove() -> Swift.Void {
		gtk_grab_remove(GTK_WIDGET(self.GOBJECT))
	}

	/// Determines whether @widget is the current default widget within its
	/// toplevel. See gtk_widget_set_can_default().
	/// - Returns: Bool (gboolean)
	open func hasDefault() -> Bool {
		return gtk_widget_has_default(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines if the widget has the global input focus. See
	/// gtk_widget_is_focus() for the difference between having the global
	/// input focus, and only having the focus within a toplevel.
	/// - Returns: Bool (gboolean)
	open func hasFocus() -> Bool {
		return gtk_widget_has_focus(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines whether the widget is currently grabbing events, so it
	/// is the only widget receiving input events (keyboard and mouse).
	/// See also gtk_grab_add().
	/// - Returns: Bool (gboolean)
	open func hasGrab() -> Bool {
		return gtk_widget_has_grab(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines if the widget style has been looked up through the rc mechanism.
	/// - Returns: Bool (gboolean)
	open func hasRcStyle() -> Bool {
		return gtk_widget_has_rc_style(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Checks whether there is a #GdkScreen is associated with
	/// this widget. All toplevel widgets have an associated
	/// screen, and all widgets added into a hierarchy with a toplevel
	/// window at the top.
	/// - Returns: Bool (gboolean)
	open func hasScreen() -> Bool {
		return gtk_widget_has_screen(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines if the widget should show a visible indication that
	/// it has the global input focus. This is a convenience function for
	/// use in ::draw handlers that takes into account whether focus
	/// indication should currently be shown in the toplevel window of
	/// @widget. See gtk_window_get_focus_visible() for more information
	/// about focus indication.
	/// To find out if the widget has the global input focus, use
	/// gtk_widget_has_focus().
	/// - Returns: Bool (gboolean)
	open func hasVisibleFocus() -> Bool {
		return gtk_widget_has_visible_focus(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Reverses the effects of gtk_widget_show(), causing the widget to be
	/// hidden (invisible to the user).
	open func hide() -> Swift.Void {
		gtk_widget_hide(GTK_WIDGET(self.GOBJECT))
	}

	/// Utility function; intended to be connected to the #GtkWidget::delete-event
	/// signal on a #GtkWindow. The function calls gtk_widget_hide() on its
	/// argument, then returns %TRUE. If connected to ::delete-event, the
	/// result is that clicking the close button for a window (on the
	/// window frame, top right corner usually) will hide but not destroy
	/// the window. By default, GTK+ destroys windows when ::delete-event
	/// is received.
	/// - Returns: Bool (gboolean)
	open func hideOnDelete() -> Bool {
		return gtk_widget_hide_on_delete(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the widget is currently being destroyed.
	/// This information can sometimes be used to avoid doing
	/// unnecessary work.
	/// - Returns: Bool (gboolean)
	open func inDestruction() -> Bool {
		return gtk_widget_in_destruction(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Creates and initializes child widgets defined in templates. This
	/// function must be called in the instance initializer for any
	/// class which assigned itself a template using gtk_widget_class_set_template()
	/// It is important to call this function in the instance initializer
	/// of a #GtkWidget subclass and not in #GObject.constructed() or
	/// #GObject.constructor() for two reasons.
	/// One reason is that generally derived widgets will assume that parent
	/// class composite widgets have been created in their instance
	/// initializers.
	/// Another reason is that when calling g_object_new() on a widget with
	/// composite templates, it’s important to build the composite widgets
	/// before the construct properties are set. Properties passed to g_object_new()
	/// should take precedence over properties set in the private template XML.
	open func initTemplate() -> Swift.Void {
		gtk_widget_init_template(GTK_WIDGET(self.GOBJECT))
	}

	/// Sets an input shape for this widget’s GDK window. This allows for
	/// windows which react to mouse click in a nonrectangular region, see
	/// gdk_window_input_shape_combine_region() for more information.
	/// - Parameters:
	///	- region: OpaquePointer? (cairo_region_t*)
	open func inputShapeCombineRegion(_ region: OpaquePointer?) -> Swift.Void {
		gtk_widget_input_shape_combine_region(GTK_WIDGET(self.GOBJECT), region)
	}

	/// Inserts @group into @widget. Children of @widget that implement
	/// #GtkActionable can then be associated with actions in @group by
	/// setting their “action-name” to
	/// @prefix.`action-name`.
	/// If @group is %NULL, a previously inserted group for @name is removed
	/// from @widget.
	/// - Parameters:
	///	- name: String (const gchar*)
	///	- group: OpaquePointer? (GActionGroup*)
	open func insertActionGroup(name: String, group: OpaquePointer?) -> Swift.Void {
		gtk_widget_insert_action_group(GTK_WIDGET(self.GOBJECT), name, group)
	}

	/// Computes the intersection of a @widget’s area and @area, storing
	/// the intersection in @intersection, and returns %TRUE if there was
	/// an intersection.  @intersection may be %NULL if you’re only
	/// interested in whether there was an intersection.
	/// - Parameters:
	///	- area: UnsafePointer<GdkRectangle>! (const GdkRectangle*)
	///	- intersection: UnsafeMutablePointer<GdkRectangle>? = nil (GdkRectangle*)
	/// - Returns: Bool (gboolean)
	open func intersect(area: UnsafePointer<GdkRectangle>!, intersection: UnsafeMutablePointer<GdkRectangle>? = nil) -> Bool {
		return gtk_widget_intersect(GTK_WIDGET(self.GOBJECT), area, intersection) != 0 ? true : false
	}

	/// Determines whether @widget is somewhere inside @ancestor, possibly with
	/// intermediate containers.
	/// - Parameters:
	///	- ancestor: CGTKWidget (GtkWidget*)
	/// - Returns: Bool (gboolean)
	open func isAncestor(_ ancestor: CGTKWidget) -> Bool {
		return gtk_widget_is_ancestor(GTK_WIDGET(self.GOBJECT), ancestor.WIDGET) != 0 ? true : false
	}

	/// Whether @widget can rely on having its alpha channel
	/// drawn correctly. On X11 this function returns whether a
	/// compositing manager is running for @widget’s screen.
	/// Please note that the semantics of this call will change
	/// in the future if used on a widget that has a composited
	/// window in its hierarchy (as set by gdk_window_set_composited()).
	/// - Returns: Bool (gboolean)
	open func isComposited() -> Bool {
		return gtk_widget_is_composited(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines whether @widget can be drawn to. A widget can be drawn
	/// to if it is mapped and visible.
	/// - Returns: Bool (gboolean)
	open func isDrawable() -> Bool {
		return gtk_widget_is_drawable(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines if the widget is the focus widget within its
	/// toplevel. (This does not mean that the #GtkWidget:has-focus property is
	/// necessarily set; #GtkWidget:has-focus will only be set if the
	/// toplevel widget additionally has the global input focus.)
	/// - Returns: Bool (gboolean)
	open func isFocus() -> Bool {
		return gtk_widget_is_focus(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the widget’s effective sensitivity, which means
	/// it is sensitive itself and also its parent widget is sensitive
	/// - Returns: Bool (gboolean)
	open func isSensitive() -> Bool {
		return gtk_widget_is_sensitive(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines whether @widget is a toplevel widget.
	/// Currently only #GtkWindow and #GtkInvisible (and out-of-process
	/// #GtkPlugs) are toplevel widgets. Toplevel widgets have no parent
	/// widget.
	/// - Returns: Bool (gboolean)
	open func isToplevel() -> Bool {
		return gtk_widget_is_toplevel(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Determines whether the widget and all its parents are marked as
	/// visible.
	/// This function does not check if the widget is obscured in any way.
	/// See also gtk_widget_get_visible() and gtk_widget_set_visible()
	/// - Returns: Bool (gboolean)
	open func isVisible() -> Bool {
		return gtk_widget_is_visible(GTK_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// This function should be called whenever keyboard navigation within
	/// a single widget hits a boundary. The function emits the
	/// #GtkWidget::keynav-failed signal on the widget and its return
	/// value should be interpreted in a way similar to the return value of
	/// gtk_widget_child_focus():
	/// When %TRUE is returned, stay in the widget, the failed keyboard
	/// navigation is OK and/or there is nowhere we can/should move the
	/// focus to.
	/// When %FALSE is returned, the caller should continue with keyboard
	/// navigation outside the widget, e.g. by calling
	/// gtk_widget_child_focus() on the widget’s toplevel.
	/// The default ::keynav-failed handler returns %TRUE for
	/// %GTK_DIR_TAB_FORWARD and %GTK_DIR_TAB_BACKWARD. For the other
	/// values of #GtkDirectionType it returns %FALSE.
	/// Whenever the default handler returns %TRUE, it also calls
	/// gtk_widget_error_bell() to notify the user of the failed keyboard
	/// navigation.
	/// A use case for providing an own implementation of ::keynav-failed
	/// (either by connecting to it or by overriding it) would be a row of
	/// #GtkEntry widgets where the user should be able to navigate the
	/// entire row with the cursor keys, as e.g. known from user interfaces
	/// that require entering license keys.
	/// - Parameters:
	///	- direction: GtkDirectionType (GtkDirectionType)
	/// - Returns: Bool (gboolean)
	open func keynavFailed(direction: GtkDirectionType) -> Bool {
		return gtk_widget_keynav_failed(GTK_WIDGET(self.GOBJECT), direction) != 0 ? true : false
	}

	/// Lists the closures used by @widget for accelerator group connections
	/// with gtk_accel_group_connect_by_path() or gtk_accel_group_connect().
	/// The closures can be used to monitor accelerator changes on @widget,
	/// by connecting to the @GtkAccelGroup::accel-changed signal of the
	/// #GtkAccelGroup of a closure which can be found out with
	/// gtk_accel_group_from_accel_closure().
	/// - Returns: UnsafeMutablePointer<GList>! (GList*)
	open func listAccelClosures() -> UnsafeMutablePointer<GList>! {
		return gtk_widget_list_accel_closures(GTK_WIDGET(self.GOBJECT))
	}

	/// Retrieves a %NULL-terminated array of strings containing the prefixes of
	/// #GActionGroup's available to @widget.
	/// - Returns: UnsafeMutablePointer<UnsafePointer<gchar>?>! (const gchar**)
	open func listActionPrefixes() -> UnsafeMutablePointer<UnsafePointer<gchar>?>! {
		return gtk_widget_list_action_prefixes(GTK_WIDGET(self.GOBJECT))
	}

	/// Returns a newly allocated list of the widgets, normally labels, for
	/// which this widget is the target of a mnemonic (see for example,
	/// gtk_label_set_mnemonic_widget()).
	/// The widgets in the list are not individually referenced. If you
	/// want to iterate through the list and perform actions involving
	/// callbacks that might destroy the widgets, you
	/// must call `g_list_foreach (result,
	/// (GFunc)g_object_ref, NULL)` first, and then unref all the
	/// widgets afterwards.
	/// - Returns: UnsafeMutablePointer<GList>! (GList*)
	open func listMnemonicLabels() -> UnsafeMutablePointer<GList>! {
		return gtk_widget_list_mnemonic_labels(GTK_WIDGET(self.GOBJECT))
	}

	/// This function is only for use in widget implementations. Causes
	/// a widget to be mapped if it isn’t already.
	open func map() -> Swift.Void {
		gtk_widget_map(GTK_WIDGET(self.GOBJECT))
	}

	/// Emits the #GtkWidget::mnemonic-activate signal.
	/// - Parameters:
	///	- groupCycling: Bool (gboolean)
	/// - Returns: Bool (gboolean)
	open func mnemonicActivate(groupCycling: Bool) -> Bool {
		return gtk_widget_mnemonic_activate(GTK_WIDGET(self.GOBJECT), groupCycling ? 1 : 0) != 0 ? true : false
	}

	/// Sets the base color for a widget in a particular state.
	/// All other style values are left untouched. The base color
	/// is the background color used along with the text color
	/// (see gtk_widget_modify_text()) for widgets such as #GtkEntry
	/// and #GtkTextView. See also gtk_widget_modify_style().
	/// > Note that “no window” widgets (which have the %GTK_NO_WINDOW
	/// > flag set) draw on their parent container’s window and thus may
	/// > not draw any background themselves. This is the case for e.g.
	/// > #GtkLabel.
	/// >
	/// > To modify the background of such widgets, you have to set the
	/// > base color on their parent; if you want to set the background
	/// > of a rectangular area around a label, try placing the label in
	/// > a #GtkEventBox widget and setting the base color on that.
	/// - Parameters:
	///	- state: GtkStateType (GtkStateType)
	///	- color: UnsafePointer<GdkColor>? (const GdkColor*)
	open func modifyBase(state: GtkStateType, color: UnsafePointer<GdkColor>?) -> Swift.Void {
		gtk_widget_modify_base(GTK_WIDGET(self.GOBJECT), state, color)
	}

	/// Sets the background color for a widget in a particular state.
	/// All other style values are left untouched.
	/// See also gtk_widget_modify_style().
	/// > Note that “no window” widgets (which have the %GTK_NO_WINDOW
	/// > flag set) draw on their parent container’s window and thus may
	/// > not draw any background themselves. This is the case for e.g.
	/// > #GtkLabel.
	/// >
	/// > To modify the background of such widgets, you have to set the
	/// > background color on their parent; if you want to set the background
	/// > of a rectangular area around a label, try placing the label in
	/// > a #GtkEventBox widget and setting the background color on that.
	/// - Parameters:
	///	- state: GtkStateType (GtkStateType)
	///	- color: UnsafePointer<GdkColor>? (const GdkColor*)
	open func modifyBg(state: GtkStateType, color: UnsafePointer<GdkColor>?) -> Swift.Void {
		gtk_widget_modify_bg(GTK_WIDGET(self.GOBJECT), state, color)
	}

	/// Sets the cursor color to use in a widget, overriding the #GtkWidget
	/// cursor-color and secondary-cursor-color
	/// style properties.
	/// All other style values are left untouched.
	/// See also gtk_widget_modify_style().
	/// - Parameters:
	///	- primary: UnsafePointer<GdkColor>? (const GdkColor*)
	///	- secondary: UnsafePointer<GdkColor>? (const GdkColor*)
	open func modifyCursor(primary: UnsafePointer<GdkColor>?, secondary: UnsafePointer<GdkColor>?) -> Swift.Void {
		gtk_widget_modify_cursor(GTK_WIDGET(self.GOBJECT), primary, secondary)
	}

	/// Sets the foreground color for a widget in a particular state.
	/// All other style values are left untouched.
	/// See also gtk_widget_modify_style().
	/// - Parameters:
	///	- state: GtkStateType (GtkStateType)
	///	- color: UnsafePointer<GdkColor>? (const GdkColor*)
	open func modifyFg(state: GtkStateType, color: UnsafePointer<GdkColor>?) -> Swift.Void {
		gtk_widget_modify_fg(GTK_WIDGET(self.GOBJECT), state, color)
	}

	/// Sets the font to use for a widget.
	/// All other style values are left untouched.
	/// See also gtk_widget_modify_style().
	/// - Parameters:
	///	- fontDesc: OpaquePointer? (PangoFontDescription*)
	open func modifyFont(fontDesc: OpaquePointer?) -> Swift.Void {
		gtk_widget_modify_font(GTK_WIDGET(self.GOBJECT), fontDesc)
	}

	/// Modifies style values on the widget.
	/// Modifications made using this technique take precedence over
	/// style values set via an RC file, however, they will be overridden
	/// if a style is explicitly set on the widget using gtk_widget_set_style().
	/// The #GtkRcStyle-struct is designed so each field can either be
	/// set or unset, so it is possible, using this function, to modify some
	/// style values and leave the others unchanged.
	/// Note that modifications made with this function are not cumulative
	/// with previous calls to gtk_widget_modify_style() or with such
	/// functions as gtk_widget_modify_fg(). If you wish to retain
	/// previous values, you must first call gtk_widget_get_modifier_style(),
	/// make your modifications to the returned style, then call
	/// gtk_widget_modify_style() with that style. On the other hand,
	/// if you first call gtk_widget_modify_style(), subsequent calls
	/// to such functions gtk_widget_modify_fg() will have a cumulative
	/// effect with the initial modifications.
	/// - Parameters:
	///	- style: UnsafeMutablePointer<GtkRcStyle>! (GtkRcStyle*)
	open func modifyStyle(_ style: UnsafeMutablePointer<GtkRcStyle>!) -> Swift.Void {
		gtk_widget_modify_style(GTK_WIDGET(self.GOBJECT), style)
	}

	/// Sets the text color for a widget in a particular state.
	/// All other style values are left untouched.
	/// The text color is the foreground color used along with the
	/// base color (see gtk_widget_modify_base()) for widgets such
	/// as #GtkEntry and #GtkTextView.
	/// See also gtk_widget_modify_style().
	/// - Parameters:
	///	- state: GtkStateType (GtkStateType)
	///	- color: UnsafePointer<GdkColor>? (const GdkColor*)
	open func modifyText(state: GtkStateType, color: UnsafePointer<GdkColor>?) -> Swift.Void {
		gtk_widget_modify_text(GTK_WIDGET(self.GOBJECT), state, color)
	}

	/// Sets the background color to use for a widget.
	/// All other style values are left untouched.
	/// See gtk_widget_override_color().
	/// - Parameters:
	///	- state: GtkStateFlags (GtkStateFlags)
	///	- color: UnsafePointer<GdkRGBA>? (const GdkRGBA*)
	open func overrideBackgroundColor(state: GtkStateFlags, color: UnsafePointer<GdkRGBA>?) -> Swift.Void {
		gtk_widget_override_background_color(GTK_WIDGET(self.GOBJECT), state, color)
	}

	/// Sets the color to use for a widget.
	/// All other style values are left untouched.
	/// This function does not act recursively. Setting the color of a
	/// container does not affect its children. Note that some widgets that
	/// you may not think of as containers, for instance #GtkButtons,
	/// are actually containers.
	/// This API is mostly meant as a quick way for applications to
	/// change a widget appearance. If you are developing a widgets
	/// library and intend this change to be themeable, it is better
	/// done by setting meaningful CSS classes in your
	/// widget/container implementation through gtk_style_context_add_class().
	/// This way, your widget library can install a #GtkCssProvider
	/// with the %GTK_STYLE_PROVIDER_PRIORITY_FALLBACK priority in order
	/// to provide a default styling for those widgets that need so, and
	/// this theming may fully overridden by the user’s theme.
	/// Note that for complex widgets this may bring in undesired
	/// results (such as uniform background color everywhere), in
	/// these cases it is better to fully style such widgets through a
	/// #GtkCssProvider with the %GTK_STYLE_PROVIDER_PRIORITY_APPLICATION
	/// priority.
	/// - Parameters:
	///	- state: GtkStateFlags (GtkStateFlags)
	///	- color: UnsafePointer<GdkRGBA>? (const GdkRGBA*)
	open func overrideColor(state: GtkStateFlags, color: UnsafePointer<GdkRGBA>?) -> Swift.Void {
		gtk_widget_override_color(GTK_WIDGET(self.GOBJECT), state, color)
	}

	/// Sets the cursor color to use in a widget, overriding the
	/// cursor-color and secondary-cursor-color
	/// style properties. All other style values are left untouched.
	/// See also gtk_widget_modify_style().
	/// Note that the underlying properties have the #GdkColor type,
	/// so the alpha value in @primary and @secondary will be ignored.
	/// - Parameters:
	///	- cursor: UnsafePointer<GdkRGBA>? (const GdkRGBA*)
	///	- secondaryCursor: UnsafePointer<GdkRGBA>? (const GdkRGBA*)
	open func overrideCursor(_ cursor: UnsafePointer<GdkRGBA>?, secondaryCursor: UnsafePointer<GdkRGBA>?) -> Swift.Void {
		gtk_widget_override_cursor(GTK_WIDGET(self.GOBJECT), cursor, secondaryCursor)
	}

	/// Sets the font to use for a widget. All other style values are
	/// left untouched. See gtk_widget_override_color().
	/// - Parameters:
	///	- fontDesc: OpaquePointer? (const PangoFontDescription*)
	open func overrideFont(fontDesc: OpaquePointer?) -> Swift.Void {
		gtk_widget_override_font(GTK_WIDGET(self.GOBJECT), fontDesc)
	}

	/// Sets a symbolic color for a widget.
	/// All other style values are left untouched.
	/// See gtk_widget_override_color() for overriding the foreground
	/// or background color.
	/// - Parameters:
	///	- name: String (const gchar*)
	///	- color: UnsafePointer<GdkRGBA>? (const GdkRGBA*)
	open func overrideSymbolicColor(name: String, color: UnsafePointer<GdkRGBA>?) -> Swift.Void {
		gtk_widget_override_symbolic_color(GTK_WIDGET(self.GOBJECT), name, color)
	}

	/// Obtains the full path to @widget. The path is simply the name of a
	/// widget and all its parents in the container hierarchy, separated by
	/// periods. The name of a widget comes from
	/// gtk_widget_get_name(). Paths are used to apply styles to a widget
	/// in gtkrc configuration files. Widget names are the type of the
	/// widget by default (e.g. “GtkButton”) or can be set to an
	/// application-specific value with gtk_widget_set_name(). By setting
	/// the name of a widget, you allow users or theme authors to apply
	/// styles to that specific widget in their gtkrc
	/// file. @path_reversed_p fills in the path in reverse order,
	/// i.e. starting with @widget’s name instead of starting with the name
	/// of @widget’s outermost ancestor.
	/// - Parameters:
	///	- pathLength: UnsafeMutablePointer<UInt32>! (guint*)
	///	- path: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! (UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!)
	///	- pathReversed: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! (UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!)
	open func path(pathLength: UnsafeMutablePointer<UInt32>!, path: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!, pathReversed: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!) -> Swift.Void {
		gtk_widget_path(GTK_WIDGET(self.GOBJECT), pathLength, path, pathReversed)
	}

	/// This function is only for use in widget implementations.
	/// Flags the widget for a rerun of the GtkWidgetClass::size_allocate
	/// function. Use this function instead of gtk_widget_queue_resize()
	/// when the @widget's size request didn't change but it wants to
	/// reposition its contents.
	/// An example user of this function is gtk_widget_set_halign().
	open func queueAllocate() -> Swift.Void {
		gtk_widget_queue_allocate(GTK_WIDGET(self.GOBJECT))
	}

	/// Mark @widget as needing to recompute its expand flags. Call
	/// this function when setting legacy expand child properties
	/// on the child of a container.
	/// See gtk_widget_compute_expand().
	open func queueComputeExpand() -> Swift.Void {
		gtk_widget_queue_compute_expand(GTK_WIDGET(self.GOBJECT))
	}

	/// Equivalent to calling gtk_widget_queue_draw_area() for the
	/// entire area of a widget.
	open func queueDraw() -> Swift.Void {
		gtk_widget_queue_draw(GTK_WIDGET(self.GOBJECT))
	}

	/// Convenience function that calls gtk_widget_queue_draw_region() on
	/// the region created from the given coordinates.
	/// The region here is specified in widget coordinates.
	/// Widget coordinates are a bit odd; for historical reasons, they are
	/// defined as @widget->window coordinates for widgets that return %TRUE for
	/// gtk_widget_get_has_window(), and are relative to @widget->allocation.x,
	/// @widget->allocation.y otherwise.
	/// @width or @height may be 0, in this case this function does
	/// nothing. Negative values for @width and @height are not allowed.
	/// - Parameters:
	///	- x: gint (gint)
	///	- y: gint (gint)
	///	- width: gint (gint)
	///	- height: gint (gint)
	open func queueDrawArea(x: gint, y: gint, width: gint, height: gint) -> Swift.Void {
		gtk_widget_queue_draw_area(GTK_WIDGET(self.GOBJECT), x, y, width, height)
	}

	/// Invalidates the area of @widget defined by @region by calling
	/// gdk_window_invalidate_region() on the widget’s window and all its
	/// child windows. Once the main loop becomes idle (after the current
	/// batch of events has been processed, roughly), the window will
	/// receive expose events for the union of all regions that have been
	/// invalidated.
	/// Normally you would only use this function in widget
	/// implementations. You might also use it to schedule a redraw of a
	/// #GtkDrawingArea or some portion thereof.
	/// - Parameters:
	///	- region: OpaquePointer! (const cairo_region_t*)
	open func queueDrawRegion(_ region: OpaquePointer!) -> Swift.Void {
		gtk_widget_queue_draw_region(GTK_WIDGET(self.GOBJECT), region)
	}

	/// This function is only for use in widget implementations.
	/// Flags a widget to have its size renegotiated; should
	/// be called when a widget for some reason has a new size request.
	/// For example, when you change the text in a #GtkLabel, #GtkLabel
	/// queues a resize to ensure there’s enough space for the new text.
	/// Note that you cannot call gtk_widget_queue_resize() on a widget
	/// from inside its implementation of the GtkWidgetClass::size_allocate
	/// virtual method. Calls to gtk_widget_queue_resize() from inside
	/// GtkWidgetClass::size_allocate will be silently ignored.
	open func queueResize() -> Swift.Void {
		gtk_widget_queue_resize(GTK_WIDGET(self.GOBJECT))
	}

	/// This function works like gtk_widget_queue_resize(),
	/// except that the widget is not invalidated.
	open func queueResizeNoRedraw() -> Swift.Void {
		gtk_widget_queue_resize_no_redraw(GTK_WIDGET(self.GOBJECT))
	}

	/// Creates the GDK (windowing system) resources associated with a
	/// widget.  For example, @widget->window will be created when a widget
	/// is realized.  Normally realization happens implicitly; if you show
	/// a widget and all its parent containers, then the widget will be
	/// realized and mapped automatically.
	/// Realizing a widget requires all
	/// the widget’s parent widgets to be realized; calling
	/// gtk_widget_realize() realizes the widget’s parents in addition to
	/// @widget itself. If a widget is not yet inside a toplevel window
	/// when you realize it, bad things will happen.
	/// This function is primarily used in widget implementations, and
	/// isn’t very useful otherwise. Many times when you think you might
	/// need it, a better approach is to connect to a signal that will be
	/// called after the widget is realized automatically, such as
	/// #GtkWidget::draw. Or simply g_signal_connect () to the
	/// #GtkWidget::realize signal.
	open func realize() -> Swift.Void {
		gtk_widget_realize(GTK_WIDGET(self.GOBJECT))
	}

	/// Computes the intersection of a @widget’s area and @region, returning
	/// the intersection. The result may be empty, use cairo_region_is_empty() to
	/// check.
	/// - Parameters:
	///	- region: OpaquePointer! (const cairo_region_t*)
	/// - Returns: OpaquePointer (cairo_region_t*)
	open func regionIntersect(region: OpaquePointer!) -> OpaquePointer {
		return gtk_widget_region_intersect(GTK_WIDGET(self.GOBJECT), region)
	}

	/// Registers a #GdkWindow with the widget and sets it up so that
	/// the widget receives events for it. Call gtk_widget_unregister_window()
	/// when destroying the window.
	/// Before 3.8 you needed to call gdk_window_set_user_data() directly to set
	/// this up. This is now deprecated and you should use gtk_widget_register_window()
	/// instead. Old code will keep working as is, although some new features like
	/// transparency might not work perfectly.
	/// - Parameters:
	///	- window: OpaquePointer! (GdkWindow*)
	open func registerWindow(_ window: OpaquePointer!) -> Swift.Void {
		gtk_widget_register_window(GTK_WIDGET(self.GOBJECT), window)
	}

	/// Removes an accelerator from @widget, previously installed with
	/// gtk_widget_add_accelerator().
	/// - Parameters:
	///	- accelGroup: UnsafeMutablePointer<GtkAccelGroup>! (GtkAccelGroup*)
	///	- accelKey: guint (guint)
	///	- accelMods: GdkModifierType (GdkModifierType)
	/// - Returns: Bool (gboolean)
	open func removeAccelerator(accelGroup: UnsafeMutablePointer<GtkAccelGroup>!, accelKey: guint, accelMods: GdkModifierType) -> Bool {
		return gtk_widget_remove_accelerator(GTK_WIDGET(self.GOBJECT), accelGroup, accelKey, accelMods) != 0 ? true : false
	}

	/// Removes a widget from the list of mnemonic labels for
	/// this widget. (See gtk_widget_list_mnemonic_labels()). The widget
	/// must have previously been added to the list with
	/// gtk_widget_add_mnemonic_label().
	/// - Parameters:
	///	- label: CGTKWidget (GtkWidget*)
	open func removeMnemonicLabel(_ label: CGTKWidget) -> Swift.Void {
		gtk_widget_remove_mnemonic_label(GTK_WIDGET(self.GOBJECT), label.WIDGET)
	}

	/// Removes a tick callback previously registered with
	/// gtk_widget_add_tick_callback().
	/// - Parameters:
	///	- id: guint (guint)
	open func removeTickCallback(id: guint) -> Swift.Void {
		gtk_widget_remove_tick_callback(GTK_WIDGET(self.GOBJECT), id)
	}

	/// A convenience function that uses the theme settings for @widget
	/// to look up @stock_id and render it to a pixbuf. @stock_id should
	/// be a stock icon ID such as #GTK_STOCK_OPEN or #GTK_STOCK_OK. @size
	/// should be a size such as #GTK_ICON_SIZE_MENU. @detail should be a
	/// string that identifies the widget or code doing the rendering, so
	/// that theme engines can special-case rendering for that widget or
	/// code.
	/// The pixels in the returned #GdkPixbuf are shared with the rest of
	/// the application and should not be modified. The pixbuf should be
	/// freed after use with g_object_unref().
	/// - Parameters:
	///	- stockId: String (const gchar*)
	///	- size: GtkIconSize (GtkIconSize)
	///	- detail: String? (const gchar*)
	/// - Returns: OpaquePointer? (GdkPixbuf*)
	open func renderIcon(stockId: String, size: GtkIconSize, detail: String?) -> OpaquePointer? {
		return gtk_widget_render_icon(GTK_WIDGET(self.GOBJECT), stockId, size, detail)
	}

	/// A convenience function that uses the theme engine and style
	/// settings for @widget to look up @stock_id and render it to
	/// a pixbuf. @stock_id should be a stock icon ID such as
	/// #GTK_STOCK_OPEN or #GTK_STOCK_OK. @size should be a size
	/// such as #GTK_ICON_SIZE_MENU.
	/// The pixels in the returned #GdkPixbuf are shared with the rest of
	/// the application and should not be modified. The pixbuf should be freed
	/// after use with g_object_unref().
	/// - Parameters:
	///	- stockId: String (const gchar*)
	///	- size: GtkIconSize (GtkIconSize)
	/// - Returns: OpaquePointer? (GdkPixbuf*)
	open func renderIconPixbuf(stockId: String, size: GtkIconSize) -> OpaquePointer? {
		return gtk_widget_render_icon_pixbuf(GTK_WIDGET(self.GOBJECT), stockId, size)
	}

	/// Moves a widget from one #GtkContainer to another, handling reference
	/// count issues to avoid destroying the widget.
	/// - Parameters:
	///	- newParent: CGTKWidget (GtkWidget*)
	open func reparent(newParent: CGTKWidget) -> Swift.Void {
		gtk_widget_reparent(GTK_WIDGET(self.GOBJECT), newParent.WIDGET)
	}

	/// Reset the styles of @widget and all descendents, so when
	/// they are looked up again, they get the correct values
	/// for the currently loaded RC file settings.
	/// This function is not useful for applications.
	open func resetRcStyles() -> Swift.Void {
		gtk_widget_reset_rc_styles(GTK_WIDGET(self.GOBJECT))
	}

	/// Updates the style context of @widget and all descendants
	/// by updating its widget path. #GtkContainers may want
	/// to use this on a child when reordering it in a way that a different
	/// style might apply to it. See also gtk_container_get_path_for_child().
	open func resetStyle() -> Swift.Void {
		gtk_widget_reset_style(GTK_WIDGET(self.GOBJECT))
	}

	/// Very rarely-used function. This function is used to emit
	/// an expose event on a widget. This function is not normally used
	/// directly. The only time it is used is when propagating an expose
	/// event to a windowless child widget (gtk_widget_get_has_window() is %FALSE),
	/// and that is normally done using gtk_container_propagate_draw().
	/// If you want to force an area of a window to be redrawn,
	/// use gdk_window_invalidate_rect() or gdk_window_invalidate_region().
	/// To cause the redraw to be done immediately, follow that call
	/// with a call to gdk_window_process_updates().
	/// - Parameters:
	///	- event: UnsafeMutablePointer<GdkEvent>! (GdkEvent*)
	/// - Returns: gint (gint)
	open func sendExpose(event: UnsafeMutablePointer<GdkEvent>!) -> gint {
		return gtk_widget_send_expose(GTK_WIDGET(self.GOBJECT), event)
	}

	/// Sends the focus change @event to @widget
	/// This function is not meant to be used by applications. The only time it
	/// should be used is when it is necessary for a #GtkWidget to assign focus
	/// to a widget that is semantically owned by the first widget even though
	/// it’s not a direct child - for instance, a search entry in a floating
	/// window similar to the quick search in #GtkTreeView.
	/// An example of its usage is:
	/// |[<!-- language="C" -->
	/// GdkEvent *fevent = gdk_event_new (GDK_FOCUS_CHANGE);
	/// fevent->focus_change.type = GDK_FOCUS_CHANGE;
	/// fevent->focus_change.in = TRUE;
	/// fevent->focus_change.window = _gtk_widget_get_window (widget);
	/// if (fevent->focus_change.window != NULL)
	/// g_object_ref (fevent->focus_change.window);
	/// gtk_widget_send_focus_change (widget, fevent);
	/// gdk_event_free (event);
	/// ]|
	/// - Parameters:
	///	- event: UnsafeMutablePointer<GdkEvent>! (GdkEvent*)
	/// - Returns: Bool (gboolean)
	open func sendFocusChange(event: UnsafeMutablePointer<GdkEvent>!) -> Bool {
		return gtk_widget_send_focus_change(GTK_WIDGET(self.GOBJECT), event) != 0 ? true : false
	}

	/// Given an accelerator group, @accel_group, and an accelerator path,
	/// @accel_path, sets up an accelerator in @accel_group so whenever the
	/// key binding that is defined for @accel_path is pressed, @widget
	/// will be activated.  This removes any accelerators (for any
	/// accelerator group) installed by previous calls to
	/// gtk_widget_set_accel_path(). Associating accelerators with
	/// paths allows them to be modified by the user and the modifications
	/// to be saved for future use. (See gtk_accel_map_save().)
	/// This function is a low level function that would most likely
	/// be used by a menu creation system like #GtkUIManager. If you
	/// use #GtkUIManager, setting up accelerator paths will be done
	/// automatically.
	/// Even when you you aren’t using #GtkUIManager, if you only want to
	/// set up accelerators on menu items gtk_menu_item_set_accel_path()
	/// provides a somewhat more convenient interface.
	/// Note that @accel_path string will be stored in a #GQuark. Therefore, if you
	/// pass a static string, you can save some memory by interning it first with
	/// g_intern_static_string().
	/// - Parameters:
	///	- accelPath: String? (const gchar*)
	///	- accelGroup: UnsafeMutablePointer<GtkAccelGroup>? (GtkAccelGroup*)
	open func setAccelPath(_ accelPath: String?, accelGroup: UnsafeMutablePointer<GtkAccelGroup>?) -> Swift.Void {
		gtk_widget_set_accel_path(GTK_WIDGET(self.GOBJECT), accelPath, accelGroup)
	}

	/// Sets the widget’s allocation.  This should not be used
	/// directly, but from within a widget’s size_allocate method.
	/// The allocation set should be the “adjusted” or actual
	/// allocation. If you’re implementing a #GtkContainer, you want to use
	/// gtk_widget_size_allocate() instead of gtk_widget_set_allocation().
	/// The GtkWidgetClass::adjust_size_allocation virtual method adjusts the
	/// allocation inside gtk_widget_size_allocate() to create an adjusted
	/// allocation.
	/// - Parameters:
	///	- allocation: UnsafePointer<GtkAllocation>! (const GtkAllocation*)
	open func setAllocation(_ allocation: UnsafePointer<GtkAllocation>!) -> Swift.Void {
		gtk_widget_set_allocation(GTK_WIDGET(self.GOBJECT), allocation)
	}

	/// Sets whether the application intends to draw on the widget in
	/// an #GtkWidget::draw handler.
	/// This is a hint to the widget and does not affect the behavior of
	/// the GTK+ core; many widgets ignore this flag entirely. For widgets
	/// that do pay attention to the flag, such as #GtkEventBox and #GtkWindow,
	/// the effect is to suppress default themed drawing of the widget's
	/// background. (Children of the widget will still be drawn.) The application
	/// is then entirely responsible for drawing the widget background.
	/// Note that the background is still drawn when the widget is mapped.
	/// - Parameters:
	///	- appPaintable: Bool (gboolean)
	open func setAppPaintable(_ appPaintable: Bool) -> Swift.Void {
		gtk_widget_set_app_paintable(GTK_WIDGET(self.GOBJECT), appPaintable ? 1 : 0)
	}

	/// Specifies whether @widget can be a default widget. See
	/// gtk_widget_grab_default() for details about the meaning of
	/// “default”.
	/// - Parameters:
	///	- canDefault: Bool (gboolean)
	open func setCanDefault(_ canDefault: Bool) -> Swift.Void {
		gtk_widget_set_can_default(GTK_WIDGET(self.GOBJECT), canDefault ? 1 : 0)
	}

	/// Specifies whether @widget can own the input focus. See
	/// gtk_widget_grab_focus() for actually setting the input focus on a
	/// widget.
	/// - Parameters:
	///	- canFocus: Bool (gboolean)
	open func setCanFocus(_ canFocus: Bool) -> Swift.Void {
		gtk_widget_set_can_focus(GTK_WIDGET(self.GOBJECT), canFocus ? 1 : 0)
	}

	/// Sets whether @widget should be mapped along with its when its parent
	/// is mapped and @widget has been shown with gtk_widget_show().
	/// The child visibility can be set for widget before it is added to
	/// a container with gtk_widget_set_parent(), to avoid mapping
	/// children unnecessary before immediately unmapping them. However
	/// it will be reset to its default state of %TRUE when the widget
	/// is removed from a container.
	/// Note that changing the child visibility of a widget does not
	/// queue a resize on the widget. Most of the time, the size of
	/// a widget is computed from all visible children, whether or
	/// not they are mapped. If this is not the case, the container
	/// can queue a resize itself.
	/// This function is only useful for container implementations and
	/// never should be called by an application.
	/// - Parameters:
	///	- isVisible: Bool (gboolean)
	open func setChildVisible(isVisible: Bool) -> Swift.Void {
		gtk_widget_set_child_visible(GTK_WIDGET(self.GOBJECT), isVisible ? 1 : 0)
	}

	/// Sets the widget’s clip.  This must not be used directly,
	/// but from within a widget’s size_allocate method.
	/// It must be called after gtk_widget_set_allocation() (or after chaining up
	/// to the parent class), because that function resets the clip.
	/// The clip set should be the area that @widget draws on. If @widget is a
	/// #GtkContainer, the area must contain all children's clips.
	/// If this function is not called by @widget during a ::size-allocate handler,
	/// the clip will be set to @widget's allocation.
	/// - Parameters:
	///	- clip: UnsafePointer<GtkAllocation>! (const GtkAllocation*)
	open func setClip(_ clip: UnsafePointer<GtkAllocation>!) -> Swift.Void {
		gtk_widget_set_clip(GTK_WIDGET(self.GOBJECT), clip)
	}

	/// Sets a widgets composite name. The widget must be
	/// a composite child of its parent; see gtk_widget_push_composite_child().
	/// - Parameters:
	///	- name: String (const gchar*)
	open func setCompositeName(_ name: String) -> Swift.Void {
		gtk_widget_set_composite_name(GTK_WIDGET(self.GOBJECT), name)
	}

	/// Enables or disables a #GdkDevice to interact with @widget
	/// and all its children.
	/// It does so by descending through the #GdkWindow hierarchy
	/// and enabling the same mask that is has for core events
	/// (i.e. the one that gdk_window_get_events() returns).
	/// - Parameters:
	///	- device: OpaquePointer! (GdkDevice*)
	///	- enabled: Bool (gboolean)
	open func setDeviceEnabled(device: OpaquePointer!, enabled: Bool) -> Swift.Void {
		gtk_widget_set_device_enabled(GTK_WIDGET(self.GOBJECT), device, enabled ? 1 : 0)
	}

	/// Sets the device event mask (see #GdkEventMask) for a widget. The event
	/// mask determines which events a widget will receive from @device. Keep
	/// in mind that different widgets have different default event masks, and by
	/// changing the event mask you may disrupt a widget’s functionality,
	/// so be careful. This function must be called while a widget is
	/// unrealized. Consider gtk_widget_add_device_events() for widgets that are
	/// already realized, or if you want to preserve the existing event
	/// mask. This function can’t be used with windowless widgets (which return
	/// %FALSE from gtk_widget_get_has_window());
	/// to get events on those widgets, place them inside a #GtkEventBox
	/// and receive events on the event box.
	/// - Parameters:
	///	- device: OpaquePointer! (GdkDevice*)
	///	- events: GdkEventMask (GdkEventMask)
	open func setDeviceEvents(device: OpaquePointer!, events: GdkEventMask) -> Swift.Void {
		gtk_widget_set_device_events(GTK_WIDGET(self.GOBJECT), device, events)
	}

	/// Sets the reading direction on a particular widget. This direction
	/// controls the primary direction for widgets containing text,
	/// and also the direction in which the children of a container are
	/// packed. The ability to set the direction is present in order
	/// so that correct localization into languages with right-to-left
	/// reading directions can be done. Generally, applications will
	/// let the default reading direction present, except for containers
	/// where the containers are arranged in an order that is explicitly
	/// visual rather than logical (such as buttons for text justification).
	/// If the direction is set to %GTK_TEXT_DIR_NONE, then the value
	/// set by gtk_widget_set_default_direction() will be used.
	/// - Parameters:
	///	- dir: GtkTextDirection (GtkTextDirection)
	open func setDirection(dir: GtkTextDirection) -> Swift.Void {
		gtk_widget_set_direction(GTK_WIDGET(self.GOBJECT), dir)
	}

	/// Widgets are double buffered by default; you can use this function
	/// to turn off the buffering. “Double buffered” simply means that
	/// gdk_window_begin_draw_frame() and gdk_window_end_draw_frame() are called
	/// automatically around expose events sent to the
	/// widget. gdk_window_begin_draw_frame() diverts all drawing to a widget's
	/// window to an offscreen buffer, and gdk_window_end_draw_frame() draws the
	/// buffer to the screen. The result is that users see the window
	/// update in one smooth step, and don’t see individual graphics
	/// primitives being rendered.
	/// In very simple terms, double buffered widgets don’t flicker,
	/// so you would only use this function to turn off double buffering
	/// if you had special needs and really knew what you were doing.
	/// Note: if you turn off double-buffering, you have to handle
	/// expose events, since even the clearing to the background color or
	/// pixmap will not happen automatically (as it is done in
	/// gdk_window_begin_draw_frame()).
	/// In 3.10 GTK and GDK have been restructured for translucent drawing. Since
	/// then expose events for double-buffered widgets are culled into a single
	/// event to the toplevel GDK window. If you now unset double buffering, you
	/// will cause a separate rendering pass for every widget. This will likely
	/// cause rendering problems - in particular related to stacking - and usually
	/// increases rendering times significantly.
	/// - Parameters:
	///	- doubleBuffered: Bool (gboolean)
	open func setDoubleBuffered(_ doubleBuffered: Bool) -> Swift.Void {
		gtk_widget_set_double_buffered(GTK_WIDGET(self.GOBJECT), doubleBuffered ? 1 : 0)
	}

	/// Sets the event mask (see #GdkEventMask) for a widget. The event
	/// mask determines which events a widget will receive. Keep in mind
	/// that different widgets have different default event masks, and by
	/// changing the event mask you may disrupt a widget’s functionality,
	/// so be careful. This function must be called while a widget is
	/// unrealized. Consider gtk_widget_add_events() for widgets that are
	/// already realized, or if you want to preserve the existing event
	/// mask. This function can’t be used with widgets that have no window.
	/// (See gtk_widget_get_has_window()).  To get events on those widgets,
	/// place them inside a #GtkEventBox and receive events on the event
	/// box.
	/// - Parameters:
	///	- events: gint (gint)
	open func setEvents(_ events: gint) -> Swift.Void {
		gtk_widget_set_events(GTK_WIDGET(self.GOBJECT), events)
	}

	/// Sets whether the widget should grab focus when it is clicked with the mouse.
	/// Making mouse clicks not grab focus is useful in places like toolbars where
	/// you don’t want the keyboard focus removed from the main area of the
	/// application.
	/// - Parameters:
	///	- focusOnClick: Bool (gboolean)
	open func setFocusOnClick(_ focusOnClick: Bool) -> Swift.Void {
		gtk_widget_set_focus_on_click(GTK_WIDGET(self.GOBJECT), focusOnClick ? 1 : 0)
	}

	/// Sets the font map to use for Pango rendering. When not set, the widget
	/// will inherit the font map from its parent.
	/// - Parameters:
	///	- fontMap: OpaquePointer? (PangoFontMap*)
	open func setFontMap(_ fontMap: OpaquePointer?) -> Swift.Void {
		gtk_widget_set_font_map(GTK_WIDGET(self.GOBJECT), fontMap)
	}

	/// Sets the #cairo_font_options_t used for Pango rendering in this widget.
	/// When not set, the default font options for the #GdkScreen will be used.
	/// - Parameters:
	///	- options: OpaquePointer? (const cairo_font_options_t*)
	open func setFontOptions(_ options: OpaquePointer?) -> Swift.Void {
		gtk_widget_set_font_options(GTK_WIDGET(self.GOBJECT), options)
	}

	/// Sets the horizontal alignment of @widget.
	/// See the #GtkWidget:halign property.
	/// - Parameters:
	///	- align: GtkAlign (GtkAlign)
	open func setHalign(align: GtkAlign) -> Swift.Void {
		gtk_widget_set_halign(GTK_WIDGET(self.GOBJECT), align)
	}

	/// Sets the has-tooltip property on @widget to @has_tooltip.  See
	/// #GtkWidget:has-tooltip for more information.
	/// - Parameters:
	///	- hasTooltip: Bool (gboolean)
	open func setHasTooltip(_ hasTooltip: Bool) -> Swift.Void {
		gtk_widget_set_has_tooltip(GTK_WIDGET(self.GOBJECT), hasTooltip ? 1 : 0)
	}

	/// Specifies whether @widget has a #GdkWindow of its own. Note that
	/// all realized widgets have a non-%NULL “window” pointer
	/// (gtk_widget_get_window() never returns a %NULL window when a widget
	/// is realized), but for many of them it’s actually the #GdkWindow of
	/// one of its parent widgets. Widgets that do not create a %window for
	/// themselves in #GtkWidget::realize must announce this by
	/// calling this function with @has_window = %FALSE.
	/// This function should only be called by widget implementations,
	/// and they should call it in their init() function.
	/// - Parameters:
	///	- hasWindow: Bool (gboolean)
	open func setHasWindow(_ hasWindow: Bool) -> Swift.Void {
		gtk_widget_set_has_window(GTK_WIDGET(self.GOBJECT), hasWindow ? 1 : 0)
	}

	/// Sets whether the widget would like any available extra horizontal
	/// space. When a user resizes a #GtkWindow, widgets with expand=TRUE
	/// generally receive the extra space. For example, a list or
	/// scrollable area or document in your window would often be set to
	/// expand.
	/// Call this function to set the expand flag if you would like your
	/// widget to become larger horizontally when the window has extra
	/// room.
	/// By default, widgets automatically expand if any of their children
	/// want to expand. (To see if a widget will automatically expand given
	/// its current children and state, call gtk_widget_compute_expand(). A
	/// container can decide how the expandability of children affects the
	/// expansion of the container by overriding the compute_expand virtual
	/// method on #GtkWidget.).
	/// Setting hexpand explicitly with this function will override the
	/// automatic expand behavior.
	/// This function forces the widget to expand or not to expand,
	/// regardless of children.  The override occurs because
	/// gtk_widget_set_hexpand() sets the hexpand-set property (see
	/// gtk_widget_set_hexpand_set()) which causes the widget’s hexpand
	/// value to be used, rather than looking at children and widget state.
	/// - Parameters:
	///	- expand: Bool (gboolean)
	open func setHexpand(expand: Bool) -> Swift.Void {
		gtk_widget_set_hexpand(GTK_WIDGET(self.GOBJECT), expand ? 1 : 0)
	}

	/// Sets whether the hexpand flag (see gtk_widget_get_hexpand()) will
	/// be used.
	/// The hexpand-set property will be set automatically when you call
	/// gtk_widget_set_hexpand() to set hexpand, so the most likely
	/// reason to use this function would be to unset an explicit expand
	/// flag.
	/// If hexpand is set, then it overrides any computed
	/// expand value based on child widgets. If hexpand is not
	/// set, then the expand value depends on whether any
	/// children of the widget would like to expand.
	/// There are few reasons to use this function, but it’s here
	/// for completeness and consistency.
	/// - Parameters:
	///	- set: Bool (gboolean)
	open func setHexpandSet(_ set: Bool) -> Swift.Void {
		gtk_widget_set_hexpand_set(GTK_WIDGET(self.GOBJECT), set ? 1 : 0)
	}

	/// Marks the widget as being mapped.
	/// This function should only ever be called in a derived widget's
	/// “map” or “unmap” implementation.
	/// - Parameters:
	///	- mapped: Bool (gboolean)
	open func setMapped(_ mapped: Bool) -> Swift.Void {
		gtk_widget_set_mapped(GTK_WIDGET(self.GOBJECT), mapped ? 1 : 0)
	}

	/// Sets the bottom margin of @widget.
	/// See the #GtkWidget:margin-bottom property.
	/// - Parameters:
	///	- margin: gint (gint)
	open func setMarginBottom(margin: gint) -> Swift.Void {
		gtk_widget_set_margin_bottom(GTK_WIDGET(self.GOBJECT), margin)
	}

	/// Sets the end margin of @widget.
	/// See the #GtkWidget:margin-end property.
	/// - Parameters:
	///	- margin: gint (gint)
	open func setMarginEnd(margin: gint) -> Swift.Void {
		gtk_widget_set_margin_end(GTK_WIDGET(self.GOBJECT), margin)
	}

	/// Sets the left margin of @widget.
	/// See the #GtkWidget:margin-left property.
	/// - Parameters:
	///	- margin: gint (gint)
	open func setMarginLeft(margin: gint) -> Swift.Void {
		gtk_widget_set_margin_left(GTK_WIDGET(self.GOBJECT), margin)
	}

	/// Sets the right margin of @widget.
	/// See the #GtkWidget:margin-right property.
	/// - Parameters:
	///	- margin: gint (gint)
	open func setMarginRight(margin: gint) -> Swift.Void {
		gtk_widget_set_margin_right(GTK_WIDGET(self.GOBJECT), margin)
	}

	/// Sets the start margin of @widget.
	/// See the #GtkWidget:margin-start property.
	/// - Parameters:
	///	- margin: gint (gint)
	open func setMarginStart(margin: gint) -> Swift.Void {
		gtk_widget_set_margin_start(GTK_WIDGET(self.GOBJECT), margin)
	}

	/// Sets the top margin of @widget.
	/// See the #GtkWidget:margin-top property.
	/// - Parameters:
	///	- margin: gint (gint)
	open func setMarginTop(margin: gint) -> Swift.Void {
		gtk_widget_set_margin_top(GTK_WIDGET(self.GOBJECT), margin)
	}

	/// Widgets can be named, which allows you to refer to them from a
	/// CSS file. You can apply a style to widgets with a particular name
	/// in the CSS file. See the documentation for the CSS syntax (on the
	/// same page as the docs for #GtkStyleContext).
	/// Note that the CSS syntax has certain special characters to delimit
	/// and represent elements in a selector (period, #, >, *...), so using
	/// these will make your widget impossible to match by name. Any combination
	/// of alphanumeric symbols, dashes and underscores will suffice.
	/// - Parameters:
	///	- name: String (const gchar*)
	open func setName(_ name: String) -> Swift.Void {
		gtk_widget_set_name(GTK_WIDGET(self.GOBJECT), name)
	}

	/// Sets the #GtkWidget:no-show-all property, which determines whether
	/// calls to gtk_widget_show_all() will affect this widget.
	/// This is mostly for use in constructing widget hierarchies with externally
	/// controlled visibility, see #GtkUIManager.
	/// - Parameters:
	///	- noShowAll: Bool (gboolean)
	open func setNoShowAll(_ noShowAll: Bool) -> Swift.Void {
		gtk_widget_set_no_show_all(GTK_WIDGET(self.GOBJECT), noShowAll ? 1 : 0)
	}

	/// Request the @widget to be rendered partially transparent,
	/// with opacity 0 being fully transparent and 1 fully opaque. (Opacity values
	/// are clamped to the [0,1] range.).
	/// This works on both toplevel widget, and child widgets, although there
	/// are some limitations:
	/// For toplevel widgets this depends on the capabilities of the windowing
	/// system. On X11 this has any effect only on X screens with a compositing manager
	/// running. See gtk_widget_is_composited(). On Windows it should work
	/// always, although setting a window’s opacity after the window has been
	/// shown causes it to flicker once on Windows.
	/// For child widgets it doesn’t work if any affected widget has a native window, or
	/// disables double buffering.
	/// - Parameters:
	///	- opacity: Double (double)
	open func setOpacity(_ opacity: Double) -> Swift.Void {
		gtk_widget_set_opacity(GTK_WIDGET(self.GOBJECT), opacity)
	}

	/// This function is useful only when implementing subclasses of
	/// #GtkContainer.
	/// Sets the container as the parent of @widget, and takes care of
	/// some details such as updating the state and style of the child
	/// to reflect its new location. The opposite function is
	/// gtk_widget_unparent().
	/// - Parameters:
	///	- parent: CGTKWidget (GtkWidget*)
	open func setParent(_ parent: CGTKWidget) -> Swift.Void {
		gtk_widget_set_parent(GTK_WIDGET(self.GOBJECT), parent.WIDGET)
	}

	/// Sets a non default parent window for @widget.
	/// For #GtkWindow classes, setting a @parent_window effects whether
	/// the window is a toplevel window or can be embedded into other
	/// widgets.
	/// For #GtkWindow classes, this needs to be called before the
	/// window is realized.
	/// - Parameters:
	///	- parentWindow: OpaquePointer! (GdkWindow*)
	open func setParentWindow(_ parentWindow: OpaquePointer!) -> Swift.Void {
		gtk_widget_set_parent_window(GTK_WIDGET(self.GOBJECT), parentWindow)
	}

	/// Marks the widget as being realized. This function must only be
	/// called after all #GdkWindows for the @widget have been created
	/// and registered.
	/// This function should only ever be called in a derived widget's
	/// “realize” or “unrealize” implementation.
	/// - Parameters:
	///	- realized: Bool (gboolean)
	open func setRealized(_ realized: Bool) -> Swift.Void {
		gtk_widget_set_realized(GTK_WIDGET(self.GOBJECT), realized ? 1 : 0)
	}

	/// Specifies whether @widget will be treated as the default widget
	/// within its toplevel when it has the focus, even if another widget
	/// is the default.
	/// See gtk_widget_grab_default() for details about the meaning of
	/// “default”.
	/// - Parameters:
	///	- receivesDefault: Bool (gboolean)
	open func setReceivesDefault(_ receivesDefault: Bool) -> Swift.Void {
		gtk_widget_set_receives_default(GTK_WIDGET(self.GOBJECT), receivesDefault ? 1 : 0)
	}

	/// Sets whether the entire widget is queued for drawing when its size
	/// allocation changes. By default, this setting is %TRUE and
	/// the entire widget is redrawn on every size change. If your widget
	/// leaves the upper left unchanged when made bigger, turning this
	/// setting off will improve performance.
	/// Note that for widgets where gtk_widget_get_has_window() is %FALSE
	/// setting this flag to %FALSE turns off all allocation on resizing:
	/// the widget will not even redraw if its position changes; this is to
	/// allow containers that don’t draw anything to avoid excess
	/// invalidations. If you set this flag on a widget with no window that
	/// does draw on @widget->window, you are
	/// responsible for invalidating both the old and new allocation of the
	/// widget when the widget is moved and responsible for invalidating
	/// regions newly when the widget increases size.
	/// - Parameters:
	///	- redrawOnAllocate: Bool (gboolean)
	open func setRedrawOnAllocate(_ redrawOnAllocate: Bool) -> Swift.Void {
		gtk_widget_set_redraw_on_allocate(GTK_WIDGET(self.GOBJECT), redrawOnAllocate ? 1 : 0)
	}

	/// Sets the sensitivity of a widget. A widget is sensitive if the user
	/// can interact with it. Insensitive widgets are “grayed out” and the
	/// user can’t interact with them. Insensitive widgets are known as
	/// “inactive”, “disabled”, or “ghosted” in some other toolkits.
	/// - Parameters:
	///	- sensitive: Bool (gboolean)
	open func setSensitive(_ sensitive: Bool) -> Swift.Void {
		gtk_widget_set_sensitive(GTK_WIDGET(self.GOBJECT), sensitive ? 1 : 0)
	}

	/// Sets the minimum size of a widget; that is, the widget’s size
	/// request will be at least @width by @height. You can use this
	/// function to force a widget to be larger than it normally would be.
	/// In most cases, gtk_window_set_default_size() is a better choice for
	/// toplevel windows than this function; setting the default size will
	/// still allow users to shrink the window. Setting the size request
	/// will force them to leave the window at least as large as the size
	/// request. When dealing with window sizes,
	/// gtk_window_set_geometry_hints() can be a useful function as well.
	/// Note the inherent danger of setting any fixed size - themes,
	/// translations into other languages, different fonts, and user action
	/// can all change the appropriate size for a given widget. So, it's
	/// basically impossible to hardcode a size that will always be
	/// correct.
	/// The size request of a widget is the smallest size a widget can
	/// accept while still functioning well and drawing itself correctly.
	/// However in some strange cases a widget may be allocated less than
	/// its requested size, and in many cases a widget may be allocated more
	/// space than it requested.
	/// If the size request in a given direction is -1 (unset), then
	/// the “natural” size request of the widget will be used instead.
	/// The size request set here does not include any margin from the
	/// #GtkWidget properties margin-left, margin-right, margin-top, and
	/// margin-bottom, but it does include pretty much all other padding
	/// or border properties set by any subclass of #GtkWidget.
	/// - Parameters:
	///	- width: gint (gint)
	///	- height: gint (gint)
	open func setSizeRequest(width: gint, height: gint) -> Swift.Void {
		gtk_widget_set_size_request(GTK_WIDGET(self.GOBJECT), width, height)
	}

	/// This function is for use in widget implementations. Sets the state
	/// of a widget (insensitive, prelighted, etc.) Usually you should set
	/// the state using wrapper functions such as gtk_widget_set_sensitive().
	/// - Parameters:
	///	- state: GtkStateType (GtkStateType)
	open func setState(_ state: GtkStateType) -> Swift.Void {
		gtk_widget_set_state(GTK_WIDGET(self.GOBJECT), state)
	}

	/// This function is for use in widget implementations. Turns on flag
	/// values in the current widget state (insensitive, prelighted, etc.).
	/// This function accepts the values %GTK_STATE_FLAG_DIR_LTR and
	/// %GTK_STATE_FLAG_DIR_RTL but ignores them. If you want to set the widget's
	/// direction, use gtk_widget_set_direction().
	/// It is worth mentioning that any other state than %GTK_STATE_FLAG_INSENSITIVE,
	/// will be propagated down to all non-internal children if @widget is a
	/// #GtkContainer, while %GTK_STATE_FLAG_INSENSITIVE itself will be propagated
	/// down to all #GtkContainer children by different means than turning on the
	/// state flag down the hierarchy, both gtk_widget_get_state_flags() and
	/// gtk_widget_is_sensitive() will make use of these.
	/// - Parameters:
	///	- flags: GtkStateFlags (GtkStateFlags)
	///	- clear: Bool (gboolean)
	open func setStateFlags(_ flags: GtkStateFlags, clear: Bool) -> Swift.Void {
		gtk_widget_set_state_flags(GTK_WIDGET(self.GOBJECT), flags, clear ? 1 : 0)
	}

	/// Used to set the #GtkStyle for a widget (@widget->style). Since
	/// GTK 3, this function does nothing, the passed in style is ignored.
	/// - Parameters:
	///	- style: UnsafeMutablePointer<GtkStyle>? (GtkStyle*)
	open func setStyle(_ style: UnsafeMutablePointer<GtkStyle>?) -> Swift.Void {
		gtk_widget_set_style(GTK_WIDGET(self.GOBJECT), style)
	}

	/// Enables or disables multiple pointer awareness. If this setting is %TRUE,
	/// @widget will start receiving multiple, per device enter/leave events. Note
	/// that if custom #GdkWindows are created in #GtkWidget::realize,
	/// gdk_window_set_support_multidevice() will have to be called manually on them.
	/// - Parameters:
	///	- supportMultidevice: Bool (gboolean)
	open func setSupportMultidevice(_ supportMultidevice: Bool) -> Swift.Void {
		gtk_widget_set_support_multidevice(GTK_WIDGET(self.GOBJECT), supportMultidevice ? 1 : 0)
	}

	/// Sets @markup as the contents of the tooltip, which is marked up with
	/// the [Pango text markup language][PangoMarkupFormat].
	/// This function will take care of setting #GtkWidget:has-tooltip to %TRUE
	/// and of the default handler for the #GtkWidget::query-tooltip signal.
	/// See also the #GtkWidget:tooltip-markup property and
	/// gtk_tooltip_set_markup().
	/// - Parameters:
	///	- markup: String? (const gchar*)
	open func setTooltipMarkup(_ markup: String?) -> Swift.Void {
		gtk_widget_set_tooltip_markup(GTK_WIDGET(self.GOBJECT), markup)
	}

	/// Sets @text as the contents of the tooltip. This function will take
	/// care of setting #GtkWidget:has-tooltip to %TRUE and of the default
	/// handler for the #GtkWidget::query-tooltip signal.
	/// See also the #GtkWidget:tooltip-text property and gtk_tooltip_set_text().
	/// - Parameters:
	///	- text: String? (const gchar*)
	open func setTooltipText(_ text: String?) -> Swift.Void {
		gtk_widget_set_tooltip_text(GTK_WIDGET(self.GOBJECT), text)
	}

	/// Replaces the default window used for displaying
	/// tooltips with @custom_window. GTK+ will take care of showing and
	/// hiding @custom_window at the right moment, to behave likewise as
	/// the default tooltip window. If @custom_window is %NULL, the default
	/// tooltip window will be used.
	/// - Parameters:
	///	- customWindow: CGTKWindow? (GtkWindow*)
	open func setTooltipWindow(customWindow: CGTKWindow?) -> Swift.Void {
		gtk_widget_set_tooltip_window(GTK_WIDGET(self.GOBJECT), customWindow?.WINDOW)
	}

	/// Sets the vertical alignment of @widget.
	/// See the #GtkWidget:valign property.
	/// - Parameters:
	///	- align: GtkAlign (GtkAlign)
	open func setValign(align: GtkAlign) -> Swift.Void {
		gtk_widget_set_valign(GTK_WIDGET(self.GOBJECT), align)
	}

	/// Sets whether the widget would like any available extra vertical
	/// space.
	/// See gtk_widget_set_hexpand() for more detail.
	/// - Parameters:
	///	- expand: Bool (gboolean)
	open func setVexpand(expand: Bool) -> Swift.Void {
		gtk_widget_set_vexpand(GTK_WIDGET(self.GOBJECT), expand ? 1 : 0)
	}

	/// Sets whether the vexpand flag (see gtk_widget_get_vexpand()) will
	/// be used.
	/// See gtk_widget_set_hexpand_set() for more detail.
	/// - Parameters:
	///	- set: Bool (gboolean)
	open func setVexpandSet(_ set: Bool) -> Swift.Void {
		gtk_widget_set_vexpand_set(GTK_WIDGET(self.GOBJECT), set ? 1 : 0)
	}

	/// Sets the visibility state of @widget. Note that setting this to
	/// %TRUE doesn’t mean the widget is actually viewable, see
	/// gtk_widget_get_visible().
	/// This function simply calls gtk_widget_show() or gtk_widget_hide()
	/// but is nicer to use when the visibility of the widget depends on
	/// some condition.
	/// - Parameters:
	///	- visible: Bool (gboolean)
	open func setVisible(_ visible: Bool) -> Swift.Void {
		gtk_widget_set_visible(GTK_WIDGET(self.GOBJECT), visible ? 1 : 0)
	}

	/// Sets the visual that should be used for by widget and its children for
	/// creating #GdkWindows. The visual must be on the same #GdkScreen as
	/// returned by gtk_widget_get_screen(), so handling the
	/// #GtkWidget::screen-changed signal is necessary.
	/// Setting a new @visual will not cause @widget to recreate its windows,
	/// so you should call this function before @widget is realized.
	/// - Parameters:
	///	- visual: OpaquePointer? (GdkVisual*)
	open func setVisual(_ visual: OpaquePointer?) -> Swift.Void {
		gtk_widget_set_visual(GTK_WIDGET(self.GOBJECT), visual)
	}

	/// Sets a widget’s window. This function should only be used in a
	/// widget’s #GtkWidget::realize implementation. The %window passed is
	/// usually either new window created with gdk_window_new(), or the
	/// window of its parent widget as returned by
	/// gtk_widget_get_parent_window().
	/// Widgets must indicate whether they will create their own #GdkWindow
	/// by calling gtk_widget_set_has_window(). This is usually done in the
	/// widget’s init() function.
	/// Note that this function does not add any reference to @window.
	/// - Parameters:
	///	- window: OpaquePointer! (GdkWindow*)
	open func setWindow(_ window: OpaquePointer!) -> Swift.Void {
		gtk_widget_set_window(GTK_WIDGET(self.GOBJECT), window)
	}

	/// Sets a shape for this widget’s GDK window. This allows for
	/// transparent windows etc., see gdk_window_shape_combine_region()
	/// for more information.
	/// - Parameters:
	///	- region: OpaquePointer? (cairo_region_t*)
	open func shapeCombineRegion(_ region: OpaquePointer?) -> Swift.Void {
		gtk_widget_shape_combine_region(GTK_WIDGET(self.GOBJECT), region)
	}

	/// Flags a widget to be displayed. Any widget that isn’t shown will
	/// not appear on the screen. If you want to show all the widgets in a
	/// container, it’s easier to call gtk_widget_show_all() on the
	/// container, instead of individually showing the widgets.
	/// Remember that you have to show the containers containing a widget,
	/// in addition to the widget itself, before it will appear onscreen.
	/// When a toplevel container is shown, it is immediately realized and
	/// mapped; other shown widgets are realized and mapped when their
	/// toplevel container is realized and mapped.
	open func show() -> Swift.Void {
		gtk_widget_show(GTK_WIDGET(self.GOBJECT))
	}

	/// Recursively shows a widget, and any child widgets (if the widget is
	/// a container).
	open func showAll() -> Swift.Void {
		gtk_widget_show_all(GTK_WIDGET(self.GOBJECT))
	}

	/// Shows a widget. If the widget is an unmapped toplevel widget
	/// (i.e. a #GtkWindow that has not yet been shown), enter the main
	/// loop and wait for the window to actually be mapped. Be careful;
	/// because the main loop is running, anything can happen during
	/// this function.
	open func showNow() -> Swift.Void {
		gtk_widget_show_now(GTK_WIDGET(self.GOBJECT))
	}

	/// This function is only used by #GtkContainer subclasses, to assign a size
	/// and position to their child widgets.
	/// In this function, the allocation may be adjusted. It will be forced
	/// to a 1x1 minimum size, and the adjust_size_allocation virtual
	/// method on the child will be used to adjust the allocation. Standard
	/// adjustments include removing the widget’s margins, and applying the
	/// widget’s #GtkWidget:halign and #GtkWidget:valign properties.
	/// For baseline support in containers you need to use gtk_widget_size_allocate_with_baseline()
	/// instead.
	/// - Parameters:
	///	- allocation: UnsafeMutablePointer<GtkAllocation>! (GtkAllocation*)
	open func sizeAllocate(allocation: UnsafeMutablePointer<GtkAllocation>!) -> Swift.Void {
		gtk_widget_size_allocate(GTK_WIDGET(self.GOBJECT), allocation)
	}

	/// This function is only used by #GtkContainer subclasses, to assign a size,
	/// position and (optionally) baseline to their child widgets.
	/// In this function, the allocation and baseline may be adjusted. It
	/// will be forced to a 1x1 minimum size, and the
	/// adjust_size_allocation virtual and adjust_baseline_allocation
	/// methods on the child will be used to adjust the allocation and
	/// baseline. Standard adjustments include removing the widget's
	/// margins, and applying the widget’s #GtkWidget:halign and
	/// #GtkWidget:valign properties.
	/// If the child widget does not have a valign of %GTK_ALIGN_BASELINE the
	/// baseline argument is ignored and -1 is used instead.
	/// - Parameters:
	///	- allocation: UnsafeMutablePointer<GtkAllocation>! (GtkAllocation*)
	///	- baseline: gint (gint)
	open func sizeAllocateWithBaseline(allocation: UnsafeMutablePointer<GtkAllocation>!, baseline: gint) -> Swift.Void {
		gtk_widget_size_allocate_with_baseline(GTK_WIDGET(self.GOBJECT), allocation, baseline)
	}

	/// This function is typically used when implementing a #GtkContainer
	/// subclass.  Obtains the preferred size of a widget. The container
	/// uses this information to arrange its child widgets and decide what
	/// size allocations to give them with gtk_widget_size_allocate().
	/// You can also call this function from an application, with some
	/// caveats. Most notably, getting a size request requires the widget
	/// to be associated with a screen, because font information may be
	/// needed. Multihead-aware applications should keep this in mind.
	/// Also remember that the size request is not necessarily the size
	/// a widget will actually be allocated.
	/// - Parameters:
	///	- requisition: UnsafeMutablePointer<GtkRequisition>! (GtkRequisition*)
	open func sizeRequest(requisition: UnsafeMutablePointer<GtkRequisition>!) -> Swift.Void {
		gtk_widget_size_request(GTK_WIDGET(self.GOBJECT), requisition)
	}

	/// This function attaches the widget’s #GtkStyle to the widget's
	/// #GdkWindow. It is a replacement for
	/// |[
	/// widget->style = gtk_style_attach (widget->style, widget->window);
	/// ]|
	/// and should only ever be called in a derived widget’s “realize”
	/// implementation which does not chain up to its parent class'
	/// “realize” implementation, because one of the parent classes
	/// (finally #GtkWidget) would attach the style itself.
	open func styleAttach() -> Swift.Void {
		gtk_widget_style_attach(GTK_WIDGET(self.GOBJECT))
	}

	/// Gets the value of a style property of @widget.
	/// - Parameters:
	///	- propertyName: String (const gchar*)
	///	- value: UnsafeMutablePointer<GValue>! (GValue*)
	open func styleGetProperty(propertyName: String, value: UnsafeMutablePointer<GValue>!) -> Swift.Void {
		gtk_widget_style_get_property(GTK_WIDGET(self.GOBJECT), propertyName, value)
	}

	/// Non-vararg variant of gtk_widget_style_get(). Used primarily by language
	/// bindings.
	/// - Parameters:
	///	- firstPropertyName: String (const gchar*)
	///	- varArgs: CVaListPointer (va_list)
	open func styleGetValist(firstPropertyName: String, varArgs: CVaListPointer) -> Swift.Void {
		gtk_widget_style_get_valist(GTK_WIDGET(self.GOBJECT), firstPropertyName, varArgs)
	}

	/// Reverts the effect of a previous call to gtk_widget_freeze_child_notify().
	/// This causes all queued #GtkWidget::child-notify signals on @widget to be
	/// emitted.
	open func thawChildNotify() -> Swift.Void {
		gtk_widget_thaw_child_notify(GTK_WIDGET(self.GOBJECT))
	}

	/// Translate coordinates relative to @src_widget’s allocation to coordinates
	/// relative to @dest_widget’s allocations. In order to perform this
	/// operation, both widgets must be realized, and must share a common
	/// toplevel.
	/// - Parameters:
	///	- destWidget: CGTKWidget (GtkWidget*)
	///	- srcX: gint (gint)
	///	- srcY: gint (gint)
	///	- destX: UnsafeMutablePointer<Int32>! (gint*)
	///	- destY: UnsafeMutablePointer<Int32>! (gint*)
	/// - Returns: Bool (gboolean)
	open func translateCoordinates(destWidget: CGTKWidget, srcX: gint, srcY: gint, destX: UnsafeMutablePointer<Int32>!, destY: UnsafeMutablePointer<Int32>!) -> Bool {
		return gtk_widget_translate_coordinates(GTK_WIDGET(self.GOBJECT), destWidget.WIDGET, srcX, srcY, destX, destY) != 0 ? true : false
	}

	/// Triggers a tooltip query on the display where the toplevel of @widget
	/// is located. See gtk_tooltip_trigger_tooltip_query() for more
	/// information.
	open func triggerTooltipQuery() -> Swift.Void {
		gtk_widget_trigger_tooltip_query(GTK_WIDGET(self.GOBJECT))
	}

	/// This function is only for use in widget implementations. Causes
	/// a widget to be unmapped if it’s currently mapped.
	open func unmap() -> Swift.Void {
		gtk_widget_unmap(GTK_WIDGET(self.GOBJECT))
	}

	/// This function is only for use in widget implementations.
	/// Should be called by implementations of the remove method
	/// on #GtkContainer, to dissociate a child from the container.
	open func unparent() -> Swift.Void {
		gtk_widget_unparent(GTK_WIDGET(self.GOBJECT))
	}

	/// This function is only useful in widget implementations.
	/// Causes a widget to be unrealized (frees all GDK resources
	/// associated with the widget, such as @widget->window).
	open func unrealize() -> Swift.Void {
		gtk_widget_unrealize(GTK_WIDGET(self.GOBJECT))
	}

	/// Unregisters a #GdkWindow from the widget that was previously set up with
	/// gtk_widget_register_window(). You need to call this when the window is
	/// no longer used by the widget, such as when you destroy it.
	/// - Parameters:
	///	- window: OpaquePointer! (GdkWindow*)
	open func unregisterWindow(_ window: OpaquePointer!) -> Swift.Void {
		gtk_widget_unregister_window(GTK_WIDGET(self.GOBJECT), window)
	}

	/// This function is for use in widget implementations. Turns off flag
	/// values for the current widget state (insensitive, prelighted, etc.).
	/// See gtk_widget_set_state_flags().
	/// - Parameters:
	///	- flags: GtkStateFlags (GtkStateFlags)
	open func unsetStateFlags(_ flags: GtkStateFlags) -> Swift.Void {
		gtk_widget_unset_state_flags(GTK_WIDGET(self.GOBJECT), flags)
	}

	/// Adds a child to @buildable. @type is an optional string
	/// describing how the child should be added.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- child: UnsafeMutablePointer<GObject>! (GObject*)
	///	- type: String? (const gchar*)
	open func addChild(builder: UnsafeMutablePointer<GtkBuilder>!, child: UnsafeMutablePointer<GObject>!, type: String?) -> Swift.Void {
		gtk_buildable_add_child(GTK_BUILDABLE(self.GOBJECT), builder, child, type)
	}

	/// Constructs a child of @buildable with the name @name.
	/// #GtkBuilder calls this function if a “constructor” has been
	/// specified in the UI definition.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- name: String (const gchar*)
	/// - Returns: UnsafeMutablePointer<GObject>! (GObject*)
	open func constructChild(builder: UnsafeMutablePointer<GtkBuilder>!, name: String) -> UnsafeMutablePointer<GObject>! {
		return gtk_buildable_construct_child(GTK_BUILDABLE(self.GOBJECT), builder, name)
	}

	/// This is similar to gtk_buildable_parser_finished() but is
	/// called once for each custom tag handled by the @buildable.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- child: UnsafeMutablePointer<GObject>? (GObject*)
	///	- tagname: String (const gchar*)
	///	- data: gpointer? (gpointer)
	open func customFinished(builder: UnsafeMutablePointer<GtkBuilder>!, child: UnsafeMutablePointer<GObject>?, tagname: String, data: gpointer?) -> Swift.Void {
		gtk_buildable_custom_finished(GTK_BUILDABLE(self.GOBJECT), builder, child, tagname, data)
	}

	/// This is called at the end of each custom element handled by
	/// the buildable.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- child: UnsafeMutablePointer<GObject>? (GObject*)
	///	- tagname: String (const gchar*)
	///	- data: UnsafeMutablePointer<gpointer?>! (gpointer*)
	open func customTagEnd(builder: UnsafeMutablePointer<GtkBuilder>!, child: UnsafeMutablePointer<GObject>?, tagname: String, data: UnsafeMutablePointer<gpointer?>!) -> Swift.Void {
		gtk_buildable_custom_tag_end(GTK_BUILDABLE(self.GOBJECT), builder, child, tagname, data)
	}

	/// This is called for each unknown element under <child>.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- child: UnsafeMutablePointer<GObject>? (GObject*)
	///	- tagname: String (const gchar*)
	///	- parser: UnsafeMutablePointer<GMarkupParser>! (GMarkupParser*)
	///	- data: UnsafeMutablePointer<gpointer?>! (gpointer*)
	/// - Returns: Bool (gboolean)
	open func customTagStart(builder: UnsafeMutablePointer<GtkBuilder>!, child: UnsafeMutablePointer<GObject>?, tagname: String, parser: UnsafeMutablePointer<GMarkupParser>!, data: UnsafeMutablePointer<gpointer?>!) -> Bool {
		return gtk_buildable_custom_tag_start(GTK_BUILDABLE(self.GOBJECT), builder, child, tagname, parser, data) != 0 ? true : false
	}

	/// Get the internal child called @childname of the @buildable object.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- childname: String (const gchar*)
	/// - Returns: UnsafeMutablePointer<GObject>! (GObject*)
	open func getInternalChild(builder: UnsafeMutablePointer<GtkBuilder>!, childname: String) -> UnsafeMutablePointer<GObject>! {
		return gtk_buildable_get_internal_child(GTK_BUILDABLE(self.GOBJECT), builder, childname)
	}

	/// Called when the builder finishes the parsing of a
	/// [GtkBuilder UI definition][BUILDER-UI].
	/// Note that this will be called once for each time
	/// gtk_builder_add_from_file() or gtk_builder_add_from_string()
	/// is called on a builder.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	open func parserFinished(builder: UnsafeMutablePointer<GtkBuilder>!) -> Swift.Void {
		gtk_buildable_parser_finished(GTK_BUILDABLE(self.GOBJECT), builder)
	}

	/// Sets the property name @name to @value on the @buildable object.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- name: String (const gchar*)
	///	- value: UnsafePointer<GValue>! (const GValue*)
	open func setBuildableProperty(builder: UnsafeMutablePointer<GtkBuilder>!, name: String, value: UnsafePointer<GValue>!) -> Swift.Void {
		gtk_buildable_set_buildable_property(GTK_BUILDABLE(self.GOBJECT), builder, name, value)
	}

}
