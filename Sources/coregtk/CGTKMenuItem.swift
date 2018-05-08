/*
 * CGTKMenuItem.swift
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

public let GTK_TYPE_MENU_ITEM: GType = gtk_menu_item_get_type()

@inline(__always) public func GTK_MENU_ITEM(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkMenuItem>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_MENU_ITEM)
}

/// The #GtkMenuItem widget and the derived widgets are the only valid
/// children for menus. Their function is to correctly handle highlighting,
/// alignment, events and submenus.
/// As a GtkMenuItem derives from #GtkBin it can hold any valid child widget,
/// although only a few are really useful.
/// By default, a GtkMenuItem sets a #GtkAccelLabel as its child.
/// GtkMenuItem has direct functions to set the label and its mnemonic.
/// For more advanced label settings, you can fetch the child widget from the GtkBin.
/// An example for setting markup and accelerator on a MenuItem:
/// |[<!-- language="C" -->
/// GtkWidget *menu_item = gtk_menu_item_new_with_label ("Example Menu Item");
/// GtkWidget *child = gtk_bin_get_child (GTK_BIN (menu_item));
/// gtk_label_set_markup (GTK_LABEL (child), "<i>new label</i> with <b>markup</b>");
/// gtk_accel_label_set_accel (GTK_ACCEL_LABEL (child), GDK_KEY_1, 0);
/// ]|
/// # GtkMenuItem as GtkBuildable
/// The GtkMenuItem implementation of the #GtkBuildable interface supports
/// adding a submenu by specifying “submenu” as the “type” attribute of
/// a <child> element.
/// An example of UI definition fragment with submenus:
/// |[
/// <object class="GtkMenuItem">
/// <child type="submenu">
/// <object class="GtkMenu"/>
/// </child>
/// </object>
/// ]|
/// # CSS nodes
/// |[<!-- language="plain" -->
/// menuitem
/// ├── <child>
/// ╰── [arrow.right]
/// ]|
/// GtkMenuItem has a single CSS node with name menuitem. If the menuitem
/// has a submenu, it gets another CSS node with name arrow, which has
/// the .left or .right style class.


open class CGTKMenuItem : CGTKBin, CGTKActionable, CGTKActivatable {
	/// Creates a new #GtkMenuItem.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_menu_item_new())!
	}

	/// Creates a new #GtkMenuItem whose child is a #GtkLabel.
	/// - Parameters:
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withLabel label: String) {
		self.init(withGObject: gtk_menu_item_new_with_label(label))!
	}

	/// Creates a new #GtkMenuItem containing a label.
	/// The label will be created using gtk_label_new_with_mnemonic(),
	/// so underscores in @label indicate the mnemonic for the menu item.
	/// - Parameters:
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withMnemonic label: String) {
		self.init(withGObject: gtk_menu_item_new_with_mnemonic(label))!
	}

	open var MENUITEM: UnsafeMutablePointer<GtkMenuItem>! {
		get {
			return GTK_MENU_ITEM(self.GOBJECT)
		}
	}

	/// Emits the #GtkMenuItem::activate signal on the given item
	open func activate() -> Swift.Void {
		gtk_menu_item_activate(GTK_MENU_ITEM(self.GOBJECT))
	}

	/// Emits the #GtkMenuItem::deselect signal on the given item.
	open func deselect() -> Swift.Void {
		gtk_menu_item_deselect(GTK_MENU_ITEM(self.GOBJECT))
	}

	/// Retrieve the accelerator path that was previously set on @menu_item.
	/// See gtk_menu_item_set_accel_path() for details.
	/// - Returns: String? (const gchar*)
	open func getAccelPath() -> String? {
		return String(utf8String: gtk_menu_item_get_accel_path(GTK_MENU_ITEM(self.GOBJECT)))
	}

	/// Sets @text on the @menu_item label
	/// - Returns: String? (const gchar*)
	open func getLabel() -> String? {
		return String(utf8String: gtk_menu_item_get_label(GTK_MENU_ITEM(self.GOBJECT)))
	}

	/// Returns whether the @menu_item reserves space for
	/// the submenu indicator, regardless if it has a submenu
	/// or not.
	/// - Returns: Bool (gboolean)
	open func getReserveIndicator() -> Bool {
		return gtk_menu_item_get_reserve_indicator(GTK_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets whether the menu item appears justified at the right
	/// side of the menu bar.
	/// - Returns: Bool (gboolean)
	open func getRightJustified() -> Bool {
		return gtk_menu_item_get_right_justified(GTK_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the submenu underneath this menu item, if any.
	/// See gtk_menu_item_set_submenu().
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getSubmenu<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_menu_item_get_submenu(GTK_MENU_ITEM(self.GOBJECT)))
	}

	/// Checks if an underline in the text indicates the next character
	/// should be used for the mnemonic accelerator key.
	/// - Returns: Bool (gboolean)
	open func getUseUnderline() -> Bool {
		return gtk_menu_item_get_use_underline(GTK_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// Emits the #GtkMenuItem::select signal on the given item.
	open func select() -> Swift.Void {
		gtk_menu_item_select(GTK_MENU_ITEM(self.GOBJECT))
	}

	/// Set the accelerator path on @menu_item, through which runtime
	/// changes of the menu item’s accelerator caused by the user can be
	/// identified and saved to persistent storage (see gtk_accel_map_save()
	/// on this). To set up a default accelerator for this menu item, call
	/// gtk_accel_map_add_entry() with the same @accel_path. See also
	/// gtk_accel_map_add_entry() on the specifics of accelerator paths,
	/// and gtk_menu_set_accel_path() for a more convenient variant of
	/// this function.
	/// This function is basically a convenience wrapper that handles
	/// calling gtk_widget_set_accel_path() with the appropriate accelerator
	/// group for the menu item.
	/// Note that you do need to set an accelerator on the parent menu with
	/// gtk_menu_set_accel_group() for this to work.
	/// Note that @accel_path string will be stored in a #GQuark.
	/// Therefore, if you pass a static string, you can save some memory
	/// by interning it first with g_intern_static_string().
	/// - Parameters:
	///	- accelPath: String? (const gchar*)
	open func setAccelPath(_ accelPath: String?) -> Swift.Void {
		gtk_menu_item_set_accel_path(GTK_MENU_ITEM(self.GOBJECT), accelPath)
	}

	/// Sets @text on the @menu_item label
	/// - Parameters:
	///	- label: String (const gchar*)
	open func setLabel(_ label: String) -> Swift.Void {
		gtk_menu_item_set_label(GTK_MENU_ITEM(self.GOBJECT), label)
	}

	/// Sets whether the @menu_item should reserve space for
	/// the submenu indicator, regardless if it actually has
	/// a submenu or not.
	/// There should be little need for applications to call
	/// this functions.
	/// - Parameters:
	///	- reserve: Bool (gboolean)
	open func setReserveIndicator(reserve: Bool) -> Swift.Void {
		gtk_menu_item_set_reserve_indicator(GTK_MENU_ITEM(self.GOBJECT), reserve ? 1 : 0)
	}

	/// Sets whether the menu item appears justified at the right
	/// side of a menu bar. This was traditionally done for “Help”
	/// menu items, but is now considered a bad idea. (If the widget
	/// layout is reversed for a right-to-left language like Hebrew
	/// or Arabic, right-justified-menu-items appear at the left.)
	/// - Parameters:
	///	- rightJustified: Bool (gboolean)
	open func setRightJustified(_ rightJustified: Bool) -> Swift.Void {
		gtk_menu_item_set_right_justified(GTK_MENU_ITEM(self.GOBJECT), rightJustified ? 1 : 0)
	}

	/// Sets or replaces the menu item’s submenu, or removes it when a %NULL
	/// submenu is passed.
	/// - Parameters:
	///	- submenu: CGTKWidget? (GtkWidget*)
	open func setSubmenu(_ submenu: CGTKWidget?) -> Swift.Void {
		gtk_menu_item_set_submenu(GTK_MENU_ITEM(self.GOBJECT), submenu?.WIDGET)
	}

	/// If true, an underline in the text indicates the next character
	/// should be used for the mnemonic accelerator key.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setUseUnderline(setting: Bool) -> Swift.Void {
		gtk_menu_item_set_use_underline(GTK_MENU_ITEM(self.GOBJECT), setting ? 1 : 0)
	}

	/// Emits the #GtkMenuItem::toggle-size-allocate signal on the given item.
	/// - Parameters:
	///	- allocation: gint (gint)
	open func toggleSizeAllocate(allocation: gint) -> Swift.Void {
		gtk_menu_item_toggle_size_allocate(GTK_MENU_ITEM(self.GOBJECT), allocation)
	}

	/// Emits the #GtkMenuItem::toggle-size-request signal on the given item.
	/// - Parameters:
	///	- requisition: UnsafeMutablePointer<Int32>! (gint*)
	open func toggleSizeRequest(requisition: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_menu_item_toggle_size_request(GTK_MENU_ITEM(self.GOBJECT), requisition)
	}

	/// Gets the action name for @actionable.
	/// See gtk_actionable_set_action_name() for more information.
	/// - Returns: String? (const gchar*)
	open func getActionName() -> String? {
		return String(utf8String: gtk_actionable_get_action_name(GTK_ACTIONABLE(self.GOBJECT)))
	}

	/// Gets the current target value of @actionable.
	/// See gtk_actionable_set_action_target_value() for more information.
	/// - Returns: OpaquePointer (GVariant*)
	open func getActionTargetValue() -> OpaquePointer {
		return gtk_actionable_get_action_target_value(GTK_ACTIONABLE(self.GOBJECT))
	}

	/// Specifies the name of the action with which this widget should be
	/// associated.  If @action_name is %NULL then the widget will be
	/// unassociated from any previous action.
	/// Usually this function is used when the widget is located (or will be
	/// located) within the hierarchy of a #GtkApplicationWindow.
	/// Names are of the form “win.save” or “app.quit” for actions on the
	/// containing #GtkApplicationWindow or its associated #GtkApplication,
	/// respectively.  This is the same form used for actions in the #GMenu
	/// associated with the window.
	/// - Parameters:
	///	- actionName: String? (const gchar*)
	open func setActionName(_ actionName: String?) -> Swift.Void {
		gtk_actionable_set_action_name(GTK_ACTIONABLE(self.GOBJECT), actionName)
	}

	/// Sets the target value of an actionable widget.
	/// If @target_value is %NULL then the target value is unset.
	/// The target value has two purposes.  First, it is used as the
	/// parameter to activation of the action associated with the
	/// #GtkActionable widget. Second, it is used to determine if the widget
	/// should be rendered as “active” — the widget is active if the state
	/// is equal to the given target.
	/// Consider the example of associating a set of buttons with a #GAction
	/// with string state in a typical “radio button” situation.  Each button
	/// will be associated with the same action, but with a different target
	/// value for that action.  Clicking on a particular button will activate
	/// the action with the target of that button, which will typically cause
	/// the action’s state to change to that value.  Since the action’s state
	/// is now equal to the target value of the button, the button will now
	/// be rendered as active (and the other buttons, with different targets,
	/// rendered inactive).
	/// - Parameters:
	///	- targetValue: OpaquePointer! (GVariant*)
	open func setActionTargetValue(_ targetValue: OpaquePointer!) -> Swift.Void {
		gtk_actionable_set_action_target_value(GTK_ACTIONABLE(self.GOBJECT), targetValue)
	}

	/// Sets the action-name and associated string target value of an
	/// actionable widget.
	/// @detailed_action_name is a string in the format accepted by
	/// g_action_parse_detailed_name().
	/// (Note that prior to version 3.22.25,
	/// this function is only usable for actions with a simple "s" target, and
	/// @detailed_action_name must be of the form `"action::target"` where
	/// `action` is the action name and `target` is the string to use
	/// as the target.)
	/// - Parameters:
	///	- detailedActionName: String (const gchar*)
	open func setDetailedActionName(_ detailedActionName: String) -> Swift.Void {
		gtk_actionable_set_detailed_action_name(GTK_ACTIONABLE(self.GOBJECT), detailedActionName)
	}

	/// This is a utility function for #GtkActivatable implementors.
	/// When implementing #GtkActivatable you must call this when
	/// handling changes of the #GtkActivatable:related-action, and
	/// you must also use this to break references in #GObject->dispose().
	/// This function adds a reference to the currently set related
	/// action for you, it also makes sure the #GtkActivatable->update()
	/// method is called when the related #GtkAction properties change
	/// and registers to the action’s proxy list.
	/// > Be careful to call this before setting the local
	/// > copy of the #GtkAction property, since this function uses
	/// > gtk_activatable_get_related_action() to retrieve the
	/// > previous action.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func doSetRelatedAction(_ action: UnsafeMutablePointer<GtkAction>!) -> Swift.Void {
		gtk_activatable_do_set_related_action(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

	/// Gets the related #GtkAction for @activatable.
	/// - Returns: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func getRelatedAction() -> UnsafeMutablePointer<GtkAction>! {
		return gtk_activatable_get_related_action(GTK_ACTIVATABLE(self.GOBJECT))
	}

	/// Gets whether this activatable should reset its layout
	/// and appearance when setting the related action or when
	/// the action changes appearance.
	/// - Returns: Bool (gboolean)
	open func getUseActionAppearance() -> Bool {
		return gtk_activatable_get_use_action_appearance(GTK_ACTIVATABLE(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the related action on the @activatable object.
	/// > #GtkActivatable implementors need to handle the #GtkActivatable:related-action
	/// > property and call gtk_activatable_do_set_related_action() when it changes.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func setRelatedAction(_ action: UnsafeMutablePointer<GtkAction>!) -> Swift.Void {
		gtk_activatable_set_related_action(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

	/// Sets whether this activatable should reset its layout and appearance
	/// when setting the related action or when the action changes appearance
	/// > #GtkActivatable implementors need to handle the
	/// > #GtkActivatable:use-action-appearance property and call
	/// > gtk_activatable_sync_action_properties() to update @activatable
	/// > if needed.
	/// - Parameters:
	///	- useAppearance: Bool (gboolean)
	open func setUseActionAppearance(useAppearance: Bool) -> Swift.Void {
		gtk_activatable_set_use_action_appearance(GTK_ACTIVATABLE(self.GOBJECT), useAppearance ? 1 : 0)
	}

	/// This is called to update the activatable completely, this is called
	/// internally when the #GtkActivatable:related-action property is set
	/// or unset and by the implementing class when
	/// #GtkActivatable:use-action-appearance changes.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>? (GtkAction*)
	open func syncActionProperties(action: UnsafeMutablePointer<GtkAction>?) -> Swift.Void {
		gtk_activatable_sync_action_properties(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

}
