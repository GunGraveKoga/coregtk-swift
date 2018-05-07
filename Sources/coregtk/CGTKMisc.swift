/*
 * CGTKMisc.swift
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

public let GTK_TYPE_MISC: GType = gtk_misc_get_type()

@inline(__always) public func GTK_MISC(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkMisc>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_MISC)
}

/// The #GtkMisc widget is an abstract widget which is not useful itself, but
/// is used to derive subclasses which have alignment and padding attributes.
/// The horizontal and vertical padding attributes allows extra space to be
/// added around the widget.
/// The horizontal and vertical alignment attributes enable the widget to be
/// positioned within its allocated area. Note that if the widget is added to
/// a container in such a way that it expands automatically to fill its
/// allocated area, the alignment settings will not alter the widget's position.
/// Note that the desired effect can in most cases be achieved by using the
/// #GtkWidget:halign, #GtkWidget:valign and #GtkWidget:margin properties
/// on the child widget, so GtkMisc should not be used in new code. To reflect
/// this fact, all #GtkMisc API has been deprecated.


open class CGTKMisc : CGTKWidget {
	open var MISC: UnsafeMutablePointer<GtkMisc>! {
		get {
			return GTK_MISC(self.GOBJECT)
		}
	}

	/// Gets the X and Y alignment of the widget within its allocation.
	/// See gtk_misc_set_alignment().
	/// - Parameters:
	///	- xalign: UnsafeMutablePointer<Float>! (gfloat*)
	///	- yalign: UnsafeMutablePointer<Float>! (gfloat*)
	open func getAlignment(xalign: UnsafeMutablePointer<Float>!, yalign: UnsafeMutablePointer<Float>!) -> Swift.Void {
		gtk_misc_get_alignment(GTK_MISC(self.GOBJECT), xalign, yalign)
	}

	/// Gets the padding in the X and Y directions of the widget.
	/// See gtk_misc_set_padding().
	/// - Parameters:
	///	- xpad: UnsafeMutablePointer<Int32>! (gint*)
	///	- ypad: UnsafeMutablePointer<Int32>! (gint*)
	open func getPadding(xpad: UnsafeMutablePointer<Int32>!, ypad: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_misc_get_padding(GTK_MISC(self.GOBJECT), xpad, ypad)
	}

	/// Sets the alignment of the widget.
	/// - Parameters:
	///	- xalign: Float (gfloat)
	///	- yalign: Float (gfloat)
	open func setAlignment(xalign: Float, yalign: Float) -> Swift.Void {
		gtk_misc_set_alignment(GTK_MISC(self.GOBJECT), xalign, yalign)
	}

	/// Sets the amount of space to add around the widget.
	/// - Parameters:
	///	- xpad: gint (gint)
	///	- ypad: gint (gint)
	open func setPadding(xpad: gint, ypad: gint) -> Swift.Void {
		gtk_misc_set_padding(GTK_MISC(self.GOBJECT), xpad, ypad)
	}

}
