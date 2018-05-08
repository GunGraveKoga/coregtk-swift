/*
 * CGTKToolItem.swift
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

public let GTK_TYPE_TOOL_ITEM: GType = gtk_tool_item_get_type()

@inline(__always) public func GTK_TOOL_ITEM(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkToolItem>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TOOL_ITEM)
}

/// #GtkToolItems are widgets that can appear on a toolbar. To
/// create a toolbar item that contain something else than a button, use
/// gtk_tool_item_new(). Use gtk_container_add() to add a child
/// widget to the tool item.
/// For toolbar items that contain buttons, see the #GtkToolButton,
/// #GtkToggleToolButton and #GtkRadioToolButton classes.
/// See the #GtkToolbar class for a description of the toolbar widget, and
/// #GtkToolShell for a description of the tool shell interface.


open class CGTKToolItem : CGTKBin, CGTKActivatable {
	/// Creates a new #GtkToolItem
	/// - Returns: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	public convenience init() {
		self.init(withGObject: gtk_tool_item_new())!
	}

	open var TOOLITEM: UnsafeMutablePointer<GtkToolItem>! {
		get {
			return GTK_TOOL_ITEM(self.GOBJECT)
		}
	}

	/// Returns the ellipsize mode used for @tool_item. Custom subclasses of
	/// #GtkToolItem should call this function to find out how text should
	/// be ellipsized.
	/// - Returns: PangoEllipsizeMode (PangoEllipsizeMode)
	open func getEllipsizeMode() -> PangoEllipsizeMode {
		return gtk_tool_item_get_ellipsize_mode(GTK_TOOL_ITEM(self.GOBJECT))
	}

	/// Returns whether @tool_item is allocated extra space.
	/// See gtk_tool_item_set_expand().
	/// - Returns: Bool (gboolean)
	open func getExpand() -> Bool {
		return gtk_tool_item_get_expand(GTK_TOOL_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether @tool_item is the same size as other homogeneous
	/// items. See gtk_tool_item_set_homogeneous().
	/// - Returns: Bool (gboolean)
	open func getHomogeneous() -> Bool {
		return gtk_tool_item_get_homogeneous(GTK_TOOL_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the icon size used for @tool_item. Custom subclasses of
	/// #GtkToolItem should call this function to find out what size icons
	/// they should use.
	/// - Returns: GtkIconSize (GtkIconSize)
	open func getIconSize() -> GtkIconSize {
		return gtk_tool_item_get_icon_size(GTK_TOOL_ITEM(self.GOBJECT))
	}

	/// Returns whether @tool_item is considered important. See
	/// gtk_tool_item_set_is_important()
	/// - Returns: Bool (gboolean)
	open func getIsImportant() -> Bool {
		return gtk_tool_item_get_is_important(GTK_TOOL_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the orientation used for @tool_item. Custom subclasses of
	/// #GtkToolItem should call this function to find out what size icons
	/// they should use.
	/// - Returns: GtkOrientation (GtkOrientation)
	open func getOrientation() -> GtkOrientation {
		return gtk_tool_item_get_orientation(GTK_TOOL_ITEM(self.GOBJECT))
	}

	/// If @menu_item_id matches the string passed to
	/// gtk_tool_item_set_proxy_menu_item() return the corresponding #GtkMenuItem.
	/// Custom subclasses of #GtkToolItem should use this function to
	/// update their menu item when the #GtkToolItem changes. That the
	/// @menu_item_ids must match ensures that a #GtkToolItem
	/// will not inadvertently change a menu item that they did not create.
	/// - Parameters:
	///	- menuItemId: String (const gchar*)
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getProxyMenuItem<T>(menuItemId: String) -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_tool_item_get_proxy_menu_item(GTK_TOOL_ITEM(self.GOBJECT), menuItemId))
	}

	/// Returns the relief style of @tool_item. See gtk_button_set_relief().
	/// Custom subclasses of #GtkToolItem should call this function in the handler
	/// of the #GtkToolItem::toolbar_reconfigured signal to find out the
	/// relief style of buttons.
	/// - Returns: GtkReliefStyle (GtkReliefStyle)
	open func getReliefStyle() -> GtkReliefStyle {
		return gtk_tool_item_get_relief_style(GTK_TOOL_ITEM(self.GOBJECT))
	}

	/// Returns the text alignment used for @tool_item. Custom subclasses of
	/// #GtkToolItem should call this function to find out how text should
	/// be aligned.
	/// - Returns: Float (gfloat)
	open func getTextAlignment() -> Float {
		return gtk_tool_item_get_text_alignment(GTK_TOOL_ITEM(self.GOBJECT))
	}

	/// Returns the text orientation used for @tool_item. Custom subclasses of
	/// #GtkToolItem should call this function to find out how text should
	/// be orientated.
	/// - Returns: GtkOrientation (GtkOrientation)
	open func getTextOrientation() -> GtkOrientation {
		return gtk_tool_item_get_text_orientation(GTK_TOOL_ITEM(self.GOBJECT))
	}

	/// Returns the size group used for labels in @tool_item.
	/// Custom subclasses of #GtkToolItem should call this function
	/// and use the size group for labels.
	/// - Returns: UnsafeMutablePointer<GtkSizeGroup>! (GtkSizeGroup*)
	open func getTextSizeGroup() -> UnsafeMutablePointer<GtkSizeGroup>! {
		return gtk_tool_item_get_text_size_group(GTK_TOOL_ITEM(self.GOBJECT))
	}

	/// Returns the toolbar style used for @tool_item. Custom subclasses of
	/// #GtkToolItem should call this function in the handler of the
	/// GtkToolItem::toolbar_reconfigured signal to find out in what style
	/// the toolbar is displayed and change themselves accordingly
	/// Possibilities are:
	/// - %GTK_TOOLBAR_BOTH, meaning the tool item should show
	/// both an icon and a label, stacked vertically
	/// - %GTK_TOOLBAR_ICONS, meaning the toolbar shows only icons
	/// - %GTK_TOOLBAR_TEXT, meaning the tool item should only show text
	/// - %GTK_TOOLBAR_BOTH_HORIZ, meaning the tool item should show
	/// both an icon and a label, arranged horizontally
	/// - Returns: GtkToolbarStyle (GtkToolbarStyle)
	open func getToolbarStyle() -> GtkToolbarStyle {
		return gtk_tool_item_get_toolbar_style(GTK_TOOL_ITEM(self.GOBJECT))
	}

	/// Returns whether @tool_item has a drag window. See
	/// gtk_tool_item_set_use_drag_window().
	/// - Returns: Bool (gboolean)
	open func getUseDragWindow() -> Bool {
		return gtk_tool_item_get_use_drag_window(GTK_TOOL_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the @tool_item is visible on toolbars that are
	/// docked horizontally.
	/// - Returns: Bool (gboolean)
	open func getVisibleHorizontal() -> Bool {
		return gtk_tool_item_get_visible_horizontal(GTK_TOOL_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether @tool_item is visible when the toolbar is docked vertically.
	/// See gtk_tool_item_set_visible_vertical().
	/// - Returns: Bool (gboolean)
	open func getVisibleVertical() -> Bool {
		return gtk_tool_item_get_visible_vertical(GTK_TOOL_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// Calling this function signals to the toolbar that the
	/// overflow menu item for @tool_item has changed. If the
	/// overflow menu is visible when this function it called,
	/// the menu will be rebuilt.
	/// The function must be called when the tool item changes what it
	/// will do in response to the #GtkToolItem::create-menu-proxy signal.
	open func rebuildMenu() -> Swift.Void {
		gtk_tool_item_rebuild_menu(GTK_TOOL_ITEM(self.GOBJECT))
	}

	/// Returns the #GtkMenuItem that was last set by
	/// gtk_tool_item_set_proxy_menu_item(), ie. the #GtkMenuItem
	/// that is going to appear in the overflow menu.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func retrieveProxyMenuItem<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_tool_item_retrieve_proxy_menu_item(GTK_TOOL_ITEM(self.GOBJECT)))!
	}

	/// Sets whether @tool_item is allocated extra space when there
	/// is more room on the toolbar then needed for the items. The
	/// effect is that the item gets bigger when the toolbar gets bigger
	/// and smaller when the toolbar gets smaller.
	/// - Parameters:
	///	- expand: Bool (gboolean)
	open func setExpand(_ expand: Bool) -> Swift.Void {
		gtk_tool_item_set_expand(GTK_TOOL_ITEM(self.GOBJECT), expand ? 1 : 0)
	}

	/// Sets whether @tool_item is to be allocated the same size as other
	/// homogeneous items. The effect is that all homogeneous items will have
	/// the same width as the widest of the items.
	/// - Parameters:
	///	- homogeneous: Bool (gboolean)
	open func setHomogeneous(_ homogeneous: Bool) -> Swift.Void {
		gtk_tool_item_set_homogeneous(GTK_TOOL_ITEM(self.GOBJECT), homogeneous ? 1 : 0)
	}

	/// Sets whether @tool_item should be considered important. The #GtkToolButton
	/// class uses this property to determine whether to show or hide its label
	/// when the toolbar style is %GTK_TOOLBAR_BOTH_HORIZ. The result is that
	/// only tool buttons with the “is_important” property set have labels, an
	/// effect known as “priority text”
	/// - Parameters:
	///	- isImportant: Bool (gboolean)
	open func setIsImportant(_ isImportant: Bool) -> Swift.Void {
		gtk_tool_item_set_is_important(GTK_TOOL_ITEM(self.GOBJECT), isImportant ? 1 : 0)
	}

	/// Sets the #GtkMenuItem used in the toolbar overflow menu. The
	/// @menu_item_id is used to identify the caller of this function and
	/// should also be used with gtk_tool_item_get_proxy_menu_item().
	/// See also #GtkToolItem::create-menu-proxy.
	/// - Parameters:
	///	- menuItemId: String (const gchar*)
	///	- menuItem: CGTKWidget? (GtkWidget*)
	open func setProxyMenuItem(menuItemId: String, menuItem: CGTKWidget?) -> Swift.Void {
		gtk_tool_item_set_proxy_menu_item(GTK_TOOL_ITEM(self.GOBJECT), menuItemId, menuItem?.WIDGET)
	}

	/// Sets the markup text to be displayed as tooltip on the item.
	/// See gtk_widget_set_tooltip_markup().
	/// - Parameters:
	///	- markup: String (const gchar*)
	open func setTooltipMarkup(_ markup: String) -> Swift.Void {
		gtk_tool_item_set_tooltip_markup(GTK_TOOL_ITEM(self.GOBJECT), markup)
	}

	/// Sets the text to be displayed as tooltip on the item.
	/// See gtk_widget_set_tooltip_text().
	/// - Parameters:
	///	- text: String (const gchar*)
	open func setTooltipText(_ text: String) -> Swift.Void {
		gtk_tool_item_set_tooltip_text(GTK_TOOL_ITEM(self.GOBJECT), text)
	}

	/// Sets whether @tool_item has a drag window. When %TRUE the
	/// toolitem can be used as a drag source through gtk_drag_source_set().
	/// When @tool_item has a drag window it will intercept all events,
	/// even those that would otherwise be sent to a child of @tool_item.
	/// - Parameters:
	///	- useDragWindow: Bool (gboolean)
	open func setUseDragWindow(_ useDragWindow: Bool) -> Swift.Void {
		gtk_tool_item_set_use_drag_window(GTK_TOOL_ITEM(self.GOBJECT), useDragWindow ? 1 : 0)
	}

	/// Sets whether @tool_item is visible when the toolbar is docked horizontally.
	/// - Parameters:
	///	- visibleHorizontal: Bool (gboolean)
	open func setVisibleHorizontal(_ visibleHorizontal: Bool) -> Swift.Void {
		gtk_tool_item_set_visible_horizontal(GTK_TOOL_ITEM(self.GOBJECT), visibleHorizontal ? 1 : 0)
	}

	/// Sets whether @tool_item is visible when the toolbar is docked
	/// vertically. Some tool items, such as text entries, are too wide to be
	/// useful on a vertically docked toolbar. If @visible_vertical is %FALSE
	/// @tool_item will not appear on toolbars that are docked vertically.
	/// - Parameters:
	///	- visibleVertical: Bool (gboolean)
	open func setVisibleVertical(_ visibleVertical: Bool) -> Swift.Void {
		gtk_tool_item_set_visible_vertical(GTK_TOOL_ITEM(self.GOBJECT), visibleVertical ? 1 : 0)
	}

	/// Emits the signal #GtkToolItem::toolbar_reconfigured on @tool_item.
	/// #GtkToolbar and other #GtkToolShell implementations use this function
	/// to notify children, when some aspect of their configuration changes.
	open func toolbarReconfigured() -> Swift.Void {
		gtk_tool_item_toolbar_reconfigured(GTK_TOOL_ITEM(self.GOBJECT))
	}

	/// This is a utility function for #GtkActivatable implementors.
	/// When implementing #GtkActivatable you must call this when
	/// handling changes of the #GtkActivatable:related-action, and
	/// you must also use this to break references in #GObject->dispose().
	/// This function adds a reference to the currently set related
	/// action for you, it also makes sure the #GtkActivatable->update()
	/// method is called when the related #GtkAction properties change
	/// and registers to the action’s proxy list.
	/// > Be careful to call this before setting the local
	/// > copy of the #GtkAction property, since this function uses
	/// > gtk_activatable_get_related_action() to retrieve the
	/// > previous action.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func doSetRelatedAction(_ action: UnsafeMutablePointer<GtkAction>!) -> Swift.Void {
		gtk_activatable_do_set_related_action(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

	/// Gets the related #GtkAction for @activatable.
	/// - Returns: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func getRelatedAction() -> UnsafeMutablePointer<GtkAction>! {
		return gtk_activatable_get_related_action(GTK_ACTIVATABLE(self.GOBJECT))
	}

	/// Gets whether this activatable should reset its layout
	/// and appearance when setting the related action or when
	/// the action changes appearance.
	/// - Returns: Bool (gboolean)
	open func getUseActionAppearance() -> Bool {
		return gtk_activatable_get_use_action_appearance(GTK_ACTIVATABLE(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the related action on the @activatable object.
	/// > #GtkActivatable implementors need to handle the #GtkActivatable:related-action
	/// > property and call gtk_activatable_do_set_related_action() when it changes.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func setRelatedAction(_ action: UnsafeMutablePointer<GtkAction>!) -> Swift.Void {
		gtk_activatable_set_related_action(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

	/// Sets whether this activatable should reset its layout and appearance
	/// when setting the related action or when the action changes appearance
	/// > #GtkActivatable implementors need to handle the
	/// > #GtkActivatable:use-action-appearance property and call
	/// > gtk_activatable_sync_action_properties() to update @activatable
	/// > if needed.
	/// - Parameters:
	///	- useAppearance: Bool (gboolean)
	open func setUseActionAppearance(useAppearance: Bool) -> Swift.Void {
		gtk_activatable_set_use_action_appearance(GTK_ACTIVATABLE(self.GOBJECT), useAppearance ? 1 : 0)
	}

	/// This is called to update the activatable completely, this is called
	/// internally when the #GtkActivatable:related-action property is set
	/// or unset and by the implementing class when
	/// #GtkActivatable:use-action-appearance changes.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>? (GtkAction*)
	open func syncActionProperties(action: UnsafeMutablePointer<GtkAction>?) -> Swift.Void {
		gtk_activatable_sync_action_properties(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

}
