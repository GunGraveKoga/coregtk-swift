/*
 * CGTKPopoverMenu.swift
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

public let GTK_TYPE_POPOVER_MENU: GType = gtk_popover_menu_get_type()

@inline(__always) public func GTK_POPOVER_MENU(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_POPOVER_MENU)
}

/// 
/// GtkPopoverMenu is a subclass of #GtkPopover that treats its
/// children like menus and allows switching between them. It is
/// meant to be used primarily together with #GtkModelButton, but
/// any widget can be used, such as #GtkSpinButton or #GtkScale.
/// In this respect, GtkPopoverMenu is more flexible than popovers
/// that are created from a #GMenuModel with gtk_popover_new_from_model().
/// To add a child as a submenu, set the #GtkPopoverMenu:submenu
/// child property to the name of the submenu. To let the user open
/// this submenu, add a #GtkModelButton whose #GtkModelButton:menu-name
/// property is set to the name you've given to the submenu.
/// By convention, the first child of a submenu should be a #GtkModelButton
/// to switch back to the parent menu. Such a button should use the
/// #GtkModelButton:inverted and #GtkModelButton:centered properties
/// to achieve a title-like appearance and place the submenu indicator
/// at the opposite side. To switch back to the main menu, use "main"
/// as the menu name.
/// # Example
/// |[
/// <object class="GtkPopoverMenu">
/// <child>
/// <object class="GtkBox">
/// <property name="visible">True</property>
/// <property name="margin">10</property>
/// <child>
/// <object class="GtkModelButton">
/// <property name="visible">True</property>
/// <property name="action-name">win.frob</property>
/// <property name="text" translatable="yes">Frob</property>
/// </object>
/// </child>
/// <child>
/// <object class="GtkModelButton">
/// <property name="visible">True</property>
/// <property name="menu-name">more</property>
/// <property name="text" translatable="yes">More</property>
/// </object>
/// </child>
/// </object>
/// </child>
/// <child>
/// <object class="GtkBox">
/// <property name="visible">True</property>
/// <property name="margin">10</property>
/// <child>
/// <object class="GtkModelButton">
/// <property name="visible">True</property>
/// <property name="action-name">win.foo</property>
/// <property name="text" translatable="yes">Foo</property>
/// </object>
/// </child>
/// <child>
/// <object class="GtkModelButton">
/// <property name="visible">True</property>
/// <property name="action-name">win.bar</property>
/// <property name="text" translatable="yes">Bar</property>
/// </object>
/// </child>
/// </object>
/// <packing>
/// <property name="submenu">more</property>
/// </packing>
/// </child>
/// </object>
/// ]|
/// Just like normal popovers created using gtk_popover_new_from_model,
/// #GtkPopoverMenu instances have a single css node called "popover"
/// and get the .menu style class.


open class CGTKPopoverMenu : CGTKPopover {
	/// 
	/// Creates a new popover menu.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_popover_menu_new())!
	}

	open var POPOVERMENU: OpaquePointer! {
		get {
			return GTK_POPOVER_MENU(self.GOBJECT)
		}
	}

	/// 
	/// Opens a submenu of the @popover. The @name
	/// must be one of the names given to the submenus
	/// of @popover with #GtkPopoverMenu:submenu, or
	/// "main" to switch back to the main menu.
	/// #GtkModelButton will open submenus automatically
	/// when the #GtkModelButton:menu-name property is set,
	/// so this function is only needed when you are using
	/// other kinds of widgets to initiate menu changes.
	/// Parameters:
	///	- name: String
	open func openSubmenu(name: String) {
		gtk_popover_menu_open_submenu(GTK_POPOVER_MENU(self.GOBJECT), name)
	}

}
