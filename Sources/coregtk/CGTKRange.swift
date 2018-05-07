/*
 * CGTKRange.swift
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

public let GTK_TYPE_RANGE: GType = gtk_range_get_type()

@inline(__always) public func GTK_RANGE(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkRange>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_RANGE)
}

/// #GtkRange is the common base class for widgets which visualize an
/// adjustment, e.g #GtkScale or #GtkScrollbar.
/// Apart from signals for monitoring the parameters of the adjustment,
/// #GtkRange provides properties and methods for influencing the sensitivity
/// of the “steppers”. It also provides properties and methods for setting a
/// “fill level” on range widgets. See gtk_range_set_fill_level().


open class CGTKRange : CGTKWidget, CGTKOrientable {
	open var RANGE: UnsafeMutablePointer<GtkRange>! {
		get {
			return GTK_RANGE(self.GOBJECT)
		}
	}

	/// Get the #GtkAdjustment which is the “model” object for #GtkRange.
	/// See gtk_range_set_adjustment() for details.
	/// The return value does not have a reference added, so should not
	/// be unreferenced.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func getAdjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_range_get_adjustment(GTK_RANGE(self.GOBJECT))
	}

	/// Gets the current position of the fill level indicator.
	/// - Returns: Double (gdouble)
	open func getFillLevel() -> Double {
		return gtk_range_get_fill_level(GTK_RANGE(self.GOBJECT))
	}

	/// Gets the value set by gtk_range_set_flippable().
	/// - Returns: Bool (gboolean)
	open func getFlippable() -> Bool {
		return gtk_range_get_flippable(GTK_RANGE(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the value set by gtk_range_set_inverted().
	/// - Returns: Bool (gboolean)
	open func getInverted() -> Bool {
		return gtk_range_get_inverted(GTK_RANGE(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the sensitivity policy for the stepper that points to the
	/// 'lower' end of the GtkRange’s adjustment.
	/// - Returns: GtkSensitivityType (GtkSensitivityType)
	open func getLowerStepperSensitivity() -> GtkSensitivityType {
		return gtk_range_get_lower_stepper_sensitivity(GTK_RANGE(self.GOBJECT))
	}

	/// This function is useful mainly for #GtkRange subclasses.
	/// See gtk_range_set_min_slider_size().
	/// - Returns: gint (gint)
	open func getMinSliderSize() -> gint {
		return gtk_range_get_min_slider_size(GTK_RANGE(self.GOBJECT))
	}

	/// This function returns the area that contains the range’s trough
	/// and its steppers, in widget->window coordinates.
	/// This function is useful mainly for #GtkRange subclasses.
	/// - Parameters:
	///	- rangeRect: UnsafeMutablePointer<GdkRectangle>! (GdkRectangle*)
	open func getRangeRect(_ rangeRect: UnsafeMutablePointer<GdkRectangle>!) -> Swift.Void {
		gtk_range_get_range_rect(GTK_RANGE(self.GOBJECT), rangeRect)
	}

	/// Gets whether the range is restricted to the fill level.
	/// - Returns: Bool (gboolean)
	open func getRestrictToFillLevel() -> Bool {
		return gtk_range_get_restrict_to_fill_level(GTK_RANGE(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the number of digits to round the value to when
	/// it changes. See #GtkRange::change-value.
	/// - Returns: gint (gint)
	open func getRoundDigits() -> gint {
		return gtk_range_get_round_digits(GTK_RANGE(self.GOBJECT))
	}

	/// Gets whether the range displays the fill level graphically.
	/// - Returns: Bool (gboolean)
	open func getShowFillLevel() -> Bool {
		return gtk_range_get_show_fill_level(GTK_RANGE(self.GOBJECT)) != 0 ? true : false
	}

	/// This function returns sliders range along the long dimension,
	/// in widget->window coordinates.
	/// This function is useful mainly for #GtkRange subclasses.
	/// - Parameters:
	///	- sliderStart: UnsafeMutablePointer<Int32>! (gint*)
	///	- sliderEnd: UnsafeMutablePointer<Int32>! (gint*)
	open func getSliderRange(sliderStart: UnsafeMutablePointer<Int32>!, sliderEnd: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_range_get_slider_range(GTK_RANGE(self.GOBJECT), sliderStart, sliderEnd)
	}

	/// This function is useful mainly for #GtkRange subclasses.
	/// See gtk_range_set_slider_size_fixed().
	/// - Returns: Bool (gboolean)
	open func getSliderSizeFixed() -> Bool {
		return gtk_range_get_slider_size_fixed(GTK_RANGE(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the sensitivity policy for the stepper that points to the
	/// 'upper' end of the GtkRange’s adjustment.
	/// - Returns: GtkSensitivityType (GtkSensitivityType)
	open func getUpperStepperSensitivity() -> GtkSensitivityType {
		return gtk_range_get_upper_stepper_sensitivity(GTK_RANGE(self.GOBJECT))
	}

	/// Gets the current value of the range.
	/// - Returns: Double (gdouble)
	open func getValue() -> Double {
		return gtk_range_get_value(GTK_RANGE(self.GOBJECT))
	}

	/// Sets the adjustment to be used as the “model” object for this range
	/// widget. The adjustment indicates the current range value, the
	/// minimum and maximum range values, the step/page increments used
	/// for keybindings and scrolling, and the page size. The page size
	/// is normally 0 for #GtkScale and nonzero for #GtkScrollbar, and
	/// indicates the size of the visible area of the widget being scrolled.
	/// The page size affects the size of the scrollbar slider.
	/// - Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func setAdjustment(_ adjustment: UnsafeMutablePointer<GtkAdjustment>!) -> Swift.Void {
		gtk_range_set_adjustment(GTK_RANGE(self.GOBJECT), adjustment)
	}

	/// Set the new position of the fill level indicator.
	/// The “fill level” is probably best described by its most prominent
	/// use case, which is an indicator for the amount of pre-buffering in
	/// a streaming media player. In that use case, the value of the range
	/// would indicate the current play position, and the fill level would
	/// be the position up to which the file/stream has been downloaded.
	/// This amount of prebuffering can be displayed on the range’s trough
	/// and is themeable separately from the trough. To enable fill level
	/// display, use gtk_range_set_show_fill_level(). The range defaults
	/// to not showing the fill level.
	/// Additionally, it’s possible to restrict the range’s slider position
	/// to values which are smaller than the fill level. This is controller
	/// by gtk_range_set_restrict_to_fill_level() and is by default
	/// enabled.
	/// - Parameters:
	///	- fillLevel: Double (gdouble)
	open func setFillLevel(_ fillLevel: Double) -> Swift.Void {
		gtk_range_set_fill_level(GTK_RANGE(self.GOBJECT), fillLevel)
	}

	/// If a range is flippable, it will switch its direction if it is
	/// horizontal and its direction is %GTK_TEXT_DIR_RTL.
	/// See gtk_widget_get_direction().
	/// - Parameters:
	///	- flippable: Bool (gboolean)
	open func setFlippable(_ flippable: Bool) -> Swift.Void {
		gtk_range_set_flippable(GTK_RANGE(self.GOBJECT), flippable ? 1 : 0)
	}

	/// Sets the step and page sizes for the range.
	/// The step size is used when the user clicks the #GtkScrollbar
	/// arrows or moves #GtkScale via arrow keys. The page size
	/// is used for example when moving via Page Up or Page Down keys.
	/// - Parameters:
	///	- step: Double (gdouble)
	///	- page: Double (gdouble)
	open func setIncrements(step: Double, page: Double) -> Swift.Void {
		gtk_range_set_increments(GTK_RANGE(self.GOBJECT), step, page)
	}

	/// Ranges normally move from lower to higher values as the
	/// slider moves from top to bottom or left to right. Inverted
	/// ranges have higher values at the top or on the right rather than
	/// on the bottom or left.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setInverted(setting: Bool) -> Swift.Void {
		gtk_range_set_inverted(GTK_RANGE(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets the sensitivity policy for the stepper that points to the
	/// 'lower' end of the GtkRange’s adjustment.
	/// - Parameters:
	///	- sensitivity: GtkSensitivityType (GtkSensitivityType)
	open func setLowerStepperSensitivity(_ sensitivity: GtkSensitivityType) -> Swift.Void {
		gtk_range_set_lower_stepper_sensitivity(GTK_RANGE(self.GOBJECT), sensitivity)
	}

	/// Sets the minimum size of the range’s slider.
	/// This function is useful mainly for #GtkRange subclasses.
	/// - Parameters:
	///	- minSize: gint (gint)
	open func setMinSliderSize(minSize: gint) -> Swift.Void {
		gtk_range_set_min_slider_size(GTK_RANGE(self.GOBJECT), minSize)
	}

	/// Sets the allowable values in the #GtkRange, and clamps the range
	/// value to be between @min and @max. (If the range has a non-zero
	/// page size, it is clamped between @min and @max - page-size.)
	/// - Parameters:
	///	- min: Double (gdouble)
	///	- max: Double (gdouble)
	open func setRange(min: Double, max: Double) -> Swift.Void {
		gtk_range_set_range(GTK_RANGE(self.GOBJECT), min, max)
	}

	/// Sets whether the slider is restricted to the fill level. See
	/// gtk_range_set_fill_level() for a general description of the fill
	/// level concept.
	/// - Parameters:
	///	- restrictToFillLevel: Bool (gboolean)
	open func setRestrictToFillLevel(_ restrictToFillLevel: Bool) -> Swift.Void {
		gtk_range_set_restrict_to_fill_level(GTK_RANGE(self.GOBJECT), restrictToFillLevel ? 1 : 0)
	}

	/// Sets the number of digits to round the value to when
	/// it changes. See #GtkRange::change-value.
	/// - Parameters:
	///	- roundDigits: gint (gint)
	open func setRoundDigits(_ roundDigits: gint) -> Swift.Void {
		gtk_range_set_round_digits(GTK_RANGE(self.GOBJECT), roundDigits)
	}

	/// Sets whether a graphical fill level is show on the trough. See
	/// gtk_range_set_fill_level() for a general description of the fill
	/// level concept.
	/// - Parameters:
	///	- showFillLevel: Bool (gboolean)
	open func setShowFillLevel(_ showFillLevel: Bool) -> Swift.Void {
		gtk_range_set_show_fill_level(GTK_RANGE(self.GOBJECT), showFillLevel ? 1 : 0)
	}

	/// Sets whether the range’s slider has a fixed size, or a size that
	/// depends on its adjustment’s page size.
	/// This function is useful mainly for #GtkRange subclasses.
	/// - Parameters:
	///	- sizeFixed: Bool (gboolean)
	open func setSliderSizeFixed(_ sizeFixed: Bool) -> Swift.Void {
		gtk_range_set_slider_size_fixed(GTK_RANGE(self.GOBJECT), sizeFixed ? 1 : 0)
	}

	/// Sets the sensitivity policy for the stepper that points to the
	/// 'upper' end of the GtkRange’s adjustment.
	/// - Parameters:
	///	- sensitivity: GtkSensitivityType (GtkSensitivityType)
	open func setUpperStepperSensitivity(_ sensitivity: GtkSensitivityType) -> Swift.Void {
		gtk_range_set_upper_stepper_sensitivity(GTK_RANGE(self.GOBJECT), sensitivity)
	}

	/// Sets the current value of the range; if the value is outside the
	/// minimum or maximum range values, it will be clamped to fit inside
	/// them. The range emits the #GtkRange::value-changed signal if the
	/// value changes.
	/// - Parameters:
	///	- value: Double (gdouble)
	open func setValue(_ value: Double) -> Swift.Void {
		gtk_range_set_value(GTK_RANGE(self.GOBJECT), value)
	}

	/// Retrieves the orientation of the @orientable.
	/// - Returns: GtkOrientation (GtkOrientation)
	open func getOrientation() -> GtkOrientation {
		return gtk_orientable_get_orientation(GTK_ORIENTABLE(self.GOBJECT))
	}

	/// Sets the orientation of the @orientable.
	/// - Parameters:
	///	- orientation: GtkOrientation (GtkOrientation)
	open func setOrientation(_ orientation: GtkOrientation) -> Swift.Void {
		gtk_orientable_set_orientation(GTK_ORIENTABLE(self.GOBJECT), orientation)
	}

}
