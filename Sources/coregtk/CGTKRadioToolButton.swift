/*
 * CGTKRadioToolButton.swift
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

public let GTK_TYPE_RADIO_TOOL_BUTTON: GType = gtk_radio_tool_button_get_type()

@inline(__always) public func GTK_RADIO_TOOL_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkRadioToolButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_RADIO_TOOL_BUTTON)
}

/// A #GtkRadioToolButton is a #GtkToolItem that contains a radio button,
/// that is, a button that is part of a group of toggle buttons where only
/// one button can be active at a time.
/// Use gtk_radio_tool_button_new() to create a new GtkRadioToolButton. Use
/// gtk_radio_tool_button_new_from_widget() to create a new GtkRadioToolButton
/// that is part of the same group as an existing GtkRadioToolButton.
/// # CSS nodes
/// GtkRadioToolButton has a single CSS node with name toolbutton.


open class CGTKRadioToolButton : CGTKToggleToolButton {
	/// Creates a new #GtkRadioToolButton, adding it to @group.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GSList>? (GSList*)
	/// - Returns: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	public convenience init(group: UnsafeMutablePointer<GSList>?) {
		self.init(withGObject: gtk_radio_tool_button_new(group))!
	}

	/// Creates a new #GtkRadioToolButton, adding it to @group.
	/// The new #GtkRadioToolButton will contain an icon and label from the
	/// stock item indicated by @stock_id.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GSList>? (GSList*)
	///	- stockId: String (const gchar*)
	/// - Returns: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	public convenience init(fromStock group: UnsafeMutablePointer<GSList>?, stockId: String) {
		self.init(withGObject: gtk_radio_tool_button_new_from_stock(group, stockId))!
	}

	/// Creates a new #GtkRadioToolButton adding it to the same group as @gruup
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GtkRadioToolButton>? (GtkRadioToolButton*)
	/// - Returns: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	public convenience init(fromWidget group: UnsafeMutablePointer<GtkRadioToolButton>?) {
		self.init(withGObject: gtk_radio_tool_button_new_from_widget(group))!
	}

	/// Creates a new #GtkRadioToolButton adding it to the same group as @group.
	/// The new #GtkRadioToolButton will contain an icon and label from the
	/// stock item indicated by @stock_id.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GtkRadioToolButton>? (GtkRadioToolButton*)
	///	- stockId: String (const gchar*)
	/// - Returns: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	public convenience init(withStockFromWidget group: UnsafeMutablePointer<GtkRadioToolButton>?, stockId: String) {
		self.init(withGObject: gtk_radio_tool_button_new_with_stock_from_widget(group, stockId))!
	}

	open var RADIOTOOLBUTTON: UnsafeMutablePointer<GtkRadioToolButton>! {
		get {
			return GTK_RADIO_TOOL_BUTTON(self.GOBJECT)
		}
	}

	/// Returns the radio button group @button belongs to.
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	open func getGroup() -> UnsafeMutablePointer<GSList>! {
		return gtk_radio_tool_button_get_group(GTK_RADIO_TOOL_BUTTON(self.GOBJECT))
	}

	/// Adds @button to @group, removing it from the group it belonged to before.
	/// - Parameters:
	///	- group: UnsafeMutablePointer<GSList>? (GSList*)
	open func setGroup(_ group: UnsafeMutablePointer<GSList>?) -> Swift.Void {
		gtk_radio_tool_button_set_group(GTK_RADIO_TOOL_BUTTON(self.GOBJECT), group)
	}

}
