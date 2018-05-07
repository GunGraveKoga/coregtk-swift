/*
 * CGTKTreeSortable.swift
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

public let GTK_TYPE_TREE_SORTABLE: GType = gtk_tree_sortable_get_type()

@inline(__always) public func GTK_TREE_SORTABLE(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TREE_SORTABLE)
}

/// #GtkTreeSortable is an interface to be implemented by tree models which
/// support sorting. The #GtkTreeView uses the methods provided by this interface
/// to sort the model.


public protocol CGTKTreeSortable: class {
	/// Fills in @sort_column_id and @order with the current sort column and the
	/// order. It returns %TRUE unless the @sort_column_id is
	/// %GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID or
	/// %GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID.
	/// - Parameters:
	///	- sortColumnId: UnsafeMutablePointer<Int32>! (gint*)
	///	- order: UnsafeMutablePointer<GtkSortType>! (GtkSortType*)
	/// - Returns: Bool (gboolean)
	func getSortColumnId(_ sortColumnId: UnsafeMutablePointer<Int32>!, order: UnsafeMutablePointer<GtkSortType>!) -> Bool

	/// Returns %TRUE if the model has a default sort function. This is used
	/// primarily by GtkTreeViewColumns in order to determine if a model can
	/// go back to the default state, or not.
	/// - Returns: Bool (gboolean)
	func hasDefaultSortFunc() -> Bool

	/// Sets the default comparison function used when sorting to be @sort_func.
	/// If the current sort column id of @sortable is
	/// %GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID, then the model will sort using
	/// this function.
	/// If @sort_func is %NULL, then there will be no default comparison function.
	/// This means that once the model  has been sorted, it can’t go back to the
	/// default state. In this case, when the current sort column id of @sortable
	/// is %GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID, the model will be unsorted.
	/// - Parameters:
	///	- sortFunc: @escaping GtkTreeIterCompareFunc (GtkTreeIterCompareFunc)
	///	- userData: gpointer (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	func setDefaultSortFunc(_ sortFunc: @escaping GtkTreeIterCompareFunc, userData: gpointer, destroy: @escaping GDestroyNotify) -> Swift.Void

	/// Sets the current sort column to be @sort_column_id. The @sortable will
	/// resort itself to reflect this change, after emitting a
	/// #GtkTreeSortable::sort-column-changed signal. @sort_column_id may either be
	/// a regular column id, or one of the following special values:
	/// - %GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID: the default sort function
	/// will be used, if it is set
	/// - %GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID: no sorting will occur
	/// - Parameters:
	///	- sortColumnId: gint (gint)
	///	- order: GtkSortType (GtkSortType)
	func setSortColumnId(_ sortColumnId: gint, order: GtkSortType) -> Swift.Void

	/// Sets the comparison function used when sorting to be @sort_func. If the
	/// current sort column id of @sortable is the same as @sort_column_id, then
	/// the model will sort using this function.
	/// - Parameters:
	///	- sortColumnId: gint (gint)
	///	- sortFunc: @escaping GtkTreeIterCompareFunc (GtkTreeIterCompareFunc)
	///	- userData: gpointer (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	func setSortFunc(sortColumnId: gint, sortFunc: @escaping GtkTreeIterCompareFunc, userData: gpointer, destroy: @escaping GDestroyNotify) -> Swift.Void

	/// Emits a #GtkTreeSortable::sort-column-changed signal on @sortable.
	func sortColumnChanged() -> Swift.Void

}
