/*
 * CGTKMenuBar.swift
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

public let GTK_TYPE_MENU_BAR: GType = gtk_menu_bar_get_type()

@inline(__always) public func GTK_MENU_BAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkMenuBar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_MENU_BAR)
}

/// 
/// The #GtkMenuBar is a subclass of #GtkMenuShell which contains one or
/// more #GtkMenuItems. The result is a standard menu bar which can hold
/// many menu items.
/// # CSS nodes
/// GtkMenuBar has a single CSS node with name menubar.


open class CGTKMenuBar : CGTKMenuShell {
	/// 
	/// Creates a new #GtkMenuBar
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_menu_bar_new())!
	}

	/// 
	/// Creates a new #GtkMenuBar and populates it with menu items
	/// and submenus according to @model.
	/// The created menu items are connected to actions found in the
	/// #GtkApplicationWindow to which the menu bar belongs - typically
	/// by means of being contained within the #GtkApplicationWindows
	/// widget hierarchy.
	/// Parameters:
	///	- model: UnsafeMutablePointer<GMenuModel>!
	/// - Returns: CGTKWidget
	public convenience init(fromModel model: UnsafeMutablePointer<GMenuModel>!) {
		self.init(withGObject: gtk_menu_bar_new_from_model(model))!
	}

	open var MENUBAR: UnsafeMutablePointer<GtkMenuBar>! {
		get {
			return GTK_MENU_BAR(self.GOBJECT)
		}
	}

	/// 
	/// Retrieves the current child pack direction of the menubar.
	/// See gtk_menu_bar_set_child_pack_direction().
	/// - Returns: GtkPackDirection
	open func getChildPackDirection() -> GtkPackDirection {
		return gtk_menu_bar_get_child_pack_direction(GTK_MENU_BAR(self.GOBJECT))
	}

	/// 
	/// Retrieves the current pack direction of the menubar.
	/// See gtk_menu_bar_set_pack_direction().
	/// - Returns: GtkPackDirection
	open func getPackDirection() -> GtkPackDirection {
		return gtk_menu_bar_get_pack_direction(GTK_MENU_BAR(self.GOBJECT))
	}

	/// 
	/// Sets how widgets should be packed inside the children of a menubar.
	/// Parameters:
	///	- childPackDir: GtkPackDirection
	open func setChildPackDirection(childPackDir: GtkPackDirection) {
		gtk_menu_bar_set_child_pack_direction(GTK_MENU_BAR(self.GOBJECT), childPackDir)
	}

	/// 
	/// Sets how items should be packed inside a menubar.
	/// Parameters:
	///	- packDir: GtkPackDirection
	open func setPackDirection(packDir: GtkPackDirection) {
		gtk_menu_bar_set_pack_direction(GTK_MENU_BAR(self.GOBJECT), packDir)
	}

}
