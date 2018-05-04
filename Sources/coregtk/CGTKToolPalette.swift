/*
 * CGTKToolPalette.swift
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

public let GTK_TYPE_TOOL_PALETTE: GType = gtk_tool_palette_get_type()

@inline(__always) public func GTK_TOOL_PALETTE(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkToolPalette>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TOOL_PALETTE)
}

/// 
/// A #GtkToolPalette allows you to add #GtkToolItems to a palette-like
/// container with different categories and drag and drop support.
/// A #GtkToolPalette is created with a call to gtk_tool_palette_new().
/// #GtkToolItems cannot be added directly to a #GtkToolPalette -
/// instead they are added to a #GtkToolItemGroup which can than be added
/// to a #GtkToolPalette. To add a #GtkToolItemGroup to a #GtkToolPalette,
/// use gtk_container_add().
/// |[<!-- language="C" -->
/// GtkWidget *palette, *group;
/// GtkToolItem *item;
/// palette = gtk_tool_palette_new ();
/// group = gtk_tool_item_group_new (_("Test Category"));
/// gtk_container_add (GTK_CONTAINER (palette), group);
/// item = gtk_tool_button_new (NULL, _("_Open"));
/// gtk_tool_button_set_icon_name (GTK_TOOL_BUTTON (item), "document-open");
/// gtk_tool_item_group_insert (GTK_TOOL_ITEM_GROUP (group), item, -1);
/// ]|
/// The easiest way to use drag and drop with #GtkToolPalette is to call
/// gtk_tool_palette_add_drag_dest() with the desired drag source @palette
/// and the desired drag target @widget. Then gtk_tool_palette_get_drag_item()
/// can be used to get the dragged item in the #GtkWidget::drag-data-received
/// signal handler of the drag target.
/// |[<!-- language="C" -->
/// static void
/// passive_canvas_drag_data_received (GtkWidget        *widget,
/// GdkDragContext   *context,
/// gint              x,
/// gint              y,
/// GtkSelectionData *selection,
/// guint             info,
/// guint             time,
/// gpointer          data)
/// {
/// GtkWidget *palette;
/// GtkWidget *item;
/// // Get the dragged item
/// palette = gtk_widget_get_ancestor (gtk_drag_get_source_widget (context),
/// GTK_TYPE_TOOL_PALETTE);
/// if (palette != NULL)
/// item = gtk_tool_palette_get_drag_item (GTK_TOOL_PALETTE (palette),
/// selection);
/// // Do something with item
/// }
/// GtkWidget *target, palette;
/// palette = gtk_tool_palette_new ();
/// target = gtk_drawing_area_new ();
/// g_signal_connect (G_OBJECT (target), "drag-data-received",
/// G_CALLBACK (passive_canvas_drag_data_received), NULL);
/// gtk_tool_palette_add_drag_dest (GTK_TOOL_PALETTE (palette), target,
/// GTK_DEST_DEFAULT_ALL,
/// GTK_TOOL_PALETTE_DRAG_ITEMS,
/// GDK_ACTION_COPY);
/// ]|
/// # CSS nodes
/// GtkToolPalette has a single CSS node named toolpalette.


open class CGTKToolPalette : CGTKContainer {
	/// 
	/// Get the target entry for a dragged #GtkToolItemGroup.
	/// - Returns: UnsafePointer<GtkTargetEntry>!
	open class func getDragTargetGroup() -> UnsafePointer<GtkTargetEntry>! {
		return gtk_tool_palette_get_drag_target_group()
	}

	/// 
	/// Gets the target entry for a dragged #GtkToolItem.
	/// - Returns: UnsafePointer<GtkTargetEntry>!
	open class func getDragTargetItem() -> UnsafePointer<GtkTargetEntry>! {
		return gtk_tool_palette_get_drag_target_item()
	}

	/// 
	/// Creates a new tool palette.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_tool_palette_new())!
	}

	open var TOOLPALETTE: UnsafeMutablePointer<GtkToolPalette>! {
		get {
			return GTK_TOOL_PALETTE(self.GOBJECT)
		}
	}

	/// 
	/// Sets @palette as drag source (see gtk_tool_palette_set_drag_source())
	/// and sets @widget as a drag destination for drags from @palette.
	/// See gtk_drag_dest_set().
	/// Parameters:
	///	- widget: CGTKWidget
	///	- flags: GtkDestDefaults
	///	- targets: GtkToolPaletteDragTargets
	///	- actions: GdkDragAction
	open func addDragDest(widget: CGTKWidget, flags: GtkDestDefaults, targets: GtkToolPaletteDragTargets, actions: GdkDragAction) {
		gtk_tool_palette_add_drag_dest(GTK_TOOL_PALETTE(self.GOBJECT), widget.WIDGET, flags, targets, actions)
	}

	/// 
	/// Get the dragged item from the selection.
	/// This could be a #GtkToolItem or a #GtkToolItemGroup.
	/// Parameters:
	///	- selection: OpaquePointer!
	/// - Returns: CGTKWidget
	open func getDragItem<T>(selection: OpaquePointer!) -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_tool_palette_get_drag_item(GTK_TOOL_PALETTE(self.GOBJECT), selection))!
	}

	/// 
	/// Gets the group at position (x, y).
	/// Parameters:
	///	- x: gint
	///	- y: gint
	/// - Returns: UnsafeMutablePointer<GtkToolItemGroup>?
	open func getDropGroup(x: gint, y: gint) -> UnsafeMutablePointer<GtkToolItemGroup>? {
		return gtk_tool_palette_get_drop_group(GTK_TOOL_PALETTE(self.GOBJECT), x, y)
	}

	/// 
	/// Gets the item at position (x, y).
	/// See gtk_tool_palette_get_drop_group().
	/// Parameters:
	///	- x: gint
	///	- y: gint
	/// - Returns: UnsafeMutablePointer<GtkToolItem>?
	open func getDropItem(x: gint, y: gint) -> UnsafeMutablePointer<GtkToolItem>? {
		return gtk_tool_palette_get_drop_item(GTK_TOOL_PALETTE(self.GOBJECT), x, y)
	}

	/// 
	/// Gets whether @group is exclusive or not.
	/// See gtk_tool_palette_set_exclusive().
	/// Parameters:
	///	- group: UnsafeMutablePointer<GtkToolItemGroup>!
	/// - Returns: Bool
	open func getExclusive(group: UnsafeMutablePointer<GtkToolItemGroup>!) -> Bool {
		return gtk_tool_palette_get_exclusive(GTK_TOOL_PALETTE(self.GOBJECT), group) != 0 ? true : false
	}

	/// 
	/// Gets whether group should be given extra space.
	/// See gtk_tool_palette_set_expand().
	/// Parameters:
	///	- group: UnsafeMutablePointer<GtkToolItemGroup>!
	/// - Returns: Bool
	open func getExpand(group: UnsafeMutablePointer<GtkToolItemGroup>!) -> Bool {
		return gtk_tool_palette_get_expand(GTK_TOOL_PALETTE(self.GOBJECT), group) != 0 ? true : false
	}

	/// 
	/// Gets the position of @group in @palette as index.
	/// See gtk_tool_palette_set_group_position().
	/// Parameters:
	///	- group: UnsafeMutablePointer<GtkToolItemGroup>!
	/// - Returns: gint
	open func getGroupPosition(group: UnsafeMutablePointer<GtkToolItemGroup>!) -> gint {
		return gtk_tool_palette_get_group_position(GTK_TOOL_PALETTE(self.GOBJECT), group)
	}

	/// 
	/// Gets the horizontal adjustment of the tool palette.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>!
	open func getHadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_tool_palette_get_hadjustment(GTK_TOOL_PALETTE(self.GOBJECT))
	}

	/// 
	/// Gets the size of icons in the tool palette.
	/// See gtk_tool_palette_set_icon_size().
	/// - Returns: GtkIconSize
	open func getIconSize() -> GtkIconSize {
		return gtk_tool_palette_get_icon_size(GTK_TOOL_PALETTE(self.GOBJECT))
	}

	/// 
	/// Gets the style (icons, text or both) of items in the tool palette.
	/// - Returns: GtkToolbarStyle
	open func getStyle() -> GtkToolbarStyle {
		return gtk_tool_palette_get_style(GTK_TOOL_PALETTE(self.GOBJECT))
	}

	/// 
	/// Gets the vertical adjustment of the tool palette.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>!
	open func getVadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_tool_palette_get_vadjustment(GTK_TOOL_PALETTE(self.GOBJECT))
	}

	/// 
	/// Sets the tool palette as a drag source.
	/// Enables all groups and items in the tool palette as drag sources
	/// on button 1 and button 3 press with copy and move actions.
	/// See gtk_drag_source_set().
	/// Parameters:
	///	- targets: GtkToolPaletteDragTargets
	open func setDragSource(targets: GtkToolPaletteDragTargets) {
		gtk_tool_palette_set_drag_source(GTK_TOOL_PALETTE(self.GOBJECT), targets)
	}

	/// 
	/// Sets whether the group should be exclusive or not.
	/// If an exclusive group is expanded all other groups are collapsed.
	/// Parameters:
	///	- group: UnsafeMutablePointer<GtkToolItemGroup>!
	///	- exclusive: Bool
	open func setExclusive(group: UnsafeMutablePointer<GtkToolItemGroup>!, exclusive: Bool) {
		gtk_tool_palette_set_exclusive(GTK_TOOL_PALETTE(self.GOBJECT), group, exclusive ? 1 : 0)
	}

	/// 
	/// Sets whether the group should be given extra space.
	/// Parameters:
	///	- group: UnsafeMutablePointer<GtkToolItemGroup>!
	///	- expand: Bool
	open func setExpand(group: UnsafeMutablePointer<GtkToolItemGroup>!, expand: Bool) {
		gtk_tool_palette_set_expand(GTK_TOOL_PALETTE(self.GOBJECT), group, expand ? 1 : 0)
	}

	/// 
	/// Sets the position of the group as an index of the tool palette.
	/// If position is 0 the group will become the first child, if position is
	/// -1 it will become the last child.
	/// Parameters:
	///	- group: UnsafeMutablePointer<GtkToolItemGroup>!
	///	- position: gint
	open func setGroupPosition(group: UnsafeMutablePointer<GtkToolItemGroup>!, position: gint) {
		gtk_tool_palette_set_group_position(GTK_TOOL_PALETTE(self.GOBJECT), group, position)
	}

	/// 
	/// Sets the size of icons in the tool palette.
	/// Parameters:
	///	- iconSize: GtkIconSize
	open func setIconSize(_ iconSize: GtkIconSize) {
		gtk_tool_palette_set_icon_size(GTK_TOOL_PALETTE(self.GOBJECT), iconSize)
	}

	/// 
	/// Sets the style (text, icons or both) of items in the tool palette.
	/// Parameters:
	///	- style: GtkToolbarStyle
	open func setStyle(_ style: GtkToolbarStyle) {
		gtk_tool_palette_set_style(GTK_TOOL_PALETTE(self.GOBJECT), style)
	}

	/// 
	/// Unsets the tool palette icon size set with gtk_tool_palette_set_icon_size(),
	/// so that user preferences will be used to determine the icon size.
	open func unsetIconSize() {
		gtk_tool_palette_unset_icon_size(GTK_TOOL_PALETTE(self.GOBJECT))
	}

	/// 
	/// Unsets a toolbar style set with gtk_tool_palette_set_style(),
	/// so that user preferences will be used to determine the toolbar style.
	open func unsetStyle() {
		gtk_tool_palette_unset_style(GTK_TOOL_PALETTE(self.GOBJECT))
	}

}
