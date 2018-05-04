/*
 * CGTKVScrollbar.swift
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

public let GTK_TYPE_VSCROLLBAR: GType = gtk_vscrollbar_get_type()

@inline(__always) public func GTK_VSCROLLBAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkVScrollbar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_VSCROLLBAR)
}

/// 
/// The #GtkVScrollbar widget is a widget arranged vertically creating a
/// scrollbar. See #GtkScrollbar for details on
/// scrollbars. #GtkAdjustment pointers may be added to handle the
/// adjustment of the scrollbar or it may be left %NULL in which case one
/// will be created for you. See #GtkScrollbar for a description of what the
/// fields in an adjustment represent for a scrollbar.
/// GtkVScrollbar has been deprecated, use #GtkScrollbar instead.


open class CGTKVScrollbar : CGTKScrollbar {
	/// 
	/// Creates a new vertical scrollbar.
	/// Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>?
	/// - Returns: CGTKWidget
	public convenience init(adjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		self.init(withGObject: gtk_vscrollbar_new(adjustment))!
	}

	open var VSCROLLBAR: UnsafeMutablePointer<GtkVScrollbar>! {
		get {
			return GTK_VSCROLLBAR(self.GOBJECT)
		}
	}

}
