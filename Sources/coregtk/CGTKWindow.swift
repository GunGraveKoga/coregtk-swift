/*
 * CGTKWindow.swift
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

public let GTK_TYPE_WINDOW: GType = gtk_window_get_type()

@inline(__always) public func GTK_WINDOW(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkWindow>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_WINDOW)
}

/// 
/// A GtkWindow is a toplevel window which can contain other widgets.
/// Windows normally have decorations that are under the control
/// of the windowing system and allow the user to manipulate the window
/// (resize it, move it, close it,...).
/// # GtkWindow as GtkBuildable
/// The GtkWindow implementation of the GtkBuildable interface supports a
/// custom <accel-groups> element, which supports any number of <group>
/// elements representing the #GtkAccelGroup objects you want to add to
/// your window (synonymous with gtk_window_add_accel_group().
/// It also supports the <initial-focus> element, whose name property names
/// the widget to receive the focus when the window is mapped.
/// An example of a UI definition fragment with accel groups:
/// |[
/// <object class="GtkWindow">
/// <accel-groups>
/// <group name="accelgroup1"/>
/// </accel-groups>
/// <initial-focus name="thunderclap"/>
/// </object>
/// ...
/// <object class="GtkAccelGroup" id="accelgroup1"/>
/// ]|
/// The GtkWindow implementation of the GtkBuildable interface supports
/// setting a child as the titlebar by specifying “titlebar” as the “type”
/// attribute of a <child> element.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// window.background
/// ├── decoration
/// ├── <titlebar child>.titlebar [.default-decoration]
/// ╰── <child>
/// ]|
/// GtkWindow has a main CSS node with name window and style class .background,
/// and a subnode with name decoration.
/// Style classes that are typically used with the main CSS node are .csd (when
/// client-side decorations are in use), .solid-csd (for client-side decorations
/// without invisible borders), .ssd (used by mutter when rendering server-side
/// decorations). GtkWindow also represents window states with the following
/// style classes on the main node: .tiled, .maximized, .fullscreen. Specialized
/// types of window often add their own discriminating style classes, such as
/// .popup or .tooltip.
/// GtkWindow adds the .titlebar and .default-decoration style classes to the
/// widget that is added as a titlebar child.


open class CGTKWindow : CGTKBin {
	/// 
	/// Gets the value set by gtk_window_set_default_icon_list().
	/// The list is a copy and should be freed with g_list_free(),
	/// but the pixbufs in the list have not had their reference count
	/// incremented.
	/// - Returns: UnsafeMutablePointer<GList>!
	open class func getDefaultIconList() -> UnsafeMutablePointer<GList>! {
		return gtk_window_get_default_icon_list()
	}

	/// 
	/// Returns the fallback icon name for windows that has been set
	/// with gtk_window_set_default_icon_name(). The returned
	/// string is owned by GTK+ and should not be modified. It
	/// is only valid until the next call to
	/// gtk_window_set_default_icon_name().
	/// - Returns: String?
	open class func getDefaultIconName() -> String? {
		return String(utf8String: gtk_window_get_default_icon_name())
	}

	/// 
	/// Returns a list of all existing toplevel windows. The widgets
	/// in the list are not individually referenced. If you want
	/// to iterate through the list and perform actions involving
	/// callbacks that might destroy the widgets, you must call
	/// `g_list_foreach (result, (GFunc)g_object_ref, NULL)` first, and
	/// then unref all the widgets afterwards.
	/// - Returns: UnsafeMutablePointer<GList>!
	open class func listToplevels() -> UnsafeMutablePointer<GList>! {
		return gtk_window_list_toplevels()
	}

	/// 
	/// By default, after showing the first #GtkWindow, GTK+ calls
	/// gdk_notify_startup_complete().  Call this function to disable
	/// the automatic startup notification. You might do this if your
	/// first window is a splash screen, and you want to delay notification
	/// until after your real main window has been shown, for example.
	/// In that example, you would disable startup notification
	/// temporarily, show your splash screen, then re-enable it so that
	/// showing the main window would automatically result in notification.
	/// Parameters:
	///	- setting: Bool
	open class func setAutoStartupNotification(setting: Bool) {
		gtk_window_set_auto_startup_notification(setting ? 1 : 0)
	}

	/// 
	/// Sets an icon to be used as fallback for windows that haven't
	/// had gtk_window_set_icon() called on them from a pixbuf.
	/// Parameters:
	///	- icon: OpaquePointer!
	open class func setDefaultIcon(_ icon: OpaquePointer!) {
		gtk_window_set_default_icon(icon)
	}

	/// 
	/// Sets an icon to be used as fallback for windows that haven't
	/// had gtk_window_set_icon_list() called on them from a file
	/// on disk. Warns on failure if @err is %NULL.
	/// Parameters:
	///	- filename: String
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil
	/// - Returns: Bool
	open class func setDefaultIconFromFile(filename: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_window_set_default_icon_from_file(filename, err) != 0 ? true : false
	}

	/// 
	/// Sets an icon list to be used as fallback for windows that haven't
	/// had gtk_window_set_icon_list() called on them to set up a
	/// window-specific icon list. This function allows you to set up the
	/// icon for all windows in your app at once.
	/// See gtk_window_set_icon_list() for more details.
	/// Parameters:
	///	- list: UnsafeMutablePointer<GList>!
	open class func setDefaultIconList(_ list: UnsafeMutablePointer<GList>!) {
		gtk_window_set_default_icon_list(list)
	}

	/// 
	/// Sets an icon to be used as fallback for windows that haven't
	/// had gtk_window_set_icon_list() called on them from a named
	/// themed icon, see gtk_window_set_icon_name().
	/// Parameters:
	///	- name: String
	open class func setDefaultIconName(_ name: String) {
		gtk_window_set_default_icon_name(name)
	}

	/// 
	/// Opens or closes the [interactive debugger][interactive-debugging],
	/// which offers access to the widget hierarchy of the application
	/// and to useful debugging tools.
	/// Parameters:
	///	- enable: Bool
	open class func setInteractiveDebugging(enable: Bool) {
		gtk_window_set_interactive_debugging(enable ? 1 : 0)
	}

	/// 
	/// Creates a new #GtkWindow, which is a toplevel window that can
	/// contain other widgets. Nearly always, the type of the window should
	/// be #GTK_WINDOW_TOPLEVEL. If you’re implementing something like a
	/// popup menu from scratch (which is a bad idea, just use #GtkMenu),
	/// you might use #GTK_WINDOW_POPUP. #GTK_WINDOW_POPUP is not for
	/// dialogs, though in some other toolkits dialogs are called “popups”.
	/// In GTK+, #GTK_WINDOW_POPUP means a pop-up menu or pop-up tooltip.
	/// On X11, popup windows are not controlled by the
	/// [window manager][gtk-X11-arch].
	/// If you simply want an undecorated window (no window borders), use
	/// gtk_window_set_decorated(), don’t use #GTK_WINDOW_POPUP.
	/// All top-level windows created by gtk_window_new() are stored in
	/// an internal top-level window list.  This list can be obtained from
	/// gtk_window_list_toplevels().  Due to Gtk+ keeping a reference to
	/// the window internally, gtk_window_new() does not return a reference
	/// to the caller.
	/// To delete a #GtkWindow, call gtk_widget_destroy().
	/// Parameters:
	///	- type: GtkWindowType
	/// - Returns: CGTKWidget
	public convenience init(type: GtkWindowType) {
		self.init(withGObject: gtk_window_new(type))!
	}

	open var WINDOW: UnsafeMutablePointer<GtkWindow>! {
		get {
			return GTK_WINDOW(self.GOBJECT)
		}
	}

	/// 
	/// Activates the default widget for the window, unless the current
	/// focused widget has been configured to receive the default action
	/// (see gtk_widget_set_receives_default()), in which case the
	/// focused widget is activated.
	/// - Returns: Bool
	open func activateDefault() -> Bool {
		return gtk_window_activate_default(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Activates the current focused widget within the window.
	/// - Returns: Bool
	open func activateFocus() -> Bool {
		return gtk_window_activate_focus(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Activates mnemonics and accelerators for this #GtkWindow. This is normally
	/// called by the default ::key_press_event handler for toplevel windows,
	/// however in some cases it may be useful to call this directly when
	/// overriding the standard key handling for a toplevel window.
	/// Parameters:
	///	- event: UnsafeMutablePointer<GdkEventKey>!
	/// - Returns: Bool
	open func activateKey(event: UnsafeMutablePointer<GdkEventKey>!) -> Bool {
		return gtk_window_activate_key(GTK_WINDOW(self.GOBJECT), event) != 0 ? true : false
	}

	/// 
	/// Associate @accel_group with @window, such that calling
	/// gtk_accel_groups_activate() on @window will activate accelerators
	/// in @accel_group.
	/// Parameters:
	///	- accelGroup: UnsafeMutablePointer<GtkAccelGroup>!
	open func addAccelGroup(_ accelGroup: UnsafeMutablePointer<GtkAccelGroup>!) {
		gtk_window_add_accel_group(GTK_WINDOW(self.GOBJECT), accelGroup)
	}

	/// 
	/// Adds a mnemonic to this window.
	/// Parameters:
	///	- keyval: guint
	///	- target: CGTKWidget
	open func addMnemonic(keyval: guint, target: CGTKWidget) {
		gtk_window_add_mnemonic(GTK_WINDOW(self.GOBJECT), keyval, target.WIDGET)
	}

	/// 
	/// Starts moving a window. This function is used if an application has
	/// window movement grips. When GDK can support it, the window movement
	/// will be done using the standard mechanism for the
	/// [window manager][gtk-X11-arch] or windowing
	/// system. Otherwise, GDK will try to emulate window movement,
	/// potentially not all that well, depending on the windowing system.
	/// Parameters:
	///	- button: gint
	///	- rootX: gint
	///	- rootY: gint
	///	- timestamp: guint32
	open func beginMoveDrag(button: gint, rootX: gint, rootY: gint, timestamp: guint32) {
		gtk_window_begin_move_drag(GTK_WINDOW(self.GOBJECT), button, rootX, rootY, timestamp)
	}

	/// 
	/// Starts resizing a window. This function is used if an application
	/// has window resizing controls. When GDK can support it, the resize
	/// will be done using the standard mechanism for the
	/// [window manager][gtk-X11-arch] or windowing
	/// system. Otherwise, GDK will try to emulate window resizing,
	/// potentially not all that well, depending on the windowing system.
	/// Parameters:
	///	- edge: GdkWindowEdge
	///	- button: gint
	///	- rootX: gint
	///	- rootY: gint
	///	- timestamp: guint32
	open func beginResizeDrag(edge: GdkWindowEdge, button: gint, rootX: gint, rootY: gint, timestamp: guint32) {
		gtk_window_begin_resize_drag(GTK_WINDOW(self.GOBJECT), edge, button, rootX, rootY, timestamp)
	}

	/// 
	/// Requests that the window is closed, similar to what happens
	/// when a window manager close button is clicked.
	/// This function can be used with close buttons in custom
	/// titlebars.
	open func close() {
		gtk_window_close(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Asks to deiconify (i.e. unminimize) the specified @window. Note
	/// that you shouldn’t assume the window is definitely deiconified
	/// afterward, because other entities (e.g. the user or
	/// [window manager][gtk-X11-arch])) could iconify it
	/// again before your code which assumes deiconification gets to run.
	/// You can track iconification via the “window-state-event” signal
	/// on #GtkWidget.
	open func deiconify() {
		gtk_window_deiconify(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Asks to place @window in the fullscreen state. Note that you
	/// shouldn’t assume the window is definitely full screen afterward,
	/// because other entities (e.g. the user or
	/// [window manager][gtk-X11-arch]) could unfullscreen it
	/// again, and not all window managers honor requests to fullscreen
	/// windows. But normally the window will end up fullscreen. Just
	/// don’t write code that crashes if not.
	/// You can track the fullscreen state via the “window-state-event” signal
	/// on #GtkWidget.
	open func fullscreen() {
		gtk_window_fullscreen(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Asks to place @window in the fullscreen state. Note that you shouldn't assume
	/// the window is definitely full screen afterward.
	/// You can track the fullscreen state via the "window-state-event" signal
	/// on #GtkWidget.
	/// Parameters:
	///	- screen: OpaquePointer!
	///	- monitor: gint
	open func fullscreenOnMonitor(screen: OpaquePointer!, monitor: gint) {
		gtk_window_fullscreen_on_monitor(GTK_WINDOW(self.GOBJECT), screen, monitor)
	}

	/// 
	/// Gets the value set by gtk_window_set_accept_focus().
	/// - Returns: Bool
	open func getAcceptFocus() -> Bool {
		return gtk_window_get_accept_focus(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the #GtkApplication associated with the window (if any).
	/// - Returns: CGTKApplication?
	open func getApplication<T>() -> T? where T: CGTKApplication {
		return T.init(withGObject: gtk_window_get_application(GTK_WINDOW(self.GOBJECT)))
	}

	/// 
	/// Fetches the attach widget for this window. See
	/// gtk_window_set_attached_to().
	/// - Returns: CGTKWidget?
	open func getAttachedTo<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_window_get_attached_to(GTK_WINDOW(self.GOBJECT)))
	}

	/// 
	/// Returns whether the window has been set to have decorations
	/// such as a title bar via gtk_window_set_decorated().
	/// - Returns: Bool
	open func getDecorated() -> Bool {
		return gtk_window_get_decorated(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the default size of the window. A value of -1 for the width or
	/// height indicates that a default size has not been explicitly set
	/// for that dimension, so the “natural” size of the window will be
	/// used.
	/// Parameters:
	///	- width: UnsafeMutablePointer<Int32>!
	///	- height: UnsafeMutablePointer<Int32>!
	open func getDefaultSize(width: UnsafeMutablePointer<Int32>!, height: UnsafeMutablePointer<Int32>!) {
		gtk_window_get_default_size(GTK_WINDOW(self.GOBJECT), width, height)
	}

	/// 
	/// Returns the default widget for @window. See
	/// gtk_window_set_default() for more details.
	/// - Returns: CGTKWidget?
	open func getDefaultWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_window_get_default_widget(GTK_WINDOW(self.GOBJECT)))
	}

	/// 
	/// Returns whether the window has been set to have a close button
	/// via gtk_window_set_deletable().
	/// - Returns: Bool
	open func getDeletable() -> Bool {
		return gtk_window_get_deletable(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the window will be destroyed with its transient parent. See
	/// gtk_window_set_destroy_with_parent ().
	/// - Returns: Bool
	open func getDestroyWithParent() -> Bool {
		return gtk_window_get_destroy_with_parent(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the current focused widget within the window.
	/// Note that this is the widget that would have the focus
	/// if the toplevel window focused; if the toplevel window
	/// is not focused then  `gtk_widget_has_focus (widget)` will
	/// not be %TRUE for the widget.
	/// - Returns: CGTKWidget?
	open func getFocus<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_window_get_focus(GTK_WINDOW(self.GOBJECT)))
	}

	/// 
	/// Gets the value set by gtk_window_set_focus_on_map().
	/// - Returns: Bool
	open func getFocusOnMap() -> Bool {
		return gtk_window_get_focus_on_map(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the value of the #GtkWindow:focus-visible property.
	/// - Returns: Bool
	open func getFocusVisible() -> Bool {
		return gtk_window_get_focus_visible(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the value set by gtk_window_set_gravity().
	/// - Returns: GdkGravity
	open func getGravity() -> GdkGravity {
		return gtk_window_get_gravity(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Returns the group for @window or the default group, if
	/// @window is %NULL or if @window does not have an explicit
	/// window group.
	/// - Returns: UnsafeMutablePointer<GtkWindowGroup>!
	open func getGroup() -> UnsafeMutablePointer<GtkWindowGroup>! {
		return gtk_window_get_group(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Determines whether the window may have a resize grip.
	/// - Returns: Bool
	open func getHasResizeGrip() -> Bool {
		return gtk_window_get_has_resize_grip(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the window has requested to have its titlebar hidden
	/// when maximized. See gtk_window_set_hide_titlebar_when_maximized ().
	/// - Returns: Bool
	open func getHideTitlebarWhenMaximized() -> Bool {
		return gtk_window_get_hide_titlebar_when_maximized(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the value set by gtk_window_set_icon() (or if you've
	/// called gtk_window_set_icon_list(), gets the first icon in
	/// the icon list).
	/// - Returns: OpaquePointer?
	open func getIcon() -> OpaquePointer? {
		return gtk_window_get_icon(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Retrieves the list of icons set by gtk_window_set_icon_list().
	/// The list is copied, but the reference count on each
	/// member won’t be incremented.
	/// - Returns: UnsafeMutablePointer<GList>!
	open func getIconList() -> UnsafeMutablePointer<GList>! {
		return gtk_window_get_icon_list(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Returns the name of the themed icon for the window,
	/// see gtk_window_set_icon_name().
	/// - Returns: String?
	open func getIconName() -> String? {
		return String(utf8String: gtk_window_get_icon_name(GTK_WINDOW(self.GOBJECT)))
	}

	/// 
	/// Returns the mnemonic modifier for this window. See
	/// gtk_window_set_mnemonic_modifier().
	/// - Returns: GdkModifierType
	open func getMnemonicModifier() -> GdkModifierType {
		return gtk_window_get_mnemonic_modifier(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Gets the value of the #GtkWindow:mnemonics-visible property.
	/// - Returns: Bool
	open func getMnemonicsVisible() -> Bool {
		return gtk_window_get_mnemonics_visible(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the window is modal. See gtk_window_set_modal().
	/// - Returns: Bool
	open func getModal() -> Bool {
		return gtk_window_get_modal(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Fetches the requested opacity for this window. See
	/// gtk_window_set_opacity().
	/// - Returns: Double
	override open func getOpacity() -> Double {
		return gtk_window_get_opacity(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// This function returns the position you need to pass to
	/// gtk_window_move() to keep @window in its current position.
	/// This means that the meaning of the returned value varies with
	/// window gravity. See gtk_window_move() for more details.
	/// The reliability of this function depends on the windowing system
	/// currently in use. Some windowing systems, such as Wayland, do not
	/// support a global coordinate system, and thus the position of the
	/// window will always be (0, 0). Others, like X11, do not have a reliable
	/// way to obtain the geometry of the decorations of a window if they are
	/// provided by the window manager. Additionally, on X11, window manager
	/// have been known to mismanage window gravity, which result in windows
	/// moving even if you use the coordinates of the current position as
	/// returned by this function.
	/// If you haven’t changed the window gravity, its gravity will be
	/// #GDK_GRAVITY_NORTH_WEST. This means that gtk_window_get_position()
	/// gets the position of the top-left corner of the window manager
	/// frame for the window. gtk_window_move() sets the position of this
	/// same top-left corner.
	/// If a window has gravity #GDK_GRAVITY_STATIC the window manager
	/// frame is not relevant, and thus gtk_window_get_position() will
	/// always produce accurate results. However you can’t use static
	/// gravity to do things like place a window in a corner of the screen,
	/// because static gravity ignores the window manager decorations.
	/// Ideally, this function should return appropriate values if the
	/// window has client side decorations, assuming that the windowing
	/// system supports global coordinates.
	/// In practice, saving the window position should not be left to
	/// applications, as they lack enough knowledge of the windowing
	/// system and the window manager state to effectively do so. The
	/// appropriate way to implement saving the window position is to
	/// use a platform-specific protocol, wherever that is available.
	/// Parameters:
	///	- rootX: UnsafeMutablePointer<Int32>!
	///	- rootY: UnsafeMutablePointer<Int32>!
	open func getPosition(rootX: UnsafeMutablePointer<Int32>!, rootY: UnsafeMutablePointer<Int32>!) {
		gtk_window_get_position(GTK_WINDOW(self.GOBJECT), rootX, rootY)
	}

	/// 
	/// Gets the value set by gtk_window_set_resizable().
	/// - Returns: Bool
	open func getResizable() -> Bool {
		return gtk_window_get_resizable(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// If a window has a resize grip, this will retrieve the grip
	/// position, width and height into the specified #GdkRectangle.
	/// Parameters:
	///	- rect: UnsafeMutablePointer<GdkRectangle>!
	/// - Returns: Bool
	open func getResizeGripArea(rect: UnsafeMutablePointer<GdkRectangle>!) -> Bool {
		return gtk_window_get_resize_grip_area(GTK_WINDOW(self.GOBJECT), rect) != 0 ? true : false
	}

	/// 
	/// Returns the role of the window. See gtk_window_set_role() for
	/// further explanation.
	/// - Returns: String?
	open func getRole() -> String? {
		return String(utf8String: gtk_window_get_role(GTK_WINDOW(self.GOBJECT)))
	}

	/// 
	/// Returns the #GdkScreen associated with @window.
	/// - Returns: OpaquePointer
	override open func getScreen() -> OpaquePointer {
		return gtk_window_get_screen(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Obtains the current size of @window.
	/// If @window is not visible on screen, this function return the size GTK+
	/// will suggest to the [window manager][gtk-X11-arch] for the initial window
	/// size (but this is not reliably the same as the size the window manager
	/// will actually select). See: gtk_window_set_default_size().
	/// Depending on the windowing system and the window manager constraints,
	/// the size returned by this function may not match the size set using
	/// gtk_window_resize(); additionally, since gtk_window_resize() may be
	/// implemented as an asynchronous operation, GTK+ cannot guarantee in any
	/// way that this code:
	/// |[<!-- language="C" -->
	/// // width and height are set elsewhere
	/// gtk_window_resize (window, width, height);
	/// int new_width, new_height;
	/// gtk_window_get_size (window, &new_width, &new_height);
	/// ]|
	/// will result in `new_width` and `new_height` matching `width` and
	/// `height`, respectively.
	/// This function will return the logical size of the #GtkWindow,
	/// excluding the widgets used in client side decorations; there is,
	/// however, no guarantee that the result will be completely accurate
	/// because client side decoration may include widgets that depend on
	/// the user preferences and that may not be visibile at the time you
	/// call this function.
	/// The dimensions returned by this function are suitable for being
	/// stored across sessions; use gtk_window_set_default_size() to
	/// restore them when before showing the window.
	/// To avoid potential race conditions, you should only call this
	/// function in response to a size change notification, for instance
	/// inside a handler for the #GtkWidget::size-allocate signal, or
	/// inside a handler for the #GtkWidget::configure-event signal:
	/// |[<!-- language="C" -->
	/// static void
	/// on_size_allocate (GtkWidget *widget, GtkAllocation *allocation)
	/// {
	/// int new_width, new_height;
	/// gtk_window_get_size (GTK_WINDOW (widget), &new_width, &new_height);
	/// ...
	/// }
	/// ]|
	/// Note that, if you connect to the #GtkWidget::size-allocate signal,
	/// you should not use the dimensions of the #GtkAllocation passed to
	/// the signal handler, as the allocation may contain client side
	/// decorations added by GTK+, depending on the windowing system in
	/// use.
	/// If you are getting a window size in order to position the window
	/// on the screen, you should, instead, simply set the window’s semantic
	/// type with gtk_window_set_type_hint(), which allows the window manager
	/// to e.g. center dialogs. Also, if you set the transient parent of
	/// dialogs with gtk_window_set_transient_for() window managers will
	/// often center the dialog over its parent window. It's much preferred
	/// to let the window manager handle these cases rather than doing it
	/// yourself, because all apps will behave consistently and according to
	/// user or system preferences, if the window manager handles it. Also,
	/// the window manager can take into account the size of the window
	/// decorations and border that it may add, and of which GTK+ has no
	/// knowledge. Additionally, positioning windows in global screen coordinates
	/// may not be allowed by the windowing system. For more information,
	/// see: gtk_window_set_position().
	/// Parameters:
	///	- width: UnsafeMutablePointer<Int32>!
	///	- height: UnsafeMutablePointer<Int32>!
	open func getSize(width: UnsafeMutablePointer<Int32>!, height: UnsafeMutablePointer<Int32>!) {
		gtk_window_get_size(GTK_WINDOW(self.GOBJECT), width, height)
	}

	/// 
	/// Gets the value set by gtk_window_set_skip_pager_hint().
	/// - Returns: Bool
	open func getSkipPagerHint() -> Bool {
		return gtk_window_get_skip_pager_hint(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the value set by gtk_window_set_skip_taskbar_hint()
	/// - Returns: Bool
	open func getSkipTaskbarHint() -> Bool {
		return gtk_window_get_skip_taskbar_hint(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the title of the window. See gtk_window_set_title().
	/// - Returns: String?
	open func getTitle() -> String? {
		return String(utf8String: gtk_window_get_title(GTK_WINDOW(self.GOBJECT)))
	}

	/// 
	/// Returns the custom titlebar that has been set with
	/// gtk_window_set_titlebar().
	/// - Returns: CGTKWidget?
	open func getTitlebar<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_window_get_titlebar(GTK_WINDOW(self.GOBJECT)))
	}

	/// 
	/// Fetches the transient parent for this window. See
	/// gtk_window_set_transient_for().
	/// - Returns: CGTKWindow?
	open func getTransientFor<T>() -> T? where T: CGTKWindow {
		return T.init(withGObject: gtk_window_get_transient_for(GTK_WINDOW(self.GOBJECT)))
	}

	/// 
	/// Gets the type hint for this window. See gtk_window_set_type_hint().
	/// - Returns: GdkWindowTypeHint
	open func getTypeHint() -> GdkWindowTypeHint {
		return gtk_window_get_type_hint(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Gets the value set by gtk_window_set_urgency_hint()
	/// - Returns: Bool
	open func getUrgencyHint() -> Bool {
		return gtk_window_get_urgency_hint(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the type of the window. See #GtkWindowType.
	/// - Returns: GtkWindowType
	open func getWindowType() -> GtkWindowType {
		return gtk_window_get_window_type(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Returns whether @window has an explicit window group.
	/// - Returns: Bool
	open func hasGroup() -> Bool {
		return gtk_window_has_group(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the input focus is within this GtkWindow.
	/// For real toplevel windows, this is identical to gtk_window_is_active(),
	/// but for embedded windows, like #GtkPlug, the results will differ.
	/// - Returns: Bool
	open func hasToplevelFocus() -> Bool {
		return gtk_window_has_toplevel_focus(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Asks to iconify (i.e. minimize) the specified @window. Note that
	/// you shouldn’t assume the window is definitely iconified afterward,
	/// because other entities (e.g. the user or
	/// [window manager][gtk-X11-arch]) could deiconify it
	/// again, or there may not be a window manager in which case
	/// iconification isn’t possible, etc. But normally the window will end
	/// up iconified. Just don’t write code that crashes if not.
	/// It’s permitted to call this function before showing a window,
	/// in which case the window will be iconified before it ever appears
	/// onscreen.
	/// You can track iconification via the “window-state-event” signal
	/// on #GtkWidget.
	open func iconify() {
		gtk_window_iconify(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Returns whether the window is part of the current active toplevel.
	/// (That is, the toplevel window receiving keystrokes.)
	/// The return value is %TRUE if the window is active toplevel
	/// itself, but also if it is, say, a #GtkPlug embedded in the active toplevel.
	/// You might use this function if you wanted to draw a widget
	/// differently in an active window from a widget in an inactive window.
	/// See gtk_window_has_toplevel_focus()
	/// - Returns: Bool
	open func isActive() -> Bool {
		return gtk_window_is_active(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the current maximized state of @window.
	/// Note that since maximization is ultimately handled by the window
	/// manager and happens asynchronously to an application request, you
	/// shouldn’t assume the return value of this function changing
	/// immediately (or at all), as an effect of calling
	/// gtk_window_maximize() or gtk_window_unmaximize().
	/// - Returns: Bool
	open func isMaximized() -> Bool {
		return gtk_window_is_maximized(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Asks to maximize @window, so that it becomes full-screen. Note that
	/// you shouldn’t assume the window is definitely maximized afterward,
	/// because other entities (e.g. the user or
	/// [window manager][gtk-X11-arch]) could unmaximize it
	/// again, and not all window managers support maximization. But
	/// normally the window will end up maximized. Just don’t write code
	/// that crashes if not.
	/// It’s permitted to call this function before showing a window,
	/// in which case the window will be maximized when it appears onscreen
	/// initially.
	/// You can track maximization via the “window-state-event” signal
	/// on #GtkWidget, or by listening to notifications on the
	/// #GtkWindow:is-maximized property.
	open func maximize() {
		gtk_window_maximize(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Activates the targets associated with the mnemonic.
	/// Parameters:
	///	- keyval: guint
	///	- modifier: GdkModifierType
	/// - Returns: Bool
	open func mnemonicActivate(keyval: guint, modifier: GdkModifierType) -> Bool {
		return gtk_window_mnemonic_activate(GTK_WINDOW(self.GOBJECT), keyval, modifier) != 0 ? true : false
	}

	/// 
	/// Asks the [window manager][gtk-X11-arch] to move
	/// @window to the given position.  Window managers are free to ignore
	/// this; most window managers ignore requests for initial window
	/// positions (instead using a user-defined placement algorithm) and
	/// honor requests after the window has already been shown.
	/// Note: the position is the position of the gravity-determined
	/// reference point for the window. The gravity determines two things:
	/// first, the location of the reference point in root window
	/// coordinates; and second, which point on the window is positioned at
	/// the reference point.
	/// By default the gravity is #GDK_GRAVITY_NORTH_WEST, so the reference
	/// point is simply the @x, @y supplied to gtk_window_move(). The
	/// top-left corner of the window decorations (aka window frame or
	/// border) will be placed at @x, @y.  Therefore, to position a window
	/// at the top left of the screen, you want to use the default gravity
	/// (which is #GDK_GRAVITY_NORTH_WEST) and move the window to 0,0.
	/// To position a window at the bottom right corner of the screen, you
	/// would set #GDK_GRAVITY_SOUTH_EAST, which means that the reference
	/// point is at @x + the window width and @y + the window height, and
	/// the bottom-right corner of the window border will be placed at that
	/// reference point. So, to place a window in the bottom right corner
	/// you would first set gravity to south east, then write:
	/// `gtk_window_move (window, gdk_screen_width () - window_width,
	/// gdk_screen_height () - window_height)` (note that this
	/// example does not take multi-head scenarios into account).
	/// The [Extended Window Manager Hints Specification](http://www.freedesktop.org/Standards/wm-spec)
	/// has a nice table of gravities in the “implementation notes” section.
	/// The gtk_window_get_position() documentation may also be relevant.
	/// Parameters:
	///	- x: gint
	///	- y: gint
	open func move(x: gint, y: gint) {
		gtk_window_move(GTK_WINDOW(self.GOBJECT), x, y)
	}

	/// 
	/// Parses a standard X Window System geometry string - see the
	/// manual page for X (type “man X”) for details on this.
	/// gtk_window_parse_geometry() does work on all GTK+ ports
	/// including Win32 but is primarily intended for an X environment.
	/// If either a size or a position can be extracted from the
	/// geometry string, gtk_window_parse_geometry() returns %TRUE
	/// and calls gtk_window_set_default_size() and/or gtk_window_move()
	/// to resize/move the window.
	/// If gtk_window_parse_geometry() returns %TRUE, it will also
	/// set the #GDK_HINT_USER_POS and/or #GDK_HINT_USER_SIZE hints
	/// indicating to the window manager that the size/position of
	/// the window was user-specified. This causes most window
	/// managers to honor the geometry.
	/// Note that for gtk_window_parse_geometry() to work as expected, it has
	/// to be called when the window has its “final” size, i.e. after calling
	/// gtk_widget_show_all() on the contents and gtk_window_set_geometry_hints()
	/// on the window.
	/// |[<!-- language="C" -->
	/// #include <gtk/gtk.h>
	/// static void
	/// fill_with_content (GtkWidget *vbox)
	/// {
	/// // fill with content...
	/// }
	/// int
	/// main (int argc, char *argv[])
	/// {
	/// GtkWidget *window, *vbox;
	/// GdkGeometry size_hints = {
	/// 100, 50, 0, 0, 100, 50, 10,
	/// 10, 0.0, 0.0, GDK_GRAVITY_NORTH_WEST
	/// };
	/// gtk_init (&argc, &argv);
	/// window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
	/// vbox = gtk_box_new (GTK_ORIENTATION_VERTICAL, 0);
	/// gtk_container_add (GTK_CONTAINER (window), vbox);
	/// fill_with_content (vbox);
	/// gtk_widget_show_all (vbox);
	/// gtk_window_set_geometry_hints (GTK_WINDOW (window),
	/// NULL,
	/// &size_hints,
	/// GDK_HINT_MIN_SIZE |
	/// GDK_HINT_BASE_SIZE |
	/// GDK_HINT_RESIZE_INC);
	/// if (argc > 1)
	/// {
	/// gboolean res;
	/// res = gtk_window_parse_geometry (GTK_WINDOW (window),
	/// argv[1]);
	/// if (! res)
	/// fprintf (stderr,
	/// "Failed to parse “%s”\n",
	/// argv[1]);
	/// }
	/// gtk_widget_show_all (window);
	/// gtk_main ();
	/// return 0;
	/// }
	/// ]|
	/// Parameters:
	///	- geometry: String
	/// - Returns: Bool
	open func parseGeometry(_ geometry: String) -> Bool {
		return gtk_window_parse_geometry(GTK_WINDOW(self.GOBJECT), geometry) != 0 ? true : false
	}

	/// 
	/// Presents a window to the user. This may mean raising the window
	/// in the stacking order, deiconifying it, moving it to the current
	/// desktop, and/or giving it the keyboard focus, possibly dependent
	/// on the user’s platform, window manager, and preferences.
	/// If @window is hidden, this function calls gtk_widget_show()
	/// as well.
	/// This function should be used when the user tries to open a window
	/// that’s already open. Say for example the preferences dialog is
	/// currently open, and the user chooses Preferences from the menu
	/// a second time; use gtk_window_present() to move the already-open dialog
	/// where the user can see it.
	/// If you are calling this function in response to a user interaction,
	/// it is preferable to use gtk_window_present_with_time().
	open func present() {
		gtk_window_present(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Presents a window to the user in response to a user interaction.
	/// If you need to present a window without a timestamp, use
	/// gtk_window_present(). See gtk_window_present() for details.
	/// Parameters:
	///	- timestamp: guint32
	open func presentWithTime(timestamp: guint32) {
		gtk_window_present_with_time(GTK_WINDOW(self.GOBJECT), timestamp)
	}

	/// 
	/// Propagate a key press or release event to the focus widget and
	/// up the focus container chain until a widget handles @event.
	/// This is normally called by the default ::key_press_event and
	/// ::key_release_event handlers for toplevel windows,
	/// however in some cases it may be useful to call this directly when
	/// overriding the standard key handling for a toplevel window.
	/// Parameters:
	///	- event: UnsafeMutablePointer<GdkEventKey>!
	/// - Returns: Bool
	open func propagateKeyEvent(_ event: UnsafeMutablePointer<GdkEventKey>!) -> Bool {
		return gtk_window_propagate_key_event(GTK_WINDOW(self.GOBJECT), event) != 0 ? true : false
	}

	/// 
	/// Reverses the effects of gtk_window_add_accel_group().
	/// Parameters:
	///	- accelGroup: UnsafeMutablePointer<GtkAccelGroup>!
	open func removeAccelGroup(_ accelGroup: UnsafeMutablePointer<GtkAccelGroup>!) {
		gtk_window_remove_accel_group(GTK_WINDOW(self.GOBJECT), accelGroup)
	}

	/// 
	/// Removes a mnemonic from this window.
	/// Parameters:
	///	- keyval: guint
	///	- target: CGTKWidget
	open func removeMnemonic(keyval: guint, target: CGTKWidget) {
		gtk_window_remove_mnemonic(GTK_WINDOW(self.GOBJECT), keyval, target.WIDGET)
	}

	/// 
	/// Hides @window, then reshows it, resetting the
	/// default size and position of the window. Used
	/// by GUI builders only.
	open func reshowWithInitialSize() {
		gtk_window_reshow_with_initial_size(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Resizes the window as if the user had done so, obeying geometry
	/// constraints. The default geometry constraint is that windows may
	/// not be smaller than their size request; to override this
	/// constraint, call gtk_widget_set_size_request() to set the window's
	/// request to a smaller value.
	/// If gtk_window_resize() is called before showing a window for the
	/// first time, it overrides any default size set with
	/// gtk_window_set_default_size().
	/// Windows may not be resized smaller than 1 by 1 pixels.
	/// When using client side decorations, GTK+ will do its best to adjust
	/// the given size so that the resulting window size matches the
	/// requested size without the title bar, borders and shadows added for
	/// the client side decorations, but there is no guarantee that the
	/// result will be totally accurate because these widgets added for
	/// client side decorations depend on the theme and may not be realized
	/// or visible at the time gtk_window_resize() is issued.
	/// If the GtkWindow has a titlebar widget (see gtk_window_set_titlebar()), then
	/// typically, gtk_window_resize() will compensate for the height of the titlebar
	/// widget only if the height is known when the resulting GtkWindow configuration
	/// is issued.
	/// For example, if new widgets are added after the GtkWindow configuration
	/// and cause the titlebar widget to grow in height, this will result in a
	/// window content smaller that specified by gtk_window_resize() and not
	/// a larger window.
	/// Parameters:
	///	- width: gint
	///	- height: gint
	open func resize(width: gint, height: gint) {
		gtk_window_resize(GTK_WINDOW(self.GOBJECT), width, height)
	}

	/// 
	/// Determines whether a resize grip is visible for the specified window.
	/// - Returns: Bool
	open func resizeGripIsVisible() -> Bool {
		return gtk_window_resize_grip_is_visible(GTK_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Like gtk_window_resize(), but @width and @height are interpreted
	/// in terms of the base size and increment set with
	/// gtk_window_set_geometry_hints.
	/// Parameters:
	///	- width: gint
	///	- height: gint
	open func resizeToGeometry(width: gint, height: gint) {
		gtk_window_resize_to_geometry(GTK_WINDOW(self.GOBJECT), width, height)
	}

	/// 
	/// Windows may set a hint asking the desktop environment not to receive
	/// the input focus. This function sets this hint.
	/// Parameters:
	///	- setting: Bool
	open func setAcceptFocus(setting: Bool) {
		gtk_window_set_accept_focus(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Sets or unsets the #GtkApplication associated with the window.
	/// The application will be kept alive for at least as long as it has any windows
	/// associated with it (see g_application_hold() for a way to keep it alive
	/// without windows).
	/// Normally, the connection between the application and the window will remain
	/// until the window is destroyed, but you can explicitly remove it by setting
	/// the @application to %NULL.
	/// This is equivalent to calling gtk_application_remove_window() and/or
	/// gtk_application_add_window() on the old/new applications as relevant.
	/// Parameters:
	///	- application: CGTKApplication
	open func setApplication(_ application: CGTKApplication) {
		gtk_window_set_application(GTK_WINDOW(self.GOBJECT), application.APPLICATION)
	}

	/// 
	/// Marks @window as attached to @attach_widget. This creates a logical binding
	/// between the window and the widget it belongs to, which is used by GTK+ to
	/// propagate information such as styling or accessibility to @window as if it
	/// was a children of @attach_widget.
	/// Examples of places where specifying this relation is useful are for instance
	/// a #GtkMenu created by a #GtkComboBox, a completion popup window
	/// created by #GtkEntry or a typeahead search entry created by #GtkTreeView.
	/// Note that this function should not be confused with
	/// gtk_window_set_transient_for(), which specifies a window manager relation
	/// between two toplevels instead.
	/// Passing %NULL for @attach_widget detaches the window.
	/// Parameters:
	///	- attachWidget: CGTKWidget
	open func setAttachedTo(attachWidget: CGTKWidget) {
		gtk_window_set_attached_to(GTK_WINDOW(self.GOBJECT), attachWidget.WIDGET)
	}

	/// 
	/// By default, windows are decorated with a title bar, resize
	/// controls, etc.  Some [window managers][gtk-X11-arch]
	/// allow GTK+ to disable these decorations, creating a
	/// borderless window. If you set the decorated property to %FALSE
	/// using this function, GTK+ will do its best to convince the window
	/// manager not to decorate the window. Depending on the system, this
	/// function may not have any effect when called on a window that is
	/// already visible, so you should call it before calling gtk_widget_show().
	/// On Windows, this function always works, since there’s no window manager
	/// policy involved.
	/// Parameters:
	///	- setting: Bool
	open func setDecorated(setting: Bool) {
		gtk_window_set_decorated(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// The default widget is the widget that’s activated when the user
	/// presses Enter in a dialog (for example). This function sets or
	/// unsets the default widget for a #GtkWindow. When setting (rather
	/// than unsetting) the default widget it’s generally easier to call
	/// gtk_widget_grab_default() on the widget. Before making a widget
	/// the default widget, you must call gtk_widget_set_can_default() on
	/// the widget you’d like to make the default.
	/// Parameters:
	///	- defaultWidget: CGTKWidget
	open func setDefault(defaultWidget: CGTKWidget) {
		gtk_window_set_default(GTK_WINDOW(self.GOBJECT), defaultWidget.WIDGET)
	}

	/// 
	/// Like gtk_window_set_default_size(), but @width and @height are interpreted
	/// in terms of the base size and increment set with
	/// gtk_window_set_geometry_hints.
	/// Parameters:
	///	- width: gint
	///	- height: gint
	open func setDefaultGeometry(width: gint, height: gint) {
		gtk_window_set_default_geometry(GTK_WINDOW(self.GOBJECT), width, height)
	}

	/// 
	/// Sets the default size of a window. If the window’s “natural” size
	/// (its size request) is larger than the default, the default will be
	/// ignored. More generally, if the default size does not obey the
	/// geometry hints for the window (gtk_window_set_geometry_hints() can
	/// be used to set these explicitly), the default size will be clamped
	/// to the nearest permitted size.
	/// Unlike gtk_widget_set_size_request(), which sets a size request for
	/// a widget and thus would keep users from shrinking the window, this
	/// function only sets the initial size, just as if the user had
	/// resized the window themselves. Users can still shrink the window
	/// again as they normally would. Setting a default size of -1 means to
	/// use the “natural” default size (the size request of the window).
	/// For more control over a window’s initial size and how resizing works,
	/// investigate gtk_window_set_geometry_hints().
	/// For some uses, gtk_window_resize() is a more appropriate function.
	/// gtk_window_resize() changes the current size of the window, rather
	/// than the size to be used on initial display. gtk_window_resize() always
	/// affects the window itself, not the geometry widget.
	/// The default size of a window only affects the first time a window is
	/// shown; if a window is hidden and re-shown, it will remember the size
	/// it had prior to hiding, rather than using the default size.
	/// Windows can’t actually be 0x0 in size, they must be at least 1x1, but
	/// passing 0 for @width and @height is OK, resulting in a 1x1 default size.
	/// If you use this function to reestablish a previously saved window size,
	/// note that the appropriate size to save is the one returned by
	/// gtk_window_get_size(). Using the window allocation directly will not
	/// work in all circumstances and can lead to growing or shrinking windows.
	/// Parameters:
	///	- width: gint
	///	- height: gint
	open func setDefaultSize(width: gint, height: gint) {
		gtk_window_set_default_size(GTK_WINDOW(self.GOBJECT), width, height)
	}

	/// 
	/// By default, windows have a close button in the window frame. Some
	/// [window managers][gtk-X11-arch] allow GTK+ to
	/// disable this button. If you set the deletable property to %FALSE
	/// using this function, GTK+ will do its best to convince the window
	/// manager not to show a close button. Depending on the system, this
	/// function may not have any effect when called on a window that is
	/// already visible, so you should call it before calling gtk_widget_show().
	/// On Windows, this function always works, since there’s no window manager
	/// policy involved.
	/// Parameters:
	///	- setting: Bool
	open func setDeletable(setting: Bool) {
		gtk_window_set_deletable(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// If @setting is %TRUE, then destroying the transient parent of @window
	/// will also destroy @window itself. This is useful for dialogs that
	/// shouldn’t persist beyond the lifetime of the main window they're
	/// associated with, for example.
	/// Parameters:
	///	- setting: Bool
	open func setDestroyWithParent(setting: Bool) {
		gtk_window_set_destroy_with_parent(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// If @focus is not the current focus widget, and is focusable, sets
	/// it as the focus widget for the window. If @focus is %NULL, unsets
	/// the focus widget for this window. To set the focus to a particular
	/// widget in the toplevel, it is usually more convenient to use
	/// gtk_widget_grab_focus() instead of this function.
	/// Parameters:
	///	- focus: CGTKWidget
	open func setFocus(_ focus: CGTKWidget) {
		gtk_window_set_focus(GTK_WINDOW(self.GOBJECT), focus.WIDGET)
	}

	/// 
	/// Windows may set a hint asking the desktop environment not to receive
	/// the input focus when the window is mapped.  This function sets this
	/// hint.
	/// Parameters:
	///	- setting: Bool
	open func setFocusOnMap(setting: Bool) {
		gtk_window_set_focus_on_map(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Sets the #GtkWindow:focus-visible property.
	/// Parameters:
	///	- setting: Bool
	open func setFocusVisible(setting: Bool) {
		gtk_window_set_focus_visible(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// This function sets up hints about how a window can be resized by
	/// the user.  You can set a minimum and maximum size; allowed resize
	/// increments (e.g. for xterm, you can only resize by the size of a
	/// character); aspect ratios; and more. See the #GdkGeometry struct.
	/// Parameters:
	///	- geometryWidget: CGTKWidget
	///	- geometry: UnsafeMutablePointer<GdkGeometry>?
	///	- geomMask: GdkWindowHints
	open func setGeometryHints(geometryWidget: CGTKWidget, geometry: UnsafeMutablePointer<GdkGeometry>?, geomMask: GdkWindowHints) {
		gtk_window_set_geometry_hints(GTK_WINDOW(self.GOBJECT), geometryWidget.WIDGET, geometry, geomMask)
	}

	/// 
	/// Window gravity defines the meaning of coordinates passed to
	/// gtk_window_move(). See gtk_window_move() and #GdkGravity for
	/// more details.
	/// The default window gravity is #GDK_GRAVITY_NORTH_WEST which will
	/// typically “do what you mean.”
	/// Parameters:
	///	- gravity: GdkGravity
	open func setGravity(_ gravity: GdkGravity) {
		gtk_window_set_gravity(GTK_WINDOW(self.GOBJECT), gravity)
	}

	/// 
	/// Sets whether @window has a corner resize grip.
	/// Note that the resize grip is only shown if the window
	/// is actually resizable and not maximized. Use
	/// gtk_window_resize_grip_is_visible() to find out if the
	/// resize grip is currently shown.
	/// Parameters:
	///	- value: Bool
	open func setHasResizeGrip(value: Bool) {
		gtk_window_set_has_resize_grip(GTK_WINDOW(self.GOBJECT), value ? 1 : 0)
	}

	/// 
	/// Tells GTK+ whether to drop its extra reference to the window
	/// when gtk_widget_destroy() is called.
	/// This function is only exported for the benefit of language
	/// bindings which may need to keep the window alive until their
	/// wrapper object is garbage collected. There is no justification
	/// for ever calling this function in an application.
	/// Parameters:
	///	- setting: Bool
	open func setHasUserRefCount(setting: Bool) {
		gtk_window_set_has_user_ref_count(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// If @setting is %TRUE, then @window will request that it’s titlebar
	/// should be hidden when maximized.
	/// This is useful for windows that don’t convey any information other
	/// than the application name in the titlebar, to put the available
	/// screen space to better use. If the underlying window system does not
	/// support the request, the setting will not have any effect.
	/// Note that custom titlebars set with gtk_window_set_titlebar() are
	/// not affected by this. The application is in full control of their
	/// content and visibility anyway.
	/// Parameters:
	///	- setting: Bool
	open func setHideTitlebarWhenMaximized(setting: Bool) {
		gtk_window_set_hide_titlebar_when_maximized(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Sets up the icon representing a #GtkWindow. This icon is used when
	/// the window is minimized (also known as iconified).  Some window
	/// managers or desktop environments may also place it in the window
	/// frame, or display it in other contexts. On others, the icon is not
	/// used at all, so your mileage may vary.
	/// The icon should be provided in whatever size it was naturally
	/// drawn; that is, don’t scale the image before passing it to
	/// GTK+. Scaling is postponed until the last minute, when the desired
	/// final size is known, to allow best quality.
	/// If you have your icon hand-drawn in multiple sizes, use
	/// gtk_window_set_icon_list(). Then the best size will be used.
	/// This function is equivalent to calling gtk_window_set_icon_list()
	/// with a 1-element list.
	/// See also gtk_window_set_default_icon_list() to set the icon
	/// for all windows in your application in one go.
	/// Parameters:
	///	- icon: OpaquePointer?
	open func setIcon(_ icon: OpaquePointer?) {
		gtk_window_set_icon(GTK_WINDOW(self.GOBJECT), icon)
	}

	/// 
	/// Sets the icon for @window.
	/// Warns on failure if @err is %NULL.
	/// This function is equivalent to calling gtk_window_set_icon()
	/// with a pixbuf created by loading the image from @filename.
	/// Parameters:
	///	- filename: String
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil
	/// - Returns: Bool
	open func setIconFromFile(filename: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_window_set_icon_from_file(GTK_WINDOW(self.GOBJECT), filename, err) != 0 ? true : false
	}

	/// 
	/// Sets up the icon representing a #GtkWindow. The icon is used when
	/// the window is minimized (also known as iconified).  Some window
	/// managers or desktop environments may also place it in the window
	/// frame, or display it in other contexts. On others, the icon is not
	/// used at all, so your mileage may vary.
	/// gtk_window_set_icon_list() allows you to pass in the same icon in
	/// several hand-drawn sizes. The list should contain the natural sizes
	/// your icon is available in; that is, don’t scale the image before
	/// passing it to GTK+. Scaling is postponed until the last minute,
	/// when the desired final size is known, to allow best quality.
	/// By passing several sizes, you may improve the final image quality
	/// of the icon, by reducing or eliminating automatic image scaling.
	/// Recommended sizes to provide: 16x16, 32x32, 48x48 at minimum, and
	/// larger images (64x64, 128x128) if you have them.
	/// See also gtk_window_set_default_icon_list() to set the icon
	/// for all windows in your application in one go.
	/// Note that transient windows (those who have been set transient for another
	/// window using gtk_window_set_transient_for()) will inherit their
	/// icon from their transient parent. So there’s no need to explicitly
	/// set the icon on transient windows.
	/// Parameters:
	///	- list: UnsafeMutablePointer<GList>!
	open func setIconList(_ list: UnsafeMutablePointer<GList>!) {
		gtk_window_set_icon_list(GTK_WINDOW(self.GOBJECT), list)
	}

	/// 
	/// Sets the icon for the window from a named themed icon.
	/// See the docs for #GtkIconTheme for more details.
	/// On some platforms, the window icon is not used at all.
	/// Note that this has nothing to do with the WM_ICON_NAME
	/// property which is mentioned in the ICCCM.
	/// Parameters:
	///	- name: String
	open func setIconName(_ name: String) {
		gtk_window_set_icon_name(GTK_WINDOW(self.GOBJECT), name)
	}

	/// 
	/// Asks to keep @window above, so that it stays on top. Note that
	/// you shouldn’t assume the window is definitely above afterward,
	/// because other entities (e.g. the user or
	/// [window manager][gtk-X11-arch]) could not keep it above,
	/// and not all window managers support keeping windows above. But
	/// normally the window will end kept above. Just don’t write code
	/// that crashes if not.
	/// It’s permitted to call this function before showing a window,
	/// in which case the window will be kept above when it appears onscreen
	/// initially.
	/// You can track the above state via the “window-state-event” signal
	/// on #GtkWidget.
	/// Note that, according to the
	/// [Extended Window Manager Hints Specification](http://www.freedesktop.org/Standards/wm-spec),
	/// the above state is mainly meant for user preferences and should not
	/// be used by applications e.g. for drawing attention to their
	/// dialogs.
	/// Parameters:
	///	- setting: Bool
	open func setKeepAbove(setting: Bool) {
		gtk_window_set_keep_above(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Asks to keep @window below, so that it stays in bottom. Note that
	/// you shouldn’t assume the window is definitely below afterward,
	/// because other entities (e.g. the user or
	/// [window manager][gtk-X11-arch]) could not keep it below,
	/// and not all window managers support putting windows below. But
	/// normally the window will be kept below. Just don’t write code
	/// that crashes if not.
	/// It’s permitted to call this function before showing a window,
	/// in which case the window will be kept below when it appears onscreen
	/// initially.
	/// You can track the below state via the “window-state-event” signal
	/// on #GtkWidget.
	/// Note that, according to the
	/// [Extended Window Manager Hints Specification](http://www.freedesktop.org/Standards/wm-spec),
	/// the above state is mainly meant for user preferences and should not
	/// be used by applications e.g. for drawing attention to their
	/// dialogs.
	/// Parameters:
	///	- setting: Bool
	open func setKeepBelow(setting: Bool) {
		gtk_window_set_keep_below(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Sets the mnemonic modifier for this window.
	/// Parameters:
	///	- modifier: GdkModifierType
	open func setMnemonicModifier(_ modifier: GdkModifierType) {
		gtk_window_set_mnemonic_modifier(GTK_WINDOW(self.GOBJECT), modifier)
	}

	/// 
	/// Sets the #GtkWindow:mnemonics-visible property.
	/// Parameters:
	///	- setting: Bool
	open func setMnemonicsVisible(setting: Bool) {
		gtk_window_set_mnemonics_visible(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Sets a window modal or non-modal. Modal windows prevent interaction
	/// with other windows in the same application. To keep modal dialogs
	/// on top of main application windows, use
	/// gtk_window_set_transient_for() to make the dialog transient for the
	/// parent; most [window managers][gtk-X11-arch]
	/// will then disallow lowering the dialog below the parent.
	/// Parameters:
	///	- modal: Bool
	open func setModal(_ modal: Bool) {
		gtk_window_set_modal(GTK_WINDOW(self.GOBJECT), modal ? 1 : 0)
	}

	/// 
	/// Request the windowing system to make @window partially transparent,
	/// with opacity 0 being fully transparent and 1 fully opaque. (Values
	/// of the opacity parameter are clamped to the [0,1] range.) On X11
	/// this has any effect only on X screens with a compositing manager
	/// running. See gtk_widget_is_composited(). On Windows it should work
	/// always.
	/// Note that setting a window’s opacity after the window has been
	/// shown causes it to flicker once on Windows.
	/// Parameters:
	///	- opacity: Double
	override open func setOpacity(_ opacity: Double) {
		gtk_window_set_opacity(GTK_WINDOW(self.GOBJECT), opacity)
	}

	/// 
	/// Sets a position constraint for this window. If the old or new
	/// constraint is %GTK_WIN_POS_CENTER_ALWAYS, this will also cause
	/// the window to be repositioned to satisfy the new constraint.
	/// Parameters:
	///	- position: GtkWindowPosition
	open func setPosition(_ position: GtkWindowPosition) {
		gtk_window_set_position(GTK_WINDOW(self.GOBJECT), position)
	}

	/// 
	/// Sets whether the user can resize a window. Windows are user resizable
	/// by default.
	/// Parameters:
	///	- resizable: Bool
	open func setResizable(_ resizable: Bool) {
		gtk_window_set_resizable(GTK_WINDOW(self.GOBJECT), resizable ? 1 : 0)
	}

	/// 
	/// This function is only useful on X11, not with other GTK+ targets.
	/// In combination with the window title, the window role allows a
	/// [window manager][gtk-X11-arch] to identify "the
	/// same" window when an application is restarted. So for example you
	/// might set the “toolbox” role on your app’s toolbox window, so that
	/// when the user restarts their session, the window manager can put
	/// the toolbox back in the same place.
	/// If a window already has a unique title, you don’t need to set the
	/// role, since the WM can use the title to identify the window when
	/// restoring the session.
	/// Parameters:
	///	- role: String
	open func setRole(_ role: String) {
		gtk_window_set_role(GTK_WINDOW(self.GOBJECT), role)
	}

	/// 
	/// Sets the #GdkScreen where the @window is displayed; if
	/// the window is already mapped, it will be unmapped, and
	/// then remapped on the new screen.
	/// Parameters:
	///	- screen: OpaquePointer!
	open func setScreen(_ screen: OpaquePointer!) {
		gtk_window_set_screen(GTK_WINDOW(self.GOBJECT), screen)
	}

	/// 
	/// Windows may set a hint asking the desktop environment not to display
	/// the window in the pager. This function sets this hint.
	/// (A "pager" is any desktop navigation tool such as a workspace
	/// switcher that displays a thumbnail representation of the windows
	/// on the screen.)
	/// Parameters:
	///	- setting: Bool
	open func setSkipPagerHint(setting: Bool) {
		gtk_window_set_skip_pager_hint(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Windows may set a hint asking the desktop environment not to display
	/// the window in the task bar. This function sets this hint.
	/// Parameters:
	///	- setting: Bool
	open func setSkipTaskbarHint(setting: Bool) {
		gtk_window_set_skip_taskbar_hint(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Startup notification identifiers are used by desktop environment to
	/// track application startup, to provide user feedback and other
	/// features. This function changes the corresponding property on the
	/// underlying GdkWindow. Normally, startup identifier is managed
	/// automatically and you should only use this function in special cases
	/// like transferring focus from other processes. You should use this
	/// function before calling gtk_window_present() or any equivalent
	/// function generating a window map event.
	/// This function is only useful on X11, not with other GTK+ targets.
	/// Parameters:
	///	- startupId: String
	open func setStartupId(_ startupId: String) {
		gtk_window_set_startup_id(GTK_WINDOW(self.GOBJECT), startupId)
	}

	/// 
	/// Sets the title of the #GtkWindow. The title of a window will be
	/// displayed in its title bar; on the X Window System, the title bar
	/// is rendered by the [window manager][gtk-X11-arch],
	/// so exactly how the title appears to users may vary
	/// according to a user’s exact configuration. The title should help a
	/// user distinguish this window from other windows they may have
	/// open. A good title might include the application name and current
	/// document filename, for example.
	/// Parameters:
	///	- title: String
	open func setTitle(_ title: String) {
		gtk_window_set_title(GTK_WINDOW(self.GOBJECT), title)
	}

	/// 
	/// Sets a custom titlebar for @window.
	/// A typical widget used here is #GtkHeaderBar, as it provides various features
	/// expected of a titlebar while allowing the addition of child widgets to it.
	/// If you set a custom titlebar, GTK+ will do its best to convince
	/// the window manager not to put its own titlebar on the window.
	/// Depending on the system, this function may not work for a window
	/// that is already visible, so you set the titlebar before calling
	/// gtk_widget_show().
	/// Parameters:
	///	- titlebar: CGTKWidget
	open func setTitlebar(_ titlebar: CGTKWidget) {
		gtk_window_set_titlebar(GTK_WINDOW(self.GOBJECT), titlebar.WIDGET)
	}

	/// 
	/// Dialog windows should be set transient for the main application
	/// window they were spawned from. This allows
	/// [window managers][gtk-X11-arch] to e.g. keep the
	/// dialog on top of the main window, or center the dialog over the
	/// main window. gtk_dialog_new_with_buttons() and other convenience
	/// functions in GTK+ will sometimes call
	/// gtk_window_set_transient_for() on your behalf.
	/// Passing %NULL for @parent unsets the current transient window.
	/// On Wayland, this function can also be used to attach a new
	/// #GTK_WINDOW_POPUP to a #GTK_WINDOW_TOPLEVEL parent already mapped
	/// on screen so that the #GTK_WINDOW_POPUP will be created as a
	/// subsurface-based window #GDK_WINDOW_SUBSURFACE which can be
	/// positioned at will relatively to the #GTK_WINDOW_TOPLEVEL surface.
	/// On Windows, this function puts the child window on top of the parent,
	/// much as the window manager would have done on X.
	/// Parameters:
	///	- parent: CGTKWindow
	open func setTransientFor(parent: CGTKWindow) {
		gtk_window_set_transient_for(GTK_WINDOW(self.GOBJECT), parent.WINDOW)
	}

	/// 
	/// By setting the type hint for the window, you allow the window
	/// manager to decorate and handle the window in a way which is
	/// suitable to the function of the window in your application.
	/// This function should be called before the window becomes visible.
	/// gtk_dialog_new_with_buttons() and other convenience functions in GTK+
	/// will sometimes call gtk_window_set_type_hint() on your behalf.
	/// Parameters:
	///	- hint: GdkWindowTypeHint
	open func setTypeHint(_ hint: GdkWindowTypeHint) {
		gtk_window_set_type_hint(GTK_WINDOW(self.GOBJECT), hint)
	}

	/// 
	/// Windows may set a hint asking the desktop environment to draw
	/// the users attention to the window. This function sets this hint.
	/// Parameters:
	///	- setting: Bool
	open func setUrgencyHint(setting: Bool) {
		gtk_window_set_urgency_hint(GTK_WINDOW(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Don’t use this function. It sets the X Window System “class” and
	/// “name” hints for a window.  According to the ICCCM, you should
	/// always set these to the same value for all windows in an
	/// application, and GTK+ sets them to that value by default, so calling
	/// this function is sort of pointless. However, you may want to call
	/// gtk_window_set_role() on each window in your application, for the
	/// benefit of the session manager. Setting the role allows the window
	/// manager to restore window positions when loading a saved session.
	/// Parameters:
	///	- wmclassName: String
	///	- wmclassClass: String
	open func setWmclass(wmclassName: String, wmclassClass: String) {
		gtk_window_set_wmclass(GTK_WINDOW(self.GOBJECT), wmclassName, wmclassClass)
	}

	/// 
	/// Asks to stick @window, which means that it will appear on all user
	/// desktops. Note that you shouldn’t assume the window is definitely
	/// stuck afterward, because other entities (e.g. the user or
	/// [window manager][gtk-X11-arch] could unstick it
	/// again, and some window managers do not support sticking
	/// windows. But normally the window will end up stuck. Just don't
	/// write code that crashes if not.
	/// It’s permitted to call this function before showing a window.
	/// You can track stickiness via the “window-state-event” signal
	/// on #GtkWidget.
	open func stick() {
		gtk_window_stick(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Asks to toggle off the fullscreen state for @window. Note that you
	/// shouldn’t assume the window is definitely not full screen
	/// afterward, because other entities (e.g. the user or
	/// [window manager][gtk-X11-arch]) could fullscreen it
	/// again, and not all window managers honor requests to unfullscreen
	/// windows. But normally the window will end up restored to its normal
	/// state. Just don’t write code that crashes if not.
	/// You can track the fullscreen state via the “window-state-event” signal
	/// on #GtkWidget.
	open func unfullscreen() {
		gtk_window_unfullscreen(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Asks to unmaximize @window. Note that you shouldn’t assume the
	/// window is definitely unmaximized afterward, because other entities
	/// (e.g. the user or [window manager][gtk-X11-arch])
	/// could maximize it again, and not all window
	/// managers honor requests to unmaximize. But normally the window will
	/// end up unmaximized. Just don’t write code that crashes if not.
	/// You can track maximization via the “window-state-event” signal
	/// on #GtkWidget.
	open func unmaximize() {
		gtk_window_unmaximize(GTK_WINDOW(self.GOBJECT))
	}

	/// 
	/// Asks to unstick @window, which means that it will appear on only
	/// one of the user’s desktops. Note that you shouldn’t assume the
	/// window is definitely unstuck afterward, because other entities
	/// (e.g. the user or [window manager][gtk-X11-arch]) could
	/// stick it again. But normally the window will
	/// end up stuck. Just don’t write code that crashes if not.
	/// You can track stickiness via the “window-state-event” signal
	/// on #GtkWidget.
	open func unstick() {
		gtk_window_unstick(GTK_WINDOW(self.GOBJECT))
	}

}
