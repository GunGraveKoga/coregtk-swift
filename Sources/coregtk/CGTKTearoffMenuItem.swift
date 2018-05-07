/*
 * CGTKTearoffMenuItem.swift
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

public let GTK_TYPE_TEAROFF_MENU_ITEM: GType = gtk_tearoff_menu_item_get_type()

@inline(__always) public func GTK_TEAROFF_MENU_ITEM(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkTearoffMenuItem>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TEAROFF_MENU_ITEM)
}

/// A #GtkTearoffMenuItem is a special #GtkMenuItem which is used to
/// tear off and reattach its menu.
/// When its menu is shown normally, the #GtkTearoffMenuItem is drawn as a
/// dotted line indicating that the menu can be torn off.  Activating it
/// causes its menu to be torn off and displayed in its own window
/// as a tearoff menu.
/// When its menu is shown as a tearoff menu, the #GtkTearoffMenuItem is drawn
/// as a dotted line which has a left pointing arrow graphic indicating that
/// the tearoff menu can be reattached.  Activating it will erase the tearoff
/// menu window.
/// > #GtkTearoffMenuItem is deprecated and should not be used in newly
/// > written code. Menus are not meant to be torn around.


open class CGTKTearoffMenuItem : CGTKMenuItem {
	/// Creates a new #GtkTearoffMenuItem.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_tearoff_menu_item_new())!
	}

	open var TEAROFFMENUITEM: UnsafeMutablePointer<GtkTearoffMenuItem>! {
		get {
			return GTK_TEAROFF_MENU_ITEM(self.GOBJECT)
		}
	}

}
