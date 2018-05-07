/*
 * CGTKLevelBar.swift
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

public let GTK_TYPE_LEVEL_BAR: GType = gtk_level_bar_get_type()

@inline(__always) public func GTK_LEVEL_BAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkLevelBar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_LEVEL_BAR)
}

/// The #GtkLevelBar is a bar widget that can be used
/// as a level indicator. Typical use cases are displaying the strength
/// of a password, or showing the charge level of a battery.
/// Use gtk_level_bar_set_value() to set the current value, and
/// gtk_level_bar_add_offset_value() to set the value offsets at which
/// the bar will be considered in a different state. GTK will add a few
/// offsets by default on the level bar: #GTK_LEVEL_BAR_OFFSET_LOW,
/// #GTK_LEVEL_BAR_OFFSET_HIGH and #GTK_LEVEL_BAR_OFFSET_FULL, with
/// values 0.25, 0.75 and 1.0 respectively.
/// Note that it is your responsibility to update preexisting offsets
/// when changing the minimum or maximum value. GTK+ will simply clamp
/// them to the new range.
/// ## Adding a custom offset on the bar
/// |[<!-- language="C" -->
/// static GtkWidget *
/// create_level_bar (void)
/// {
/// GtkWidget *widget;
/// GtkLevelBar *bar;
/// widget = gtk_level_bar_new ();
/// bar = GTK_LEVEL_BAR (widget);
/// // This changes the value of the default low offset
/// gtk_level_bar_add_offset_value (bar,
/// GTK_LEVEL_BAR_OFFSET_LOW,
/// 0.10);
/// // This adds a new offset to the bar; the application will
/// // be able to change its color CSS like this:
/// //
/// // levelbar block.my-offset {
/// //   background-color: magenta;
/// //   border-style: solid;
/// //   border-color: black;
/// //   border-style: 1px;
/// // }
/// gtk_level_bar_add_offset_value (bar, "my-offset", 0.60);
/// return widget;
/// }
/// ]|
/// The default interval of values is between zero and one, but it’s possible to
/// modify the interval using gtk_level_bar_set_min_value() and
/// gtk_level_bar_set_max_value(). The value will be always drawn in proportion to
/// the admissible interval, i.e. a value of 15 with a specified interval between
/// 10 and 20 is equivalent to a value of 0.5 with an interval between 0 and 1.
/// When #GTK_LEVEL_BAR_MODE_DISCRETE is used, the bar level is rendered
/// as a finite number of separated blocks instead of a single one. The number
/// of blocks that will be rendered is equal to the number of units specified by
/// the admissible interval.
/// For instance, to build a bar rendered with five blocks, it’s sufficient to
/// set the minimum value to 0 and the maximum value to 5 after changing the indicator
/// mode to discrete.
/// GtkLevelBar was introduced in GTK+ 3.6.
/// # GtkLevelBar as GtkBuildable
/// The GtkLevelBar implementation of the GtkBuildable interface supports a
/// custom <offsets> element, which can contain any number of <offset> elements,
/// each of which must have name and value attributes.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// levelbar[.discrete]
/// ╰── trough
/// ├── block.filled.level-name
/// ┊
/// ├── block.empty
/// ┊
/// ]|
/// GtkLevelBar has a main CSS node with name levelbar and one of the style
/// classes .discrete or .continuous and a subnode with name trough. Below the
/// trough node are a number of nodes with name block and style class .filled
/// or .empty. In continuous mode, there is exactly one node of each, in discrete
/// mode, the number of filled and unfilled nodes corresponds to blocks that are
/// drawn. The block.filled nodes also get a style class .level-name corresponding
/// to the level for the current value.
/// In horizontal orientation, the nodes are always arranged from left to right,
/// regardless of text direction.


open class CGTKLevelBar : CGTKWidget, CGTKOrientable {
	/// Creates a new #GtkLevelBar.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_level_bar_new())!
	}

	/// Utility constructor that creates a new #GtkLevelBar for the specified
	/// interval.
	/// - Parameters:
	///	- minValue: Double (gdouble)
	///	- maxValue: Double (gdouble)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(forInterval minValue: Double, maxValue: Double) {
		self.init(withGObject: gtk_level_bar_new_for_interval(minValue, maxValue))!
	}

	open var LEVELBAR: UnsafeMutablePointer<GtkLevelBar>! {
		get {
			return GTK_LEVEL_BAR(self.GOBJECT)
		}
	}

	/// Adds a new offset marker on @self at the position specified by @value.
	/// When the bar value is in the interval topped by @value (or between @value
	/// and #GtkLevelBar:max-value in case the offset is the last one on the bar)
	/// a style class named `level-`@name will be applied
	/// when rendering the level bar fill.
	/// If another offset marker named @name exists, its value will be
	/// replaced by @value.
	/// - Parameters:
	///	- name: String (const gchar*)
	///	- value: Double (gdouble)
	open func addOffsetValue(name: String, value: Double) -> Swift.Void {
		gtk_level_bar_add_offset_value(GTK_LEVEL_BAR(self.GOBJECT), name, value)
	}

	/// Return the value of the #GtkLevelBar:inverted property.
	/// - Returns: Bool (gboolean)
	open func getInverted() -> Bool {
		return gtk_level_bar_get_inverted(GTK_LEVEL_BAR(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the value of the #GtkLevelBar:max-value property.
	/// - Returns: Double (gdouble)
	open func getMaxValue() -> Double {
		return gtk_level_bar_get_max_value(GTK_LEVEL_BAR(self.GOBJECT))
	}

	/// Returns the value of the #GtkLevelBar:min-value property.
	/// - Returns: Double (gdouble)
	open func getMinValue() -> Double {
		return gtk_level_bar_get_min_value(GTK_LEVEL_BAR(self.GOBJECT))
	}

	/// Returns the value of the #GtkLevelBar:mode property.
	/// - Returns: GtkLevelBarMode (GtkLevelBarMode)
	open func getMode() -> GtkLevelBarMode {
		return gtk_level_bar_get_mode(GTK_LEVEL_BAR(self.GOBJECT))
	}

	/// Fetches the value specified for the offset marker @name in @self,
	/// returning %TRUE in case an offset named @name was found.
	/// - Parameters:
	///	- name: String (const gchar*)
	///	- value: UnsafeMutablePointer<Double>! (gdouble*)
	/// - Returns: Bool (gboolean)
	open func getOffsetValue(name: String, value: UnsafeMutablePointer<Double>!) -> Bool {
		return gtk_level_bar_get_offset_value(GTK_LEVEL_BAR(self.GOBJECT), name, value) != 0 ? true : false
	}

	/// Returns the value of the #GtkLevelBar:value property.
	/// - Returns: Double (gdouble)
	open func getValue() -> Double {
		return gtk_level_bar_get_value(GTK_LEVEL_BAR(self.GOBJECT))
	}

	/// Removes an offset marker previously added with
	/// gtk_level_bar_add_offset_value().
	/// - Parameters:
	///	- name: String (const gchar*)
	open func removeOffsetValue(name: String) -> Swift.Void {
		gtk_level_bar_remove_offset_value(GTK_LEVEL_BAR(self.GOBJECT), name)
	}

	/// Sets the value of the #GtkLevelBar:inverted property.
	/// - Parameters:
	///	- inverted: Bool (gboolean)
	open func setInverted(_ inverted: Bool) -> Swift.Void {
		gtk_level_bar_set_inverted(GTK_LEVEL_BAR(self.GOBJECT), inverted ? 1 : 0)
	}

	/// Sets the value of the #GtkLevelBar:max-value property.
	/// You probably want to update preexisting level offsets after calling
	/// this function.
	/// - Parameters:
	///	- value: Double (gdouble)
	open func setMaxValue(_ value: Double) -> Swift.Void {
		gtk_level_bar_set_max_value(GTK_LEVEL_BAR(self.GOBJECT), value)
	}

	/// Sets the value of the #GtkLevelBar:min-value property.
	/// You probably want to update preexisting level offsets after calling
	/// this function.
	/// - Parameters:
	///	- value: Double (gdouble)
	open func setMinValue(_ value: Double) -> Swift.Void {
		gtk_level_bar_set_min_value(GTK_LEVEL_BAR(self.GOBJECT), value)
	}

	/// Sets the value of the #GtkLevelBar:mode property.
	/// - Parameters:
	///	- mode: GtkLevelBarMode (GtkLevelBarMode)
	open func setMode(_ mode: GtkLevelBarMode) -> Swift.Void {
		gtk_level_bar_set_mode(GTK_LEVEL_BAR(self.GOBJECT), mode)
	}

	/// Sets the value of the #GtkLevelBar:value property.
	/// - Parameters:
	///	- value: Double (gdouble)
	open func setValue(_ value: Double) -> Swift.Void {
		gtk_level_bar_set_value(GTK_LEVEL_BAR(self.GOBJECT), value)
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
