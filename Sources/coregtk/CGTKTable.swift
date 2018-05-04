/*
 * CGTKTable.swift
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

public let GTK_TYPE_TABLE: GType = gtk_table_get_type()

@inline(__always) public func GTK_TABLE(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkTable>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TABLE)
}

/// 
/// The #GtkTable functions allow the programmer to arrange widgets in rows and
/// columns, making it easy to align many widgets next to each other,
/// horizontally and vertically.
/// Tables are created with a call to gtk_table_new(), the size of which can
/// later be changed with gtk_table_resize().
/// Widgets can be added to a table using gtk_table_attach() or the more
/// convenient (but slightly less flexible) gtk_table_attach_defaults().
/// To alter the space next to a specific row, use gtk_table_set_row_spacing(),
/// and for a column, gtk_table_set_col_spacing().
/// The gaps between all rows or columns can be changed by
/// calling gtk_table_set_row_spacings() or gtk_table_set_col_spacings()
/// respectively. Note that spacing is added between the
/// children, while padding added by gtk_table_attach() is added on
/// either side of the widget it belongs to.
/// gtk_table_set_homogeneous(), can be used to set whether all cells in the
/// table will resize themselves to the size of the largest widget in the table.
/// > #GtkTable has been deprecated. Use #GtkGrid instead. It provides the same
/// > capabilities as GtkTable for arranging widgets in a rectangular grid, but
/// > does support height-for-width geometry management.


open class CGTKTable : CGTKContainer {
	/// 
	/// Used to create a new table widget. An initial size must be given by
	/// specifying how many rows and columns the table should have, although
	/// this can be changed later with gtk_table_resize().  @rows and @columns
	/// must both be in the range 1 .. 65535. For historical reasons, 0 is accepted
	/// as well and is silently interpreted as 1.
	/// Parameters:
	///	- rows: guint
	///	- columns: guint
	///	- homogeneous: Bool
	/// - Returns: CGTKWidget
	public convenience init(rows: guint, columns: guint, homogeneous: Bool) {
		self.init(withGObject: gtk_table_new(rows, columns, homogeneous ? 1 : 0))!
	}

	open var TABLE: UnsafeMutablePointer<GtkTable>! {
		get {
			return GTK_TABLE(self.GOBJECT)
		}
	}

	/// 
	/// Adds a widget to a table. The number of “cells” that a widget will occupy is
	/// specified by @left_attach, @right_attach, @top_attach and @bottom_attach.
	/// These each represent the leftmost, rightmost, uppermost and lowest column
	/// and row numbers of the table. (Columns and rows are indexed from zero).
	/// To make a button occupy the lower right cell of a 2x2 table, use
	/// |[
	/// gtk_table_attach (table, button,
	/// 1, 2, // left, right attach
	/// 1, 2, // top, bottom attach
	/// xoptions, yoptions,
	/// xpadding, ypadding);
	/// ]|
	/// If you want to make the button span the entire bottom row, use @left_attach == 0 and @right_attach = 2 instead.
	/// Parameters:
	///	- child: CGTKWidget
	///	- leftAttach: guint
	///	- rightAttach: guint
	///	- topAttach: guint
	///	- bottomAttach: guint
	///	- xoptions: GtkAttachOptions
	///	- yoptions: GtkAttachOptions
	///	- xpadding: guint
	///	- ypadding: guint
	open func attach(child: CGTKWidget, leftAttach: guint, rightAttach: guint, topAttach: guint, bottomAttach: guint, xoptions: GtkAttachOptions, yoptions: GtkAttachOptions, xpadding: guint, ypadding: guint) {
		gtk_table_attach(GTK_TABLE(self.GOBJECT), child.WIDGET, leftAttach, rightAttach, topAttach, bottomAttach, xoptions, yoptions, xpadding, ypadding)
	}

	/// 
	/// As there are many options associated with gtk_table_attach(), this convenience
	/// function provides the programmer with a means to add children to a table with
	/// identical padding and expansion options. The values used for the #GtkAttachOptions
	/// are `GTK_EXPAND | GTK_FILL`, and the padding is set to 0.
	/// Parameters:
	///	- widget: CGTKWidget
	///	- leftAttach: guint
	///	- rightAttach: guint
	///	- topAttach: guint
	///	- bottomAttach: guint
	open func attachDefaults(widget: CGTKWidget, leftAttach: guint, rightAttach: guint, topAttach: guint, bottomAttach: guint) {
		gtk_table_attach_defaults(GTK_TABLE(self.GOBJECT), widget.WIDGET, leftAttach, rightAttach, topAttach, bottomAttach)
	}

	/// 
	/// Gets the amount of space between column @col, and
	/// column @col + 1. See gtk_table_set_col_spacing().
	/// Parameters:
	///	- column: guint
	/// - Returns: guint
	open func getColSpacing(column: guint) -> guint {
		return gtk_table_get_col_spacing(GTK_TABLE(self.GOBJECT), column)
	}

	/// 
	/// Gets the default column spacing for the table. This is
	/// the spacing that will be used for newly added columns.
	/// (See gtk_table_set_col_spacings())
	/// - Returns: guint
	open func getDefaultColSpacing() -> guint {
		return gtk_table_get_default_col_spacing(GTK_TABLE(self.GOBJECT))
	}

	/// 
	/// Gets the default row spacing for the table. This is
	/// the spacing that will be used for newly added rows.
	/// (See gtk_table_set_row_spacings())
	/// - Returns: guint
	open func getDefaultRowSpacing() -> guint {
		return gtk_table_get_default_row_spacing(GTK_TABLE(self.GOBJECT))
	}

	/// 
	/// Returns whether the table cells are all constrained to the same
	/// width and height. (See gtk_table_set_homogeneous ())
	/// - Returns: Bool
	open func getHomogeneous() -> Bool {
		return gtk_table_get_homogeneous(GTK_TABLE(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the amount of space between row @row, and
	/// row @row + 1. See gtk_table_set_row_spacing().
	/// Parameters:
	///	- row: guint
	/// - Returns: guint
	open func getRowSpacing(row: guint) -> guint {
		return gtk_table_get_row_spacing(GTK_TABLE(self.GOBJECT), row)
	}

	/// 
	/// Gets the number of rows and columns in the table.
	/// Parameters:
	///	- rows: UnsafeMutablePointer<UInt32>!
	///	- columns: UnsafeMutablePointer<UInt32>!
	open func getSize(rows: UnsafeMutablePointer<UInt32>!, columns: UnsafeMutablePointer<UInt32>!) {
		gtk_table_get_size(GTK_TABLE(self.GOBJECT), rows, columns)
	}

	/// 
	/// If you need to change a table’s size after
	/// it has been created, this function allows you to do so.
	/// Parameters:
	///	- rows: guint
	///	- columns: guint
	open func resize(rows: guint, columns: guint) {
		gtk_table_resize(GTK_TABLE(self.GOBJECT), rows, columns)
	}

	/// 
	/// Alters the amount of space between a given table column and the following
	/// column.
	/// Parameters:
	///	- column: guint
	///	- spacing: guint
	open func setColSpacing(column: guint, spacing: guint) {
		gtk_table_set_col_spacing(GTK_TABLE(self.GOBJECT), column, spacing)
	}

	/// 
	/// Sets the space between every column in @table equal to @spacing.
	/// Parameters:
	///	- spacing: guint
	open func setColSpacings(spacing: guint) {
		gtk_table_set_col_spacings(GTK_TABLE(self.GOBJECT), spacing)
	}

	/// 
	/// Changes the homogenous property of table cells, ie. whether all cells are
	/// an equal size or not.
	/// Parameters:
	///	- homogeneous: Bool
	open func setHomogeneous(_ homogeneous: Bool) {
		gtk_table_set_homogeneous(GTK_TABLE(self.GOBJECT), homogeneous ? 1 : 0)
	}

	/// 
	/// Changes the space between a given table row and the subsequent row.
	/// Parameters:
	///	- row: guint
	///	- spacing: guint
	open func setRowSpacing(row: guint, spacing: guint) {
		gtk_table_set_row_spacing(GTK_TABLE(self.GOBJECT), row, spacing)
	}

	/// 
	/// Sets the space between every row in @table equal to @spacing.
	/// Parameters:
	///	- spacing: guint
	open func setRowSpacings(spacing: guint) {
		gtk_table_set_row_spacings(GTK_TABLE(self.GOBJECT), spacing)
	}

}
