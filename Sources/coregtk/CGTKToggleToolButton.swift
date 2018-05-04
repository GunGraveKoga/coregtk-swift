/*
 * CGTKToggleToolButton.swift
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

public let GTK_TYPE_TOGGLE_TOOL_BUTTON: GType = gtk_toggle_tool_button_get_type()

@inline(__always) public func GTK_TOGGLE_TOOL_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkToggleToolButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TOGGLE_TOOL_BUTTON)
}

/// 
/// A #GtkToggleToolButton is a #GtkToolItem that contains a toggle
/// button.
/// Use gtk_toggle_tool_button_new() to create a new GtkToggleToolButton.
/// # CSS nodes
/// GtkToggleToolButton has a single CSS node with name togglebutton.


open class CGTKToggleToolButton : CGTKToolButton {
	/// 
	/// Returns a new #GtkToggleToolButton
	/// - Returns: UnsafeMutablePointer<GtkToolItem>!
	public convenience init() {
		self.init(withGObject: gtk_toggle_tool_button_new())!
	}

	/// 
	/// Creates a new #GtkToggleToolButton containing the image and text from a
	/// stock item. Some stock ids have preprocessor macros like #GTK_STOCK_OK
	/// and #GTK_STOCK_APPLY.
	/// It is an error if @stock_id is not a name of a stock item.
	/// Parameters:
	///	- stockId: String
	/// - Returns: UnsafeMutablePointer<GtkToolItem>!
	public convenience init(fromStock stockId: String) {
		self.init(withGObject: gtk_toggle_tool_button_new_from_stock(stockId))!
	}

	open var TOGGLETOOLBUTTON: UnsafeMutablePointer<GtkToggleToolButton>! {
		get {
			return GTK_TOGGLE_TOOL_BUTTON(self.GOBJECT)
		}
	}

	/// 
	/// Queries a #GtkToggleToolButton and returns its current state.
	/// Returns %TRUE if the toggle button is pressed in and %FALSE if it is raised.
	/// - Returns: Bool
	open func getActive() -> Bool {
		return gtk_toggle_tool_button_get_active(GTK_TOGGLE_TOOL_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Sets the status of the toggle tool button. Set to %TRUE if you
	/// want the GtkToggleButton to be “pressed in”, and %FALSE to raise it.
	/// This action causes the toggled signal to be emitted.
	/// Parameters:
	///	- isActive: Bool
	open func setActive(isActive: Bool) {
		gtk_toggle_tool_button_set_active(GTK_TOGGLE_TOOL_BUTTON(self.GOBJECT), isActive ? 1 : 0)
	}

}
