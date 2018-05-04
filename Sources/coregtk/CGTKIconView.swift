/*
 * CGTKIconView.swift
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

public let GTK_TYPE_ICON_VIEW: GType = gtk_icon_view_get_type()

@inline(__always) public func GTK_ICON_VIEW(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkIconView>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_ICON_VIEW)
}

/// 
/// #GtkIconView provides an alternative view on a #GtkTreeModel.
/// It displays the model as a grid of icons with labels. Like
/// #GtkTreeView, it allows to select one or multiple items
/// (depending on the selection mode, see gtk_icon_view_set_selection_mode()).
/// In addition to selection with the arrow keys, #GtkIconView supports
/// rubberband selection, which is controlled by dragging the pointer.
/// Note that if the tree model is backed by an actual tree store (as
/// opposed to a flat list where the mapping to icons is obvious),
/// #GtkIconView will only display the first level of the tree and
/// ignore the tree’s branches.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// iconview.view
/// ╰── [rubberband]
/// ]|
/// GtkIconView has a single CSS node with name iconview and style class .view.
/// For rubberband selection, a subnode with name rubberband is used.


open class CGTKIconView : CGTKContainer {
	/// 
	/// Creates a new #GtkIconView widget
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_icon_view_new())!
	}

	/// 
	/// Creates a new #GtkIconView widget using the
	/// specified @area to layout cells inside the icons.
	/// Parameters:
	///	- area: UnsafeMutablePointer<GtkCellArea>!
	/// - Returns: CGTKWidget
	public convenience init(withArea area: UnsafeMutablePointer<GtkCellArea>!) {
		self.init(withGObject: gtk_icon_view_new_with_area(area))!
	}

	/// 
	/// Creates a new #GtkIconView widget with the model @model.
	/// Parameters:
	///	- model: OpaquePointer!
	/// - Returns: CGTKWidget
	public convenience init(withModel model: OpaquePointer!) {
		self.init(withGObject: gtk_icon_view_new_with_model(model))!
	}

	open var ICONVIEW: UnsafeMutablePointer<GtkIconView>! {
		get {
			return GTK_ICON_VIEW(self.GOBJECT)
		}
	}

	/// 
	/// Converts widget coordinates to coordinates for the bin_window,
	/// as expected by e.g. gtk_icon_view_get_path_at_pos().
	/// Parameters:
	///	- wx: gint
	///	- wy: gint
	///	- bx: UnsafeMutablePointer<Int32>!
	///	- by: UnsafeMutablePointer<Int32>!
	open func convertWidgetToBinWindowCoords(wx: gint, wy: gint, bx: UnsafeMutablePointer<Int32>!, by: UnsafeMutablePointer<Int32>!) {
		gtk_icon_view_convert_widget_to_bin_window_coords(GTK_ICON_VIEW(self.GOBJECT), wx, wy, bx, by)
	}

	/// 
	/// Creates a #cairo_surface_t representation of the item at @path.
	/// This image is used for a drag icon.
	/// Parameters:
	///	- path: OpaquePointer!
	/// - Returns: OpaquePointer
	open func createDragIcon(path: OpaquePointer!) -> OpaquePointer {
		return gtk_icon_view_create_drag_icon(GTK_ICON_VIEW(self.GOBJECT), path)
	}

	/// 
	/// Turns @icon_view into a drop destination for automatic DND. Calling this
	/// method sets #GtkIconView:reorderable to %FALSE.
	/// Parameters:
	///	- targets: UnsafeMutablePointer<GtkTargetEntry>!
	///	- ntargets: gint
	///	- actions: GdkDragAction
	open func enableModelDragDest(targets: UnsafeMutablePointer<GtkTargetEntry>!, ntargets: gint, actions: GdkDragAction) {
		gtk_icon_view_enable_model_drag_dest(GTK_ICON_VIEW(self.GOBJECT), targets, ntargets, actions)
	}

	/// 
	/// Turns @icon_view into a drag source for automatic DND. Calling this
	/// method sets #GtkIconView:reorderable to %FALSE.
	/// Parameters:
	///	- startButtonMask: GdkModifierType
	///	- targets: UnsafeMutablePointer<GtkTargetEntry>!
	///	- ntargets: gint
	///	- actions: GdkDragAction
	open func enableModelDragSource(startButtonMask: GdkModifierType, targets: UnsafeMutablePointer<GtkTargetEntry>!, ntargets: gint, actions: GdkDragAction) {
		gtk_icon_view_enable_model_drag_source(GTK_ICON_VIEW(self.GOBJECT), startButtonMask, targets, ntargets, actions)
	}

	/// 
	/// Gets the setting set by gtk_icon_view_set_activate_on_single_click().
	/// - Returns: Bool
	open func getActivateOnSingleClick() -> Bool {
		return gtk_icon_view_get_activate_on_single_click(GTK_ICON_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Fills the bounding rectangle in widget coordinates for the cell specified by
	/// @path and @cell. If @cell is %NULL the main cell area is used.
	/// This function is only valid if @icon_view is realized.
	/// Parameters:
	///	- path: OpaquePointer!
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>?
	///	- rect: UnsafeMutablePointer<GdkRectangle>!
	/// - Returns: Bool
	open func getCellRect(path: OpaquePointer!, cell: UnsafeMutablePointer<GtkCellRenderer>?, rect: UnsafeMutablePointer<GdkRectangle>!) -> Bool {
		return gtk_icon_view_get_cell_rect(GTK_ICON_VIEW(self.GOBJECT), path, cell, rect) != 0 ? true : false
	}

	/// 
	/// Returns the value of the ::column-spacing property.
	/// - Returns: gint
	open func getColumnSpacing() -> gint {
		return gtk_icon_view_get_column_spacing(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Returns the value of the ::columns property.
	/// - Returns: gint
	open func getColumns() -> gint {
		return gtk_icon_view_get_columns(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Fills in @path and @cell with the current cursor path and cell.
	/// If the cursor isn’t currently set, then *@path will be %NULL.
	/// If no cell currently has focus, then *@cell will be %NULL.
	/// The returned #GtkTreePath must be freed with gtk_tree_path_free().
	/// Parameters:
	///	- path: UnsafeMutablePointer<OpaquePointer?>
	///	- cell: UnsafeMutablePointer<UnsafeMutablePointer<GtkCellRenderer>?>!
	/// - Returns: Bool
	open func getCursor(path: UnsafeMutablePointer<OpaquePointer?>, cell: UnsafeMutablePointer<UnsafeMutablePointer<GtkCellRenderer>?>!) -> Bool {
		return gtk_icon_view_get_cursor(GTK_ICON_VIEW(self.GOBJECT), path, cell) != 0 ? true : false
	}

	/// 
	/// Determines the destination item for a given position.
	/// Parameters:
	///	- dragX: gint
	///	- dragY: gint
	///	- path: UnsafeMutablePointer<OpaquePointer?>
	///	- pos: UnsafeMutablePointer<GtkIconViewDropPosition>!
	/// - Returns: Bool
	open func getDestItemAtPos(dragX: gint, dragY: gint, path: UnsafeMutablePointer<OpaquePointer?>, pos: UnsafeMutablePointer<GtkIconViewDropPosition>!) -> Bool {
		return gtk_icon_view_get_dest_item_at_pos(GTK_ICON_VIEW(self.GOBJECT), dragX, dragY, path, pos) != 0 ? true : false
	}

	/// 
	/// Gets information about the item that is highlighted for feedback.
	/// Parameters:
	///	- path: UnsafeMutablePointer<OpaquePointer?>
	///	- pos: UnsafeMutablePointer<GtkIconViewDropPosition>!
	open func getDragDestItem(path: UnsafeMutablePointer<OpaquePointer?>, pos: UnsafeMutablePointer<GtkIconViewDropPosition>!) {
		gtk_icon_view_get_drag_dest_item(GTK_ICON_VIEW(self.GOBJECT), path, pos)
	}

	/// 
	/// Finds the path at the point (@x, @y), relative to bin_window coordinates.
	/// In contrast to gtk_icon_view_get_path_at_pos(), this function also
	/// obtains the cell at the specified position. The returned path should
	/// be freed with gtk_tree_path_free().
	/// See gtk_icon_view_convert_widget_to_bin_window_coords() for converting
	/// widget coordinates to bin_window coordinates.
	/// Parameters:
	///	- x: gint
	///	- y: gint
	///	- path: UnsafeMutablePointer<OpaquePointer?>
	///	- cell: UnsafeMutablePointer<UnsafeMutablePointer<GtkCellRenderer>?>!
	/// - Returns: Bool
	open func getItemAtPos(x: gint, y: gint, path: UnsafeMutablePointer<OpaquePointer?>, cell: UnsafeMutablePointer<UnsafeMutablePointer<GtkCellRenderer>?>!) -> Bool {
		return gtk_icon_view_get_item_at_pos(GTK_ICON_VIEW(self.GOBJECT), x, y, path, cell) != 0 ? true : false
	}

	/// 
	/// Gets the column in which the item @path is currently
	/// displayed. Column numbers start at 0.
	/// Parameters:
	///	- path: OpaquePointer!
	/// - Returns: gint
	open func getItemColumn(path: OpaquePointer!) -> gint {
		return gtk_icon_view_get_item_column(GTK_ICON_VIEW(self.GOBJECT), path)
	}

	/// 
	/// Returns the value of the ::item-orientation property which determines
	/// whether the labels are drawn beside the icons instead of below.
	/// - Returns: GtkOrientation
	open func getItemOrientation() -> GtkOrientation {
		return gtk_icon_view_get_item_orientation(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Returns the value of the ::item-padding property.
	/// - Returns: gint
	open func getItemPadding() -> gint {
		return gtk_icon_view_get_item_padding(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Gets the row in which the item @path is currently
	/// displayed. Row numbers start at 0.
	/// Parameters:
	///	- path: OpaquePointer!
	/// - Returns: gint
	open func getItemRow(path: OpaquePointer!) -> gint {
		return gtk_icon_view_get_item_row(GTK_ICON_VIEW(self.GOBJECT), path)
	}

	/// 
	/// Returns the value of the ::item-width property.
	/// - Returns: gint
	open func getItemWidth() -> gint {
		return gtk_icon_view_get_item_width(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Returns the value of the ::margin property.
	/// - Returns: gint
	open func getMargin() -> gint {
		return gtk_icon_view_get_margin(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Returns the column with markup text for @icon_view.
	/// - Returns: gint
	open func getMarkupColumn() -> gint {
		return gtk_icon_view_get_markup_column(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Returns the model the #GtkIconView is based on.  Returns %NULL if the
	/// model is unset.
	/// - Returns: OpaquePointer?
	open func getModel() -> OpaquePointer? {
		return gtk_icon_view_get_model(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Finds the path at the point (@x, @y), relative to bin_window coordinates.
	/// See gtk_icon_view_get_item_at_pos(), if you are also interested in
	/// the cell at the specified position.
	/// See gtk_icon_view_convert_widget_to_bin_window_coords() for converting
	/// widget coordinates to bin_window coordinates.
	/// Parameters:
	///	- x: gint
	///	- y: gint
	/// - Returns: OpaquePointer?
	open func getPathAtPos(x: gint, y: gint) -> OpaquePointer? {
		return gtk_icon_view_get_path_at_pos(GTK_ICON_VIEW(self.GOBJECT), x, y)
	}

	/// 
	/// Returns the column with pixbufs for @icon_view.
	/// - Returns: gint
	open func getPixbufColumn() -> gint {
		return gtk_icon_view_get_pixbuf_column(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Retrieves whether the user can reorder the list via drag-and-drop.
	/// See gtk_icon_view_set_reorderable().
	/// - Returns: Bool
	open func getReorderable() -> Bool {
		return gtk_icon_view_get_reorderable(GTK_ICON_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the value of the ::row-spacing property.
	/// - Returns: gint
	open func getRowSpacing() -> gint {
		return gtk_icon_view_get_row_spacing(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Creates a list of paths of all selected items. Additionally, if you are
	/// planning on modifying the model after calling this function, you may
	/// want to convert the returned list into a list of #GtkTreeRowReferences.
	/// To do this, you can use gtk_tree_row_reference_new().
	/// To free the return value, use:
	/// |[<!-- language="C" -->
	/// g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
	/// ]|
	/// - Returns: UnsafeMutablePointer<GList>!
	open func getSelectedItems() -> UnsafeMutablePointer<GList>! {
		return gtk_icon_view_get_selected_items(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Gets the selection mode of the @icon_view.
	/// - Returns: GtkSelectionMode
	open func getSelectionMode() -> GtkSelectionMode {
		return gtk_icon_view_get_selection_mode(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Returns the value of the ::spacing property.
	/// - Returns: gint
	open func getSpacing() -> gint {
		return gtk_icon_view_get_spacing(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Returns the column with text for @icon_view.
	/// - Returns: gint
	open func getTextColumn() -> gint {
		return gtk_icon_view_get_text_column(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Returns the column of @icon_view’s model which is being used for
	/// displaying tooltips on @icon_view’s rows.
	/// - Returns: gint
	open func getTooltipColumn() -> gint {
		return gtk_icon_view_get_tooltip_column(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// This function is supposed to be used in a #GtkWidget::query-tooltip
	/// signal handler for #GtkIconView.  The @x, @y and @keyboard_tip values
	/// which are received in the signal handler, should be passed to this
	/// function without modification.
	/// The return value indicates whether there is an icon view item at the given
	/// coordinates (%TRUE) or not (%FALSE) for mouse tooltips. For keyboard
	/// tooltips the item returned will be the cursor item. When %TRUE, then any of
	/// @model, @path and @iter which have been provided will be set to point to
	/// that row and the corresponding model. @x and @y will always be converted
	/// to be relative to @icon_view’s bin_window if @keyboard_tooltip is %FALSE.
	/// Parameters:
	///	- x: UnsafeMutablePointer<Int32>!
	///	- y: UnsafeMutablePointer<Int32>!
	///	- keyboardTip: Bool
	///	- model: UnsafeMutablePointer<OpaquePointer?>
	///	- path: UnsafeMutablePointer<OpaquePointer?>
	///	- iter: UnsafeMutablePointer<GtkTreeIter>!
	/// - Returns: Bool
	open func getTooltipContext(x: UnsafeMutablePointer<Int32>!, y: UnsafeMutablePointer<Int32>!, keyboardTip: Bool, model: UnsafeMutablePointer<OpaquePointer?>, path: UnsafeMutablePointer<OpaquePointer?>, iter: UnsafeMutablePointer<GtkTreeIter>!) -> Bool {
		return gtk_icon_view_get_tooltip_context(GTK_ICON_VIEW(self.GOBJECT), x, y, keyboardTip ? 1 : 0, model, path, iter) != 0 ? true : false
	}

	/// 
	/// Sets @start_path and @end_path to be the first and last visible path.
	/// Note that there may be invisible paths in between.
	/// Both paths should be freed with gtk_tree_path_free() after use.
	/// Parameters:
	///	- startPath: UnsafeMutablePointer<OpaquePointer?>
	///	- endPath: UnsafeMutablePointer<OpaquePointer?>
	/// - Returns: Bool
	open func getVisibleRange(startPath: UnsafeMutablePointer<OpaquePointer?>, endPath: UnsafeMutablePointer<OpaquePointer?>) -> Bool {
		return gtk_icon_view_get_visible_range(GTK_ICON_VIEW(self.GOBJECT), startPath, endPath) != 0 ? true : false
	}

	/// 
	/// Activates the item determined by @path.
	/// Parameters:
	///	- path: OpaquePointer!
	open func itemActivated(path: OpaquePointer!) {
		gtk_icon_view_item_activated(GTK_ICON_VIEW(self.GOBJECT), path)
	}

	/// 
	/// Returns %TRUE if the icon pointed to by @path is currently
	/// selected. If @path does not point to a valid location, %FALSE is returned.
	/// Parameters:
	///	- path: OpaquePointer!
	/// - Returns: Bool
	open func pathIsSelected(path: OpaquePointer!) -> Bool {
		return gtk_icon_view_path_is_selected(GTK_ICON_VIEW(self.GOBJECT), path) != 0 ? true : false
	}

	/// 
	/// Moves the alignments of @icon_view to the position specified by @path.
	/// @row_align determines where the row is placed, and @col_align determines
	/// where @column is placed.  Both are expected to be between 0.0 and 1.0.
	/// 0.0 means left/top alignment, 1.0 means right/bottom alignment, 0.5 means
	/// center.
	/// If @use_align is %FALSE, then the alignment arguments are ignored, and the
	/// tree does the minimum amount of work to scroll the item onto the screen.
	/// This means that the item will be scrolled to the edge closest to its current
	/// position.  If the item is currently visible on the screen, nothing is done.
	/// This function only works if the model is set, and @path is a valid row on
	/// the model. If the model changes before the @icon_view is realized, the
	/// centered path will be modified to reflect this change.
	/// Parameters:
	///	- path: OpaquePointer!
	///	- useAlign: Bool
	///	- rowAlign: Float
	///	- colAlign: Float
	open func scrollToPath(_ path: OpaquePointer!, useAlign: Bool, rowAlign: Float, colAlign: Float) {
		gtk_icon_view_scroll_to_path(GTK_ICON_VIEW(self.GOBJECT), path, useAlign ? 1 : 0, rowAlign, colAlign)
	}

	/// 
	/// Selects all the icons. @icon_view must has its selection mode set
	/// to #GTK_SELECTION_MULTIPLE.
	open func selectAll() {
		gtk_icon_view_select_all(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Selects the row at @path.
	/// Parameters:
	///	- path: OpaquePointer!
	open func selectPath(_ path: OpaquePointer!) {
		gtk_icon_view_select_path(GTK_ICON_VIEW(self.GOBJECT), path)
	}

	/// 
	/// Calls a function for each selected icon. Note that the model or
	/// selection cannot be modified from within this function.
	/// Parameters:
	///	- function: @escaping GtkIconViewForeachFunc
	///	- data: gpointer
	open func selectedForeach(function: @escaping GtkIconViewForeachFunc, data: gpointer) {
		gtk_icon_view_selected_foreach(GTK_ICON_VIEW(self.GOBJECT), function, data)
	}

	/// 
	/// Causes the #GtkIconView::item-activated signal to be emitted on
	/// a single click instead of a double click.
	/// Parameters:
	///	- single: Bool
	open func setActivateOnSingleClick(single: Bool) {
		gtk_icon_view_set_activate_on_single_click(GTK_ICON_VIEW(self.GOBJECT), single ? 1 : 0)
	}

	/// 
	/// Sets the ::column-spacing property which specifies the space
	/// which is inserted between the columns of the icon view.
	/// Parameters:
	///	- columnSpacing: gint
	open func setColumnSpacing(_ columnSpacing: gint) {
		gtk_icon_view_set_column_spacing(GTK_ICON_VIEW(self.GOBJECT), columnSpacing)
	}

	/// 
	/// Sets the ::columns property which determines in how
	/// many columns the icons are arranged. If @columns is
	/// -1, the number of columns will be chosen automatically
	/// to fill the available area.
	/// Parameters:
	///	- columns: gint
	open func setColumns(_ columns: gint) {
		gtk_icon_view_set_columns(GTK_ICON_VIEW(self.GOBJECT), columns)
	}

	/// 
	/// Sets the current keyboard focus to be at @path, and selects it.  This is
	/// useful when you want to focus the user’s attention on a particular item.
	/// If @cell is not %NULL, then focus is given to the cell specified by
	/// it. Additionally, if @start_editing is %TRUE, then editing should be
	/// started in the specified cell.
	/// This function is often followed by `gtk_widget_grab_focus
	/// (icon_view)` in order to give keyboard focus to the widget.
	/// Please note that editing can only happen when the widget is realized.
	/// Parameters:
	///	- path: OpaquePointer!
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>?
	///	- startEditing: Bool
	open func setCursor(path: OpaquePointer!, cell: UnsafeMutablePointer<GtkCellRenderer>?, startEditing: Bool) {
		gtk_icon_view_set_cursor(GTK_ICON_VIEW(self.GOBJECT), path, cell, startEditing ? 1 : 0)
	}

	/// 
	/// Sets the item that is highlighted for feedback.
	/// Parameters:
	///	- path: OpaquePointer?
	///	- pos: GtkIconViewDropPosition
	open func setDragDestItem(path: OpaquePointer?, pos: GtkIconViewDropPosition) {
		gtk_icon_view_set_drag_dest_item(GTK_ICON_VIEW(self.GOBJECT), path, pos)
	}

	/// 
	/// Sets the ::item-orientation property which determines whether the labels
	/// are drawn beside the icons instead of below.
	/// Parameters:
	///	- orientation: GtkOrientation
	open func setItemOrientation(_ orientation: GtkOrientation) {
		gtk_icon_view_set_item_orientation(GTK_ICON_VIEW(self.GOBJECT), orientation)
	}

	/// 
	/// Sets the #GtkIconView:item-padding property which specifies the padding
	/// around each of the icon view’s items.
	/// Parameters:
	///	- itemPadding: gint
	open func setItemPadding(_ itemPadding: gint) {
		gtk_icon_view_set_item_padding(GTK_ICON_VIEW(self.GOBJECT), itemPadding)
	}

	/// 
	/// Sets the ::item-width property which specifies the width
	/// to use for each item. If it is set to -1, the icon view will
	/// automatically determine a suitable item size.
	/// Parameters:
	///	- itemWidth: gint
	open func setItemWidth(_ itemWidth: gint) {
		gtk_icon_view_set_item_width(GTK_ICON_VIEW(self.GOBJECT), itemWidth)
	}

	/// 
	/// Sets the ::margin property which specifies the space
	/// which is inserted at the top, bottom, left and right
	/// of the icon view.
	/// Parameters:
	///	- margin: gint
	open func setMargin(_ margin: gint) {
		gtk_icon_view_set_margin(GTK_ICON_VIEW(self.GOBJECT), margin)
	}

	/// 
	/// Sets the column with markup information for @icon_view to be
	/// @column. The markup column must be of type #G_TYPE_STRING.
	/// If the markup column is set to something, it overrides
	/// the text column set by gtk_icon_view_set_text_column().
	/// Parameters:
	///	- column: gint
	open func setMarkupColumn(_ column: gint) {
		gtk_icon_view_set_markup_column(GTK_ICON_VIEW(self.GOBJECT), column)
	}

	/// 
	/// Sets the model for a #GtkIconView.
	/// If the @icon_view already has a model set, it will remove
	/// it before setting the new model.  If @model is %NULL, then
	/// it will unset the old model.
	/// Parameters:
	///	- model: OpaquePointer?
	open func setModel(_ model: OpaquePointer?) {
		gtk_icon_view_set_model(GTK_ICON_VIEW(self.GOBJECT), model)
	}

	/// 
	/// Sets the column with pixbufs for @icon_view to be @column. The pixbuf
	/// column must be of type #GDK_TYPE_PIXBUF
	/// Parameters:
	///	- column: gint
	open func setPixbufColumn(_ column: gint) {
		gtk_icon_view_set_pixbuf_column(GTK_ICON_VIEW(self.GOBJECT), column)
	}

	/// 
	/// This function is a convenience function to allow you to reorder models that
	/// support the #GtkTreeDragSourceIface and the #GtkTreeDragDestIface.  Both
	/// #GtkTreeStore and #GtkListStore support these.  If @reorderable is %TRUE, then
	/// the user can reorder the model by dragging and dropping rows.  The
	/// developer can listen to these changes by connecting to the model's
	/// row_inserted and row_deleted signals. The reordering is implemented by setting up
	/// the icon view as a drag source and destination. Therefore, drag and
	/// drop can not be used in a reorderable view for any other purpose.
	/// This function does not give you any degree of control over the order -- any
	/// reordering is allowed.  If more control is needed, you should probably
	/// handle drag and drop manually.
	/// Parameters:
	///	- reorderable: Bool
	open func setReorderable(_ reorderable: Bool) {
		gtk_icon_view_set_reorderable(GTK_ICON_VIEW(self.GOBJECT), reorderable ? 1 : 0)
	}

	/// 
	/// Sets the ::row-spacing property which specifies the space
	/// which is inserted between the rows of the icon view.
	/// Parameters:
	///	- rowSpacing: gint
	open func setRowSpacing(_ rowSpacing: gint) {
		gtk_icon_view_set_row_spacing(GTK_ICON_VIEW(self.GOBJECT), rowSpacing)
	}

	/// 
	/// Sets the selection mode of the @icon_view.
	/// Parameters:
	///	- mode: GtkSelectionMode
	open func setSelectionMode(_ mode: GtkSelectionMode) {
		gtk_icon_view_set_selection_mode(GTK_ICON_VIEW(self.GOBJECT), mode)
	}

	/// 
	/// Sets the ::spacing property which specifies the space
	/// which is inserted between the cells (i.e. the icon and
	/// the text) of an item.
	/// Parameters:
	///	- spacing: gint
	open func setSpacing(_ spacing: gint) {
		gtk_icon_view_set_spacing(GTK_ICON_VIEW(self.GOBJECT), spacing)
	}

	/// 
	/// Sets the column with text for @icon_view to be @column. The text
	/// column must be of type #G_TYPE_STRING.
	/// Parameters:
	///	- column: gint
	open func setTextColumn(_ column: gint) {
		gtk_icon_view_set_text_column(GTK_ICON_VIEW(self.GOBJECT), column)
	}

	/// 
	/// Sets the tip area of @tooltip to the area which @cell occupies in
	/// the item pointed to by @path. See also gtk_tooltip_set_tip_area().
	/// See also gtk_icon_view_set_tooltip_column() for a simpler alternative.
	/// Parameters:
	///	- tooltip: OpaquePointer!
	///	- path: OpaquePointer!
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>?
	open func setTooltipCell(tooltip: OpaquePointer!, path: OpaquePointer!, cell: UnsafeMutablePointer<GtkCellRenderer>?) {
		gtk_icon_view_set_tooltip_cell(GTK_ICON_VIEW(self.GOBJECT), tooltip, path, cell)
	}

	/// 
	/// If you only plan to have simple (text-only) tooltips on full items, you
	/// can use this function to have #GtkIconView handle these automatically
	/// for you. @column should be set to the column in @icon_view’s model
	/// containing the tooltip texts, or -1 to disable this feature.
	/// When enabled, #GtkWidget:has-tooltip will be set to %TRUE and
	/// @icon_view will connect a #GtkWidget::query-tooltip signal handler.
	/// Note that the signal handler sets the text with gtk_tooltip_set_markup(),
	/// so &, <, etc have to be escaped in the text.
	/// Parameters:
	///	- column: gint
	open func setTooltipColumn(_ column: gint) {
		gtk_icon_view_set_tooltip_column(GTK_ICON_VIEW(self.GOBJECT), column)
	}

	/// 
	/// Sets the tip area of @tooltip to be the area covered by the item at @path.
	/// See also gtk_icon_view_set_tooltip_column() for a simpler alternative.
	/// See also gtk_tooltip_set_tip_area().
	/// Parameters:
	///	- tooltip: OpaquePointer!
	///	- path: OpaquePointer!
	open func setTooltipItem(tooltip: OpaquePointer!, path: OpaquePointer!) {
		gtk_icon_view_set_tooltip_item(GTK_ICON_VIEW(self.GOBJECT), tooltip, path)
	}

	/// 
	/// Unselects all the icons.
	open func unselectAll() {
		gtk_icon_view_unselect_all(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Unselects the row at @path.
	/// Parameters:
	///	- path: OpaquePointer!
	open func unselectPath(_ path: OpaquePointer!) {
		gtk_icon_view_unselect_path(GTK_ICON_VIEW(self.GOBJECT), path)
	}

	/// 
	/// Undoes the effect of gtk_icon_view_enable_model_drag_dest(). Calling this
	/// method sets #GtkIconView:reorderable to %FALSE.
	open func unsetModelDragDest() {
		gtk_icon_view_unset_model_drag_dest(GTK_ICON_VIEW(self.GOBJECT))
	}

	/// 
	/// Undoes the effect of gtk_icon_view_enable_model_drag_source(). Calling this
	/// method sets #GtkIconView:reorderable to %FALSE.
	open func unsetModelDragSource() {
		gtk_icon_view_unset_model_drag_source(GTK_ICON_VIEW(self.GOBJECT))
	}

}
