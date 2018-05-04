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

/// 
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


open class CGTKMenuItem : CGTKBin {
	/// 
	/// Creates a new #GtkMenuItem.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_menu_item_new())!
	}

	/// 
	/// Creates a new #GtkMenuItem whose child is a #GtkLabel.
	/// Parameters:
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withLabel label: String) {
		self.init(withGObject: gtk_menu_item_new_with_label(label))!
	}

	/// 
	/// Creates a new #GtkMenuItem containing a label.
	/// The label will be created using gtk_label_new_with_mnemonic(),
	/// so underscores in @label indicate the mnemonic for the menu item.
	/// Parameters:
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withMnemonic label: String) {
		self.init(withGObject: gtk_menu_item_new_with_mnemonic(label))!
	}

	open var MENUITEM: UnsafeMutablePointer<GtkMenuItem>! {
		get {
			return GTK_MENU_ITEM(self.GOBJECT)
		}
	}

	/// 
	/// Emits the #GtkMenuItem::activate signal on the given item
	open func activate() {
		gtk_menu_item_activate(GTK_MENU_ITEM(self.GOBJECT))
	}

	/// 
	/// Emits the #GtkMenuItem::deselect signal on the given item.
	open func deselect() {
		gtk_menu_item_deselect(GTK_MENU_ITEM(self.GOBJECT))
	}

	/// 
	/// Retrieve the accelerator path that was previously set on @menu_item.
	/// See gtk_menu_item_set_accel_path() for details.
	/// - Returns: String?
	open func getAccelPath() -> String? {
		return String(utf8String: gtk_menu_item_get_accel_path(GTK_MENU_ITEM(self.GOBJECT)))
	}

	/// 
	/// Sets @text on the @menu_item label
	/// - Returns: String?
	open func getLabel() -> String? {
		return String(utf8String: gtk_menu_item_get_label(GTK_MENU_ITEM(self.GOBJECT)))
	}

	/// 
	/// Returns whether the @menu_item reserves space for
	/// the submenu indicator, regardless if it has a submenu
	/// or not.
	/// - Returns: Bool
	open func getReserveIndicator() -> Bool {
		return gtk_menu_item_get_reserve_indicator(GTK_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets whether the menu item appears justified at the right
	/// side of the menu bar.
	/// - Returns: Bool
	open func getRightJustified() -> Bool {
		return gtk_menu_item_get_right_justified(GTK_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the submenu underneath this menu item, if any.
	/// See gtk_menu_item_set_submenu().
	/// - Returns: CGTKWidget?
	open func getSubmenu<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_menu_item_get_submenu(GTK_MENU_ITEM(self.GOBJECT)))
	}

	/// 
	/// Checks if an underline in the text indicates the next character
	/// should be used for the mnemonic accelerator key.
	/// - Returns: Bool
	open func getUseUnderline() -> Bool {
		return gtk_menu_item_get_use_underline(GTK_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Emits the #GtkMenuItem::select signal on the given item.
	open func select() {
		gtk_menu_item_select(GTK_MENU_ITEM(self.GOBJECT))
	}

	/// 
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
	/// Parameters:
	///	- accelPath: String
	open func setAccelPath(_ accelPath: String) {
		gtk_menu_item_set_accel_path(GTK_MENU_ITEM(self.GOBJECT), accelPath)
	}

	/// 
	/// Sets @text on the @menu_item label
	/// Parameters:
	///	- label: String
	open func setLabel(_ label: String) {
		gtk_menu_item_set_label(GTK_MENU_ITEM(self.GOBJECT), label)
	}

	/// 
	/// Sets whether the @menu_item should reserve space for
	/// the submenu indicator, regardless if it actually has
	/// a submenu or not.
	/// There should be little need for applications to call
	/// this functions.
	/// Parameters:
	///	- reserve: Bool
	open func setReserveIndicator(reserve: Bool) {
		gtk_menu_item_set_reserve_indicator(GTK_MENU_ITEM(self.GOBJECT), reserve ? 1 : 0)
	}

	/// 
	/// Sets whether the menu item appears justified at the right
	/// side of a menu bar. This was traditionally done for “Help”
	/// menu items, but is now considered a bad idea. (If the widget
	/// layout is reversed for a right-to-left language like Hebrew
	/// or Arabic, right-justified-menu-items appear at the left.)
	/// Parameters:
	///	- rightJustified: Bool
	open func setRightJustified(_ rightJustified: Bool) {
		gtk_menu_item_set_right_justified(GTK_MENU_ITEM(self.GOBJECT), rightJustified ? 1 : 0)
	}

	/// 
	/// Sets or replaces the menu item’s submenu, or removes it when a %NULL
	/// submenu is passed.
	/// Parameters:
	///	- submenu: CGTKWidget
	open func setSubmenu(_ submenu: CGTKWidget) {
		gtk_menu_item_set_submenu(GTK_MENU_ITEM(self.GOBJECT), submenu.WIDGET)
	}

	/// 
	/// If true, an underline in the text indicates the next character
	/// should be used for the mnemonic accelerator key.
	/// Parameters:
	///	- setting: Bool
	open func setUseUnderline(setting: Bool) {
		gtk_menu_item_set_use_underline(GTK_MENU_ITEM(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Emits the #GtkMenuItem::toggle-size-allocate signal on the given item.
	/// Parameters:
	///	- allocation: gint
	open func toggleSizeAllocate(allocation: gint) {
		gtk_menu_item_toggle_size_allocate(GTK_MENU_ITEM(self.GOBJECT), allocation)
	}

	/// 
	/// Emits the #GtkMenuItem::toggle-size-request signal on the given item.
	/// Parameters:
	///	- requisition: UnsafeMutablePointer<Int32>!
	open func toggleSizeRequest(requisition: UnsafeMutablePointer<Int32>!) {
		gtk_menu_item_toggle_size_request(GTK_MENU_ITEM(self.GOBJECT), requisition)
	}

}
