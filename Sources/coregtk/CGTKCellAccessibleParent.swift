/*
 * CGTKCellAccessibleParent.swift
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

#if os(Linux)

public let GTK_TYPE_CELL_ACCESSIBLE_PARENT: GType = gtk_cell_accessible_parent_get_type()

@inline(__always) public func GTK_CELL_ACCESSIBLE_PARENT(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_CELL_ACCESSIBLE_PARENT)
}

public protocol CGTKCellAccessibleParent: class {
	/// func activate(cell: OpaquePointer!) -> Swift.Void -> void
	/// - Parameters:
	///	- cell: OpaquePointer! (GtkCellAccessible*)
	func activate(cell: OpaquePointer!) -> Swift.Void

	/// func edit(cell: OpaquePointer!) -> Swift.Void -> void
	/// - Parameters:
	///	- cell: OpaquePointer! (GtkCellAccessible*)
	func edit(cell: OpaquePointer!) -> Swift.Void

	/// func expandCollapse(cell: OpaquePointer!) -> Swift.Void -> void
	/// - Parameters:
	///	- cell: OpaquePointer! (GtkCellAccessible*)
	func expandCollapse(cell: OpaquePointer!) -> Swift.Void

	/// func getCellArea(cell: OpaquePointer!, cellRect: UnsafeMutablePointer<GdkRectangle>!) -> Swift.Void -> void
	/// - Parameters:
	///	- cell: OpaquePointer! (GtkCellAccessible*)
	///	- cellRect: UnsafeMutablePointer<GdkRectangle>! (GdkRectangle*)
	func getCellArea(cell: OpaquePointer!, cellRect: UnsafeMutablePointer<GdkRectangle>!) -> Swift.Void

	/// func getCellExtents(cell: OpaquePointer!, x: UnsafeMutablePointer<Int32>!, y: UnsafeMutablePointer<Int32>!, width: UnsafeMutablePointer<Int32>!, height: UnsafeMutablePointer<Int32>!, coordType: AtkCoordType) -> Swift.Void -> void
	/// - Parameters:
	///	- cell: OpaquePointer! (GtkCellAccessible*)
	///	- x: UnsafeMutablePointer<Int32>! (gint*)
	///	- y: UnsafeMutablePointer<Int32>! (gint*)
	///	- width: UnsafeMutablePointer<Int32>! (gint*)
	///	- height: UnsafeMutablePointer<Int32>! (gint*)
	///	- coordType: AtkCoordType (AtkCoordType)
	func getCellExtents(cell: OpaquePointer!, x: UnsafeMutablePointer<Int32>!, y: UnsafeMutablePointer<Int32>!, width: UnsafeMutablePointer<Int32>!, height: UnsafeMutablePointer<Int32>!, coordType: AtkCoordType) -> Swift.Void

	/// func getChildIndex(cell: OpaquePointer!) -> Int32 -> Int32
	/// - Parameters:
	///	- cell: OpaquePointer! (GtkCellAccessible*)
	/// - Returns: Int32 (int)
	func getChildIndex(cell: OpaquePointer!) -> Int32

	/// func getRendererState(cell: OpaquePointer!) -> GtkCellRendererState -> GtkCellRendererState
	/// - Parameters:
	///	- cell: OpaquePointer! (GtkCellAccessible*)
	/// - Returns: GtkCellRendererState (GtkCellRendererState)
	func getRendererState(cell: OpaquePointer!) -> GtkCellRendererState

	/// func grabFocus(cell: OpaquePointer!) -> Bool -> Bool
	/// - Parameters:
	///	- cell: OpaquePointer! (GtkCellAccessible*)
	/// - Returns: Bool (gboolean)
	func grabFocus(cell: OpaquePointer!) -> Bool

	/// func updateRelationset(cell: OpaquePointer!, relationset: UnsafeMutablePointer<AtkRelationSet>!) -> Swift.Void -> void
	/// - Parameters:
	///	- cell: OpaquePointer! (GtkCellAccessible*)
	///	- relationset: UnsafeMutablePointer<AtkRelationSet>! (AtkRelationSet*)
	func updateRelationset(cell: OpaquePointer!, relationset: UnsafeMutablePointer<AtkRelationSet>!) -> Swift.Void

}

#endif
