/*
 * CGTKListBoxRow.swift
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

public let GTK_TYPE_LIST_BOX_ROW: GType = gtk_list_box_row_get_type()

@inline(__always) public func GTK_LIST_BOX_ROW(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkListBoxRow>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_LIST_BOX_ROW)
}

open class CGTKListBoxRow : CGTKBin {
	/// 
	/// Creates a new #GtkListBoxRow, to be used as a child of a #GtkListBox.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_list_box_row_new())!
	}

	open var LISTBOXROW: UnsafeMutablePointer<GtkListBoxRow>! {
		get {
			return GTK_LIST_BOX_ROW(self.GOBJECT)
		}
	}

	/// 
	/// Marks @row as changed, causing any state that depends on this
	/// to be updated. This affects sorting, filtering and headers.
	/// Note that calls to this method must be in sync with the data
	/// used for the row functions. For instance, if the list is
	/// mirroring some external data set, and *two* rows changed in the
	/// external data set then when you call gtk_list_box_row_changed()
	/// on the first row the sort function must only read the new data
	/// for the first of the two changed rows, otherwise the resorting
	/// of the rows will be wrong.
	/// This generally means that if you don’t fully control the data
	/// model you have to duplicate the data that affects the listbox
	/// row functions into the row widgets themselves. Another alternative
	/// is to call gtk_list_box_invalidate_sort() on any model change,
	/// but that is more expensive.
	open func changed() {
		gtk_list_box_row_changed(GTK_LIST_BOX_ROW(self.GOBJECT))
	}

	/// 
	/// Gets the value of the #GtkListBoxRow:activatable property
	/// for this row.
	/// - Returns: Bool
	open func getActivatable() -> Bool {
		return gtk_list_box_row_get_activatable(GTK_LIST_BOX_ROW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the current header of the @row. This can be used
	/// in a #GtkListBoxUpdateHeaderFunc to see if there is a header
	/// set already, and if so to update the state of it.
	/// - Returns: CGTKWidget?
	open func getHeader<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_list_box_row_get_header(GTK_LIST_BOX_ROW(self.GOBJECT)))
	}

	/// 
	/// Gets the current index of the @row in its #GtkListBox container.
	/// - Returns: gint
	open func getIndex() -> gint {
		return gtk_list_box_row_get_index(GTK_LIST_BOX_ROW(self.GOBJECT))
	}

	/// 
	/// Gets the value of the #GtkListBoxRow:selectable property
	/// for this row.
	/// - Returns: Bool
	open func getSelectable() -> Bool {
		return gtk_list_box_row_get_selectable(GTK_LIST_BOX_ROW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the child is currently selected in its
	/// #GtkListBox container.
	/// - Returns: Bool
	open func isSelected() -> Bool {
		return gtk_list_box_row_is_selected(GTK_LIST_BOX_ROW(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Set the #GtkListBoxRow:activatable property for this row.
	/// Parameters:
	///	- activatable: Bool
	open func setActivatable(_ activatable: Bool) {
		gtk_list_box_row_set_activatable(GTK_LIST_BOX_ROW(self.GOBJECT), activatable ? 1 : 0)
	}

	/// 
	/// Sets the current header of the @row. This is only allowed to be called
	/// from a #GtkListBoxUpdateHeaderFunc. It will replace any existing
	/// header in the row, and be shown in front of the row in the listbox.
	/// Parameters:
	///	- header: CGTKWidget
	open func setHeader(_ header: CGTKWidget) {
		gtk_list_box_row_set_header(GTK_LIST_BOX_ROW(self.GOBJECT), header.WIDGET)
	}

	/// 
	/// Set the #GtkListBoxRow:selectable property for this row.
	/// Parameters:
	///	- selectable: Bool
	open func setSelectable(_ selectable: Bool) {
		gtk_list_box_row_set_selectable(GTK_LIST_BOX_ROW(self.GOBJECT), selectable ? 1 : 0)
	}

}
