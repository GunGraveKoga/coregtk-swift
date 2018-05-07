/*
 * CGTKToolbar.swift
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

public let GTK_TYPE_TOOLBAR: GType = gtk_toolbar_get_type()

@inline(__always) public func GTK_TOOLBAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkToolbar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TOOLBAR)
}

/// A toolbar is created with a call to gtk_toolbar_new().
/// A toolbar can contain instances of a subclass of #GtkToolItem. To add
/// a #GtkToolItem to the a toolbar, use gtk_toolbar_insert(). To remove
/// an item from the toolbar use gtk_container_remove(). To add a button
/// to the toolbar, add an instance of #GtkToolButton.
/// Toolbar items can be visually grouped by adding instances of
/// #GtkSeparatorToolItem to the toolbar. If the GtkToolbar child property
/// “expand” is #TRUE and the property #GtkSeparatorToolItem:draw is set to
/// #FALSE, the effect is to force all following items to the end of the toolbar.
/// By default, a toolbar can be shrunk, upon which it will add an arrow button
/// to show an overflow menu offering access to any #GtkToolItem child that has
/// a proxy menu item. To disable this and request enough size for all children,
/// call gtk_toolbar_set_show_arrow() to set #GtkToolbar:show-arrow to %FALSE.
/// Creating a context menu for the toolbar can be done by connecting to
/// the #GtkToolbar::popup-context-menu signal.
/// # CSS nodes
/// GtkToolbar has a single CSS node with name toolbar.


open class CGTKToolbar : CGTKContainer, CGTKOrientable, CGTKToolShell {
	/// Creates a new toolbar.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_toolbar_new())!
	}

	open var TOOLBAR: UnsafeMutablePointer<GtkToolbar>! {
		get {
			return GTK_TOOLBAR(self.GOBJECT)
		}
	}

	/// Returns the position corresponding to the indicated point on
	/// @toolbar. This is useful when dragging items to the toolbar:
	/// this function returns the position a new item should be
	/// inserted.
	/// @x and @y are in @toolbar coordinates.
	/// - Parameters:
	///	- x: gint (gint)
	///	- y: gint (gint)
	/// - Returns: gint (gint)
	open func getDropIndex(x: gint, y: gint) -> gint {
		return gtk_toolbar_get_drop_index(GTK_TOOLBAR(self.GOBJECT), x, y)
	}

	/// Retrieves the icon size for the toolbar. See gtk_toolbar_set_icon_size().
	/// - Returns: GtkIconSize (GtkIconSize)
	open func getIconSize() -> GtkIconSize {
		return gtk_toolbar_get_icon_size(GTK_TOOLBAR(self.GOBJECT))
	}

	/// Returns the position of @item on the toolbar, starting from 0.
	/// It is an error if @item is not a child of the toolbar.
	/// - Parameters:
	///	- item: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	/// - Returns: gint (gint)
	open func getItemIndex(item: UnsafeMutablePointer<GtkToolItem>!) -> gint {
		return gtk_toolbar_get_item_index(GTK_TOOLBAR(self.GOBJECT), item)
	}

	/// Returns the number of items on the toolbar.
	/// - Returns: gint (gint)
	open func getNitems() -> gint {
		return gtk_toolbar_get_n_items(GTK_TOOLBAR(self.GOBJECT))
	}

	/// Returns the @n'th item on @toolbar, or %NULL if the
	/// toolbar does not contain an @n'th item.
	/// - Parameters:
	///	- n: gint (gint)
	/// - Returns: UnsafeMutablePointer<GtkToolItem>? (GtkToolItem*)
	open func getNthItem(n: gint) -> UnsafeMutablePointer<GtkToolItem>? {
		return gtk_toolbar_get_nth_item(GTK_TOOLBAR(self.GOBJECT), n)
	}

	/// Returns the relief style of buttons on @toolbar. See
	/// gtk_button_set_relief().
	/// - Returns: GtkReliefStyle (GtkReliefStyle)
	open func getReliefStyle() -> GtkReliefStyle {
		return gtk_toolbar_get_relief_style(GTK_TOOLBAR(self.GOBJECT))
	}

	/// Returns whether the toolbar has an overflow menu.
	/// See gtk_toolbar_set_show_arrow().
	/// - Returns: Bool (gboolean)
	open func getShowArrow() -> Bool {
		return gtk_toolbar_get_show_arrow(GTK_TOOLBAR(self.GOBJECT)) != 0 ? true : false
	}

	/// Retrieves whether the toolbar has text, icons, or both . See
	/// gtk_toolbar_set_style().
	/// - Returns: GtkToolbarStyle (GtkToolbarStyle)
	open func getStyle() -> GtkToolbarStyle {
		return gtk_toolbar_get_style(GTK_TOOLBAR(self.GOBJECT))
	}

	/// Insert a #GtkToolItem into the toolbar at position @pos. If @pos is
	/// 0 the item is prepended to the start of the toolbar. If @pos is
	/// negative, the item is appended to the end of the toolbar.
	/// - Parameters:
	///	- item: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	///	- pos: gint (gint)
	open func insert(item: UnsafeMutablePointer<GtkToolItem>!, pos: gint) -> Swift.Void {
		gtk_toolbar_insert(GTK_TOOLBAR(self.GOBJECT), item, pos)
	}

	/// Highlights @toolbar to give an idea of what it would look like
	/// if @item was added to @toolbar at the position indicated by @index_.
	/// If @item is %NULL, highlighting is turned off. In that case @index_
	/// is ignored.
	/// The @tool_item passed to this function must not be part of any widget
	/// hierarchy. When an item is set as drop highlight item it can not
	/// added to any widget hierarchy or used as highlight item for another
	/// toolbar.
	/// - Parameters:
	///	- toolItem: UnsafeMutablePointer<GtkToolItem>? (GtkToolItem*)
	///	- index: gint (gint)
	open func setDropHighlightItem(toolItem: UnsafeMutablePointer<GtkToolItem>?, index: gint) -> Swift.Void {
		gtk_toolbar_set_drop_highlight_item(GTK_TOOLBAR(self.GOBJECT), toolItem, index)
	}

	/// This function sets the size of stock icons in the toolbar. You
	/// can call it both before you add the icons and after they’ve been
	/// added. The size you set will override user preferences for the default
	/// icon size.
	/// This should only be used for special-purpose toolbars, normal
	/// application toolbars should respect the user preferences for the
	/// size of icons.
	/// - Parameters:
	///	- iconSize: GtkIconSize (GtkIconSize)
	open func setIconSize(_ iconSize: GtkIconSize) -> Swift.Void {
		gtk_toolbar_set_icon_size(GTK_TOOLBAR(self.GOBJECT), iconSize)
	}

	/// Sets whether to show an overflow menu when @toolbar isn’t allocated enough
	/// size to show all of its items. If %TRUE, items which can’t fit in @toolbar,
	/// and which have a proxy menu item set by gtk_tool_item_set_proxy_menu_item()
	/// or #GtkToolItem::create-menu-proxy, will be available in an overflow menu,
	/// which can be opened by an added arrow button. If %FALSE, @toolbar will
	/// request enough size to fit all of its child items without any overflow.
	/// - Parameters:
	///	- showArrow: Bool (gboolean)
	open func setShowArrow(_ showArrow: Bool) -> Swift.Void {
		gtk_toolbar_set_show_arrow(GTK_TOOLBAR(self.GOBJECT), showArrow ? 1 : 0)
	}

	/// Alters the view of @toolbar to display either icons only, text only, or both.
	/// - Parameters:
	///	- style: GtkToolbarStyle (GtkToolbarStyle)
	open func setStyle(_ style: GtkToolbarStyle) -> Swift.Void {
		gtk_toolbar_set_style(GTK_TOOLBAR(self.GOBJECT), style)
	}

	/// Unsets toolbar icon size set with gtk_toolbar_set_icon_size(), so that
	/// user preferences will be used to determine the icon size.
	open func unsetIconSize() -> Swift.Void {
		gtk_toolbar_unset_icon_size(GTK_TOOLBAR(self.GOBJECT))
	}

	/// Unsets a toolbar style set with gtk_toolbar_set_style(), so that
	/// user preferences will be used to determine the toolbar style.
	open func unsetStyle() -> Swift.Void {
		gtk_toolbar_unset_style(GTK_TOOLBAR(self.GOBJECT))
	}

	/// Retrieves the orientation of the @orientable.
	/// - Returns: GtkOrientation (GtkOrientation)
	open func getOrientation() -> GtkOrientation {
		return gtk_orientable_get_orientation(GTK_ORIENTABLE(self.GOBJECT))
	}

	/// Sets the orientation of the @orientable.
	/// - Parameters:
	///	- orientation: GtkOrientation (GtkOrientation)
	open func setOrientation(_ orientation: GtkOrientation) -> Swift.Void {
		gtk_orientable_set_orientation(GTK_ORIENTABLE(self.GOBJECT), orientation)
	}

	/// Retrieves the current ellipsize mode for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_ellipsize_mode()
	/// instead.
	/// - Returns: PangoEllipsizeMode (PangoEllipsizeMode)
	open func getEllipsizeMode() -> PangoEllipsizeMode {
		return gtk_tool_shell_get_ellipsize_mode(GTK_TOOL_SHELL(self.GOBJECT))
	}

	/// Retrieves the current text alignment for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_text_alignment()
	/// instead.
	/// - Returns: Float (gfloat)
	open func getTextAlignment() -> Float {
		return gtk_tool_shell_get_text_alignment(GTK_TOOL_SHELL(self.GOBJECT))
	}

	/// Retrieves the current text orientation for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_text_orientation()
	/// instead.
	/// - Returns: GtkOrientation (GtkOrientation)
	open func getTextOrientation() -> GtkOrientation {
		return gtk_tool_shell_get_text_orientation(GTK_TOOL_SHELL(self.GOBJECT))
	}

	/// Retrieves the current text size group for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_text_size_group()
	/// instead.
	/// - Returns: UnsafeMutablePointer<GtkSizeGroup>! (GtkSizeGroup*)
	open func getTextSizeGroup() -> UnsafeMutablePointer<GtkSizeGroup>! {
		return gtk_tool_shell_get_text_size_group(GTK_TOOL_SHELL(self.GOBJECT))
	}

	/// Calling this function signals the tool shell that the overflow menu item for
	/// tool items have changed. If there is an overflow menu and if it is visible
	/// when this function it called, the menu will be rebuilt.
	/// Tool items must not call this function directly, but rely on
	/// gtk_tool_item_rebuild_menu() instead.
	open func rebuildMenu() -> Swift.Void {
		gtk_tool_shell_rebuild_menu(GTK_TOOL_SHELL(self.GOBJECT))
	}

}
