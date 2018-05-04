/*
 * CGTKScrollbar.swift
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

public let GTK_TYPE_SCROLLBAR: GType = gtk_scrollbar_get_type()

@inline(__always) public func GTK_SCROLLBAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkScrollbar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SCROLLBAR)
}

/// 
/// The #GtkScrollbar widget is a horizontal or vertical scrollbar,
/// depending on the value of the #GtkOrientable:orientation property.
/// Its position and movement are controlled by the adjustment that is passed to
/// or created by gtk_scrollbar_new(). See #GtkAdjustment for more details. The
/// #GtkAdjustment:value field sets the position of the thumb and must be between
/// #GtkAdjustment:lower and #GtkAdjustment:upper - #GtkAdjustment:page-size. The
/// #GtkAdjustment:page-size represents the size of the visible scrollable area.
/// The fields #GtkAdjustment:step-increment and #GtkAdjustment:page-increment
/// fields are added to or subtracted from the #GtkAdjustment:value when the user
/// asks to move by a step (using e.g. the cursor arrow keys or, if present, the
/// stepper buttons) or by a page (using e.g. the Page Down/Up keys).
/// # CSS nodes
/// |[<!-- language="plain" -->
/// scrollbar[.fine-tune]
/// ╰── contents
/// ├── [button.up]
/// ├── [button.down]
/// ├── trough
/// │   ╰── slider
/// ├── [button.up]
/// ╰── [button.down]
/// ]|
/// GtkScrollbar has a main CSS node with name scrollbar and a subnode for its
/// contents, with subnodes named trough and slider.
/// The main node gets the style class .fine-tune added when the scrollbar is
/// in 'fine-tuning' mode.
/// If steppers are enabled, they are represented by up to four additional
/// subnodes with name button. These get the style classes .up and .down to
/// indicate in which direction they are moving.
/// Other style classes that may be added to scrollbars inside #GtkScrolledWindow
/// include the positional classes (.left, .right, .top, .bottom) and style
/// classes related to overlay scrolling (.overlay-indicator, .dragging, .hovering).


open class CGTKScrollbar : CGTKRange {
	/// 
	/// Creates a new scrollbar with the given orientation.
	/// Parameters:
	///	- orientation: GtkOrientation
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>?
	/// - Returns: CGTKWidget
	public convenience init(orientation: GtkOrientation, adjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		self.init(withGObject: gtk_scrollbar_new(orientation, adjustment))!
	}

	open var SCROLLBAR: UnsafeMutablePointer<GtkScrollbar>! {
		get {
			return GTK_SCROLLBAR(self.GOBJECT)
		}
	}

}
