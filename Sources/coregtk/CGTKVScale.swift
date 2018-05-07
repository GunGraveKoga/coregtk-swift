/*
 * CGTKVScale.swift
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

public let GTK_TYPE_VSCALE: GType = gtk_vscale_get_type()

@inline(__always) public func GTK_VSCALE(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkVScale>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_VSCALE)
}

/// The #GtkVScale widget is used to allow the user to select a value using
/// a vertical slider. To create one, use gtk_hscale_new_with_range().
/// The position to show the current value, and the number of decimal places
/// shown can be set using the parent #GtkScale class’s functions.
/// GtkVScale has been deprecated, use #GtkScale instead.


open class CGTKVScale : CGTKScale {
	/// Creates a new #GtkVScale.
	/// - Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(adjustment: UnsafeMutablePointer<GtkAdjustment>!) {
		self.init(withGObject: gtk_vscale_new(adjustment))!
	}

	/// Creates a new vertical scale widget that lets the user input a
	/// number between @min and @max (including @min and @max) with the
	/// increment @step.  @step must be nonzero; it’s the distance the
	/// slider moves when using the arrow keys to adjust the scale value.
	/// Note that the way in which the precision is derived works best if @step
	/// is a power of ten. If the resulting precision is not suitable for your
	/// needs, use gtk_scale_set_digits() to correct it.
	/// - Parameters:
	///	- min: Double (gdouble)
	///	- max: Double (gdouble)
	///	- step: Double (gdouble)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withRange min: Double, max: Double, step: Double) {
		self.init(withGObject: gtk_vscale_new_with_range(min, max, step))!
	}

	open var VSCALE: UnsafeMutablePointer<GtkVScale>! {
		get {
			return GTK_VSCALE(self.GOBJECT)
		}
	}

}
