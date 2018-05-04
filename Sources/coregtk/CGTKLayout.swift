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

/// 
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


open class CGTKLayout : CGTKContainer {
	/// 
	/// Creates a new #GtkLayout. Unless you have a specific adjustment
	/// you’d like the layout to use for scrolling, pass %NULL for
	/// @hadjustment and @vadjustment.
	/// Parameters:
	///	- hadjustment: UnsafeMutablePointer<GtkAdjustment>?
	///	- vadjustment: UnsafeMutablePointer<GtkAdjustment>?
	/// - Returns: CGTKWidget
	public convenience init(hadjustment: UnsafeMutablePointer<GtkAdjustment>?, vadjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		self.init(withGObject: gtk_layout_new(hadjustment, vadjustment))!
	}

	open var LAYOUT: UnsafeMutablePointer<GtkLayout>! {
		get {
			return GTK_LAYOUT(self.GOBJECT)
		}
	}

	/// 
	/// Retrieve the bin window of the layout used for drawing operations.
	/// - Returns: OpaquePointer
	open func getBinWindow() -> OpaquePointer {
		return gtk_layout_get_bin_window(GTK_LAYOUT(self.GOBJECT))
	}

	/// 
	/// This function should only be called after the layout has been
	/// placed in a #GtkScrolledWindow or otherwise configured for
	/// scrolling. It returns the #GtkAdjustment used for communication
	/// between the horizontal scrollbar and @layout.
	/// See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>!
	open func getHadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_layout_get_hadjustment(GTK_LAYOUT(self.GOBJECT))
	}

	/// 
	/// Gets the size that has been set on the layout, and that determines
	/// the total extents of the layout’s scrollbar area. See
	/// gtk_layout_set_size ().
	/// Parameters:
	///	- width: UnsafeMutablePointer<UInt32>!
	///	- height: UnsafeMutablePointer<UInt32>!
	open func getSize(width: UnsafeMutablePointer<UInt32>!, height: UnsafeMutablePointer<UInt32>!) {
		gtk_layout_get_size(GTK_LAYOUT(self.GOBJECT), width, height)
	}

	/// 
	/// This function should only be called after the layout has been
	/// placed in a #GtkScrolledWindow or otherwise configured for
	/// scrolling. It returns the #GtkAdjustment used for communication
	/// between the vertical scrollbar and @layout.
	/// See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>!
	open func getVadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_layout_get_vadjustment(GTK_LAYOUT(self.GOBJECT))
	}

	/// 
	/// Moves a current child of @layout to a new position.
	/// Parameters:
	///	- childWidget: CGTKWidget
	///	- x: gint
	///	- y: gint
	open func move(childWidget: CGTKWidget, x: gint, y: gint) {
		gtk_layout_move(GTK_LAYOUT(self.GOBJECT), childWidget.WIDGET, x, y)
	}

	/// 
	/// Adds @child_widget to @layout, at position (@x,@y).
	/// @layout becomes the new parent container of @child_widget.
	/// Parameters:
	///	- childWidget: CGTKWidget
	///	- x: gint
	///	- y: gint
	open func put(childWidget: CGTKWidget, x: gint, y: gint) {
		gtk_layout_put(GTK_LAYOUT(self.GOBJECT), childWidget.WIDGET, x, y)
	}

	/// 
	/// Sets the horizontal scroll adjustment for the layout.
	/// See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
	/// Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>?
	open func setHadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		gtk_layout_set_hadjustment(GTK_LAYOUT(self.GOBJECT), adjustment)
	}

	/// 
	/// Sets the size of the scrollable area of the layout.
	/// Parameters:
	///	- width: guint
	///	- height: guint
	open func setSize(width: guint, height: guint) {
		gtk_layout_set_size(GTK_LAYOUT(self.GOBJECT), width, height)
	}

	/// 
	/// Sets the vertical scroll adjustment for the layout.
	/// See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
	/// Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>?
	open func setVadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		gtk_layout_set_vadjustment(GTK_LAYOUT(self.GOBJECT), adjustment)
	}

}
