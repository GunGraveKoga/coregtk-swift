/*
 * CGTKToolItemGroup.swift
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

public let GTK_TYPE_TOOL_ITEM_GROUP: GType = gtk_tool_item_group_get_type()

@inline(__always) public func GTK_TOOL_ITEM_GROUP(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkToolItemGroup>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TOOL_ITEM_GROUP)
}

/// A #GtkToolItemGroup is used together with #GtkToolPalette to add
/// #GtkToolItems to a palette like container with different
/// categories and drag and drop support.
/// # CSS nodes
/// GtkToolItemGroup has a single CSS node named toolitemgroup.


open class CGTKToolItemGroup : CGTKContainer, CGTKToolShell {
	/// Creates a new tool item group with label @label.
	/// - Parameters:
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(label: String) {
		self.init(withGObject: gtk_tool_item_group_new(label))!
	}

	open var TOOLITEMGROUP: UnsafeMutablePointer<GtkToolItemGroup>! {
		get {
			return GTK_TOOL_ITEM_GROUP(self.GOBJECT)
		}
	}

	/// Gets whether @group is collapsed or expanded.
	/// - Returns: Bool (gboolean)
	open func getCollapsed() -> Bool {
		return gtk_tool_item_group_get_collapsed(GTK_TOOL_ITEM_GROUP(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the tool item at position (x, y).
	/// - Parameters:
	///	- x: gint (gint)
	///	- y: gint (gint)
	/// - Returns: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	open func getDropItem(x: gint, y: gint) -> UnsafeMutablePointer<GtkToolItem>! {
		return gtk_tool_item_group_get_drop_item(GTK_TOOL_ITEM_GROUP(self.GOBJECT), x, y)
	}

	/// Gets the ellipsization mode of @group.
	/// - Returns: PangoEllipsizeMode (PangoEllipsizeMode)
	open func getEllipsize() -> PangoEllipsizeMode {
		return gtk_tool_item_group_get_ellipsize(GTK_TOOL_ITEM_GROUP(self.GOBJECT))
	}

	/// Gets the relief mode of the header button of @group.
	/// - Returns: GtkReliefStyle (GtkReliefStyle)
	open func getHeaderRelief() -> GtkReliefStyle {
		return gtk_tool_item_group_get_header_relief(GTK_TOOL_ITEM_GROUP(self.GOBJECT))
	}

	/// Gets the position of @item in @group as index.
	/// - Parameters:
	///	- item: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	/// - Returns: gint (gint)
	open func getItemPosition(item: UnsafeMutablePointer<GtkToolItem>!) -> gint {
		return gtk_tool_item_group_get_item_position(GTK_TOOL_ITEM_GROUP(self.GOBJECT), item)
	}

	/// Gets the label of @group.
	/// - Returns: String? (const gchar*)
	open func getLabel() -> String? {
		return String(utf8String: gtk_tool_item_group_get_label(GTK_TOOL_ITEM_GROUP(self.GOBJECT)))
	}

	/// Gets the label widget of @group.
	/// See gtk_tool_item_group_set_label_widget().
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getLabelWidget<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_tool_item_group_get_label_widget(GTK_TOOL_ITEM_GROUP(self.GOBJECT)))!
	}

	/// Gets the number of tool items in @group.
	/// - Returns: guint (guint)
	open func getNitems() -> guint {
		return gtk_tool_item_group_get_n_items(GTK_TOOL_ITEM_GROUP(self.GOBJECT))
	}

	/// Gets the tool item at @index in group.
	/// - Parameters:
	///	- index: guint (guint)
	/// - Returns: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	open func getNthItem(index: guint) -> UnsafeMutablePointer<GtkToolItem>! {
		return gtk_tool_item_group_get_nth_item(GTK_TOOL_ITEM_GROUP(self.GOBJECT), index)
	}

	/// Inserts @item at @position in the list of children of @group.
	/// - Parameters:
	///	- item: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	///	- position: gint (gint)
	open func insert(item: UnsafeMutablePointer<GtkToolItem>!, position: gint) -> Swift.Void {
		gtk_tool_item_group_insert(GTK_TOOL_ITEM_GROUP(self.GOBJECT), item, position)
	}

	/// Sets whether the @group should be collapsed or expanded.
	/// - Parameters:
	///	- collapsed: Bool (gboolean)
	open func setCollapsed(_ collapsed: Bool) -> Swift.Void {
		gtk_tool_item_group_set_collapsed(GTK_TOOL_ITEM_GROUP(self.GOBJECT), collapsed ? 1 : 0)
	}

	/// Sets the ellipsization mode which should be used by labels in @group.
	/// - Parameters:
	///	- ellipsize: PangoEllipsizeMode (PangoEllipsizeMode)
	open func setEllipsize(_ ellipsize: PangoEllipsizeMode) -> Swift.Void {
		gtk_tool_item_group_set_ellipsize(GTK_TOOL_ITEM_GROUP(self.GOBJECT), ellipsize)
	}

	/// Set the button relief of the group header.
	/// See gtk_button_set_relief() for details.
	/// - Parameters:
	///	- style: GtkReliefStyle (GtkReliefStyle)
	open func setHeaderRelief(style: GtkReliefStyle) -> Swift.Void {
		gtk_tool_item_group_set_header_relief(GTK_TOOL_ITEM_GROUP(self.GOBJECT), style)
	}

	/// Sets the position of @item in the list of children of @group.
	/// - Parameters:
	///	- item: UnsafeMutablePointer<GtkToolItem>! (GtkToolItem*)
	///	- position: gint (gint)
	open func setItemPosition(item: UnsafeMutablePointer<GtkToolItem>!, position: gint) -> Swift.Void {
		gtk_tool_item_group_set_item_position(GTK_TOOL_ITEM_GROUP(self.GOBJECT), item, position)
	}

	/// Sets the label of the tool item group. The label is displayed in the header
	/// of the group.
	/// - Parameters:
	///	- label: String (const gchar*)
	open func setLabel(_ label: String) -> Swift.Void {
		gtk_tool_item_group_set_label(GTK_TOOL_ITEM_GROUP(self.GOBJECT), label)
	}

	/// Sets the label of the tool item group.
	/// The label widget is displayed in the header of the group, in place
	/// of the usual label.
	/// - Parameters:
	///	- labelWidget: CGTKWidget (GtkWidget*)
	open func setLabelWidget(_ labelWidget: CGTKWidget) -> Swift.Void {
		gtk_tool_item_group_set_label_widget(GTK_TOOL_ITEM_GROUP(self.GOBJECT), labelWidget.WIDGET)
	}

	/// Retrieves the current ellipsize mode for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_ellipsize_mode()
	/// instead.
	/// - Returns: PangoEllipsizeMode (PangoEllipsizeMode)
	open func getEllipsizeMode() -> PangoEllipsizeMode {
		return gtk_tool_shell_get_ellipsize_mode(GTK_TOOL_SHELL(self.GOBJECT))
	}

	/// Retrieves the icon size for the tool shell. Tool items must not call this
	/// function directly, but rely on gtk_tool_item_get_icon_size() instead.
	/// - Returns: GtkIconSize (GtkIconSize)
	open func getIconSize() -> GtkIconSize {
		return gtk_tool_shell_get_icon_size(GTK_TOOL_SHELL(self.GOBJECT))
	}

	/// Retrieves the current orientation for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_orientation()
	/// instead.
	/// - Returns: GtkOrientation (GtkOrientation)
	open func getOrientation() -> GtkOrientation {
		return gtk_tool_shell_get_orientation(GTK_TOOL_SHELL(self.GOBJECT))
	}

	/// Returns the relief style of buttons on @shell. Tool items must not call this
	/// function directly, but rely on gtk_tool_item_get_relief_style() instead.
	/// - Returns: GtkReliefStyle (GtkReliefStyle)
	open func getReliefStyle() -> GtkReliefStyle {
		return gtk_tool_shell_get_relief_style(GTK_TOOL_SHELL(self.GOBJECT))
	}

	/// Retrieves whether the tool shell has text, icons, or both. Tool items must
	/// not call this function directly, but rely on gtk_tool_item_get_toolbar_style()
	/// instead.
	/// - Returns: GtkToolbarStyle (GtkToolbarStyle)
	open func getStyle() -> GtkToolbarStyle {
		return gtk_tool_shell_get_style(GTK_TOOL_SHELL(self.GOBJECT))
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
