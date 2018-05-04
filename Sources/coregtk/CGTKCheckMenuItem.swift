/*
 * CGTKCheckMenuItem.swift
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

public let GTK_TYPE_CHECK_MENU_ITEM: GType = gtk_check_menu_item_get_type()

@inline(__always) public func GTK_CHECK_MENU_ITEM(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkCheckMenuItem>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_CHECK_MENU_ITEM)
}

/// 
/// A #GtkCheckMenuItem is a menu item that maintains the state of a boolean
/// value in addition to a #GtkMenuItem usual role in activating application
/// code.
/// A check box indicating the state of the boolean value is displayed
/// at the left side of the #GtkMenuItem.  Activating the #GtkMenuItem
/// toggles the value.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// menuitem
/// ├── check.left
/// ╰── <child>
/// ]|
/// GtkCheckMenuItem has a main CSS node with name menuitem, and a subnode
/// with name check, which gets the .left or .right style class.


open class CGTKCheckMenuItem : CGTKMenuItem {
	/// 
	/// Creates a new #GtkCheckMenuItem.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_check_menu_item_new())!
	}

	/// 
	/// Creates a new #GtkCheckMenuItem with a label.
	/// Parameters:
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withLabel label: String) {
		self.init(withGObject: gtk_check_menu_item_new_with_label(label))!
	}

	/// 
	/// Creates a new #GtkCheckMenuItem containing a label. The label
	/// will be created using gtk_label_new_with_mnemonic(), so underscores
	/// in @label indicate the mnemonic for the menu item.
	/// Parameters:
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withMnemonic label: String) {
		self.init(withGObject: gtk_check_menu_item_new_with_mnemonic(label))!
	}

	open var CHECKMENUITEM: UnsafeMutablePointer<GtkCheckMenuItem>! {
		get {
			return GTK_CHECK_MENU_ITEM(self.GOBJECT)
		}
	}

	/// 
	/// Returns whether the check menu item is active. See
	/// gtk_check_menu_item_set_active ().
	/// - Returns: Bool
	open func getActive() -> Bool {
		return gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether @check_menu_item looks like a #GtkRadioMenuItem
	/// - Returns: Bool
	open func getDrawAsRadio() -> Bool {
		return gtk_check_menu_item_get_draw_as_radio(GTK_CHECK_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the value set by gtk_check_menu_item_set_inconsistent().
	/// - Returns: Bool
	open func getInconsistent() -> Bool {
		return gtk_check_menu_item_get_inconsistent(GTK_CHECK_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Sets the active state of the menu item’s check box.
	/// Parameters:
	///	- isActive: Bool
	open func setActive(isActive: Bool) {
		gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(self.GOBJECT), isActive ? 1 : 0)
	}

	/// 
	/// Sets whether @check_menu_item is drawn like a #GtkRadioMenuItem
	/// Parameters:
	///	- drawAsRadio: Bool
	open func setDrawAsRadio(_ drawAsRadio: Bool) {
		gtk_check_menu_item_set_draw_as_radio(GTK_CHECK_MENU_ITEM(self.GOBJECT), drawAsRadio ? 1 : 0)
	}

	/// 
	/// If the user has selected a range of elements (such as some text or
	/// spreadsheet cells) that are affected by a boolean setting, and the
	/// current values in that range are inconsistent, you may want to
	/// display the check in an “in between” state. This function turns on
	/// “in between” display.  Normally you would turn off the inconsistent
	/// state again if the user explicitly selects a setting. This has to be
	/// done manually, gtk_check_menu_item_set_inconsistent() only affects
	/// visual appearance, it doesn’t affect the semantics of the widget.
	/// Parameters:
	///	- setting: Bool
	open func setInconsistent(setting: Bool) {
		gtk_check_menu_item_set_inconsistent(GTK_CHECK_MENU_ITEM(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Emits the #GtkCheckMenuItem::toggled signal.
	open func toggled() {
		gtk_check_menu_item_toggled(GTK_CHECK_MENU_ITEM(self.GOBJECT))
	}

}
