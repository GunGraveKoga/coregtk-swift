/*
 * CGTKTreeDragSource.swift
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

public let GTK_TYPE_TREE_DRAG_SOURCE: GType = gtk_tree_drag_source_get_type()

@inline(__always) public func GTK_TREE_DRAG_SOURCE(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TREE_DRAG_SOURCE)
}

public protocol CGTKTreeDragSource: class {
	/// Asks the #GtkTreeDragSource to delete the row at @path, because
	/// it was moved somewhere else via drag-and-drop. Returns %FALSE
	/// if the deletion fails because @path no longer exists, or for
	/// some model-specific reason. Should robustly handle a @path no
	/// longer found in the model!
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	/// - Returns: Bool (gboolean)
	func dragDataDelete(path: OpaquePointer!) -> Bool

	/// Asks the #GtkTreeDragSource to fill in @selection_data with a
	/// representation of the row at @path. @selection_data->target gives
	/// the required type of the data.  Should robustly handle a @path no
	/// longer found in the model!
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	///	- selectionData: OpaquePointer! (GtkSelectionData*)
	/// - Returns: Bool (gboolean)
	func dragDataGet(path: OpaquePointer!, selectionData: OpaquePointer!) -> Bool

	/// Asks the #GtkTreeDragSource whether a particular row can be used as
	/// the source of a DND operation. If the source doesn’t implement
	/// this interface, the row is assumed draggable.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkTreePath*)
	/// - Returns: Bool (gboolean)
	func rowDraggable(path: OpaquePointer!) -> Bool

}
