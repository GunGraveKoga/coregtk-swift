/*
 * CGTKCellView.swift
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

public let GTK_TYPE_CELL_VIEW: GType = gtk_cell_view_get_type()

@inline(__always) public func GTK_CELL_VIEW(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkCellView>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_CELL_VIEW)
}

/// A #GtkCellView displays a single row of a #GtkTreeModel using a #GtkCellArea
/// and #GtkCellAreaContext. A #GtkCellAreaContext can be provided to the
/// #GtkCellView at construction time in order to keep the cellview in context
/// of a group of cell views, this ensures that the renderers displayed will
/// be properly aligned with eachother (like the aligned cells in the menus
/// of #GtkComboBox).
/// #GtkCellView is #GtkOrientable in order to decide in which orientation
/// the underlying #GtkCellAreaContext should be allocated. Taking the #GtkComboBox
/// menu as an example, cellviews should be oriented horizontally if the menus are
/// listed top-to-bottom and thus all share the same width but may have separate
/// individual heights (left-to-right menus should be allocated vertically since
/// they all share the same height but may have variable widths).
/// # CSS nodes
/// GtkCellView has a single CSS node with name cellview.


open class CGTKCellView : CGTKWidget, CGTKCellLayout, CGTKOrientable {
	/// Creates a new #GtkCellView widget.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_cell_view_new())!
	}

	/// Creates a new #GtkCellView widget with a specific #GtkCellArea
	/// to layout cells and a specific #GtkCellAreaContext.
	/// Specifying the same context for a handfull of cells lets
	/// the underlying area synchronize the geometry for those cells,
	/// in this way alignments with cellviews for other rows are
	/// possible.
	/// - Parameters:
	///	- area: UnsafeMutablePointer<GtkCellArea>! (GtkCellArea*)
	///	- context: UnsafeMutablePointer<GtkCellAreaContext>! (GtkCellAreaContext*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withContext area: UnsafeMutablePointer<GtkCellArea>!, context: UnsafeMutablePointer<GtkCellAreaContext>!) {
		self.init(withGObject: gtk_cell_view_new_with_context(area, context))!
	}

	/// Creates a new #GtkCellView widget, adds a #GtkCellRendererText
	/// to it, and makes it show @markup. The text can be
	/// marked up with the [Pango text markup language][PangoMarkupFormat].
	/// - Parameters:
	///	- markup: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withMarkup markup: String) {
		self.init(withGObject: gtk_cell_view_new_with_markup(markup))!
	}

	/// Creates a new #GtkCellView widget, adds a #GtkCellRendererPixbuf
	/// to it, and makes it show @pixbuf.
	/// - Parameters:
	///	- pixbuf: OpaquePointer! (GdkPixbuf*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withPixbuf pixbuf: OpaquePointer!) {
		self.init(withGObject: gtk_cell_view_new_with_pixbuf(pixbuf))!
	}

	/// Creates a new #GtkCellView widget, adds a #GtkCellRendererText
	/// to it, and makes it show @text.
	/// - Parameters:
	///	- text: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withText text: String) {
		self.init(withGObject: gtk_cell_view_new_with_text(text))!
	}

	open var CELLVIEW: UnsafeMutablePointer<GtkCellView>! {
		get {
			return GTK_CELL_VIEW(self.GOBJECT)
		}
	}

	/// Returns a #GtkTreePath referring to the currently
	/// displayed row. If no row is currently displayed,
	/// %NULL is returned.
	/// - Returns: OpaquePointer? (GtkTreePath*)
	open func getDisplayedRow() -> OpaquePointer? {
		return gtk_cell_view_get_displayed_row(GTK_CELL_VIEW(self.GOBJECT))
	}

	/// Gets whether @cell_view is configured to draw all of its
	/// cells in a sensitive state.
	/// - Returns: Bool (gboolean)
	open func getDrawSensitive() -> Bool {
		return gtk_cell_view_get_draw_sensitive(GTK_CELL_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets whether @cell_view is configured to request space
	/// to fit the entire #GtkTreeModel.
	/// - Returns: Bool (gboolean)
	open func getFitModel() -> Bool {
		return gtk_cell_view_get_fit_model(GTK_CELL_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the model for @cell_view. If no model is used %NULL is
	/// returned.
	/// - Returns: OpaquePointer? (GtkTreeModel*)
	open func getModel() -> OpaquePointer? {
		return gtk_cell_view_get_model(GTK_CELL_VIEW(self.GOBJECT))
	}

	/// Sets @requisition to the size needed by @cell_view to display
	/// the model row pointed to by @path.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	///	- requisition: UnsafeMutablePointer<GtkRequisition>! (GtkRequisition*)
	/// - Returns: Bool (gboolean)
	open func getSizeOfRow(path: OpaquePointer!, requisition: UnsafeMutablePointer<GtkRequisition>!) -> Bool {
		return gtk_cell_view_get_size_of_row(GTK_CELL_VIEW(self.GOBJECT), path, requisition) != 0 ? true : false
	}

	/// Sets the background color of @view.
	/// - Parameters:
	///	- color: UnsafePointer<GdkColor>! (const GdkColor*)
	open func setBackgroundColor(_ color: UnsafePointer<GdkColor>!) -> Swift.Void {
		gtk_cell_view_set_background_color(GTK_CELL_VIEW(self.GOBJECT), color)
	}

	/// Sets the background color of @cell_view.
	/// - Parameters:
	///	- rgba: UnsafePointer<GdkRGBA>! (const GdkRGBA*)
	open func setBackgroundRgba(_ rgba: UnsafePointer<GdkRGBA>!) -> Swift.Void {
		gtk_cell_view_set_background_rgba(GTK_CELL_VIEW(self.GOBJECT), rgba)
	}

	/// Sets the row of the model that is currently displayed
	/// by the #GtkCellView. If the path is unset, then the
	/// contents of the cellview “stick” at their last value;
	/// this is not normally a desired result, but may be
	/// a needed intermediate state if say, the model for
	/// the #GtkCellView becomes temporarily empty.
	/// - Parameters:
	///	- path: OpaquePointer? (GtkTreePath*)
	open func setDisplayedRow(path: OpaquePointer?) -> Swift.Void {
		gtk_cell_view_set_displayed_row(GTK_CELL_VIEW(self.GOBJECT), path)
	}

	/// Sets whether @cell_view should draw all of its
	/// cells in a sensitive state, this is used by #GtkComboBox menus
	/// to ensure that rows with insensitive cells that contain
	/// children appear sensitive in the parent menu item.
	/// - Parameters:
	///	- drawSensitive: Bool (gboolean)
	open func setDrawSensitive(_ drawSensitive: Bool) -> Swift.Void {
		gtk_cell_view_set_draw_sensitive(GTK_CELL_VIEW(self.GOBJECT), drawSensitive ? 1 : 0)
	}

	/// Sets whether @cell_view should request space to fit the entire #GtkTreeModel.
	/// This is used by #GtkComboBox to ensure that the cell view displayed on
	/// the combo box’s button always gets enough space and does not resize
	/// when selection changes.
	/// - Parameters:
	///	- fitModel: Bool (gboolean)
	open func setFitModel(_ fitModel: Bool) -> Swift.Void {
		gtk_cell_view_set_fit_model(GTK_CELL_VIEW(self.GOBJECT), fitModel ? 1 : 0)
	}

	/// Sets the model for @cell_view.  If @cell_view already has a model
	/// set, it will remove it before setting the new model.  If @model is
	/// %NULL, then it will unset the old model.
	/// - Parameters:
	///	- model: OpaquePointer? (GtkTreeModel*)
	open func setModel(_ model: OpaquePointer?) -> Swift.Void {
		gtk_cell_view_set_model(GTK_CELL_VIEW(self.GOBJECT), model)
	}

	/// Adds an attribute mapping to the list in @cell_layout.
	/// The @column is the column of the model to get a value from, and the
	/// @attribute is the parameter on @cell to be set from the value. So for
	/// example if column 2 of the model contains strings, you could have the
	/// “text” attribute of a #GtkCellRendererText get its values from column 2.
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- attribute: String (const gchar*)
	///	- column: gint (gint)
	open func addAttribute(cell: UnsafeMutablePointer<GtkCellRenderer>!, attribute: String, column: gint) -> Swift.Void {
		gtk_cell_layout_add_attribute(GTK_CELL_LAYOUT(self.GOBJECT), cell, attribute, column)
	}

	/// Unsets all the mappings on all renderers on @cell_layout and
	/// removes all renderers from @cell_layout.
	open func clear() -> Swift.Void {
		gtk_cell_layout_clear(GTK_CELL_LAYOUT(self.GOBJECT))
	}

	/// Clears all existing attributes previously set with
	/// gtk_cell_layout_set_attributes().
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	open func clearAttributes(cell: UnsafeMutablePointer<GtkCellRenderer>!) -> Swift.Void {
		gtk_cell_layout_clear_attributes(GTK_CELL_LAYOUT(self.GOBJECT), cell)
	}

	/// Returns the underlying #GtkCellArea which might be @cell_layout
	/// if called on a #GtkCellArea or might be %NULL if no #GtkCellArea
	/// is used by @cell_layout.
	/// - Returns: UnsafeMutablePointer<GtkCellArea>? (GtkCellArea*)
	open func getArea() -> UnsafeMutablePointer<GtkCellArea>? {
		return gtk_cell_layout_get_area(GTK_CELL_LAYOUT(self.GOBJECT))
	}

	/// Returns the cell renderers which have been added to @cell_layout.
	/// - Returns: UnsafeMutablePointer<GList>! (GList*)
	open func getCells() -> UnsafeMutablePointer<GList>! {
		return gtk_cell_layout_get_cells(GTK_CELL_LAYOUT(self.GOBJECT))
	}

	/// Adds the @cell to the end of @cell_layout. If @expand is %FALSE, then the
	/// @cell is allocated no more space than it needs. Any unused space is
	/// divided evenly between cells for which @expand is %TRUE.
	/// Note that reusing the same cell renderer is not supported.
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- expand: Bool (gboolean)
	open func packEnd(cell: UnsafeMutablePointer<GtkCellRenderer>!, expand: Bool) -> Swift.Void {
		gtk_cell_layout_pack_end(GTK_CELL_LAYOUT(self.GOBJECT), cell, expand ? 1 : 0)
	}

	/// Packs the @cell into the beginning of @cell_layout. If @expand is %FALSE,
	/// then the @cell is allocated no more space than it needs. Any unused space
	/// is divided evenly between cells for which @expand is %TRUE.
	/// Note that reusing the same cell renderer is not supported.
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- expand: Bool (gboolean)
	open func packStart(cell: UnsafeMutablePointer<GtkCellRenderer>!, expand: Bool) -> Swift.Void {
		gtk_cell_layout_pack_start(GTK_CELL_LAYOUT(self.GOBJECT), cell, expand ? 1 : 0)
	}

	/// Re-inserts @cell at @position.
	/// Note that @cell has already to be packed into @cell_layout
	/// for this to function properly.
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- position: gint (gint)
	open func reorder(cell: UnsafeMutablePointer<GtkCellRenderer>!, position: gint) -> Swift.Void {
		gtk_cell_layout_reorder(GTK_CELL_LAYOUT(self.GOBJECT), cell, position)
	}

	/// Sets the #GtkCellLayoutDataFunc to use for @cell_layout.
	/// This function is used instead of the standard attributes mapping
	/// for setting the column value, and should set the value of @cell_layout’s
	/// cell renderer(s) as appropriate.
	/// @func may be %NULL to remove a previously set function.
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- function: @escaping GtkCellLayoutDataFunc (GtkCellLayoutDataFunc)
	///	- funcData: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setCellDataFunc(cell: UnsafeMutablePointer<GtkCellRenderer>!, function: @escaping GtkCellLayoutDataFunc, funcData: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_cell_layout_set_cell_data_func(GTK_CELL_LAYOUT(self.GOBJECT), cell, function, funcData, destroy)
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

}
