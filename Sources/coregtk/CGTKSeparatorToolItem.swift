/*
 * CGTKSeparatorToolItem.swift
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

public let GTK_TYPE_SEPARATOR_TOOL_ITEM: GType = gtk_separator_tool_item_get_type()

@inline(__always) public func GTK_SEPARATOR_TOOL_ITEM(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkSeparatorToolItem>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SEPARATOR_TOOL_ITEM)
}

/// 
/// A #GtkSeparatorToolItem is a #GtkToolItem that separates groups of other
/// #GtkToolItems. Depending on the theme, a #GtkSeparatorToolItem will
/// often look like a vertical line on horizontally docked toolbars.
/// If the #GtkToolbar child property “expand” is %TRUE and the property
/// #GtkSeparatorToolItem:draw is %FALSE, a #GtkSeparatorToolItem will act as
/// a “spring” that forces other items to the ends of the toolbar.
/// Use gtk_separator_tool_item_new() to create a new #GtkSeparatorToolItem.
/// # CSS nodes
/// GtkSeparatorToolItem has a single CSS node with name separator.


open class CGTKSeparatorToolItem : CGTKToolItem {
	/// 
	/// Create a new #GtkSeparatorToolItem
	/// - Returns: UnsafeMutablePointer<GtkToolItem>!
	public convenience init() {
		self.init(withGObject: gtk_separator_tool_item_new())!
	}

	open var SEPARATORTOOLITEM: UnsafeMutablePointer<GtkSeparatorToolItem>! {
		get {
			return GTK_SEPARATOR_TOOL_ITEM(self.GOBJECT)
		}
	}

	/// 
	/// Returns whether @item is drawn as a line, or just blank.
	/// See gtk_separator_tool_item_set_draw().
	/// - Returns: Bool
	open func getDraw() -> Bool {
		return gtk_separator_tool_item_get_draw(GTK_SEPARATOR_TOOL_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Whether @item is drawn as a vertical line, or just blank.
	/// Setting this to %FALSE along with gtk_tool_item_set_expand() is useful
	/// to create an item that forces following items to the end of the toolbar.
	/// Parameters:
	///	- draw: Bool
	open func setDraw(_ draw: Bool) {
		gtk_separator_tool_item_set_draw(GTK_SEPARATOR_TOOL_ITEM(self.GOBJECT), draw ? 1 : 0)
	}

}
