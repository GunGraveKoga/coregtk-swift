/*
 * CGTKLayout.swift
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

public let GTK_TYPE_LAYOUT: GType = gtk_layout_get_type()

@inline(__always) public func GTK_LAYOUT(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkLayout>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_LAYOUT)
}

/// #GtkLayout is similar to #GtkDrawingArea in that it’s a “blank slate” and
/// doesn’t do anything except paint a blank background by default. It’s
/// different in that it supports scrolling natively due to implementing
/// #GtkScrollable, and can contain child widgets since it’s a #GtkContainer.
/// If you just want to draw, a #GtkDrawingArea is a better choice since it has
/// lower overhead. If you just need to position child widgets at specific
/// points, then #GtkFixed provides that functionality on its own.
/// When handling expose events on a #GtkLayout, you must draw to the #GdkWindow
/// returned by gtk_layout_get_bin_window(), rather than to the one returned by
/// gtk_widget_get_window() as you would for a #GtkDrawingArea.


open class CGTKLayout : CGTKContainer, CGTKScrollable {
	/// Creates a new #GtkLayout. Unless you have a specific adjustment
	/// you’d like the layout to use for scrolling, pass %NULL for
	/// @hadjustment and @vadjustment.
	/// - Parameters:
	///	- hadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	///	- vadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(hadjustment: UnsafeMutablePointer<GtkAdjustment>?, vadjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		self.init(withGObject: gtk_layout_new(hadjustment, vadjustment))!
	}

	open var LAYOUT: UnsafeMutablePointer<GtkLayout>! {
		get {
			return GTK_LAYOUT(self.GOBJECT)
		}
	}

	/// Retrieve the bin window of the layout used for drawing operations.
	/// - Returns: OpaquePointer (GdkWindow*)
	open func getBinWindow() -> OpaquePointer {
		return gtk_layout_get_bin_window(GTK_LAYOUT(self.GOBJECT))
	}

	/// This function should only be called after the layout has been
	/// placed in a #GtkScrolledWindow or otherwise configured for
	/// scrolling. It returns the #GtkAdjustment used for communication
	/// between the horizontal scrollbar and @layout.
	/// See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func getHadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_layout_get_hadjustment(GTK_LAYOUT(self.GOBJECT))
	}

	/// Gets the size that has been set on the layout, and that determines
	/// the total extents of the layout’s scrollbar area. See
	/// gtk_layout_set_size ().
	/// - Parameters:
	///	- width: UnsafeMutablePointer<UInt32>! (guint*)
	///	- height: UnsafeMutablePointer<UInt32>! (guint*)
	open func getSize(width: UnsafeMutablePointer<UInt32>!, height: UnsafeMutablePointer<UInt32>!) -> Swift.Void {
		gtk_layout_get_size(GTK_LAYOUT(self.GOBJECT), width, height)
	}

	/// This function should only be called after the layout has been
	/// placed in a #GtkScrolledWindow or otherwise configured for
	/// scrolling. It returns the #GtkAdjustment used for communication
	/// between the vertical scrollbar and @layout.
	/// See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func getVadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_layout_get_vadjustment(GTK_LAYOUT(self.GOBJECT))
	}

	/// Moves a current child of @layout to a new position.
	/// - Parameters:
	///	- childWidget: CGTKWidget (GtkWidget*)
	///	- x: gint (gint)
	///	- y: gint (gint)
	open func move(childWidget: CGTKWidget, x: gint, y: gint) -> Swift.Void {
		gtk_layout_move(GTK_LAYOUT(self.GOBJECT), childWidget.WIDGET, x, y)
	}

	/// Adds @child_widget to @layout, at position (@x,@y).
	/// @layout becomes the new parent container of @child_widget.
	/// - Parameters:
	///	- childWidget: CGTKWidget (GtkWidget*)
	///	- x: gint (gint)
	///	- y: gint (gint)
	open func put(childWidget: CGTKWidget, x: gint, y: gint) -> Swift.Void {
		gtk_layout_put(GTK_LAYOUT(self.GOBJECT), childWidget.WIDGET, x, y)
	}

	/// Sets the horizontal scroll adjustment for the layout.
	/// See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
	/// - Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setHadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_layout_set_hadjustment(GTK_LAYOUT(self.GOBJECT), adjustment)
	}

	/// Sets the size of the scrollable area of the layout.
	/// - Parameters:
	///	- width: guint (guint)
	///	- height: guint (guint)
	open func setSize(width: guint, height: guint) -> Swift.Void {
		gtk_layout_set_size(GTK_LAYOUT(self.GOBJECT), width, height)
	}

	/// Sets the vertical scroll adjustment for the layout.
	/// See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
	/// - Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setVadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_layout_set_vadjustment(GTK_LAYOUT(self.GOBJECT), adjustment)
	}

	/// Returns the size of a non-scrolling border around the
	/// outside of the scrollable. An example for this would
	/// be treeview headers. GTK+ can use this information to
	/// display overlayed graphics, like the overshoot indication,
	/// at the right position.
	/// - Parameters:
	///	- border: UnsafeMutablePointer<GtkBorder>! (GtkBorder*)
	/// - Returns: Bool (gboolean)
	open func getBorder(_ border: UnsafeMutablePointer<GtkBorder>!) -> Bool {
		return gtk_scrollable_get_border(GTK_SCROLLABLE(self.GOBJECT), border) != 0 ? true : false
	}

	/// Gets the horizontal #GtkScrollablePolicy.
	/// - Returns: GtkScrollablePolicy (GtkScrollablePolicy)
	open func getHscrollPolicy() -> GtkScrollablePolicy {
		return gtk_scrollable_get_hscroll_policy(GTK_SCROLLABLE(self.GOBJECT))
	}

	/// Gets the vertical #GtkScrollablePolicy.
	/// - Returns: GtkScrollablePolicy (GtkScrollablePolicy)
	open func getVscrollPolicy() -> GtkScrollablePolicy {
		return gtk_scrollable_get_vscroll_policy(GTK_SCROLLABLE(self.GOBJECT))
	}

	/// Sets the horizontal adjustment of the #GtkScrollable.
	/// - Parameters:
	///	- hadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setHadjustment(_ hadjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_scrollable_set_hadjustment(GTK_SCROLLABLE(self.GOBJECT), hadjustment)
	}

	/// Sets the #GtkScrollablePolicy to determine whether
	/// horizontal scrolling should start below the minimum width or
	/// below the natural width.
	/// - Parameters:
	///	- policy: GtkScrollablePolicy (GtkScrollablePolicy)
	open func setHscrollPolicy(_ policy: GtkScrollablePolicy) -> Swift.Void {
		gtk_scrollable_set_hscroll_policy(GTK_SCROLLABLE(self.GOBJECT), policy)
	}

	/// Sets the vertical adjustment of the #GtkScrollable.
	/// - Parameters:
	///	- vadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setVadjustment(_ vadjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_scrollable_set_vadjustment(GTK_SCROLLABLE(self.GOBJECT), vadjustment)
	}

	/// Sets the #GtkScrollablePolicy to determine whether
	/// vertical scrolling should start below the minimum height or
	/// below the natural height.
	/// - Parameters:
	///	- policy: GtkScrollablePolicy (GtkScrollablePolicy)
	open func setVscrollPolicy(_ policy: GtkScrollablePolicy) -> Swift.Void {
		gtk_scrollable_set_vscroll_policy(GTK_SCROLLABLE(self.GOBJECT), policy)
	}

}
