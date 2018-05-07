/*
 * CGTKTreeDragDest.swift
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

public let GTK_TYPE_TREE_DRAG_DEST: GType = gtk_tree_drag_dest_get_type()

@inline(__always) public func GTK_TREE_DRAG_DEST(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TREE_DRAG_DEST)
}

public protocol CGTKTreeDragDest: class {
	/// Asks the #GtkTreeDragDest to insert a row before the path @dest,
	/// deriving the contents of the row from @selection_data. If @dest is
	/// outside the tree so that inserting before it is impossible, %FALSE
	/// will be returned. Also, %FALSE may be returned if the new row is
	/// not created for some model-specific reason.  Should robustly handle
	/// a @dest no longer found in the model!
	/// - Parameters:
	///	- dest: OpaquePointer! (GtkTreePath*)
	///	- selectionData: OpaquePointer! (GtkSelectionData*)
	/// - Returns: Bool (gboolean)
	func dragDataReceived(dest: OpaquePointer!, selectionData: OpaquePointer!) -> Bool

	/// Determines whether a drop is possible before the given @dest_path,
	/// at the same depth as @dest_path. i.e., can we drop the data in
	/// @selection_data at that location. @dest_path does not have to
	/// exist; the return value will almost certainly be %FALSE if the
	/// parent of @dest_path doesn’t exist, though.
	/// - Parameters:
	///	- destPath: OpaquePointer! (GtkTreePath*)
	///	- selectionData: OpaquePointer! (GtkSelectionData*)
	/// - Returns: Bool (gboolean)
	func rowDropPossible(destPath: OpaquePointer!, selectionData: OpaquePointer!) -> Bool

}
