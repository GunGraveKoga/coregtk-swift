/*
 * CGTKGrid.swift
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

public let GTK_TYPE_GRID: GType = gtk_grid_get_type()

@inline(__always) public func GTK_GRID(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkGrid>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_GRID)
}

/// 
/// GtkGrid is a container which arranges its child widgets in
/// rows and columns. It is a very similar to #GtkTable and #GtkBox,
/// but it consistently uses #GtkWidget’s #GtkWidget:margin and #GtkWidget:expand
/// properties instead of custom child properties, and it fully supports
/// [height-for-width geometry management][geometry-management].
/// Children are added using gtk_grid_attach(). They can span multiple
/// rows or columns. It is also possible to add a child next to an
/// existing child, using gtk_grid_attach_next_to(). The behaviour of
/// GtkGrid when several children occupy the same grid cell is undefined.
/// GtkGrid can be used like a #GtkBox by just using gtk_container_add(),
/// which will place children next to each other in the direction determined
/// by the #GtkOrientable:orientation property.
/// # CSS nodes
/// GtkGrid uses a single CSS node with name grid.


open class CGTKGrid : CGTKContainer {
	/// 
	/// Creates a new grid widget.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_grid_new())!
	}

	open var GRID: UnsafeMutablePointer<GtkGrid>! {
		get {
			return GTK_GRID(self.GOBJECT)
		}
	}

	/// 
	/// Adds a widget to the grid.
	/// The position of @child is determined by @left and @top. The
	/// number of “cells” that @child will occupy is determined by
	/// @width and @height.
	/// Parameters:
	///	- child: CGTKWidget
	///	- left: gint
	///	- top: gint
	///	- width: gint
	///	- height: gint
	open func attach(child: CGTKWidget, left: gint, top: gint, width: gint, height: gint) {
		gtk_grid_attach(GTK_GRID(self.GOBJECT), child.WIDGET, left, top, width, height)
	}

	/// 
	/// Adds a widget to the grid.
	/// The widget is placed next to @sibling, on the side determined by
	/// @side. When @sibling is %NULL, the widget is placed in row (for
	/// left or right placement) or column 0 (for top or bottom placement),
	/// at the end indicated by @side.
	/// Attaching widgets labeled [1], [2], [3] with @sibling == %NULL and
	/// @side == %GTK_POS_LEFT yields a layout of [3][2][1].
	/// Parameters:
	///	- child: CGTKWidget
	///	- sibling: CGTKWidget
	///	- side: GtkPositionType
	///	- width: gint
	///	- height: gint
	open func attachNextTo(child: CGTKWidget, sibling: CGTKWidget, side: GtkPositionType, width: gint, height: gint) {
		gtk_grid_attach_next_to(GTK_GRID(self.GOBJECT), child.WIDGET, sibling.WIDGET, side, width, height)
	}

	/// 
	/// Returns which row defines the global baseline of @grid.
	/// - Returns: gint
	open func getBaselineRow() -> gint {
		return gtk_grid_get_baseline_row(GTK_GRID(self.GOBJECT))
	}

	/// 
	/// Gets the child of @grid whose area covers the grid
	/// cell whose upper left corner is at @left, @top.
	/// Parameters:
	///	- left: gint
	///	- top: gint
	/// - Returns: CGTKWidget?
	open func getChildAt<T>(left: gint, top: gint) -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_grid_get_child_at(GTK_GRID(self.GOBJECT), left, top))
	}

	/// 
	/// Returns whether all columns of @grid have the same width.
	/// - Returns: Bool
	open func getColumnHomogeneous() -> Bool {
		return gtk_grid_get_column_homogeneous(GTK_GRID(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the amount of space between the columns of @grid.
	/// - Returns: guint
	open func getColumnSpacing() -> guint {
		return gtk_grid_get_column_spacing(GTK_GRID(self.GOBJECT))
	}

	/// 
	/// Returns the baseline position of @row as set
	/// by gtk_grid_set_row_baseline_position() or the default value
	/// %GTK_BASELINE_POSITION_CENTER.
	/// Parameters:
	///	- row: gint
	/// - Returns: GtkBaselinePosition
	open func getRowBaselinePosition(row: gint) -> GtkBaselinePosition {
		return gtk_grid_get_row_baseline_position(GTK_GRID(self.GOBJECT), row)
	}

	/// 
	/// Returns whether all rows of @grid have the same height.
	/// - Returns: Bool
	open func getRowHomogeneous() -> Bool {
		return gtk_grid_get_row_homogeneous(GTK_GRID(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the amount of space between the rows of @grid.
	/// - Returns: guint
	open func getRowSpacing() -> guint {
		return gtk_grid_get_row_spacing(GTK_GRID(self.GOBJECT))
	}

	/// 
	/// Inserts a column at the specified position.
	/// Children which are attached at or to the right of this position
	/// are moved one column to the right. Children which span across this
	/// position are grown to span the new column.
	/// Parameters:
	///	- position: gint
	open func insertColumn(position: gint) {
		gtk_grid_insert_column(GTK_GRID(self.GOBJECT), position)
	}

	/// 
	/// Inserts a row or column at the specified position.
	/// The new row or column is placed next to @sibling, on the side
	/// determined by @side. If @side is %GTK_POS_TOP or %GTK_POS_BOTTOM,
	/// a row is inserted. If @side is %GTK_POS_LEFT of %GTK_POS_RIGHT,
	/// a column is inserted.
	/// Parameters:
	///	- sibling: CGTKWidget
	///	- side: GtkPositionType
	open func insertNextTo(sibling: CGTKWidget, side: GtkPositionType) {
		gtk_grid_insert_next_to(GTK_GRID(self.GOBJECT), sibling.WIDGET, side)
	}

	/// 
	/// Inserts a row at the specified position.
	/// Children which are attached at or below this position
	/// are moved one row down. Children which span across this
	/// position are grown to span the new row.
	/// Parameters:
	///	- position: gint
	open func insertRow(position: gint) {
		gtk_grid_insert_row(GTK_GRID(self.GOBJECT), position)
	}

	/// 
	/// Removes a column from the grid.
	/// Children that are placed in this column are removed,
	/// spanning children that overlap this column have their
	/// width reduced by one, and children after the column
	/// are moved to the left.
	/// Parameters:
	///	- position: gint
	open func removeColumn(position: gint) {
		gtk_grid_remove_column(GTK_GRID(self.GOBJECT), position)
	}

	/// 
	/// Removes a row from the grid.
	/// Children that are placed in this row are removed,
	/// spanning children that overlap this row have their
	/// height reduced by one, and children below the row
	/// are moved up.
	/// Parameters:
	///	- position: gint
	open func removeRow(position: gint) {
		gtk_grid_remove_row(GTK_GRID(self.GOBJECT), position)
	}

	/// 
	/// Sets which row defines the global baseline for the entire grid.
	/// Each row in the grid can have its own local baseline, but only
	/// one of those is global, meaning it will be the baseline in the
	/// parent of the @grid.
	/// Parameters:
	///	- row: gint
	open func setBaselineRow(_ row: gint) {
		gtk_grid_set_baseline_row(GTK_GRID(self.GOBJECT), row)
	}

	/// 
	/// Sets whether all columns of @grid will have the same width.
	/// Parameters:
	///	- homogeneous: Bool
	open func setColumnHomogeneous(_ homogeneous: Bool) {
		gtk_grid_set_column_homogeneous(GTK_GRID(self.GOBJECT), homogeneous ? 1 : 0)
	}

	/// 
	/// Sets the amount of space between columns of @grid.
	/// Parameters:
	///	- spacing: guint
	open func setColumnSpacing(_ spacing: guint) {
		gtk_grid_set_column_spacing(GTK_GRID(self.GOBJECT), spacing)
	}

	/// 
	/// Sets how the baseline should be positioned on @row of the
	/// grid, in case that row is assigned more space than is requested.
	/// Parameters:
	///	- row: gint
	///	- pos: GtkBaselinePosition
	open func setRowBaselinePosition(row: gint, pos: GtkBaselinePosition) {
		gtk_grid_set_row_baseline_position(GTK_GRID(self.GOBJECT), row, pos)
	}

	/// 
	/// Sets whether all rows of @grid will have the same height.
	/// Parameters:
	///	- homogeneous: Bool
	open func setRowHomogeneous(_ homogeneous: Bool) {
		gtk_grid_set_row_homogeneous(GTK_GRID(self.GOBJECT), homogeneous ? 1 : 0)
	}

	/// 
	/// Sets the amount of space between rows of @grid.
	/// Parameters:
	///	- spacing: guint
	open func setRowSpacing(_ spacing: guint) {
		gtk_grid_set_row_spacing(GTK_GRID(self.GOBJECT), spacing)
	}

}
