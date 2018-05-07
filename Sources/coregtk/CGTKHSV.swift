/*
 * CGTKHSV.swift
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

public let GTK_TYPE_HSV: GType = gtk_hsv_get_type()

@inline(__always) public func GTK_HSV(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkHSV>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_HSV)
}

/// #GtkHSV is the “color wheel” part of a complete color selector widget.
/// It allows to select a color by determining its HSV components in an
/// intuitive way. Moving the selection around the outer ring changes the hue,
/// and moving the selection point inside the inner triangle changes value and
/// saturation.
/// #GtkHSV has been deprecated together with #GtkColorSelection, where
/// it was used.


open class CGTKHSV : CGTKWidget {
	/// Converts a color from HSV space to RGB.
	/// Input values must be in the [0.0, 1.0] range;
	/// output values will be in the same range.
	/// - Parameters:
	///	- h: Double (gdouble)
	///	- s: Double (gdouble)
	///	- v: Double (gdouble)
	///	- r: UnsafeMutablePointer<Double>! (gdouble*)
	///	- g: UnsafeMutablePointer<Double>! (gdouble*)
	///	- b: UnsafeMutablePointer<Double>! (gdouble*)
	open class func gtkHsvToRgb(h: Double, s: Double, v: Double, r: UnsafeMutablePointer<Double>!, g: UnsafeMutablePointer<Double>!, b: UnsafeMutablePointer<Double>!) -> Swift.Void {
		gtk_hsv_to_rgb(h, s, v, r, g, b)
	}

	/// Creates a new HSV color selector.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_hsv_new())!
	}

	open var HSV: UnsafeMutablePointer<GtkHSV>! {
		get {
			return GTK_HSV(self.GOBJECT)
		}
	}

	/// Queries the current color in an HSV color selector.
	/// Returned values will be in the [0.0, 1.0] range.
	/// - Parameters:
	///	- h: UnsafeMutablePointer<Double>! (gdouble*)
	///	- s: UnsafeMutablePointer<Double>! (gdouble*)
	///	- v: UnsafeMutablePointer<Double>! (gdouble*)
	open func gtkHsvGetColor(h: UnsafeMutablePointer<Double>!, s: UnsafeMutablePointer<Double>!, v: UnsafeMutablePointer<Double>!) -> Swift.Void {
		gtk_hsv_get_color(GTK_HSV(self.GOBJECT), h, s, v)
	}

	/// Queries the size and ring width of an HSV color selector.
	/// - Parameters:
	///	- size: UnsafeMutablePointer<Int32>! (gint*)
	///	- ringWidth: UnsafeMutablePointer<Int32>! (gint*)
	open func gtkHsvGetMetrics(size: UnsafeMutablePointer<Int32>!, ringWidth: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_hsv_get_metrics(GTK_HSV(self.GOBJECT), size, ringWidth)
	}

	/// An HSV color selector can be said to be adjusting if multiple rapid
	/// changes are being made to its value, for example, when the user is
	/// adjusting the value with the mouse. This function queries whether
	/// the HSV color selector is being adjusted or not.
	/// - Returns: Bool (gboolean)
	open func gtkHsvIsAdjusting() -> Bool {
		return gtk_hsv_is_adjusting(GTK_HSV(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the current color in an HSV color selector.
	/// Color component values must be in the [0.0, 1.0] range.
	/// - Parameters:
	///	- h: Double (double)
	///	- s: Double (double)
	///	- v: Double (double)
	open func gtkHsvSetColor(h: Double, s: Double, v: Double) -> Swift.Void {
		gtk_hsv_set_color(GTK_HSV(self.GOBJECT), h, s, v)
	}

	/// Sets the size and ring width of an HSV color selector.
	/// - Parameters:
	///	- size: gint (gint)
	///	- ringWidth: gint (gint)
	open func gtkHsvSetMetrics(size: gint, ringWidth: gint) -> Swift.Void {
		gtk_hsv_set_metrics(GTK_HSV(self.GOBJECT), size, ringWidth)
	}

}
