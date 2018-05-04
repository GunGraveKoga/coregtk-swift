/*
 * CGTKAlignment.swift
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

public let GTK_TYPE_ALIGNMENT: GType = gtk_alignment_get_type()

@inline(__always) public func GTK_ALIGNMENT(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkAlignment>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_ALIGNMENT)
}

/// 
/// The #GtkAlignment widget controls the alignment and size of its child widget.
/// It has four settings: xscale, yscale, xalign, and yalign.
/// The scale settings are used to specify how much the child widget should
/// expand to fill the space allocated to the #GtkAlignment.
/// The values can range from 0 (meaning the child doesn’t expand at all) to
/// 1 (meaning the child expands to fill all of the available space).
/// The align settings are used to place the child widget within the available
/// area. The values range from 0 (top or left) to 1 (bottom or right).
/// Of course, if the scale settings are both set to 1, the alignment settings
/// have no effect.
/// GtkAlignment has been deprecated in 3.14 and should not be used in
/// newly-written code. The desired effect can be achieved by using the
/// #GtkWidget:halign, #GtkWidget:valign and #GtkWidget:margin properties on the
/// child widget.


open class CGTKAlignment : CGTKBin {
	/// 
	/// Creates a new #GtkAlignment.
	/// Parameters:
	///	- xalign: Float
	///	- yalign: Float
	///	- xscale: Float
	///	- yscale: Float
	/// - Returns: CGTKWidget
	public convenience init(xalign: Float, yalign: Float, xscale: Float, yscale: Float) {
		self.init(withGObject: gtk_alignment_new(xalign, yalign, xscale, yscale))!
	}

	open var ALIGNMENT: UnsafeMutablePointer<GtkAlignment>! {
		get {
			return GTK_ALIGNMENT(self.GOBJECT)
		}
	}

	/// 
	/// Gets the padding on the different sides of the widget.
	/// See gtk_alignment_set_padding ().
	/// Parameters:
	///	- paddingTop: UnsafeMutablePointer<UInt32>!
	///	- paddingBottom: UnsafeMutablePointer<UInt32>!
	///	- paddingLeft: UnsafeMutablePointer<UInt32>!
	///	- paddingRight: UnsafeMutablePointer<UInt32>!
	open func getPadding(paddingTop: UnsafeMutablePointer<UInt32>!, paddingBottom: UnsafeMutablePointer<UInt32>!, paddingLeft: UnsafeMutablePointer<UInt32>!, paddingRight: UnsafeMutablePointer<UInt32>!) {
		gtk_alignment_get_padding(GTK_ALIGNMENT(self.GOBJECT), paddingTop, paddingBottom, paddingLeft, paddingRight)
	}

	/// 
	/// Sets the #GtkAlignment values.
	/// Parameters:
	///	- xalign: Float
	///	- yalign: Float
	///	- xscale: Float
	///	- yscale: Float
	open func set(xalign: Float, yalign: Float, xscale: Float, yscale: Float) {
		gtk_alignment_set(GTK_ALIGNMENT(self.GOBJECT), xalign, yalign, xscale, yscale)
	}

	/// 
	/// Sets the padding on the different sides of the widget.
	/// The padding adds blank space to the sides of the widget. For instance,
	/// this can be used to indent the child widget towards the right by adding
	/// padding on the left.
	/// Parameters:
	///	- paddingTop: guint
	///	- paddingBottom: guint
	///	- paddingLeft: guint
	///	- paddingRight: guint
	open func setPadding(paddingTop: guint, paddingBottom: guint, paddingLeft: guint, paddingRight: guint) {
		gtk_alignment_set_padding(GTK_ALIGNMENT(self.GOBJECT), paddingTop, paddingBottom, paddingLeft, paddingRight)
	}

}
