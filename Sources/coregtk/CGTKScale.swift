/*
 * CGTKScale.swift
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

public let GTK_TYPE_SCALE: GType = gtk_scale_get_type()

@inline(__always) public func GTK_SCALE(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkScale>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SCALE)
}

/// A GtkScale is a slider control used to select a numeric value.
/// To use it, you’ll probably want to investigate the methods on
/// its base class, #GtkRange, in addition to the methods for GtkScale itself.
/// To set the value of a scale, you would normally use gtk_range_set_value().
/// To detect changes to the value, you would normally use the
/// #GtkRange::value-changed signal.
/// Note that using the same upper and lower bounds for the #GtkScale (through
/// the #GtkRange methods) will hide the slider itself. This is useful for
/// applications that want to show an undeterminate value on the scale, without
/// changing the layout of the application (such as movie or music players).
/// # GtkScale as GtkBuildable
/// GtkScale supports a custom <marks> element, which can contain multiple
/// <mark> elements. The “value” and “position” attributes have the same
/// meaning as gtk_scale_add_mark() parameters of the same name. If the
/// element is not empty, its content is taken as the markup to show at
/// the mark. It can be translated with the usual ”translatable” and
/// “context” attributes.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// scale[.fine-tune][.marks-before][.marks-after]
/// ├── marks.top
/// │   ├── mark
/// │   ┊    ├── [label]
/// │   ┊    ╰── indicator
/// ┊   ┊
/// │   ╰── mark
/// ├── [value]
/// ├── contents
/// │   ╰── trough
/// │       ├── slider
/// │       ├── [highlight]
/// │       ╰── [fill]
/// ╰── marks.bottom
/// ├── mark
/// ┊    ├── indicator
/// ┊    ╰── [label]
/// ╰── mark
/// ]|
/// GtkScale has a main CSS node with name scale and a subnode for its contents,
/// with subnodes named trough and slider.
/// The main node gets the style class .fine-tune added when the scale is in
/// 'fine-tuning' mode.
/// If the scale has an origin (see gtk_scale_set_has_origin()), there is a
/// subnode with name highlight below the trough node that is used for rendering
/// the highlighted part of the trough.
/// If the scale is showing a fill level (see gtk_range_set_show_fill_level()),
/// there is a subnode with name fill below the trough node that is used for
/// rendering the filled in part of the trough.
/// If marks are present, there is a marks subnode before or after the contents
/// node, below which each mark gets a node with name mark. The marks nodes get
/// either the .top or .bottom style class.
/// The mark node has a subnode named indicator. If the mark has text, it also
/// has a subnode named label. When the mark is either above or left of the
/// scale, the label subnode is the first when present. Otherwise, the indicator
/// subnode is the first.
/// The main CSS node gets the 'marks-before' and/or 'marks-after' style classes
/// added depending on what marks are present.
/// If the scale is displaying the value (see #GtkScale:draw-value), there is
/// subnode with name value.


open class CGTKScale : CGTKRange {
	/// Creates a new #GtkScale.
	/// - Parameters:
	///	- orientation: GtkOrientation (GtkOrientation)
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(orientation: GtkOrientation, adjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		self.init(withGObject: gtk_scale_new(orientation, adjustment))!
	}

	/// Creates a new scale widget with the given orientation that lets the
	/// user input a number between @min and @max (including @min and @max)
	/// with the increment @step.  @step must be nonzero; it’s the distance
	/// the slider moves when using the arrow keys to adjust the scale
	/// value.
	/// Note that the way in which the precision is derived works best if @step
	/// is a power of ten. If the resulting precision is not suitable for your
	/// needs, use gtk_scale_set_digits() to correct it.
	/// - Parameters:
	///	- orientation: GtkOrientation (GtkOrientation)
	///	- min: Double (gdouble)
	///	- max: Double (gdouble)
	///	- step: Double (gdouble)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withRange orientation: GtkOrientation, min: Double, max: Double, step: Double) {
		self.init(withGObject: gtk_scale_new_with_range(orientation, min, max, step))!
	}

	open var SCALE: UnsafeMutablePointer<GtkScale>! {
		get {
			return GTK_SCALE(self.GOBJECT)
		}
	}

	/// Adds a mark at @value.
	/// A mark is indicated visually by drawing a tick mark next to the scale,
	/// and GTK+ makes it easy for the user to position the scale exactly at the
	/// marks value.
	/// If @markup is not %NULL, text is shown next to the tick mark.
	/// To remove marks from a scale, use gtk_scale_clear_marks().
	/// - Parameters:
	///	- value: Double (gdouble)
	///	- position: GtkPositionType (GtkPositionType)
	///	- markup: String (const gchar*)
	open func addMark(value: Double, position: GtkPositionType, markup: String) -> Swift.Void {
		gtk_scale_add_mark(GTK_SCALE(self.GOBJECT), value, position, markup)
	}

	/// Removes any marks that have been added with gtk_scale_add_mark().
	open func clearMarks() -> Swift.Void {
		gtk_scale_clear_marks(GTK_SCALE(self.GOBJECT))
	}

	/// Gets the number of decimal places that are displayed in the value.
	/// - Returns: gint (gint)
	open func getDigits() -> gint {
		return gtk_scale_get_digits(GTK_SCALE(self.GOBJECT))
	}

	/// Returns whether the current value is displayed as a string
	/// next to the slider.
	/// - Returns: Bool (gboolean)
	open func getDrawValue() -> Bool {
		return gtk_scale_get_draw_value(GTK_SCALE(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the scale has an origin.
	/// - Returns: Bool (gboolean)
	open func getHasOrigin() -> Bool {
		return gtk_scale_get_has_origin(GTK_SCALE(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the #PangoLayout used to display the scale. The returned
	/// object is owned by the scale so does not need to be freed by
	/// the caller.
	/// - Returns: OpaquePointer? (PangoLayout*)
	open func getLayout() -> OpaquePointer? {
		return gtk_scale_get_layout(GTK_SCALE(self.GOBJECT))
	}

	/// Obtains the coordinates where the scale will draw the
	/// #PangoLayout representing the text in the scale. Remember
	/// when using the #PangoLayout function you need to convert to
	/// and from pixels using PANGO_PIXELS() or #PANGO_SCALE.
	/// If the #GtkScale:draw-value property is %FALSE, the return
	/// values are undefined.
	/// - Parameters:
	///	- x: UnsafeMutablePointer<Int32>! (gint*)
	///	- y: UnsafeMutablePointer<Int32>! (gint*)
	open func getLayoutOffsets(x: UnsafeMutablePointer<Int32>!, y: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_scale_get_layout_offsets(GTK_SCALE(self.GOBJECT), x, y)
	}

	/// Gets the position in which the current value is displayed.
	/// - Returns: GtkPositionType (GtkPositionType)
	open func getValuePos() -> GtkPositionType {
		return gtk_scale_get_value_pos(GTK_SCALE(self.GOBJECT))
	}

	/// Sets the number of decimal places that are displayed in the value. Also
	/// causes the value of the adjustment to be rounded to this number of digits,
	/// so the retrieved value matches the displayed one, if #GtkScale:draw-value is
	/// %TRUE when the value changes. If you want to enforce rounding the value when
	/// #GtkScale:draw-value is %FALSE, you can set #GtkRange:round-digits instead.
	/// Note that rounding to a small number of digits can interfere with
	/// the smooth autoscrolling that is built into #GtkScale. As an alternative,
	/// you can use the #GtkScale::format-value signal to format the displayed
	/// value yourself.
	/// - Parameters:
	///	- digits: gint (gint)
	open func setDigits(_ digits: gint) -> Swift.Void {
		gtk_scale_set_digits(GTK_SCALE(self.GOBJECT), digits)
	}

	/// Specifies whether the current value is displayed as a string next
	/// to the slider.
	/// - Parameters:
	///	- drawValue: Bool (gboolean)
	open func setDrawValue(_ drawValue: Bool) -> Swift.Void {
		gtk_scale_set_draw_value(GTK_SCALE(self.GOBJECT), drawValue ? 1 : 0)
	}

	/// If #GtkScale:has-origin is set to %TRUE (the default), the scale will
	/// highlight the part of the trough between the origin (bottom or left side)
	/// and the current value.
	/// - Parameters:
	///	- hasOrigin: Bool (gboolean)
	open func setHasOrigin(_ hasOrigin: Bool) -> Swift.Void {
		gtk_scale_set_has_origin(GTK_SCALE(self.GOBJECT), hasOrigin ? 1 : 0)
	}

	/// Sets the position in which the current value is displayed.
	/// - Parameters:
	///	- pos: GtkPositionType (GtkPositionType)
	open func setValuePos(_ pos: GtkPositionType) -> Swift.Void {
		gtk_scale_set_value_pos(GTK_SCALE(self.GOBJECT), pos)
	}

}
