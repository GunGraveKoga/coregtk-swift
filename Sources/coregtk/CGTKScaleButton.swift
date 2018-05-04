/*
 * CGTKScaleButton.swift
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

public let GTK_TYPE_SCALE_BUTTON: GType = gtk_scale_button_get_type()

@inline(__always) public func GTK_SCALE_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkScaleButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SCALE_BUTTON)
}

/// 
/// #GtkScaleButton provides a button which pops up a scale widget.
/// This kind of widget is commonly used for volume controls in multimedia
/// applications, and GTK+ provides a #GtkVolumeButton subclass that
/// is tailored for this use case.
/// # CSS nodes
/// GtkScaleButton has a single CSS node with name button. To differentiate
/// it from a plain #GtkButton, it gets the .scale style class.


open class CGTKScaleButton : CGTKButton {
	/// 
	/// Creates a #GtkScaleButton, with a range between @min and @max, with
	/// a stepping of @step.
	/// Parameters:
	///	- size: GtkIconSize
	///	- min: Double
	///	- max: Double
	///	- step: Double
	///	- icons: UnsafeMutablePointer<UnsafePointer<gchar>?>!
	/// - Returns: CGTKWidget
	public convenience init(size: GtkIconSize, min: Double, max: Double, step: Double, icons: UnsafeMutablePointer<UnsafePointer<gchar>?>!) {
		self.init(withGObject: gtk_scale_button_new(size, min, max, step, icons))!
	}

	open var SCALEBUTTON: UnsafeMutablePointer<GtkScaleButton>! {
		get {
			return GTK_SCALE_BUTTON(self.GOBJECT)
		}
	}

	/// 
	/// Gets the #GtkAdjustment associated with the #GtkScaleButton’s scale.
	/// See gtk_range_get_adjustment() for details.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>!
	open func getAdjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_scale_button_get_adjustment(GTK_SCALE_BUTTON(self.GOBJECT))
	}

	/// 
	/// Retrieves the minus button of the #GtkScaleButton.
	/// - Returns: CGTKWidget
	open func getMinusButton<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_scale_button_get_minus_button(GTK_SCALE_BUTTON(self.GOBJECT)))!
	}

	/// 
	/// Retrieves the plus button of the #GtkScaleButton.
	/// - Returns: CGTKWidget
	open func getPlusButton<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_scale_button_get_plus_button(GTK_SCALE_BUTTON(self.GOBJECT)))!
	}

	/// 
	/// Retrieves the popup of the #GtkScaleButton.
	/// - Returns: CGTKWidget
	open func getPopup<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_scale_button_get_popup(GTK_SCALE_BUTTON(self.GOBJECT)))!
	}

	/// 
	/// Gets the current value of the scale button.
	/// - Returns: Double
	open func getValue() -> Double {
		return gtk_scale_button_get_value(GTK_SCALE_BUTTON(self.GOBJECT))
	}

	/// 
	/// Sets the #GtkAdjustment to be used as a model
	/// for the #GtkScaleButton’s scale.
	/// See gtk_range_set_adjustment() for details.
	/// Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>!
	open func setAdjustment(_ adjustment: UnsafeMutablePointer<GtkAdjustment>!) {
		gtk_scale_button_set_adjustment(GTK_SCALE_BUTTON(self.GOBJECT), adjustment)
	}

	/// 
	/// Sets the icons to be used by the scale button.
	/// For details, see the #GtkScaleButton:icons property.
	/// Parameters:
	///	- icons: UnsafeMutablePointer<UnsafePointer<gchar>?>!
	open func setIcons(_ icons: UnsafeMutablePointer<UnsafePointer<gchar>?>!) {
		gtk_scale_button_set_icons(GTK_SCALE_BUTTON(self.GOBJECT), icons)
	}

	/// 
	/// Sets the current value of the scale; if the value is outside
	/// the minimum or maximum range values, it will be clamped to fit
	/// inside them. The scale button emits the #GtkScaleButton::value-changed
	/// signal if the value changes.
	/// Parameters:
	///	- value: Double
	open func setValue(_ value: Double) {
		gtk_scale_button_set_value(GTK_SCALE_BUTTON(self.GOBJECT), value)
	}

}
