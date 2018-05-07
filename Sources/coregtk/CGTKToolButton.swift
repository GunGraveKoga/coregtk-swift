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


open class CGTKToolButton : CGTKToolItem, CGTKActionable {
	/// Creates a new #GtkToolButton using @icon_widget as contents and @label as
	/// label.
	/// - Parameters:
	///	- iconWidget: CGTKWidget (GtkWidget*)
	///	- label: String (const gchar*)
	/// - Returns: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	public convenience init(iconWidget: CGTKWidget, label: String) {
		self.init(withGObject: gtk_tool_button_new(iconWidget.WIDGET, label))!
	}

	/// Creates a new #GtkToolButton containing the image and text from a
	/// stock item. Some stock ids have preprocessor macros like #GTK_STOCK_OK
	/// and #GTK_STOCK_APPLY.
	/// It is an error if @stock_id is not a name of a stock item.
	/// - Parameters:
	///	- stockId: String (const gchar*)
	/// - Returns: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	public convenience init(fromStock stockId: String) {
		self.init(withGObject: gtk_tool_button_new_from_stock(stockId))!
	}

	open var TOOLBUTTON: UnsafeMutablePointer<GtkToolButton>! {
		get {
			return GTK_TOOL_BUTTON(self.GOBJECT)
		}
	}

	/// Returns the name of the themed icon for the tool button,
	/// see gtk_tool_button_set_icon_name().
	/// - Returns: String? (const gchar*)
	open func getIconName() -> String? {
		return String(utf8String: gtk_tool_button_get_icon_name(GTK_TOOL_BUTTON(self.GOBJECT)))
	}

	/// Return the widget used as icon widget on @button.
	/// See gtk_tool_button_set_icon_widget().
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getIconWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_tool_button_get_icon_widget(GTK_TOOL_BUTTON(self.GOBJECT)))
	}

	/// Returns the label used by the tool button, or %NULL if the tool button
	/// doesn’t have a label. or uses a the label from a stock item. The returned
	/// string is owned by GTK+, and must not be modified or freed.
	/// - Returns: String? (const gchar*)
	open func getLabel() -> String? {
		return String(utf8String: gtk_tool_button_get_label(GTK_TOOL_BUTTON(self.GOBJECT)))
	}

	/// Returns the widget used as label on @button.
	/// See gtk_tool_button_set_label_widget().
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getLabelWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_tool_button_get_label_widget(GTK_TOOL_BUTTON(self.GOBJECT)))
	}

	/// Returns the name of the stock item. See gtk_tool_button_set_stock_id().
	/// The returned string is owned by GTK+ and must not be freed or modifed.
	/// - Returns: String? (const gchar*)
	open func getStockId() -> String? {
		return String(utf8String: gtk_tool_button_get_stock_id(GTK_TOOL_BUTTON(self.GOBJECT)))
	}

	/// Returns whether underscores in the label property are used as mnemonics
	/// on menu items on the overflow menu. See gtk_tool_button_set_use_underline().
	/// - Returns: Bool (gboolean)
	open func getUseUnderline() -> Bool {
		return gtk_tool_button_get_use_underline(GTK_TOOL_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the icon for the tool button from a named themed icon.
	/// See the docs for #GtkIconTheme for more details.
	/// The #GtkToolButton:icon-name property only has an effect if not
	/// overridden by non-%NULL #GtkToolButton:label-widget,
	/// #GtkToolButton:icon-widget and #GtkToolButton:stock-id properties.
	/// - Parameters:
	///	- iconName: String (const gchar*)
	open func setIconName(_ iconName: String) -> Swift.Void {
		gtk_tool_button_set_icon_name(GTK_TOOL_BUTTON(self.GOBJECT), iconName)
	}

	/// Sets @icon as the widget used as icon on @button. If @icon_widget is
	/// %NULL the icon is determined by the #GtkToolButton:stock-id property. If the
	/// #GtkToolButton:stock-id property is also %NULL, @button will not have an icon.
	/// - Parameters:
	///	- iconWidget: CGTKWidget (GtkWidget*)
	open func setIconWidget(_ iconWidget: CGTKWidget) -> Swift.Void {
		gtk_tool_button_set_icon_widget(GTK_TOOL_BUTTON(self.GOBJECT), iconWidget.WIDGET)
	}

	/// Sets @label as the label used for the tool button. The #GtkToolButton:label
	/// property only has an effect if not overridden by a non-%NULL
	/// #GtkToolButton:label-widget property. If both the #GtkToolButton:label-widget
	/// and #GtkToolButton:label properties are %NULL, the label is determined by the
	/// #GtkToolButton:stock-id property. If the #GtkToolButton:stock-id property is
	/// also %NULL, @button will not have a label.
	/// - Parameters:
	///	- label: String (const gchar*)
	open func setLabel(_ label: String) -> Swift.Void {
		gtk_tool_button_set_label(GTK_TOOL_BUTTON(self.GOBJECT), label)
	}

	/// Sets @label_widget as the widget that will be used as the label
	/// for @button. If @label_widget is %NULL the #GtkToolButton:label property is used
	/// as label. If #GtkToolButton:label is also %NULL, the label in the stock item
	/// determined by the #GtkToolButton:stock-id property is used as label. If
	/// #GtkToolButton:stock-id is also %NULL, @button does not have a label.
	/// - Parameters:
	///	- labelWidget: CGTKWidget (GtkWidget*)
	open func setLabelWidget(_ labelWidget: CGTKWidget) -> Swift.Void {
		gtk_tool_button_set_label_widget(GTK_TOOL_BUTTON(self.GOBJECT), labelWidget.WIDGET)
	}

	/// Sets the name of the stock item. See gtk_tool_button_new_from_stock().
	/// The stock_id property only has an effect if not overridden by non-%NULL
	/// #GtkToolButton:label-widget and #GtkToolButton:icon-widget properties.
	/// - Parameters:
	///	- stockId: String (const gchar*)
	open func setStockId(_ stockId: String) -> Swift.Void {
		gtk_tool_button_set_stock_id(GTK_TOOL_BUTTON(self.GOBJECT), stockId)
	}

	/// If set, an underline in the label property indicates that the next character
	/// should be used for the mnemonic accelerator key in the overflow menu. For
	/// example, if the label property is “_Open” and @use_underline is %TRUE,
	/// the label on the tool button will be “Open” and the item on the overflow
	/// menu will have an underlined “O”.
	/// Labels shown on tool buttons never have mnemonics on them; this property
	/// only affects the menu item on the overflow menu.
	/// - Parameters:
	///	- useUnderline: Bool (gboolean)
	open func setUseUnderline(_ useUnderline: Bool) -> Swift.Void {
		gtk_tool_button_set_use_underline(GTK_TOOL_BUTTON(self.GOBJECT), useUnderline ? 1 : 0)
	}

	/// Gets the action name for @actionable.
	/// See gtk_actionable_set_action_name() for more information.
	/// - Returns: String? (const gchar*)
	open func getActionName() -> String? {
		return String(utf8String: gtk_actionable_get_action_name(GTK_ACTIONABLE(self.GOBJECT)))
	}

	/// Gets the current target value of @actionable.
	/// See gtk_actionable_set_action_target_value() for more information.
	/// - Returns: OpaquePointer (GVariant*)
	open func getActionTargetValue() -> OpaquePointer {
		return gtk_actionable_get_action_target_value(GTK_ACTIONABLE(self.GOBJECT))
	}

	/// Specifies the name of the action with which this widget should be
	/// associated.  If @action_name is %NULL then the widget will be
	/// unassociated from any previous action.
	/// Usually this function is used when the widget is located (or will be
	/// located) within the hierarchy of a #GtkApplicationWindow.
	/// Names are of the form “win.save” or “app.quit” for actions on the
	/// containing #GtkApplicationWindow or its associated #GtkApplication,
	/// respectively.  This is the same form used for actions in the #GMenu
	/// associated with the window.
	/// - Parameters:
	///	- actionName: String (const gchar*)
	open func setActionName(_ actionName: String) -> Swift.Void {
		gtk_actionable_set_action_name(GTK_ACTIONABLE(self.GOBJECT), actionName)
	}

	/// Sets the target value of an actionable widget.
	/// If @target_value is %NULL then the target value is unset.
	/// The target value has two purposes.  First, it is used as the
	/// parameter to activation of the action associated with the
	/// #GtkActionable widget. Second, it is used to determine if the widget
	/// should be rendered as “active” — the widget is active if the state
	/// is equal to the given target.
	/// Consider the example of associating a set of buttons with a #GAction
	/// with string state in a typical “radio button” situation.  Each button
	/// will be associated with the same action, but with a different target
	/// value for that action.  Clicking on a particular button will activate
	/// the action with the target of that button, which will typically cause
	/// the action’s state to change to that value.  Since the action’s state
	/// is now equal to the target value of the button, the button will now
	/// be rendered as active (and the other buttons, with different targets,
	/// rendered inactive).
	/// - Parameters:
	///	- targetValue: OpaquePointer! (GVariant*)
	open func setActionTargetValue(_ targetValue: OpaquePointer!) -> Swift.Void {
		gtk_actionable_set_action_target_value(GTK_ACTIONABLE(self.GOBJECT), targetValue)
	}

	/// Sets the action-name and associated string target value of an
	/// actionable widget.
	/// @detailed_action_name is a string in the format accepted by
	/// g_action_parse_detailed_name().
	/// (Note that prior to version 3.22.25,
	/// this function is only usable for actions with a simple "s" target, and
	/// @detailed_action_name must be of the form `"action::target"` where
	/// `action` is the action name and `target` is the string to use
	/// as the target.)
	/// - Parameters:
	///	- detailedActionName: String (const gchar*)
	open func setDetailedActionName(_ detailedActionName: String) -> Swift.Void {
		gtk_actionable_set_detailed_action_name(GTK_ACTIONABLE(self.GOBJECT), detailedActionName)
	}

}
