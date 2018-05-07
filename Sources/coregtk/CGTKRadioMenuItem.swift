/*
 * CGTKRadioMenuItem.swift
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

public let GTK_TYPE_RADIO_MENU_ITEM: GType = gtk_radio_menu_item_get_type()

@inline(__always) public func GTK_RADIO_MENU_ITEM(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkRadioMenuItem>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_RADIO_MENU_ITEM)
}

/// A radio menu item is a check menu item that belongs to a group. At each
/// instant exactly one of the radio menu items from a group is selected.
/// The group list does not need to be freed, as each #GtkRadioMenuItem will
/// remove itself and its list item when it is destroyed.
/// The correct way to create a group of radio menu items is approximatively
/// this:
/// ## How to create a group of radio menu items.
/// |[<!-- language="C" -->
/// GSList *group = NULL;
/// GtkWidget *item;
/// gint i;
/// for (i = 0; i < 5; i++)
/// {
/// item = gtk_radio_menu_item_new_with_label (group, "This is an example");
/// group = gtk_radio_menu_item_get_group (GTK_RADIO_MENU_ITEM (item));
/// if (i == 1)
/// gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (item), TRUE);
/// }
/// ]|
/// # CSS nodes
/// |[<!-- language="plain" -->
/// menuitem
/// ├── radio.left
/// ╰── <child>
/// ]|
/// GtkRadioMenuItem has a main CSS node with name menuitem, and a subnode
/// with name radio, which gets the .left or .right style class.


open class CGTKRadioMenuItem : CGTKCheckMenuItem {
	/// Creates a new #GtkRadioMenuItem.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GSList>? (GSList*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(group: UnsafeMutablePointer<GSList>?) {
		self.init(withGObject: gtk_radio_menu_item_new(group))!
	}

	/// Creates a new #GtkRadioMenuItem adding it to the same group as @group.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GtkRadioMenuItem>? (GtkRadioMenuItem*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromWidget group: UnsafeMutablePointer<GtkRadioMenuItem>?) {
		self.init(withGObject: gtk_radio_menu_item_new_from_widget(group))!
	}

	/// Creates a new #GtkRadioMenuItem whose child is a simple #GtkLabel.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GSList>? (GSList*)
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withLabel group: UnsafeMutablePointer<GSList>?, label: String) {
		self.init(withGObject: gtk_radio_menu_item_new_with_label(group, label))!
	}

	/// Creates a new GtkRadioMenuItem whose child is a simple GtkLabel.
	/// The new #GtkRadioMenuItem is added to the same group as @group.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GtkRadioMenuItem>? (GtkRadioMenuItem*)
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withLabelFromWidget group: UnsafeMutablePointer<GtkRadioMenuItem>?, label: String) {
		self.init(withGObject: gtk_radio_menu_item_new_with_label_from_widget(group, label))!
	}

	/// Creates a new #GtkRadioMenuItem containing a label. The label
	/// will be created using gtk_label_new_with_mnemonic(), so underscores
	/// in @label indicate the mnemonic for the menu item.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GSList>? (GSList*)
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withMnemonic group: UnsafeMutablePointer<GSList>?, label: String) {
		self.init(withGObject: gtk_radio_menu_item_new_with_mnemonic(group, label))!
	}

	/// Creates a new GtkRadioMenuItem containing a label. The label will be
	/// created using gtk_label_new_with_mnemonic(), so underscores in label
	/// indicate the mnemonic for the menu item.
	/// The new #GtkRadioMenuItem is added to the same group as @group.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GtkRadioMenuItem>? (GtkRadioMenuItem*)
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withMnemonicFromWidget group: UnsafeMutablePointer<GtkRadioMenuItem>?, label: String) {
		self.init(withGObject: gtk_radio_menu_item_new_with_mnemonic_from_widget(group, label))!
	}

	open var RADIOMENUITEM: UnsafeMutablePointer<GtkRadioMenuItem>! {
		get {
			return GTK_RADIO_MENU_ITEM(self.GOBJECT)
		}
	}

	/// Returns the group to which the radio menu item belongs, as a #GList of
	/// #GtkRadioMenuItem. The list belongs to GTK+ and should not be freed.
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	open func getGroup() -> UnsafeMutablePointer<GSList>! {
		return gtk_radio_menu_item_get_group(GTK_RADIO_MENU_ITEM(self.GOBJECT))
	}

	/// Joins a #GtkRadioMenuItem object to the group of another #GtkRadioMenuItem
	/// object.
	/// This function should be used by language bindings to avoid the memory
	/// manangement of the opaque #GSList of gtk_radio_menu_item_get_group()
	/// and gtk_radio_menu_item_set_group().
	/// A common way to set up a group of #GtkRadioMenuItem instances is:
	/// |[
	/// GtkRadioMenuItem *last_item = NULL;
	/// while ( ...more items to add... )
	/// {
	/// GtkRadioMenuItem *radio_item;
	/// radio_item = gtk_radio_menu_item_new (...);
	/// gtk_radio_menu_item_join_group (radio_item, last_item);
	/// last_item = radio_item;
	/// }
	/// ]|
	/// - Parameters:
	///	- groupSource: UnsafeMutablePointer<GtkRadioMenuItem>? (GtkRadioMenuItem*)
	open func joinGroup(groupSource: UnsafeMutablePointer<GtkRadioMenuItem>?) -> Swift.Void {
		gtk_radio_menu_item_join_group(GTK_RADIO_MENU_ITEM(self.GOBJECT), groupSource)
	}

	/// Sets the group of a radio menu item, or changes it.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GSList>? (GSList*)
	open func setGroup(_ group: UnsafeMutablePointer<GSList>?) -> Swift.Void {
		gtk_radio_menu_item_set_group(GTK_RADIO_MENU_ITEM(self.GOBJECT), group)
	}

}
