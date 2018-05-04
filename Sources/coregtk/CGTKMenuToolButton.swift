/*
 * CGTKMenuToolButton.swift
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

public let GTK_TYPE_MENU_TOOL_BUTTON: GType = gtk_menu_tool_button_get_type()

@inline(__always) public func GTK_MENU_TOOL_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkMenuToolButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_MENU_TOOL_BUTTON)
}

/// 
/// A #GtkMenuToolButton is a #GtkToolItem that contains a button and
/// a small additional button with an arrow. When clicked, the arrow
/// button pops up a dropdown menu.
/// Use gtk_menu_tool_button_new() to create a new
/// #GtkMenuToolButton.
/// # GtkMenuToolButton as GtkBuildable
/// The GtkMenuToolButton implementation of the GtkBuildable interface
/// supports adding a menu by specifying “menu” as the “type” attribute
/// of a <child> element.
/// An example for a UI definition fragment with menus:
/// |[
/// <object class="GtkMenuToolButton">
/// <child type="menu">
/// <object class="GtkMenu"/>
/// </child>
/// </object>
/// ]|


open class CGTKMenuToolButton : CGTKToolButton {
	/// 
	/// Creates a new #GtkMenuToolButton using @icon_widget as icon and
	/// @label as label.
	/// Parameters:
	///	- iconWidget: CGTKWidget
	///	- label: String
	/// - Returns: UnsafeMutablePointer<GtkToolItem>!
	public convenience init(iconWidget: CGTKWidget, label: String) {
		self.init(withGObject: gtk_menu_tool_button_new(iconWidget.WIDGET, label))!
	}

	/// 
	/// Creates a new #GtkMenuToolButton.
	/// The new #GtkMenuToolButton will contain an icon and label from
	/// the stock item indicated by @stock_id.
	/// Parameters:
	///	- stockId: String
	/// - Returns: UnsafeMutablePointer<GtkToolItem>!
	public convenience init(fromStock stockId: String) {
		self.init(withGObject: gtk_menu_tool_button_new_from_stock(stockId))!
	}

	open var MENUTOOLBUTTON: UnsafeMutablePointer<GtkMenuToolButton>! {
		get {
			return GTK_MENU_TOOL_BUTTON(self.GOBJECT)
		}
	}

	/// 
	/// Gets the #GtkMenu associated with #GtkMenuToolButton.
	/// - Returns: CGTKWidget
	open func getMenu<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_menu_tool_button_get_menu(GTK_MENU_TOOL_BUTTON(self.GOBJECT)))!
	}

	/// 
	/// Sets the tooltip markup text to be used as tooltip for the arrow button
	/// which pops up the menu.  See gtk_tool_item_set_tooltip_text() for setting
	/// a tooltip on the whole #GtkMenuToolButton.
	/// Parameters:
	///	- markup: String
	open func setArrowTooltipMarkup(_ markup: String) {
		gtk_menu_tool_button_set_arrow_tooltip_markup(GTK_MENU_TOOL_BUTTON(self.GOBJECT), markup)
	}

	/// 
	/// Sets the tooltip text to be used as tooltip for the arrow button which
	/// pops up the menu.  See gtk_tool_item_set_tooltip_text() for setting a tooltip
	/// on the whole #GtkMenuToolButton.
	/// Parameters:
	///	- text: String
	open func setArrowTooltipText(_ text: String) {
		gtk_menu_tool_button_set_arrow_tooltip_text(GTK_MENU_TOOL_BUTTON(self.GOBJECT), text)
	}

	/// 
	/// Sets the #GtkMenu that is popped up when the user clicks on the arrow.
	/// If @menu is NULL, the arrow button becomes insensitive.
	/// Parameters:
	///	- menu: CGTKWidget
	open func setMenu(_ menu: CGTKWidget) {
		gtk_menu_tool_button_set_menu(GTK_MENU_TOOL_BUTTON(self.GOBJECT), menu.WIDGET)
	}

}
