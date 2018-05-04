/*
 * CGTKToolButton.swift
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

public let GTK_TYPE_TOOL_BUTTON: GType = gtk_tool_button_get_type()

@inline(__always) public func GTK_TOOL_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkToolButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TOOL_BUTTON)
}

/// 
/// #GtkToolButtons are #GtkToolItems containing buttons.
/// Use gtk_tool_button_new() to create a new #GtkToolButton.
/// The label of a #GtkToolButton is determined by the properties
/// #GtkToolButton:label-widget, #GtkToolButton:label, and
/// #GtkToolButton:stock-id. If #GtkToolButton:label-widget is
/// non-%NULL, then that widget is used as the label. Otherwise, if
/// #GtkToolButton:label is non-%NULL, that string is used as the label.
/// Otherwise, if #GtkToolButton:stock-id is non-%NULL, the label is
/// determined by the stock item. Otherwise, the button does not have a label.
/// The icon of a #GtkToolButton is determined by the properties
/// #GtkToolButton:icon-widget and #GtkToolButton:stock-id. If
/// #GtkToolButton:icon-widget is non-%NULL, then
/// that widget is used as the icon. Otherwise, if #GtkToolButton:stock-id is
/// non-%NULL, the icon is determined by the stock item. Otherwise,
/// the button does not have a icon.
/// # CSS nodes
/// GtkToolButton has a single CSS node with name toolbutton.


open class CGTKToolButton : CGTKToolItem {
	/// 
	/// Creates a new #GtkToolButton using @icon_widget as contents and @label as
	/// label.
	/// Parameters:
	///	- iconWidget: CGTKWidget
	///	- label: String
	/// - Returns: UnsafeMutablePointer<GtkToolItem>!
	public convenience init(iconWidget: CGTKWidget, label: String) {
		self.init(withGObject: gtk_tool_button_new(iconWidget.WIDGET, label))!
	}

	/// 
	/// Creates a new #GtkToolButton containing the image and text from a
	/// stock item. Some stock ids have preprocessor macros like #GTK_STOCK_OK
	/// and #GTK_STOCK_APPLY.
	/// It is an error if @stock_id is not a name of a stock item.
	/// Parameters:
	///	- stockId: String
	/// - Returns: UnsafeMutablePointer<GtkToolItem>!
	public convenience init(fromStock stockId: String) {
		self.init(withGObject: gtk_tool_button_new_from_stock(stockId))!
	}

	open var TOOLBUTTON: UnsafeMutablePointer<GtkToolButton>! {
		get {
			return GTK_TOOL_BUTTON(self.GOBJECT)
		}
	}

	/// 
	/// Returns the name of the themed icon for the tool button,
	/// see gtk_tool_button_set_icon_name().
	/// - Returns: String?
	open func getIconName() -> String? {
		return String(utf8String: gtk_tool_button_get_icon_name(GTK_TOOL_BUTTON(self.GOBJECT)))
	}

	/// 
	/// Return the widget used as icon widget on @button.
	/// See gtk_tool_button_set_icon_widget().
	/// - Returns: CGTKWidget?
	open func getIconWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_tool_button_get_icon_widget(GTK_TOOL_BUTTON(self.GOBJECT)))
	}

	/// 
	/// Returns the label used by the tool button, or %NULL if the tool button
	/// doesn’t have a label. or uses a the label from a stock item. The returned
	/// string is owned by GTK+, and must not be modified or freed.
	/// - Returns: String?
	open func getLabel() -> String? {
		return String(utf8String: gtk_tool_button_get_label(GTK_TOOL_BUTTON(self.GOBJECT)))
	}

	/// 
	/// Returns the widget used as label on @button.
	/// See gtk_tool_button_set_label_widget().
	/// - Returns: CGTKWidget?
	open func getLabelWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_tool_button_get_label_widget(GTK_TOOL_BUTTON(self.GOBJECT)))
	}

	/// 
	/// Returns the name of the stock item. See gtk_tool_button_set_stock_id().
	/// The returned string is owned by GTK+ and must not be freed or modifed.
	/// - Returns: String?
	open func getStockId() -> String? {
		return String(utf8String: gtk_tool_button_get_stock_id(GTK_TOOL_BUTTON(self.GOBJECT)))
	}

	/// 
	/// Returns whether underscores in the label property are used as mnemonics
	/// on menu items on the overflow menu. See gtk_tool_button_set_use_underline().
	/// - Returns: Bool
	open func getUseUnderline() -> Bool {
		return gtk_tool_button_get_use_underline(GTK_TOOL_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Sets the icon for the tool button from a named themed icon.
	/// See the docs for #GtkIconTheme for more details.
	/// The #GtkToolButton:icon-name property only has an effect if not
	/// overridden by non-%NULL #GtkToolButton:label-widget,
	/// #GtkToolButton:icon-widget and #GtkToolButton:stock-id properties.
	/// Parameters:
	///	- iconName: String
	open func setIconName(_ iconName: String) {
		gtk_tool_button_set_icon_name(GTK_TOOL_BUTTON(self.GOBJECT), iconName)
	}

	/// 
	/// Sets @icon as the widget used as icon on @button. If @icon_widget is
	/// %NULL the icon is determined by the #GtkToolButton:stock-id property. If the
	/// #GtkToolButton:stock-id property is also %NULL, @button will not have an icon.
	/// Parameters:
	///	- iconWidget: CGTKWidget
	open func setIconWidget(_ iconWidget: CGTKWidget) {
		gtk_tool_button_set_icon_widget(GTK_TOOL_BUTTON(self.GOBJECT), iconWidget.WIDGET)
	}

	/// 
	/// Sets @label as the label used for the tool button. The #GtkToolButton:label
	/// property only has an effect if not overridden by a non-%NULL
	/// #GtkToolButton:label-widget property. If both the #GtkToolButton:label-widget
	/// and #GtkToolButton:label properties are %NULL, the label is determined by the
	/// #GtkToolButton:stock-id property. If the #GtkToolButton:stock-id property is
	/// also %NULL, @button will not have a label.
	/// Parameters:
	///	- label: String
	open func setLabel(_ label: String) {
		gtk_tool_button_set_label(GTK_TOOL_BUTTON(self.GOBJECT), label)
	}

	/// 
	/// Sets @label_widget as the widget that will be used as the label
	/// for @button. If @label_widget is %NULL the #GtkToolButton:label property is used
	/// as label. If #GtkToolButton:label is also %NULL, the label in the stock item
	/// determined by the #GtkToolButton:stock-id property is used as label. If
	/// #GtkToolButton:stock-id is also %NULL, @button does not have a label.
	/// Parameters:
	///	- labelWidget: CGTKWidget
	open func setLabelWidget(_ labelWidget: CGTKWidget) {
		gtk_tool_button_set_label_widget(GTK_TOOL_BUTTON(self.GOBJECT), labelWidget.WIDGET)
	}

	/// 
	/// Sets the name of the stock item. See gtk_tool_button_new_from_stock().
	/// The stock_id property only has an effect if not overridden by non-%NULL
	/// #GtkToolButton:label-widget and #GtkToolButton:icon-widget properties.
	/// Parameters:
	///	- stockId: String
	open func setStockId(_ stockId: String) {
		gtk_tool_button_set_stock_id(GTK_TOOL_BUTTON(self.GOBJECT), stockId)
	}

	/// 
	/// If set, an underline in the label property indicates that the next character
	/// should be used for the mnemonic accelerator key in the overflow menu. For
	/// example, if the label property is “_Open” and @use_underline is %TRUE,
	/// the label on the tool button will be “Open” and the item on the overflow
	/// menu will have an underlined “O”.
	/// Labels shown on tool buttons never have mnemonics on them; this property
	/// only affects the menu item on the overflow menu.
	/// Parameters:
	///	- useUnderline: Bool
	open func setUseUnderline(_ useUnderline: Bool) {
		gtk_tool_button_set_use_underline(GTK_TOOL_BUTTON(self.GOBJECT), useUnderline ? 1 : 0)
	}

}
