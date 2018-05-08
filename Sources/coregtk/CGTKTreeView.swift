/*
 * CGTKTreeView.swift
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

public let GTK_TYPE_TREE_VIEW: GType = gtk_tree_view_get_type()

@inline(__always) public func GTK_TREE_VIEW(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkTreeView>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TREE_VIEW)
}

/// Widget that displays any object that implements the #GtkTreeModel interface.
/// Please refer to the
/// [tree widget conceptual overview][TreeWidget]
/// for an overview of all the objects and data types related
/// to the tree widget and how they work together.
/// Several different coordinate systems are exposed in the GtkTreeView API.
/// These are:
/// ![](tree-view-coordinates.png)
/// Coordinate systems in GtkTreeView API:
/// - Widget coordinates: Coordinates relative to the widget (usually `widget->window`).
/// - Bin window coordinates: Coordinates relative to the window that GtkTreeView renders to.
/// - Tree coordinates: Coordinates relative to the entire scrollable area of GtkTreeView. These
/// coordinates start at (0, 0) for row 0 of the tree.
/// Several functions are available for converting between the different
/// coordinate systems.  The most common translations are between widget and bin
/// window coordinates and between bin window and tree coordinates. For the
/// former you can use gtk_tree_view_convert_widget_to_bin_window_coords()
/// (and vice versa), for the latter gtk_tree_view_convert_bin_window_to_tree_coords()
/// (and vice versa).
/// # GtkTreeView as GtkBuildable
/// The GtkTreeView implementation of the GtkBuildable interface accepts
/// #GtkTreeViewColumn objects as <child> elements and exposes the internal
/// #GtkTreeSelection in UI definitions.
/// An example of a UI definition fragment with GtkTreeView:
/// |[
/// <object class="GtkTreeView" id="treeview">
/// <property name="model">liststore1</property>
/// <child>
/// <object class="GtkTreeViewColumn" id="test-column">
/// <property name="title">Test</property>
/// <child>
/// <object class="GtkCellRendererText" id="test-renderer"/>
/// <attributes>
/// <attribute name="text">1</attribute>
/// </attributes>
/// </child>
/// </object>
/// </child>
/// <child internal-child="selection">
/// <object class="GtkTreeSelection" id="selection">
/// <signal name="changed" handler="on_treeview_selection_changed"/>
/// </object>
/// </child>
/// </object>
/// ]|
/// # CSS nodes
/// |[<!-- language="plain" -->
/// treeview.view
/// ├── header
/// │   ├── <column header>
/// ┊   ┊
/// │   ╰── <column header>
/// │
/// ╰── [rubberband]
/// ]|
/// GtkTreeView has a main CSS node with name treeview and style class .view.
/// It has a subnode with name header, which is the parent for all the column
/// header widgets' CSS nodes.
/// For rubberband selection, a subnode with name rubberband is used.


open class CGTKTreeView : CGTKContainer, CGTKScrollable {
	/// Creates a new #GtkTreeView widget.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_tree_view_new())!
	}

	/// Creates a new #GtkTreeView widget with the model initialized to @model.
	/// - Parameters:
	///	- model: OpaquePointer! (GtkTreeModel*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withModel model: OpaquePointer!) {
		self.init(withGObject: gtk_tree_view_new_with_model(model))!
	}

	open var TREEVIEW: UnsafeMutablePointer<GtkTreeView>! {
		get {
			return GTK_TREE_VIEW(self.GOBJECT)
		}
	}

	/// Appends @column to the list of columns. If @tree_view has “fixed_height”
	/// mode enabled, then @column must have its “sizing” property set to be
	/// GTK_TREE_VIEW_COLUMN_FIXED.
	/// - Parameters:
	///	- column: UnsafeMutablePointer<GtkTreeViewColumn>! (GtkTreeViewColumn*)
	/// - Returns: gint (gint)
	open func appendColumn(_ column: UnsafeMutablePointer<GtkTreeViewColumn>!) -> gint {
		return gtk_tree_view_append_column(GTK_TREE_VIEW(self.GOBJECT), column)
	}

	/// Recursively collapses all visible, expanded nodes in @tree_view.
	open func collapseAll() -> Swift.Void {
		gtk_tree_view_collapse_all(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Collapses a row (hides its child rows, if they exist).
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	/// - Returns: Bool (gboolean)
	open func collapseRow(path: OpaquePointer!) -> Bool {
		return gtk_tree_view_collapse_row(GTK_TREE_VIEW(self.GOBJECT), path) != 0 ? true : false
	}

	/// Resizes all columns to their optimal width. Only works after the
	/// treeview has been realized.
	open func columnsAutosize() -> Swift.Void {
		gtk_tree_view_columns_autosize(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Converts bin_window coordinates to coordinates for the
	/// tree (the full scrollable area of the tree).
	/// - Parameters:
	///	- bx: gint (gint)
	///	- by: gint (gint)
	///	- tx: UnsafeMutablePointer<Int32>! (gint*)
	///	- ty: UnsafeMutablePointer<Int32>! (gint*)
	open func convertBinWindowToTreeCoords(bx: gint, by: gint, tx: UnsafeMutablePointer<Int32>!, ty: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_tree_view_convert_bin_window_to_tree_coords(GTK_TREE_VIEW(self.GOBJECT), bx, by, tx, ty)
	}

	/// Converts bin_window coordinates (see gtk_tree_view_get_bin_window())
	/// to widget relative coordinates.
	/// - Parameters:
	///	- bx: gint (gint)
	///	- by: gint (gint)
	///	- wx: UnsafeMutablePointer<Int32>! (gint*)
	///	- wy: UnsafeMutablePointer<Int32>! (gint*)
	open func convertBinWindowToWidgetCoords(bx: gint, by: gint, wx: UnsafeMutablePointer<Int32>!, wy: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_tree_view_convert_bin_window_to_widget_coords(GTK_TREE_VIEW(self.GOBJECT), bx, by, wx, wy)
	}

	/// Converts tree coordinates (coordinates in full scrollable area of the tree)
	/// to bin_window coordinates.
	/// - Parameters:
	///	- tx: gint (gint)
	///	- ty: gint (gint)
	///	- bx: UnsafeMutablePointer<Int32>! (gint*)
	///	- by: UnsafeMutablePointer<Int32>! (gint*)
	open func convertTreeToBinWindowCoords(tx: gint, ty: gint, bx: UnsafeMutablePointer<Int32>!, by: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_tree_view_convert_tree_to_bin_window_coords(GTK_TREE_VIEW(self.GOBJECT), tx, ty, bx, by)
	}

	/// Converts tree coordinates (coordinates in full scrollable area of the tree)
	/// to widget coordinates.
	/// - Parameters:
	///	- tx: gint (gint)
	///	- ty: gint (gint)
	///	- wx: UnsafeMutablePointer<Int32>! (gint*)
	///	- wy: UnsafeMutablePointer<Int32>! (gint*)
	open func convertTreeToWidgetCoords(tx: gint, ty: gint, wx: UnsafeMutablePointer<Int32>!, wy: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_tree_view_convert_tree_to_widget_coords(GTK_TREE_VIEW(self.GOBJECT), tx, ty, wx, wy)
	}

	/// Converts widget coordinates to coordinates for the bin_window
	/// (see gtk_tree_view_get_bin_window()).
	/// - Parameters:
	///	- wx: gint (gint)
	///	- wy: gint (gint)
	///	- bx: UnsafeMutablePointer<Int32>! (gint*)
	///	- by: UnsafeMutablePointer<Int32>! (gint*)
	open func convertWidgetToBinWindowCoords(wx: gint, wy: gint, bx: UnsafeMutablePointer<Int32>!, by: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_tree_view_convert_widget_to_bin_window_coords(GTK_TREE_VIEW(self.GOBJECT), wx, wy, bx, by)
	}

	/// Converts widget coordinates to coordinates for the
	/// tree (the full scrollable area of the tree).
	/// - Parameters:
	///	- wx: gint (gint)
	///	- wy: gint (gint)
	///	- tx: UnsafeMutablePointer<Int32>! (gint*)
	///	- ty: UnsafeMutablePointer<Int32>! (gint*)
	open func convertWidgetToTreeCoords(wx: gint, wy: gint, tx: UnsafeMutablePointer<Int32>!, ty: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_tree_view_convert_widget_to_tree_coords(GTK_TREE_VIEW(self.GOBJECT), wx, wy, tx, ty)
	}

	/// Creates a #cairo_surface_t representation of the row at @path.
	/// This image is used for a drag icon.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	/// - Returns: OpaquePointer (cairo_surface_t*)
	open func createRowDragIcon(path: OpaquePointer!) -> OpaquePointer {
		return gtk_tree_view_create_row_drag_icon(GTK_TREE_VIEW(self.GOBJECT), path)
	}

	/// Turns @tree_view into a drop destination for automatic DND. Calling
	/// this method sets #GtkTreeView:reorderable to %FALSE.
	/// - Parameters:
	///	- targets: UnsafeMutablePointer<GtkTargetEntry>! (GtkTargetEntry*)
	///	- ntargets: gint (gint)
	///	- actions: GdkDragAction (GdkDragAction)
	open func enableModelDragDest(targets: UnsafeMutablePointer<GtkTargetEntry>!, ntargets: gint, actions: GdkDragAction) -> Swift.Void {
		gtk_tree_view_enable_model_drag_dest(GTK_TREE_VIEW(self.GOBJECT), targets, ntargets, actions)
	}

	/// Turns @tree_view into a drag source for automatic DND. Calling this
	/// method sets #GtkTreeView:reorderable to %FALSE.
	/// - Parameters:
	///	- startButtonMask: GdkModifierType (GdkModifierType)
	///	- targets: UnsafeMutablePointer<GtkTargetEntry>! (GtkTargetEntry*)
	///	- ntargets: gint (gint)
	///	- actions: GdkDragAction (GdkDragAction)
	open func enableModelDragSource(startButtonMask: GdkModifierType, targets: UnsafeMutablePointer<GtkTargetEntry>!, ntargets: gint, actions: GdkDragAction) -> Swift.Void {
		gtk_tree_view_enable_model_drag_source(GTK_TREE_VIEW(self.GOBJECT), startButtonMask, targets, ntargets, actions)
	}

	/// Recursively expands all nodes in the @tree_view.
	open func expandAll() -> Swift.Void {
		gtk_tree_view_expand_all(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Opens the row so its children are visible.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	///	- openAll: Bool (gboolean)
	/// - Returns: Bool (gboolean)
	open func expandRow(path: OpaquePointer!, openAll: Bool) -> Bool {
		return gtk_tree_view_expand_row(GTK_TREE_VIEW(self.GOBJECT), path, openAll ? 1 : 0) != 0 ? true : false
	}

	/// Expands the row at @path. This will also expand all parent rows of
	/// @path as necessary.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	open func expandToPath(_ path: OpaquePointer!) -> Swift.Void {
		gtk_tree_view_expand_to_path(GTK_TREE_VIEW(self.GOBJECT), path)
	}

	/// Gets the setting set by gtk_tree_view_set_activate_on_single_click().
	/// - Returns: Bool (gboolean)
	open func getActivateOnSingleClick() -> Bool {
		return gtk_tree_view_get_activate_on_single_click(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Fills the bounding rectangle in bin_window coordinates for the cell at the
	/// row specified by @path and the column specified by @column.  If @path is
	/// %NULL, or points to a node not found in the tree, the @y and @height fields of
	/// the rectangle will be filled with 0. If @column is %NULL, the @x and @width
	/// fields will be filled with 0.  The returned rectangle is equivalent to the
	/// @background_area passed to gtk_cell_renderer_render().  These background
	/// areas tile to cover the entire bin window.  Contrast with the @cell_area,
	/// returned by gtk_tree_view_get_cell_area(), which returns only the cell
	/// itself, excluding surrounding borders and the tree expander area.
	/// - Parameters:
	///	- path: OpaquePointer? (GtkTreePath*)
	///	- column: UnsafeMutablePointer<GtkTreeViewColumn>? (GtkTreeViewColumn*)
	///	- rect: UnsafeMutablePointer<GdkRectangle>! (GdkRectangle*)
	open func getBackgroundArea(path: OpaquePointer?, column: UnsafeMutablePointer<GtkTreeViewColumn>?, rect: UnsafeMutablePointer<GdkRectangle>!) -> Swift.Void {
		gtk_tree_view_get_background_area(GTK_TREE_VIEW(self.GOBJECT), path, column, rect)
	}

	/// Returns the window that @tree_view renders to.
	/// This is used primarily to compare to `event->window`
	/// to confirm that the event on @tree_view is on the right window.
	/// - Returns: OpaquePointer? (GdkWindow*)
	open func getBinWindow() -> OpaquePointer? {
		return gtk_tree_view_get_bin_window(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Fills the bounding rectangle in bin_window coordinates for the cell at the
	/// row specified by @path and the column specified by @column.  If @path is
	/// %NULL, or points to a path not currently displayed, the @y and @height fields
	/// of the rectangle will be filled with 0. If @column is %NULL, the @x and @width
	/// fields will be filled with 0.  The sum of all cell rects does not cover the
	/// entire tree; there are extra pixels in between rows, for example. The
	/// returned rectangle is equivalent to the @cell_area passed to
	/// gtk_cell_renderer_render().  This function is only valid if @tree_view is
	/// realized.
	/// - Parameters:
	///	- path: OpaquePointer? (GtkTreePath*)
	///	- column: UnsafeMutablePointer<GtkTreeViewColumn>? (GtkTreeViewColumn*)
	///	- rect: UnsafeMutablePointer<GdkRectangle>! (GdkRectangle*)
	open func getCellArea(path: OpaquePointer?, column: UnsafeMutablePointer<GtkTreeViewColumn>?, rect: UnsafeMutablePointer<GdkRectangle>!) -> Swift.Void {
		gtk_tree_view_get_cell_area(GTK_TREE_VIEW(self.GOBJECT), path, column, rect)
	}

	/// Gets the #GtkTreeViewColumn at the given position in the #tree_view.
	/// - Parameters:
	///	- n: gint (gint)
	/// - Returns: UnsafeMutablePointer<GtkTreeViewColumn>? (GtkTreeViewColumn*)
	open func getColumn(n: gint) -> UnsafeMutablePointer<GtkTreeViewColumn>? {
		return gtk_tree_view_get_column(GTK_TREE_VIEW(self.GOBJECT), n)
	}

	/// Returns a #GList of all the #GtkTreeViewColumn s currently in @tree_view.
	/// The returned list must be freed with g_list_free ().
	/// - Returns: UnsafeMutablePointer<GList>! (GList*)
	open func getColumns() -> UnsafeMutablePointer<GList>! {
		return gtk_tree_view_get_columns(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Fills in @path and @focus_column with the current path and focus column.  If
	/// the cursor isn’t currently set, then *@path will be %NULL.  If no column
	/// currently has focus, then *@focus_column will be %NULL.
	/// The returned #GtkTreePath must be freed with gtk_tree_path_free() when
	/// you are done with it.
	/// - Parameters:
	///	- path: UnsafeMutablePointer<OpaquePointer?>? = nil (GtkTreePath**)
	///	- focusColumn: UnsafeMutablePointer<UnsafeMutablePointer<GtkTreeViewColumn>?>? = nil (GtkTreeViewColumn**)
	open func getCursor(path: UnsafeMutablePointer<OpaquePointer?>? = nil, focusColumn: UnsafeMutablePointer<UnsafeMutablePointer<GtkTreeViewColumn>?>? = nil) -> Swift.Void {
		gtk_tree_view_get_cursor(GTK_TREE_VIEW(self.GOBJECT), path, focusColumn)
	}

	/// Determines the destination row for a given position.  @drag_x and
	/// @drag_y are expected to be in widget coordinates.  This function is only
	/// meaningful if @tree_view is realized.  Therefore this function will always
	/// return %FALSE if @tree_view is not realized or does not have a model.
	/// - Parameters:
	///	- dragX: gint (gint)
	///	- dragY: gint (gint)
	///	- path: UnsafeMutablePointer<OpaquePointer?>? = nil (GtkTreePath**)
	///	- pos: UnsafeMutablePointer<GtkTreeViewDropPosition>? = nil (GtkTreeViewDropPosition*)
	/// - Returns: Bool (gboolean)
	open func getDestRowAtPos(dragX: gint, dragY: gint, path: UnsafeMutablePointer<OpaquePointer?>? = nil, pos: UnsafeMutablePointer<GtkTreeViewDropPosition>? = nil) -> Bool {
		return gtk_tree_view_get_dest_row_at_pos(GTK_TREE_VIEW(self.GOBJECT), dragX, dragY, path, pos) != 0 ? true : false
	}

	/// Gets information about the row that is highlighted for feedback.
	/// - Parameters:
	///	- path: UnsafeMutablePointer<OpaquePointer?>? = nil (GtkTreePath**)
	///	- pos: UnsafeMutablePointer<GtkTreeViewDropPosition>? = nil (GtkTreeViewDropPosition*)
	open func getDragDestRow(path: UnsafeMutablePointer<OpaquePointer?>? = nil, pos: UnsafeMutablePointer<GtkTreeViewDropPosition>? = nil) -> Swift.Void {
		gtk_tree_view_get_drag_dest_row(GTK_TREE_VIEW(self.GOBJECT), path, pos)
	}

	/// Returns whether or not the tree allows to start interactive searching
	/// by typing in text.
	/// - Returns: Bool (gboolean)
	open func getEnableSearch() -> Bool {
		return gtk_tree_view_get_enable_search(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether or not tree lines are drawn in @tree_view.
	/// - Returns: Bool (gboolean)
	open func getEnableTreeLines() -> Bool {
		return gtk_tree_view_get_enable_tree_lines(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the column that is the current expander column.
	/// This column has the expander arrow drawn next to it.
	/// - Returns: UnsafeMutablePointer<GtkTreeViewColumn>! (GtkTreeViewColumn*)
	open func getExpanderColumn() -> UnsafeMutablePointer<GtkTreeViewColumn>! {
		return gtk_tree_view_get_expander_column(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Returns whether fixed height mode is turned on for @tree_view.
	/// - Returns: Bool (gboolean)
	open func getFixedHeightMode() -> Bool {
		return gtk_tree_view_get_fixed_height_mode(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns which grid lines are enabled in @tree_view.
	/// - Returns: GtkTreeViewGridLines (GtkTreeViewGridLines)
	open func getGridLines() -> GtkTreeViewGridLines {
		return gtk_tree_view_get_grid_lines(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Gets the #GtkAdjustment currently being used for the horizontal aspect.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func getHadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_tree_view_get_hadjustment(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Returns whether all header columns are clickable.
	/// - Returns: Bool (gboolean)
	open func getHeadersClickable() -> Bool {
		return gtk_tree_view_get_headers_clickable(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns %TRUE if the headers on the @tree_view are visible.
	/// - Returns: Bool (gboolean)
	open func getHeadersVisible() -> Bool {
		return gtk_tree_view_get_headers_visible(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether hover expansion mode is turned on for @tree_view.
	/// - Returns: Bool (gboolean)
	open func getHoverExpand() -> Bool {
		return gtk_tree_view_get_hover_expand(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether hover selection mode is turned on for @tree_view.
	/// - Returns: Bool (gboolean)
	open func getHoverSelection() -> Bool {
		return gtk_tree_view_get_hover_selection(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the amount, in pixels, of extra indentation for child levels
	/// in @tree_view.
	/// - Returns: gint (gint)
	open func getLevelIndentation() -> gint {
		return gtk_tree_view_get_level_indentation(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Returns the model the #GtkTreeView is based on.  Returns %NULL if the
	/// model is unset.
	/// - Returns: OpaquePointer? (GtkTreeModel*)
	open func getModel() -> OpaquePointer? {
		return gtk_tree_view_get_model(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Queries the number of columns in the given @tree_view.
	/// - Returns: guint (guint)
	open func getNcolumns() -> guint {
		return gtk_tree_view_get_n_columns(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Finds the path at the point (@x, @y), relative to bin_window coordinates
	/// (please see gtk_tree_view_get_bin_window()).
	/// That is, @x and @y are relative to an events coordinates. @x and @y must
	/// come from an event on the @tree_view only where `event->window ==
	/// gtk_tree_view_get_bin_window ()`. It is primarily for
	/// things like popup menus. If @path is non-%NULL, then it will be filled
	/// with the #GtkTreePath at that point.  This path should be freed with
	/// gtk_tree_path_free().  If @column is non-%NULL, then it will be filled
	/// with the column at that point.  @cell_x and @cell_y return the coordinates
	/// relative to the cell background (i.e. the @background_area passed to
	/// gtk_cell_renderer_render()).  This function is only meaningful if
	/// @tree_view is realized.  Therefore this function will always return %FALSE
	/// if @tree_view is not realized or does not have a model.
	/// For converting widget coordinates (eg. the ones you get from
	/// GtkWidget::query-tooltip), please see
	/// gtk_tree_view_convert_widget_to_bin_window_coords().
	/// - Parameters:
	///	- x: gint (gint)
	///	- y: gint (gint)
	///	- path: UnsafeMutablePointer<OpaquePointer?>? = nil (GtkTreePath**)
	///	- column: UnsafeMutablePointer<UnsafeMutablePointer<GtkTreeViewColumn>?>? = nil (GtkTreeViewColumn**)
	///	- cellX: UnsafeMutablePointer<Int32>! (gint*)
	///	- cellY: UnsafeMutablePointer<Int32>! (gint*)
	/// - Returns: Bool (gboolean)
	open func getPathAtPos(x: gint, y: gint, path: UnsafeMutablePointer<OpaquePointer?>? = nil, column: UnsafeMutablePointer<UnsafeMutablePointer<GtkTreeViewColumn>?>? = nil, cellX: UnsafeMutablePointer<Int32>!, cellY: UnsafeMutablePointer<Int32>!) -> Bool {
		return gtk_tree_view_get_path_at_pos(GTK_TREE_VIEW(self.GOBJECT), x, y, path, column, cellX, cellY) != 0 ? true : false
	}

	/// Retrieves whether the user can reorder the tree via drag-and-drop. See
	/// gtk_tree_view_set_reorderable().
	/// - Returns: Bool (gboolean)
	open func getReorderable() -> Bool {
		return gtk_tree_view_get_reorderable(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the current row separator function.
	/// - Returns: GtkTreeViewRowSeparatorFunc (GtkTreeViewRowSeparatorFunc)
	open func getRowSeparatorFunc() -> GtkTreeViewRowSeparatorFunc {
		return gtk_tree_view_get_row_separator_func(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Returns whether rubber banding is turned on for @tree_view.  If the
	/// selection mode is #GTK_SELECTION_MULTIPLE, rubber banding will allow the
	/// user to select multiple rows by dragging the mouse.
	/// - Returns: Bool (gboolean)
	open func getRubberBanding() -> Bool {
		return gtk_tree_view_get_rubber_banding(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the setting set by gtk_tree_view_set_rules_hint().
	/// - Returns: Bool (gboolean)
	open func getRulesHint() -> Bool {
		return gtk_tree_view_get_rules_hint(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the column searched on by the interactive search code.
	/// - Returns: gint (gint)
	open func getSearchColumn() -> gint {
		return gtk_tree_view_get_search_column(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Returns the #GtkEntry which is currently in use as interactive search
	/// entry for @tree_view.  In case the built-in entry is being used, %NULL
	/// will be returned.
	/// - Returns: UnsafeMutablePointer<GtkEntry>! (GtkEntry*)
	open func getSearchEntry() -> UnsafeMutablePointer<GtkEntry>! {
		return gtk_tree_view_get_search_entry(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Returns the compare function currently in use.
	/// - Returns: GtkTreeViewSearchEqualFunc (GtkTreeViewSearchEqualFunc)
	open func getSearchEqualFunc() -> GtkTreeViewSearchEqualFunc {
		return gtk_tree_view_get_search_equal_func(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Returns the positioning function currently in use.
	/// - Returns: GtkTreeViewSearchPositionFunc (GtkTreeViewSearchPositionFunc)
	open func getSearchPositionFunc() -> GtkTreeViewSearchPositionFunc {
		return gtk_tree_view_get_search_position_func(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Gets the #GtkTreeSelection associated with @tree_view.
	/// - Returns: UnsafeMutablePointer<GtkTreeSelection>! (GtkTreeSelection*)
	open func getSelection() -> UnsafeMutablePointer<GtkTreeSelection>! {
		return gtk_tree_view_get_selection(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Returns whether or not expanders are drawn in @tree_view.
	/// - Returns: Bool (gboolean)
	open func getShowExpanders() -> Bool {
		return gtk_tree_view_get_show_expanders(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the column of @tree_view’s model which is being used for
	/// displaying tooltips on @tree_view’s rows.
	/// - Returns: gint (gint)
	open func getTooltipColumn() -> gint {
		return gtk_tree_view_get_tooltip_column(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// This function is supposed to be used in a #GtkWidget::query-tooltip
	/// signal handler for #GtkTreeView.  The @x, @y and @keyboard_tip values
	/// which are received in the signal handler, should be passed to this
	/// function without modification.
	/// The return value indicates whether there is a tree view row at the given
	/// coordinates (%TRUE) or not (%FALSE) for mouse tooltips.  For keyboard
	/// tooltips the row returned will be the cursor row.  When %TRUE, then any of
	/// @model, @path and @iter which have been provided will be set to point to
	/// that row and the corresponding model.  @x and @y will always be converted
	/// to be relative to @tree_view’s bin_window if @keyboard_tooltip is %FALSE.
	/// - Parameters:
	///	- x: UnsafeMutablePointer<Int32>! (gint*)
	///	- y: UnsafeMutablePointer<Int32>! (gint*)
	///	- keyboardTip: Bool (gboolean)
	///	- model: UnsafeMutablePointer<OpaquePointer?>? = nil (GtkTreeModel**)
	///	- path: UnsafeMutablePointer<OpaquePointer?>? = nil (GtkTreePath**)
	///	- iter: UnsafeMutablePointer<GtkTreeIter>? = nil (GtkTreeIter*)
	/// - Returns: Bool (gboolean)
	open func getTooltipContext(x: UnsafeMutablePointer<Int32>!, y: UnsafeMutablePointer<Int32>!, keyboardTip: Bool, model: UnsafeMutablePointer<OpaquePointer?>? = nil, path: UnsafeMutablePointer<OpaquePointer?>? = nil, iter: UnsafeMutablePointer<GtkTreeIter>? = nil) -> Bool {
		return gtk_tree_view_get_tooltip_context(GTK_TREE_VIEW(self.GOBJECT), x, y, keyboardTip ? 1 : 0, model, path, iter) != 0 ? true : false
	}

	/// Gets the #GtkAdjustment currently being used for the vertical aspect.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func getVadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_tree_view_get_vadjustment(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Sets @start_path and @end_path to be the first and last visible path.
	/// Note that there may be invisible paths in between.
	/// The paths should be freed with gtk_tree_path_free() after use.
	/// - Parameters:
	///	- startPath: UnsafeMutablePointer<OpaquePointer?>? = nil (GtkTreePath**)
	///	- endPath: UnsafeMutablePointer<OpaquePointer?>? = nil (GtkTreePath**)
	/// - Returns: Bool (gboolean)
	open func getVisibleRange(startPath: UnsafeMutablePointer<OpaquePointer?>? = nil, endPath: UnsafeMutablePointer<OpaquePointer?>? = nil) -> Bool {
		return gtk_tree_view_get_visible_range(GTK_TREE_VIEW(self.GOBJECT), startPath, endPath) != 0 ? true : false
	}

	/// Fills @visible_rect with the currently-visible region of the
	/// buffer, in tree coordinates. Convert to bin_window coordinates with
	/// gtk_tree_view_convert_tree_to_bin_window_coords().
	/// Tree coordinates start at 0,0 for row 0 of the tree, and cover the entire
	/// scrollable area of the tree.
	/// - Parameters:
	///	- visibleRect: UnsafeMutablePointer<GdkRectangle>! (GdkRectangle*)
	open func getVisibleRect(_ visibleRect: UnsafeMutablePointer<GdkRectangle>!) -> Swift.Void {
		gtk_tree_view_get_visible_rect(GTK_TREE_VIEW(self.GOBJECT), visibleRect)
	}

	/// This inserts the @column into the @tree_view at @position.  If @position is
	/// -1, then the column is inserted at the end. If @tree_view has
	/// “fixed_height” mode enabled, then @column must have its “sizing” property
	/// set to be GTK_TREE_VIEW_COLUMN_FIXED.
	/// - Parameters:
	///	- column: UnsafeMutablePointer<GtkTreeViewColumn>! (GtkTreeViewColumn*)
	///	- position: gint (gint)
	/// - Returns: gint (gint)
	open func insertColumn(_ column: UnsafeMutablePointer<GtkTreeViewColumn>!, position: gint) -> gint {
		return gtk_tree_view_insert_column(GTK_TREE_VIEW(self.GOBJECT), column, position)
	}

	/// Convenience function that inserts a new column into the #GtkTreeView
	/// with the given cell renderer and a #GtkTreeCellDataFunc to set cell renderer
	/// attributes (normally using data from the model). See also
	/// gtk_tree_view_column_set_cell_data_func(), gtk_tree_view_column_pack_start().
	/// If @tree_view has “fixed_height” mode enabled, then the new column will have its
	/// “sizing” property set to be GTK_TREE_VIEW_COLUMN_FIXED.
	/// - Parameters:
	///	- position: gint (gint)
	///	- title: String (const gchar*)
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- function: @escaping GtkTreeCellDataFunc (GtkTreeCellDataFunc)
	///	- data: gpointer? (gpointer)
	///	- dnotify: @escaping GDestroyNotify (GDestroyNotify)
	/// - Returns: gint (gint)
	open func insertColumnWithDataFunc(position: gint, title: String, cell: UnsafeMutablePointer<GtkCellRenderer>!, function: @escaping GtkTreeCellDataFunc, data: gpointer?, dnotify: @escaping GDestroyNotify) -> gint {
		return gtk_tree_view_insert_column_with_data_func(GTK_TREE_VIEW(self.GOBJECT), position, title, cell, function, data, dnotify)
	}

	/// Determine whether the point (@x, @y) in @tree_view is blank, that is no
	/// cell content nor an expander arrow is drawn at the location. If so, the
	/// location can be considered as the background. You might wish to take
	/// special action on clicks on the background, such as clearing a current
	/// selection, having a custom context menu or starting rubber banding.
	/// The @x and @y coordinate that are provided must be relative to bin_window
	/// coordinates.  That is, @x and @y must come from an event on @tree_view
	/// where `event->window == gtk_tree_view_get_bin_window ()`.
	/// For converting widget coordinates (eg. the ones you get from
	/// GtkWidget::query-tooltip), please see
	/// gtk_tree_view_convert_widget_to_bin_window_coords().
	/// The @path, @column, @cell_x and @cell_y arguments will be filled in
	/// likewise as for gtk_tree_view_get_path_at_pos().  Please see
	/// gtk_tree_view_get_path_at_pos() for more information.
	/// - Parameters:
	///	- x: gint (gint)
	///	- y: gint (gint)
	///	- path: UnsafeMutablePointer<OpaquePointer?>? = nil (GtkTreePath**)
	///	- column: UnsafeMutablePointer<UnsafeMutablePointer<GtkTreeViewColumn>?>? = nil (GtkTreeViewColumn**)
	///	- cellX: UnsafeMutablePointer<Int32>! (gint*)
	///	- cellY: UnsafeMutablePointer<Int32>! (gint*)
	/// - Returns: Bool (gboolean)
	open func isBlankAtPos(x: gint, y: gint, path: UnsafeMutablePointer<OpaquePointer?>? = nil, column: UnsafeMutablePointer<UnsafeMutablePointer<GtkTreeViewColumn>?>? = nil, cellX: UnsafeMutablePointer<Int32>!, cellY: UnsafeMutablePointer<Int32>!) -> Bool {
		return gtk_tree_view_is_blank_at_pos(GTK_TREE_VIEW(self.GOBJECT), x, y, path, column, cellX, cellY) != 0 ? true : false
	}

	/// Returns whether a rubber banding operation is currently being done
	/// in @tree_view.
	/// - Returns: Bool (gboolean)
	open func isRubberBandingActive() -> Bool {
		return gtk_tree_view_is_rubber_banding_active(GTK_TREE_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Calls @func on all expanded rows.
	/// - Parameters:
	///	- function: @escaping GtkTreeViewMappingFunc (GtkTreeViewMappingFunc)
	///	- data: gpointer? (gpointer)
	open func mapExpandedRows(function: @escaping GtkTreeViewMappingFunc, data: gpointer?) -> Swift.Void {
		gtk_tree_view_map_expanded_rows(GTK_TREE_VIEW(self.GOBJECT), function, data)
	}

	/// Moves @column to be after to @base_column.  If @base_column is %NULL, then
	/// @column is placed in the first position.
	/// - Parameters:
	///	- column: UnsafeMutablePointer<GtkTreeViewColumn>! (GtkTreeViewColumn*)
	///	- baseColumn: UnsafeMutablePointer<GtkTreeViewColumn>? (GtkTreeViewColumn*)
	open func moveColumnAfter(column: UnsafeMutablePointer<GtkTreeViewColumn>!, baseColumn: UnsafeMutablePointer<GtkTreeViewColumn>?) -> Swift.Void {
		gtk_tree_view_move_column_after(GTK_TREE_VIEW(self.GOBJECT), column, baseColumn)
	}

	/// Removes @column from @tree_view.
	/// - Parameters:
	///	- column: UnsafeMutablePointer<GtkTreeViewColumn>! (GtkTreeViewColumn*)
	/// - Returns: gint (gint)
	open func removeColumn(_ column: UnsafeMutablePointer<GtkTreeViewColumn>!) -> gint {
		return gtk_tree_view_remove_column(GTK_TREE_VIEW(self.GOBJECT), column)
	}

	/// Activates the cell determined by @path and @column.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	///	- column: UnsafeMutablePointer<GtkTreeViewColumn>! (GtkTreeViewColumn*)
	open func rowActivated(path: OpaquePointer!, column: UnsafeMutablePointer<GtkTreeViewColumn>!) -> Swift.Void {
		gtk_tree_view_row_activated(GTK_TREE_VIEW(self.GOBJECT), path, column)
	}

	/// Returns %TRUE if the node pointed to by @path is expanded in @tree_view.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	/// - Returns: Bool (gboolean)
	open func rowExpanded(path: OpaquePointer!) -> Bool {
		return gtk_tree_view_row_expanded(GTK_TREE_VIEW(self.GOBJECT), path) != 0 ? true : false
	}

	/// Moves the alignments of @tree_view to the position specified by @column and
	/// @path.  If @column is %NULL, then no horizontal scrolling occurs.  Likewise,
	/// if @path is %NULL no vertical scrolling occurs.  At a minimum, one of @column
	/// or @path need to be non-%NULL.  @row_align determines where the row is
	/// placed, and @col_align determines where @column is placed.  Both are expected
	/// to be between 0.0 and 1.0. 0.0 means left/top alignment, 1.0 means
	/// right/bottom alignment, 0.5 means center.
	/// If @use_align is %FALSE, then the alignment arguments are ignored, and the
	/// tree does the minimum amount of work to scroll the cell onto the screen.
	/// This means that the cell will be scrolled to the edge closest to its current
	/// position.  If the cell is currently visible on the screen, nothing is done.
	/// This function only works if the model is set, and @path is a valid row on the
	/// model.  If the model changes before the @tree_view is realized, the centered
	/// path will be modified to reflect this change.
	/// - Parameters:
	///	- path: OpaquePointer? (GtkTreePath*)
	///	- column: UnsafeMutablePointer<GtkTreeViewColumn>? (GtkTreeViewColumn*)
	///	- useAlign: Bool (gboolean)
	///	- rowAlign: Float (gfloat)
	///	- colAlign: Float (gfloat)
	open func scrollToCell(path: OpaquePointer?, column: UnsafeMutablePointer<GtkTreeViewColumn>?, useAlign: Bool, rowAlign: Float, colAlign: Float) -> Swift.Void {
		gtk_tree_view_scroll_to_cell(GTK_TREE_VIEW(self.GOBJECT), path, column, useAlign ? 1 : 0, rowAlign, colAlign)
	}

	/// Scrolls the tree view such that the top-left corner of the visible
	/// area is @tree_x, @tree_y, where @tree_x and @tree_y are specified
	/// in tree coordinates.  The @tree_view must be realized before
	/// this function is called.  If it isn't, you probably want to be
	/// using gtk_tree_view_scroll_to_cell().
	/// If either @tree_x or @tree_y are -1, then that direction isn’t scrolled.
	/// - Parameters:
	///	- treeX: gint (gint)
	///	- treeY: gint (gint)
	open func scrollToPoint(treeX: gint, treeY: gint) -> Swift.Void {
		gtk_tree_view_scroll_to_point(GTK_TREE_VIEW(self.GOBJECT), treeX, treeY)
	}

	/// Cause the #GtkTreeView::row-activated signal to be emitted
	/// on a single click instead of a double click.
	/// - Parameters:
	///	- single: Bool (gboolean)
	open func setActivateOnSingleClick(single: Bool) -> Swift.Void {
		gtk_tree_view_set_activate_on_single_click(GTK_TREE_VIEW(self.GOBJECT), single ? 1 : 0)
	}

	/// Sets a user function for determining where a column may be dropped when
	/// dragged.  This function is called on every column pair in turn at the
	/// beginning of a column drag to determine where a drop can take place.  The
	/// arguments passed to @func are: the @tree_view, the #GtkTreeViewColumn being
	/// dragged, the two #GtkTreeViewColumn s determining the drop spot, and
	/// @user_data.  If either of the #GtkTreeViewColumn arguments for the drop spot
	/// are %NULL, then they indicate an edge.  If @func is set to be %NULL, then
	/// @tree_view reverts to the default behavior of allowing all columns to be
	/// dropped everywhere.
	/// - Parameters:
	///	- function: @escaping GtkTreeViewColumnDropFunc (GtkTreeViewColumnDropFunc)
	///	- userData: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setColumnDragFunction(function: @escaping GtkTreeViewColumnDropFunc, userData: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_tree_view_set_column_drag_function(GTK_TREE_VIEW(self.GOBJECT), function, userData, destroy)
	}

	/// Sets the current keyboard focus to be at @path, and selects it.  This is
	/// useful when you want to focus the user’s attention on a particular row.  If
	/// @focus_column is not %NULL, then focus is given to the column specified by
	/// it. Additionally, if @focus_column is specified, and @start_editing is
	/// %TRUE, then editing should be started in the specified cell.
	/// This function is often followed by @gtk_widget_grab_focus (@tree_view)
	/// in order to give keyboard focus to the widget.  Please note that editing
	/// can only happen when the widget is realized.
	/// If @path is invalid for @model, the current cursor (if any) will be unset
	/// and the function will return without failing.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	///	- focusColumn: UnsafeMutablePointer<GtkTreeViewColumn>? (GtkTreeViewColumn*)
	///	- startEditing: Bool (gboolean)
	open func setCursor(path: OpaquePointer!, focusColumn: UnsafeMutablePointer<GtkTreeViewColumn>?, startEditing: Bool) -> Swift.Void {
		gtk_tree_view_set_cursor(GTK_TREE_VIEW(self.GOBJECT), path, focusColumn, startEditing ? 1 : 0)
	}

	/// Sets the current keyboard focus to be at @path, and selects it.  This is
	/// useful when you want to focus the user’s attention on a particular row.  If
	/// @focus_column is not %NULL, then focus is given to the column specified by
	/// it. If @focus_column and @focus_cell are not %NULL, and @focus_column
	/// contains 2 or more editable or activatable cells, then focus is given to
	/// the cell specified by @focus_cell. Additionally, if @focus_column is
	/// specified, and @start_editing is %TRUE, then editing should be started in
	/// the specified cell.  This function is often followed by
	/// @gtk_widget_grab_focus (@tree_view) in order to give keyboard focus to the
	/// widget.  Please note that editing can only happen when the widget is
	/// realized.
	/// If @path is invalid for @model, the current cursor (if any) will be unset
	/// and the function will return without failing.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	///	- focusColumn: UnsafeMutablePointer<GtkTreeViewColumn>? (GtkTreeViewColumn*)
	///	- focusCell: UnsafeMutablePointer<GtkCellRenderer>? (GtkCellRenderer*)
	///	- startEditing: Bool (gboolean)
	open func setCursorOnCell(path: OpaquePointer!, focusColumn: UnsafeMutablePointer<GtkTreeViewColumn>?, focusCell: UnsafeMutablePointer<GtkCellRenderer>?, startEditing: Bool) -> Swift.Void {
		gtk_tree_view_set_cursor_on_cell(GTK_TREE_VIEW(self.GOBJECT), path, focusColumn, focusCell, startEditing ? 1 : 0)
	}

	/// This function should almost never be used.  It is meant for private use by
	/// ATK for determining the number of visible children that are removed when the
	/// user collapses a row, or a row is deleted.
	/// - Parameters:
	///	- function: @escaping GtkTreeDestroyCountFunc (GtkTreeDestroyCountFunc)
	///	- data: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setDestroyCountFunc(_ function: @escaping GtkTreeDestroyCountFunc, data: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_tree_view_set_destroy_count_func(GTK_TREE_VIEW(self.GOBJECT), function, data, destroy)
	}

	/// Sets the row that is highlighted for feedback.
	/// If @path is %NULL, an existing highlight is removed.
	/// - Parameters:
	///	- path: OpaquePointer? (GtkTreePath*)
	///	- pos: GtkTreeViewDropPosition (GtkTreeViewDropPosition)
	open func setDragDestRow(path: OpaquePointer?, pos: GtkTreeViewDropPosition) -> Swift.Void {
		gtk_tree_view_set_drag_dest_row(GTK_TREE_VIEW(self.GOBJECT), path, pos)
	}

	/// If @enable_search is set, then the user can type in text to search through
	/// the tree interactively (this is sometimes called "typeahead find").
	/// Note that even if this is %FALSE, the user can still initiate a search
	/// using the “start-interactive-search” key binding.
	/// - Parameters:
	///	- enableSearch: Bool (gboolean)
	open func setEnableSearch(_ enableSearch: Bool) -> Swift.Void {
		gtk_tree_view_set_enable_search(GTK_TREE_VIEW(self.GOBJECT), enableSearch ? 1 : 0)
	}

	/// Sets whether to draw lines interconnecting the expanders in @tree_view.
	/// This does not have any visible effects for lists.
	/// - Parameters:
	///	- enabled: Bool (gboolean)
	open func setEnableTreeLines(enabled: Bool) -> Swift.Void {
		gtk_tree_view_set_enable_tree_lines(GTK_TREE_VIEW(self.GOBJECT), enabled ? 1 : 0)
	}

	/// Sets the column to draw the expander arrow at. It must be in @tree_view.
	/// If @column is %NULL, then the expander arrow is always at the first
	/// visible column.
	/// If you do not want expander arrow to appear in your tree, set the
	/// expander column to a hidden column.
	/// - Parameters:
	///	- column: UnsafeMutablePointer<GtkTreeViewColumn>! (GtkTreeViewColumn*)
	open func setExpanderColumn(_ column: UnsafeMutablePointer<GtkTreeViewColumn>!) -> Swift.Void {
		gtk_tree_view_set_expander_column(GTK_TREE_VIEW(self.GOBJECT), column)
	}

	/// Enables or disables the fixed height mode of @tree_view.
	/// Fixed height mode speeds up #GtkTreeView by assuming that all
	/// rows have the same height.
	/// Only enable this option if all rows are the same height and all
	/// columns are of type %GTK_TREE_VIEW_COLUMN_FIXED.
	/// - Parameters:
	///	- enable: Bool (gboolean)
	open func setFixedHeightMode(enable: Bool) -> Swift.Void {
		gtk_tree_view_set_fixed_height_mode(GTK_TREE_VIEW(self.GOBJECT), enable ? 1 : 0)
	}

	/// Sets which grid lines to draw in @tree_view.
	/// - Parameters:
	///	- gridLines: GtkTreeViewGridLines (GtkTreeViewGridLines)
	open func setGridLines(_ gridLines: GtkTreeViewGridLines) -> Swift.Void {
		gtk_tree_view_set_grid_lines(GTK_TREE_VIEW(self.GOBJECT), gridLines)
	}

	/// Sets the #GtkAdjustment for the current horizontal aspect.
	/// - Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setHadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_tree_view_set_hadjustment(GTK_TREE_VIEW(self.GOBJECT), adjustment)
	}

	/// Allow the column title buttons to be clicked.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setHeadersClickable(setting: Bool) -> Swift.Void {
		gtk_tree_view_set_headers_clickable(GTK_TREE_VIEW(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets the visibility state of the headers.
	/// - Parameters:
	///	- headersVisible: Bool (gboolean)
	open func setHeadersVisible(_ headersVisible: Bool) -> Swift.Void {
		gtk_tree_view_set_headers_visible(GTK_TREE_VIEW(self.GOBJECT), headersVisible ? 1 : 0)
	}

	/// Enables or disables the hover expansion mode of @tree_view.
	/// Hover expansion makes rows expand or collapse if the pointer
	/// moves over them.
	/// - Parameters:
	///	- expand: Bool (gboolean)
	open func setHoverExpand(_ expand: Bool) -> Swift.Void {
		gtk_tree_view_set_hover_expand(GTK_TREE_VIEW(self.GOBJECT), expand ? 1 : 0)
	}

	/// Enables or disables the hover selection mode of @tree_view.
	/// Hover selection makes the selected row follow the pointer.
	/// Currently, this works only for the selection modes
	/// %GTK_SELECTION_SINGLE and %GTK_SELECTION_BROWSE.
	/// - Parameters:
	///	- hover: Bool (gboolean)
	open func setHoverSelection(hover: Bool) -> Swift.Void {
		gtk_tree_view_set_hover_selection(GTK_TREE_VIEW(self.GOBJECT), hover ? 1 : 0)
	}

	/// Sets the amount of extra indentation for child levels to use in @tree_view
	/// in addition to the default indentation.  The value should be specified in
	/// pixels, a value of 0 disables this feature and in this case only the default
	/// indentation will be used.
	/// This does not have any visible effects for lists.
	/// - Parameters:
	///	- indentation: gint (gint)
	open func setLevelIndentation(_ indentation: gint) -> Swift.Void {
		gtk_tree_view_set_level_indentation(GTK_TREE_VIEW(self.GOBJECT), indentation)
	}

	/// Sets the model for a #GtkTreeView.  If the @tree_view already has a model
	/// set, it will remove it before setting the new model.  If @model is %NULL,
	/// then it will unset the old model.
	/// - Parameters:
	///	- model: OpaquePointer? (GtkTreeModel*)
	open func setModel(_ model: OpaquePointer?) -> Swift.Void {
		gtk_tree_view_set_model(GTK_TREE_VIEW(self.GOBJECT), model)
	}

	/// This function is a convenience function to allow you to reorder
	/// models that support the #GtkTreeDragSourceIface and the
	/// #GtkTreeDragDestIface.  Both #GtkTreeStore and #GtkListStore support
	/// these.  If @reorderable is %TRUE, then the user can reorder the
	/// model by dragging and dropping rows. The developer can listen to
	/// these changes by connecting to the model’s #GtkTreeModel::row-inserted
	/// and #GtkTreeModel::row-deleted signals. The reordering is implemented
	/// by setting up the tree view as a drag source and destination.
	/// Therefore, drag and drop can not be used in a reorderable view for any
	/// other purpose.
	/// This function does not give you any degree of control over the order -- any
	/// reordering is allowed.  If more control is needed, you should probably
	/// handle drag and drop manually.
	/// - Parameters:
	///	- reorderable: Bool (gboolean)
	open func setReorderable(_ reorderable: Bool) -> Swift.Void {
		gtk_tree_view_set_reorderable(GTK_TREE_VIEW(self.GOBJECT), reorderable ? 1 : 0)
	}

	/// Sets the row separator function, which is used to determine
	/// whether a row should be drawn as a separator. If the row separator
	/// function is %NULL, no separators are drawn. This is the default value.
	/// - Parameters:
	///	- function: @escaping GtkTreeViewRowSeparatorFunc (GtkTreeViewRowSeparatorFunc)
	///	- data: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setRowSeparatorFunc(_ function: @escaping GtkTreeViewRowSeparatorFunc, data: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_tree_view_set_row_separator_func(GTK_TREE_VIEW(self.GOBJECT), function, data, destroy)
	}

	/// Enables or disables rubber banding in @tree_view.  If the selection mode
	/// is #GTK_SELECTION_MULTIPLE, rubber banding will allow the user to select
	/// multiple rows by dragging the mouse.
	/// - Parameters:
	///	- enable: Bool (gboolean)
	open func setRubberBanding(enable: Bool) -> Swift.Void {
		gtk_tree_view_set_rubber_banding(GTK_TREE_VIEW(self.GOBJECT), enable ? 1 : 0)
	}

	/// Sets a hint for the theme to draw even/odd rows in the @tree_view
	/// with different colors, also known as "zebra striping".
	/// This function tells the GTK+ theme that the user interface for your
	/// application requires users to read across tree rows and associate
	/// cells with one another.
	/// Do not use it just because you prefer the appearance of the ruled
	/// tree; that’s a question for the theme. Some themes will draw tree
	/// rows in alternating colors even when rules are turned off, and
	/// users who prefer that appearance all the time can choose those
	/// themes. You should call this function only as a semantic hint to
	/// the theme engine that your tree makes alternating colors useful
	/// from a functional standpoint (since it has lots of columns,
	/// generally).
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setRulesHint(setting: Bool) -> Swift.Void {
		gtk_tree_view_set_rules_hint(GTK_TREE_VIEW(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets @column as the column where the interactive search code should
	/// search in for the current model.
	/// If the search column is set, users can use the “start-interactive-search”
	/// key binding to bring up search popup. The enable-search property controls
	/// whether simply typing text will also start an interactive search.
	/// Note that @column refers to a column of the current model. The search
	/// column is reset to -1 when the model is changed.
	/// - Parameters:
	///	- column: gint (gint)
	open func setSearchColumn(_ column: gint) -> Swift.Void {
		gtk_tree_view_set_search_column(GTK_TREE_VIEW(self.GOBJECT), column)
	}

	/// Sets the entry which the interactive search code will use for this
	/// @tree_view.  This is useful when you want to provide a search entry
	/// in our interface at all time at a fixed position.  Passing %NULL for
	/// @entry will make the interactive search code use the built-in popup
	/// entry again.
	/// - Parameters:
	///	- entry: UnsafeMutablePointer<GtkEntry>? (GtkEntry*)
	open func setSearchEntry(_ entry: UnsafeMutablePointer<GtkEntry>?) -> Swift.Void {
		gtk_tree_view_set_search_entry(GTK_TREE_VIEW(self.GOBJECT), entry)
	}

	/// Sets the compare function for the interactive search capabilities; note
	/// that somewhat like strcmp() returning 0 for equality
	/// #GtkTreeViewSearchEqualFunc returns %FALSE on matches.
	/// - Parameters:
	///	- searchEqualFunc: @escaping GtkTreeViewSearchEqualFunc (GtkTreeViewSearchEqualFunc)
	///	- searchUserData: gpointer? (gpointer)
	///	- searchDestroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setSearchEqualFunc(_ searchEqualFunc: @escaping GtkTreeViewSearchEqualFunc, searchUserData: gpointer?, searchDestroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_tree_view_set_search_equal_func(GTK_TREE_VIEW(self.GOBJECT), searchEqualFunc, searchUserData, searchDestroy)
	}

	/// Sets the function to use when positioning the search dialog.
	/// - Parameters:
	///	- function: @escaping GtkTreeViewSearchPositionFunc (GtkTreeViewSearchPositionFunc)
	///	- data: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setSearchPositionFunc(_ function: @escaping GtkTreeViewSearchPositionFunc, data: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_tree_view_set_search_position_func(GTK_TREE_VIEW(self.GOBJECT), function, data, destroy)
	}

	/// Sets whether to draw and enable expanders and indent child rows in
	/// @tree_view.  When disabled there will be no expanders visible in trees
	/// and there will be no way to expand and collapse rows by default.  Also
	/// note that hiding the expanders will disable the default indentation.  You
	/// can set a custom indentation in this case using
	/// gtk_tree_view_set_level_indentation().
	/// This does not have any visible effects for lists.
	/// - Parameters:
	///	- enabled: Bool (gboolean)
	open func setShowExpanders(enabled: Bool) -> Swift.Void {
		gtk_tree_view_set_show_expanders(GTK_TREE_VIEW(self.GOBJECT), enabled ? 1 : 0)
	}

	/// Sets the tip area of @tooltip to the area @path, @column and @cell have
	/// in common.  For example if @path is %NULL and @column is set, the tip
	/// area will be set to the full area covered by @column.  See also
	/// gtk_tooltip_set_tip_area().
	/// Note that if @path is not specified and @cell is set and part of a column
	/// containing the expander, the tooltip might not show and hide at the correct
	/// position.  In such cases @path must be set to the current node under the
	/// mouse cursor for this function to operate correctly.
	/// See also gtk_tree_view_set_tooltip_column() for a simpler alternative.
	/// - Parameters:
	///	- tooltip: OpaquePointer! (GtkTooltip*)
	///	- path: OpaquePointer? (GtkTreePath*)
	///	- column: UnsafeMutablePointer<GtkTreeViewColumn>? (GtkTreeViewColumn*)
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>? (GtkCellRenderer*)
	open func setTooltipCell(tooltip: OpaquePointer!, path: OpaquePointer?, column: UnsafeMutablePointer<GtkTreeViewColumn>?, cell: UnsafeMutablePointer<GtkCellRenderer>?) -> Swift.Void {
		gtk_tree_view_set_tooltip_cell(GTK_TREE_VIEW(self.GOBJECT), tooltip, path, column, cell)
	}

	/// If you only plan to have simple (text-only) tooltips on full rows, you
	/// can use this function to have #GtkTreeView handle these automatically
	/// for you. @column should be set to the column in @tree_view’s model
	/// containing the tooltip texts, or -1 to disable this feature.
	/// When enabled, #GtkWidget:has-tooltip will be set to %TRUE and
	/// @tree_view will connect a #GtkWidget::query-tooltip signal handler.
	/// Note that the signal handler sets the text with gtk_tooltip_set_markup(),
	/// so &, <, etc have to be escaped in the text.
	/// - Parameters:
	///	- column: gint (gint)
	open func setTooltipColumn(_ column: gint) -> Swift.Void {
		gtk_tree_view_set_tooltip_column(GTK_TREE_VIEW(self.GOBJECT), column)
	}

	/// Sets the tip area of @tooltip to be the area covered by the row at @path.
	/// See also gtk_tree_view_set_tooltip_column() for a simpler alternative.
	/// See also gtk_tooltip_set_tip_area().
	/// - Parameters:
	///	- tooltip: OpaquePointer! (GtkTooltip*)
	///	- path: OpaquePointer! (GtkTreePath*)
	open func setTooltipRow(tooltip: OpaquePointer!, path: OpaquePointer!) -> Swift.Void {
		gtk_tree_view_set_tooltip_row(GTK_TREE_VIEW(self.GOBJECT), tooltip, path)
	}

	/// Sets the #GtkAdjustment for the current vertical aspect.
	/// - Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setVadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_tree_view_set_vadjustment(GTK_TREE_VIEW(self.GOBJECT), adjustment)
	}

	/// Undoes the effect of
	/// gtk_tree_view_enable_model_drag_dest(). Calling this method sets
	/// #GtkTreeView:reorderable to %FALSE.
	open func unsetRowsDragDest() -> Swift.Void {
		gtk_tree_view_unset_rows_drag_dest(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Undoes the effect of
	/// gtk_tree_view_enable_model_drag_source(). Calling this method sets
	/// #GtkTreeView:reorderable to %FALSE.
	open func unsetRowsDragSource() -> Swift.Void {
		gtk_tree_view_unset_rows_drag_source(GTK_TREE_VIEW(self.GOBJECT))
	}

	/// Returns the size of a non-scrolling border around the
	/// outside of the scrollable. An example for this would
	/// be treeview headers. GTK+ can use this information to
	/// display overlayed graphics, like the overshoot indication,
	/// at the right position.
	/// - Parameters:
	///	- border: UnsafeMutablePointer<GtkBorder>! (GtkBorder*)
	/// - Returns: Bool (gboolean)
	open func getBorder(_ border: UnsafeMutablePointer<GtkBorder>!) -> Bool {
		return gtk_scrollable_get_border(GTK_SCROLLABLE(self.GOBJECT), border) != 0 ? true : false
	}

	/// Gets the horizontal #GtkScrollablePolicy.
	/// - Returns: GtkScrollablePolicy (GtkScrollablePolicy)
	open func getHscrollPolicy() -> GtkScrollablePolicy {
		return gtk_scrollable_get_hscroll_policy(GTK_SCROLLABLE(self.GOBJECT))
	}

	/// Gets the vertical #GtkScrollablePolicy.
	/// - Returns: GtkScrollablePolicy (GtkScrollablePolicy)
	open func getVscrollPolicy() -> GtkScrollablePolicy {
		return gtk_scrollable_get_vscroll_policy(GTK_SCROLLABLE(self.GOBJECT))
	}

	/// Sets the horizontal adjustment of the #GtkScrollable.
	/// - Parameters:
	///	- hadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setHadjustment(_ hadjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_scrollable_set_hadjustment(GTK_SCROLLABLE(self.GOBJECT), hadjustment)
	}

	/// Sets the #GtkScrollablePolicy to determine whether
	/// horizontal scrolling should start below the minimum width or
	/// below the natural width.
	/// - Parameters:
	///	- policy: GtkScrollablePolicy (GtkScrollablePolicy)
	open func setHscrollPolicy(_ policy: GtkScrollablePolicy) -> Swift.Void {
		gtk_scrollable_set_hscroll_policy(GTK_SCROLLABLE(self.GOBJECT), policy)
	}

	/// Sets the vertical adjustment of the #GtkScrollable.
	/// - Parameters:
	///	- vadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setVadjustment(_ vadjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_scrollable_set_vadjustment(GTK_SCROLLABLE(self.GOBJECT), vadjustment)
	}

	/// Sets the #GtkScrollablePolicy to determine whether
	/// vertical scrolling should start below the minimum height or
	/// below the natural height.
	/// - Parameters:
	///	- policy: GtkScrollablePolicy (GtkScrollablePolicy)
	open func setVscrollPolicy(_ policy: GtkScrollablePolicy) -> Swift.Void {
		gtk_scrollable_set_vscroll_policy(GTK_SCROLLABLE(self.GOBJECT), policy)
	}

}
