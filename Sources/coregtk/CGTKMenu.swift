/*
 * CGTKMenu.swift
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

public let GTK_TYPE_MENU: GType = gtk_menu_get_type()

@inline(__always) public func GTK_MENU(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkMenu>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_MENU)
}

/// A #GtkMenu is a #GtkMenuShell that implements a drop down menu
/// consisting of a list of #GtkMenuItem objects which can be navigated
/// and activated by the user to perform application functions.
/// A #GtkMenu is most commonly dropped down by activating a
/// #GtkMenuItem in a #GtkMenuBar or popped up by activating a
/// #GtkMenuItem in another #GtkMenu.
/// A #GtkMenu can also be popped up by activating a #GtkComboBox.
/// Other composite widgets such as the #GtkNotebook can pop up a
/// #GtkMenu as well.
/// Applications can display a #GtkMenu as a popup menu by calling the
/// gtk_menu_popup() function.  The example below shows how an application
/// can pop up a menu when the 3rd mouse button is pressed.
/// ## Connecting the popup signal handler.
/// |[<!-- language="C" -->
/// // connect our handler which will popup the menu
/// g_signal_connect_swapped (window, "button_press_event",
/// G_CALLBACK (my_popup_handler), menu);
/// ]|
/// ## Signal handler which displays a popup menu.
/// |[<!-- language="C" -->
/// static gint
/// my_popup_handler (GtkWidget *widget, GdkEvent *event)
/// {
/// GtkMenu *menu;
/// GdkEventButton *event_button;
/// g_return_val_if_fail (widget != NULL, FALSE);
/// g_return_val_if_fail (GTK_IS_MENU (widget), FALSE);
/// g_return_val_if_fail (event != NULL, FALSE);
/// // The "widget" is the menu that was supplied when
/// // g_signal_connect_swapped() was called.
/// menu = GTK_MENU (widget);
/// if (event->type == GDK_BUTTON_PRESS)
/// {
/// event_button = (GdkEventButton *) event;
/// if (event_button->button == GDK_BUTTON_SECONDARY)
/// {
/// gtk_menu_popup (menu, NULL, NULL, NULL, NULL,
/// event_button->button, event_button->time);
/// return TRUE;
/// }
/// }
/// return FALSE;
/// }
/// ]|
/// # CSS nodes
/// |[<!-- language="plain" -->
/// menu
/// ├── arrow.top
/// ├── <child>
/// ┊
/// ├── <child>
/// ╰── arrow.bottom
/// ]|
/// The main CSS node of GtkMenu has name menu, and there are two subnodes
/// with name arrow, for scrolling menu arrows. These subnodes get the
/// .top and .bottom style classes.


open class CGTKMenu : CGTKMenuShell {
	/// Returns a list of the menus which are attached to this widget.
	/// This list is owned by GTK+ and must not be modified.
	/// - Parameters:
	///	- widget: CGTKWidget (GtkWidget*)
	/// - Returns: UnsafeMutablePointer<GList>! (GList*)
	open class func getForAttachWidget(_ widget: CGTKWidget) -> UnsafeMutablePointer<GList>! {
		return gtk_menu_get_for_attach_widget(widget.WIDGET)
	}

	/// Creates a new #GtkMenu
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_menu_new())!
	}

	/// Creates a #GtkMenu and populates it with menu items and
	/// submenus according to @model.
	/// The created menu items are connected to actions found in the
	/// #GtkApplicationWindow to which the menu belongs - typically
	/// by means of being attached to a widget (see gtk_menu_attach_to_widget())
	/// that is contained within the #GtkApplicationWindows widget hierarchy.
	/// Actions can also be added using gtk_widget_insert_action_group() on the menu's
	/// attach widget or on any of its parent widgets.
	/// - Parameters:
	///	- model: UnsafeMutablePointer<GMenuModel>! (GMenuModel*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromModel model: UnsafeMutablePointer<GMenuModel>!) {
		self.init(withGObject: gtk_menu_new_from_model(model))!
	}

	open var MENU: UnsafeMutablePointer<GtkMenu>! {
		get {
			return GTK_MENU(self.GOBJECT)
		}
	}

	/// Adds a new #GtkMenuItem to a (table) menu. The number of “cells” that
	/// an item will occupy is specified by @left_attach, @right_attach,
	/// @top_attach and @bottom_attach. These each represent the leftmost,
	/// rightmost, uppermost and lower column and row numbers of the table.
	/// (Columns and rows are indexed from zero).
	/// Note that this function is not related to gtk_menu_detach().
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- leftAttach: guint (guint)
	///	- rightAttach: guint (guint)
	///	- topAttach: guint (guint)
	///	- bottomAttach: guint (guint)
	open func attach(child: CGTKWidget, leftAttach: guint, rightAttach: guint, topAttach: guint, bottomAttach: guint) -> Swift.Void {
		gtk_menu_attach(GTK_MENU(self.GOBJECT), child.WIDGET, leftAttach, rightAttach, topAttach, bottomAttach)
	}

	/// Attaches the menu to the widget and provides a callback function
	/// that will be invoked when the menu calls gtk_menu_detach() during
	/// its destruction.
	/// If the menu is attached to the widget then it will be destroyed
	/// when the widget is destroyed, as if it was a child widget.
	/// An attached menu will also move between screens correctly if the
	/// widgets moves between screens.
	/// - Parameters:
	///	- attachWidget: CGTKWidget (GtkWidget*)
	///	- detacher: @escaping GtkMenuDetachFunc (GtkMenuDetachFunc)
	open func attachToWidget(attachWidget: CGTKWidget, detacher: @escaping GtkMenuDetachFunc) -> Swift.Void {
		gtk_menu_attach_to_widget(GTK_MENU(self.GOBJECT), attachWidget.WIDGET, detacher)
	}

	/// Detaches the menu from the widget to which it had been attached.
	/// This function will call the callback function, @detacher, provided
	/// when the gtk_menu_attach_to_widget() function was called.
	open func detach() -> Swift.Void {
		gtk_menu_detach(GTK_MENU(self.GOBJECT))
	}

	/// Gets the #GtkAccelGroup which holds global accelerators for the
	/// menu. See gtk_menu_set_accel_group().
	/// - Returns: UnsafeMutablePointer<GtkAccelGroup>! (GtkAccelGroup*)
	open func getAccelGroup() -> UnsafeMutablePointer<GtkAccelGroup>! {
		return gtk_menu_get_accel_group(GTK_MENU(self.GOBJECT))
	}

	/// Retrieves the accelerator path set on the menu.
	/// - Returns: String? (const gchar*)
	open func getAccelPath() -> String? {
		return String(utf8String: gtk_menu_get_accel_path(GTK_MENU(self.GOBJECT)))
	}

	/// Returns the selected menu item from the menu.  This is used by the
	/// #GtkComboBox.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getActive<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_menu_get_active(GTK_MENU(self.GOBJECT)))!
	}

	/// Returns the #GtkWidget that the menu is attached to.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getAttachWidget<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_menu_get_attach_widget(GTK_MENU(self.GOBJECT)))!
	}

	/// Retrieves the number of the monitor on which to show the menu.
	/// - Returns: gint (gint)
	open func getMonitor() -> gint {
		return gtk_menu_get_monitor(GTK_MENU(self.GOBJECT))
	}

	/// Returns whether the menu reserves space for toggles and
	/// icons, regardless of their actual presence.
	/// - Returns: Bool (gboolean)
	open func getReserveToggleSize() -> Bool {
		return gtk_menu_get_reserve_toggle_size(GTK_MENU(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the menu is torn off.
	/// See gtk_menu_set_tearoff_state().
	/// - Returns: Bool (gboolean)
	open func getTearoffState() -> Bool {
		return gtk_menu_get_tearoff_state(GTK_MENU(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the title of the menu. See gtk_menu_set_title().
	/// - Returns: String? (const gchar*)
	open func getTitle() -> String? {
		return String(utf8String: gtk_menu_get_title(GTK_MENU(self.GOBJECT)))
	}

	/// Places @menu on the given monitor.
	/// - Parameters:
	///	- monitor: OpaquePointer! (GdkMonitor*)
	open func placeOnMonitor(_ monitor: OpaquePointer!) -> Swift.Void {
		gtk_menu_place_on_monitor(GTK_MENU(self.GOBJECT), monitor)
	}

	/// Removes the menu from the screen.
	open func popdown() -> Swift.Void {
		gtk_menu_popdown(GTK_MENU(self.GOBJECT))
	}

	/// Displays a menu and makes it available for selection.
	/// Applications can use this function to display context-sensitive
	/// menus, and will typically supply %NULL for the @parent_menu_shell,
	/// @parent_menu_item, @func and @data parameters. The default menu
	/// positioning function will position the menu at the current mouse
	/// cursor position.
	/// The @button parameter should be the mouse button pressed to initiate
	/// the menu popup. If the menu popup was initiated by something other
	/// than a mouse button press, such as a mouse button release or a keypress,
	/// @button should be 0.
	/// The @activate_time parameter is used to conflict-resolve initiation
	/// of concurrent requests for mouse/keyboard grab requests. To function
	/// properly, this needs to be the timestamp of the user event (such as
	/// a mouse click or key press) that caused the initiation of the popup.
	/// Only if no such event is available, gtk_get_current_event_time() can
	/// be used instead.
	/// Note that this function does not work very well on GDK backends that
	/// do not have global coordinates, such as Wayland or Mir. You should
	/// probably use one of the gtk_menu_popup_at_ variants, which do not
	/// have this problem.
	/// - Parameters:
	///	- parentMenuShell: CGTKWidget (GtkWidget*)
	///	- parentMenuItem: CGTKWidget (GtkWidget*)
	///	- function: @escaping GtkMenuPositionFunc (GtkMenuPositionFunc)
	///	- data: gpointer (gpointer)
	///	- button: guint (guint)
	///	- activateTime: guint32 (guint32)
	open func popup(parentMenuShell: CGTKWidget, parentMenuItem: CGTKWidget, function: @escaping GtkMenuPositionFunc, data: gpointer, button: guint, activateTime: guint32) -> Swift.Void {
		gtk_menu_popup(GTK_MENU(self.GOBJECT), parentMenuShell.WIDGET, parentMenuItem.WIDGET, function, data, button, activateTime)
	}

	/// Displays @menu and makes it available for selection.
	/// See gtk_menu_popup_at_widget () to pop up a menu at a widget.
	/// gtk_menu_popup_at_rect () also allows you to position a menu at an arbitrary
	/// rectangle.
	/// @menu will be positioned at the pointer associated with @trigger_event.
	/// Properties that influence the behaviour of this function are
	/// #GtkMenu:anchor-hints, #GtkMenu:rect-anchor-dx, #GtkMenu:rect-anchor-dy, and
	/// #GtkMenu:menu-type-hint. Connect to the #GtkMenu::popped-up signal to find
	/// out how it was actually positioned.
	/// - Parameters:
	///	- triggerEvent: UnsafePointer<GdkEvent>? (const GdkEvent*)
	open func popupAtPointer(triggerEvent: UnsafePointer<GdkEvent>?) -> Swift.Void {
		gtk_menu_popup_at_pointer(GTK_MENU(self.GOBJECT), triggerEvent)
	}

	/// Displays @menu and makes it available for selection.
	/// See gtk_menu_popup_at_widget () and gtk_menu_popup_at_pointer (), which
	/// handle more common cases for popping up menus.
	/// @menu will be positioned at @rect, aligning their anchor points. @rect is
	/// relative to the top-left corner of @rect_window. @rect_anchor and
	/// @menu_anchor determine anchor points on @rect and @menu to pin together.
	/// @menu can optionally be offset by #GtkMenu:rect-anchor-dx and
	/// #GtkMenu:rect-anchor-dy.
	/// Anchors should be specified under the assumption that the text direction is
	/// left-to-right; they will be flipped horizontally automatically if the text
	/// direction is right-to-left.
	/// Other properties that influence the behaviour of this function are
	/// #GtkMenu:anchor-hints and #GtkMenu:menu-type-hint. Connect to the
	/// #GtkMenu::popped-up signal to find out how it was actually positioned.
	/// - Parameters:
	///	- rectWindow: OpaquePointer! (GdkWindow*)
	///	- rect: UnsafePointer<GdkRectangle>! (const GdkRectangle*)
	///	- rectAnchor: GdkGravity (GdkGravity)
	///	- menuAnchor: GdkGravity (GdkGravity)
	///	- triggerEvent: UnsafePointer<GdkEvent>? (const GdkEvent*)
	open func popupAtRect(rectWindow: OpaquePointer!, rect: UnsafePointer<GdkRectangle>!, rectAnchor: GdkGravity, menuAnchor: GdkGravity, triggerEvent: UnsafePointer<GdkEvent>?) -> Swift.Void {
		gtk_menu_popup_at_rect(GTK_MENU(self.GOBJECT), rectWindow, rect, rectAnchor, menuAnchor, triggerEvent)
	}

	/// Displays @menu and makes it available for selection.
	/// See gtk_menu_popup_at_pointer () to pop up a menu at the master pointer.
	/// gtk_menu_popup_at_rect () also allows you to position a menu at an arbitrary
	/// rectangle.
	/// ![](popup-anchors.png)
	/// @menu will be positioned at @widget, aligning their anchor points.
	/// @widget_anchor and @menu_anchor determine anchor points on @widget and @menu
	/// to pin together. @menu can optionally be offset by #GtkMenu:rect-anchor-dx
	/// and #GtkMenu:rect-anchor-dy.
	/// Anchors should be specified under the assumption that the text direction is
	/// left-to-right; they will be flipped horizontally automatically if the text
	/// direction is right-to-left.
	/// Other properties that influence the behaviour of this function are
	/// #GtkMenu:anchor-hints and #GtkMenu:menu-type-hint. Connect to the
	/// #GtkMenu::popped-up signal to find out how it was actually positioned.
	/// - Parameters:
	///	- widget: CGTKWidget (GtkWidget*)
	///	- widgetAnchor: GdkGravity (GdkGravity)
	///	- menuAnchor: GdkGravity (GdkGravity)
	///	- triggerEvent: UnsafePointer<GdkEvent>? (const GdkEvent*)
	open func popupAtWidget(_ widget: CGTKWidget, widgetAnchor: GdkGravity, menuAnchor: GdkGravity, triggerEvent: UnsafePointer<GdkEvent>?) -> Swift.Void {
		gtk_menu_popup_at_widget(GTK_MENU(self.GOBJECT), widget.WIDGET, widgetAnchor, menuAnchor, triggerEvent)
	}

	/// Displays a menu and makes it available for selection.
	/// Applications can use this function to display context-sensitive menus,
	/// and will typically supply %NULL for the @parent_menu_shell,
	/// @parent_menu_item, @func, @data and @destroy parameters. The default
	/// menu positioning function will position the menu at the current position
	/// of @device (or its corresponding pointer).
	/// The @button parameter should be the mouse button pressed to initiate
	/// the menu popup. If the menu popup was initiated by something other than
	/// a mouse button press, such as a mouse button release or a keypress,
	/// @button should be 0.
	/// The @activate_time parameter is used to conflict-resolve initiation of
	/// concurrent requests for mouse/keyboard grab requests. To function
	/// properly, this needs to be the time stamp of the user event (such as
	/// a mouse click or key press) that caused the initiation of the popup.
	/// Only if no such event is available, gtk_get_current_event_time() can
	/// be used instead.
	/// Note that this function does not work very well on GDK backends that
	/// do not have global coordinates, such as Wayland or Mir. You should
	/// probably use one of the gtk_menu_popup_at_ variants, which do not
	/// have this problem.
	/// - Parameters:
	///	- device: OpaquePointer? (GdkDevice*)
	///	- parentMenuShell: CGTKWidget (GtkWidget*)
	///	- parentMenuItem: CGTKWidget (GtkWidget*)
	///	- function: @escaping GtkMenuPositionFunc (GtkMenuPositionFunc)
	///	- data: gpointer (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	///	- button: guint (guint)
	///	- activateTime: guint32 (guint32)
	open func popupForDevice(_ device: OpaquePointer?, parentMenuShell: CGTKWidget, parentMenuItem: CGTKWidget, function: @escaping GtkMenuPositionFunc, data: gpointer, destroy: @escaping GDestroyNotify, button: guint, activateTime: guint32) -> Swift.Void {
		gtk_menu_popup_for_device(GTK_MENU(self.GOBJECT), device, parentMenuShell.WIDGET, parentMenuItem.WIDGET, function, data, destroy, button, activateTime)
	}

	/// Moves @child to a new @position in the list of @menu
	/// children.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- position: gint (gint)
	open func reorderChild(_ child: CGTKWidget, position: gint) -> Swift.Void {
		gtk_menu_reorder_child(GTK_MENU(self.GOBJECT), child.WIDGET, position)
	}

	/// Repositions the menu according to its position function.
	open func reposition() -> Swift.Void {
		gtk_menu_reposition(GTK_MENU(self.GOBJECT))
	}

	/// Set the #GtkAccelGroup which holds global accelerators for the
	/// menu.  This accelerator group needs to also be added to all windows
	/// that this menu is being used in with gtk_window_add_accel_group(),
	/// in order for those windows to support all the accelerators
	/// contained in this group.
	/// - Parameters:
	///	- accelGroup: UnsafeMutablePointer<GtkAccelGroup>? (GtkAccelGroup*)
	open func setAccelGroup(_ accelGroup: UnsafeMutablePointer<GtkAccelGroup>?) -> Swift.Void {
		gtk_menu_set_accel_group(GTK_MENU(self.GOBJECT), accelGroup)
	}

	/// Sets an accelerator path for this menu from which accelerator paths
	/// for its immediate children, its menu items, can be constructed.
	/// The main purpose of this function is to spare the programmer the
	/// inconvenience of having to call gtk_menu_item_set_accel_path() on
	/// each menu item that should support runtime user changable accelerators.
	/// Instead, by just calling gtk_menu_set_accel_path() on their parent,
	/// each menu item of this menu, that contains a label describing its
	/// purpose, automatically gets an accel path assigned.
	/// For example, a menu containing menu items “New” and “Exit”, will, after
	/// `gtk_menu_set_accel_path (menu, "<Gnumeric-Sheet>/File");` has been
	/// called, assign its items the accel paths: `"<Gnumeric-Sheet>/File/New"`
	/// and `"<Gnumeric-Sheet>/File/Exit"`.
	/// Assigning accel paths to menu items then enables the user to change
	/// their accelerators at runtime. More details about accelerator paths
	/// and their default setups can be found at gtk_accel_map_add_entry().
	/// Note that @accel_path string will be stored in a #GQuark. Therefore,
	/// if you pass a static string, you can save some memory by interning
	/// it first with g_intern_static_string().
	/// - Parameters:
	///	- accelPath: String (const gchar*)
	open func setAccelPath(_ accelPath: String) -> Swift.Void {
		gtk_menu_set_accel_path(GTK_MENU(self.GOBJECT), accelPath)
	}

	/// Selects the specified menu item within the menu.  This is used by
	/// the #GtkComboBox and should not be used by anyone else.
	/// - Parameters:
	///	- index: guint (guint)
	open func setActive(index: guint) -> Swift.Void {
		gtk_menu_set_active(GTK_MENU(self.GOBJECT), index)
	}

	/// Informs GTK+ on which monitor a menu should be popped up.
	/// See gdk_monitor_get_geometry().
	/// This function should be called from a #GtkMenuPositionFunc
	/// if the menu should not appear on the same monitor as the pointer.
	/// This information can’t be reliably inferred from the coordinates
	/// returned by a #GtkMenuPositionFunc, since, for very long menus,
	/// these coordinates may extend beyond the monitor boundaries or even
	/// the screen boundaries.
	/// - Parameters:
	///	- monitorNum: gint (gint)
	open func setMonitor(monitorNum: gint) -> Swift.Void {
		gtk_menu_set_monitor(GTK_MENU(self.GOBJECT), monitorNum)
	}

	/// Sets whether the menu should reserve space for drawing toggles
	/// or icons, regardless of their actual presence.
	/// - Parameters:
	///	- reserveToggleSize: Bool (gboolean)
	open func setReserveToggleSize(_ reserveToggleSize: Bool) -> Swift.Void {
		gtk_menu_set_reserve_toggle_size(GTK_MENU(self.GOBJECT), reserveToggleSize ? 1 : 0)
	}

	/// Sets the #GdkScreen on which the menu will be displayed.
	/// - Parameters:
	///	- screen: OpaquePointer? (GdkScreen*)
	open func setScreen(_ screen: OpaquePointer?) -> Swift.Void {
		gtk_menu_set_screen(GTK_MENU(self.GOBJECT), screen)
	}

	/// Changes the tearoff state of the menu.  A menu is normally
	/// displayed as drop down menu which persists as long as the menu is
	/// active.  It can also be displayed as a tearoff menu which persists
	/// until it is closed or reattached.
	/// - Parameters:
	///	- tornOff: Bool (gboolean)
	open func setTearoffState(tornOff: Bool) -> Swift.Void {
		gtk_menu_set_tearoff_state(GTK_MENU(self.GOBJECT), tornOff ? 1 : 0)
	}

	/// Sets the title string for the menu.
	/// The title is displayed when the menu is shown as a tearoff
	/// menu. If @title is %NULL, the menu will see if it is attached
	/// to a parent menu item, and if so it will try to use the same
	/// text as that menu item’s label.
	/// - Parameters:
	///	- title: String (const gchar*)
	open func setTitle(_ title: String) -> Swift.Void {
		gtk_menu_set_title(GTK_MENU(self.GOBJECT), title)
	}

}
