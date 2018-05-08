/*
 * CGTKMenuButton.swift
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

public let GTK_TYPE_MENU_BUTTON: GType = gtk_menu_button_get_type()

@inline(__always) public func GTK_MENU_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkMenuButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_MENU_BUTTON)
}

/// The #GtkMenuButton widget is used to display a popup when clicked on.
/// This popup can be provided either as a #GtkMenu, a #GtkPopover or an
/// abstract #GMenuModel.
/// The #GtkMenuButton widget can hold any valid child widget. That is, it
/// can hold almost any other standard #GtkWidget. The most commonly used
/// child is #GtkImage. If no widget is explicitely added to the #GtkMenuButton,
/// a #GtkImage is automatically created, using an arrow image oriented
/// according to #GtkMenuButton:direction or the generic “open-menu-symbolic”
/// icon if the direction is not set.
/// The positioning of the popup is determined by the #GtkMenuButton:direction
/// property of the menu button.
/// For menus, the #GtkWidget:halign and #GtkWidget:valign properties of the
/// menu are also taken into account. For example, when the direction is
/// %GTK_ARROW_DOWN and the horizontal alignment is %GTK_ALIGN_START, the
/// menu will be positioned below the button, with the starting edge
/// (depending on the text direction) of the menu aligned with the starting
/// edge of the button. If there is not enough space below the button, the
/// menu is popped up above the button instead. If the alignment would move
/// part of the menu offscreen, it is “pushed in”.
/// ## Direction = Down
/// - halign = start
/// ![](down-start.png)
/// - halign = center
/// ![](down-center.png)
/// - halign = end
/// ![](down-end.png)
/// ## Direction = Up
/// - halign = start
/// ![](up-start.png)
/// - halign = center
/// ![](up-center.png)
/// - halign = end
/// ![](up-end.png)
/// ## Direction = Left
/// - valign = start
/// ![](left-start.png)
/// - valign = center
/// ![](left-center.png)
/// - valign = end
/// ![](left-end.png)
/// ## Direction = Right
/// - valign = start
/// ![](right-start.png)
/// - valign = center
/// ![](right-center.png)
/// - valign = end
/// ![](right-end.png)
/// # CSS nodes
/// GtkMenuButton has a single CSS node with name button. To differentiate
/// it from a plain #GtkButton, it gets the .popup style class.


open class CGTKMenuButton : CGTKToggleButton {
	/// Creates a new #GtkMenuButton widget with downwards-pointing
	/// arrow as the only child. You can replace the child widget
	/// with another #GtkWidget should you wish to.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_menu_button_new())!
	}

	open var MENUBUTTON: UnsafeMutablePointer<GtkMenuButton>! {
		get {
			return GTK_MENU_BUTTON(self.GOBJECT)
		}
	}

	/// Returns the parent #GtkWidget to use to line up with menu.
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getAlignWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_menu_button_get_align_widget(GTK_MENU_BUTTON(self.GOBJECT)))
	}

	/// Returns the direction the popup will be pointing at when popped up.
	/// - Returns: GtkArrowType (GtkArrowType)
	open func getDirection() -> GtkArrowType {
		return gtk_menu_button_get_direction(GTK_MENU_BUTTON(self.GOBJECT))
	}

	/// Returns the #GMenuModel used to generate the popup.
	/// - Returns: UnsafeMutablePointer<GMenuModel>? (GMenuModel*)
	open func getMenuModel() -> UnsafeMutablePointer<GMenuModel>? {
		return gtk_menu_button_get_menu_model(GTK_MENU_BUTTON(self.GOBJECT))
	}

	/// Returns the #GtkPopover that pops out of the button.
	/// If the button is not using a #GtkPopover, this function
	/// returns %NULL.
	/// - Returns: UnsafeMutablePointer<GtkPopover>? (GtkPopover*)
	open func getPopover() -> UnsafeMutablePointer<GtkPopover>? {
		return gtk_menu_button_get_popover(GTK_MENU_BUTTON(self.GOBJECT))
	}

	/// Returns the #GtkMenu that pops out of the button.
	/// If the button does not use a #GtkMenu, this function
	/// returns %NULL.
	/// - Returns: UnsafeMutablePointer<GtkMenu>? (GtkMenu*)
	open func getPopup() -> UnsafeMutablePointer<GtkMenu>? {
		return gtk_menu_button_get_popup(GTK_MENU_BUTTON(self.GOBJECT))
	}

	/// Returns whether a #GtkPopover or a #GtkMenu will be constructed
	/// from the menu model.
	/// - Returns: Bool (gboolean)
	open func getUsePopover() -> Bool {
		return gtk_menu_button_get_use_popover(GTK_MENU_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the #GtkWidget to use to line the menu with when popped up.
	/// Note that the @align_widget must contain the #GtkMenuButton itself.
	/// Setting it to %NULL means that the menu will be aligned with the
	/// button itself.
	/// Note that this property is only used with menus currently,
	/// and not for popovers.
	/// - Parameters:
	///	- alignWidget: CGTKWidget? (GtkWidget*)
	open func setAlignWidget(_ alignWidget: CGTKWidget?) -> Swift.Void {
		gtk_menu_button_set_align_widget(GTK_MENU_BUTTON(self.GOBJECT), alignWidget?.WIDGET)
	}

	/// Sets the direction in which the popup will be popped up, as
	/// well as changing the arrow’s direction. The child will not
	/// be changed to an arrow if it was customized.
	/// If the does not fit in the available space in the given direction,
	/// GTK+ will its best to keep it inside the screen and fully visible.
	/// If you pass %GTK_ARROW_NONE for a @direction, the popup will behave
	/// as if you passed %GTK_ARROW_DOWN (although you won’t see any arrows).
	/// - Parameters:
	///	- direction: GtkArrowType (GtkArrowType)
	open func setDirection(_ direction: GtkArrowType) -> Swift.Void {
		gtk_menu_button_set_direction(GTK_MENU_BUTTON(self.GOBJECT), direction)
	}

	/// Sets the #GMenuModel from which the popup will be constructed,
	/// or %NULL to disable the button.
	/// Depending on the value of #GtkMenuButton:use-popover, either a
	/// #GtkMenu will be created with gtk_menu_new_from_model(), or a
	/// #GtkPopover with gtk_popover_new_from_model(). In either case,
	/// actions will be connected as documented for these functions.
	/// If #GtkMenuButton:popup or #GtkMenuButton:popover are already set,
	/// their content will be lost and replaced by the newly created popup.
	/// - Parameters:
	///	- menuModel: UnsafeMutablePointer<GMenuModel>? (GMenuModel*)
	open func setMenuModel(_ menuModel: UnsafeMutablePointer<GMenuModel>?) -> Swift.Void {
		gtk_menu_button_set_menu_model(GTK_MENU_BUTTON(self.GOBJECT), menuModel)
	}

	/// Sets the #GtkPopover that will be popped up when the button is
	/// clicked, or %NULL to disable the button. If #GtkMenuButton:menu-model
	/// or #GtkMenuButton:popup are set, they will be set to %NULL.
	/// - Parameters:
	///	- popover: CGTKWidget? (GtkWidget*)
	open func setPopover(_ popover: CGTKWidget?) -> Swift.Void {
		gtk_menu_button_set_popover(GTK_MENU_BUTTON(self.GOBJECT), popover?.WIDGET)
	}

	/// Sets the #GtkMenu that will be popped up when the button is clicked,
	/// or %NULL to disable the button. If #GtkMenuButton:menu-model or
	/// #GtkMenuButton:popover are set, they will be set to %NULL.
	/// - Parameters:
	///	- menu: CGTKWidget? (GtkWidget*)
	open func setPopup(menu: CGTKWidget?) -> Swift.Void {
		gtk_menu_button_set_popup(GTK_MENU_BUTTON(self.GOBJECT), menu?.WIDGET)
	}

	/// Sets whether to construct a #GtkPopover instead of #GtkMenu
	/// when gtk_menu_button_set_menu_model() is called. Note that
	/// this property is only consulted when a new menu model is set.
	/// - Parameters:
	///	- usePopover: Bool (gboolean)
	open func setUsePopover(_ usePopover: Bool) -> Swift.Void {
		gtk_menu_button_set_use_popover(GTK_MENU_BUTTON(self.GOBJECT), usePopover ? 1 : 0)
	}

}
