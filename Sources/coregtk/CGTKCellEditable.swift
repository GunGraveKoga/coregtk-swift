/*
 * CGTKCellEditable.swift
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

public let GTK_TYPE_CELL_EDITABLE: GType = gtk_cell_editable_get_type()

@inline(__always) public func GTK_CELL_EDITABLE(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_CELL_EDITABLE)
}

/// The #GtkCellEditable interface must be implemented for widgets to be usable
/// when editing the contents of a #GtkTreeView cell.


public protocol CGTKCellEditable: class {
	/// Emits the #GtkCellEditable::editing-done signal.
	func editingDone() -> Swift.Void

	/// Emits the #GtkCellEditable::remove-widget signal.
	func removeWidget() -> Swift.Void

	/// Begins editing on a @cell_editable. @event is the #GdkEvent that began
	/// the editing process. It may be %NULL, in the instance that editing was
	/// initiated through programatic means.
	/// - Parameters:
	///	- event: UnsafeMutablePointer<GdkEvent>? (GdkEvent*)
	func startEditing(event: UnsafeMutablePointer<GdkEvent>?) -> Swift.Void

}
