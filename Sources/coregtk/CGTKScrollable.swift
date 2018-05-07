/*
 * CGTKScrollable.swift
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

public let GTK_TYPE_SCROLLABLE: GType = gtk_scrollable_get_type()

@inline(__always) public func GTK_SCROLLABLE(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SCROLLABLE)
}

/// #GtkScrollable is an interface that is implemented by widgets with native
/// scrolling ability.
/// To implement this interface you should override the
/// #GtkScrollable:hadjustment and #GtkScrollable:vadjustment properties.
/// ## Creating a scrollable widget
/// All scrollable widgets should do the following.
/// - When a parent widget sets the scrollable child widget’s adjustments,
/// the widget should populate the adjustments’
/// #GtkAdjustment:lower, #GtkAdjustment:upper,
/// #GtkAdjustment:step-increment, #GtkAdjustment:page-increment and
/// #GtkAdjustment:page-size properties and connect to the
/// #GtkAdjustment::value-changed signal.
/// - Because its preferred size is the size for a fully expanded widget,
/// the scrollable widget must be able to cope with underallocations.
/// This means that it must accept any value passed to its
/// #GtkWidgetClass.size_allocate() function.
/// - When the parent allocates space to the scrollable child widget,
/// the widget should update the adjustments’ properties with new values.
/// - When any of the adjustments emits the #GtkAdjustment::value-changed signal,
/// the scrollable widget should scroll its contents.


public protocol CGTKScrollable: class {
	/// Returns the size of a non-scrolling border around the
	/// outside of the scrollable. An example for this would
	/// be treeview headers. GTK+ can use this information to
	/// display overlayed graphics, like the overshoot indication,
	/// at the right position.
	/// - Parameters:
	///	- border: UnsafeMutablePointer<GtkBorder>! (GtkBorder*)
	/// - Returns: Bool (gboolean)
	func getBorder(_ border: UnsafeMutablePointer<GtkBorder>!) -> Bool

	/// Retrieves the #GtkAdjustment used for horizontal scrolling.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	func getHadjustment() -> UnsafeMutablePointer<GtkAdjustment>!

	/// Gets the horizontal #GtkScrollablePolicy.
	/// - Returns: GtkScrollablePolicy (GtkScrollablePolicy)
	func getHscrollPolicy() -> GtkScrollablePolicy

	/// Retrieves the #GtkAdjustment used for vertical scrolling.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	func getVadjustment() -> UnsafeMutablePointer<GtkAdjustment>!

	/// Gets the vertical #GtkScrollablePolicy.
	/// - Returns: GtkScrollablePolicy (GtkScrollablePolicy)
	func getVscrollPolicy() -> GtkScrollablePolicy

	/// Sets the horizontal adjustment of the #GtkScrollable.
	/// - Parameters:
	///	- hadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	func setHadjustment(_ hadjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void

	/// Sets the #GtkScrollablePolicy to determine whether
	/// horizontal scrolling should start below the minimum width or
	/// below the natural width.
	/// - Parameters:
	///	- policy: GtkScrollablePolicy (GtkScrollablePolicy)
	func setHscrollPolicy(_ policy: GtkScrollablePolicy) -> Swift.Void

	/// Sets the vertical adjustment of the #GtkScrollable.
	/// - Parameters:
	///	- vadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	func setVadjustment(_ vadjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void

	/// Sets the #GtkScrollablePolicy to determine whether
	/// vertical scrolling should start below the minimum height or
	/// below the natural height.
	/// - Parameters:
	///	- policy: GtkScrollablePolicy (GtkScrollablePolicy)
	func setVscrollPolicy(_ policy: GtkScrollablePolicy) -> Swift.Void

}
