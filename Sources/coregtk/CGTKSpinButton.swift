/*
 * CGTKSpinButton.swift
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

public let GTK_TYPE_SPIN_BUTTON: GType = gtk_spin_button_get_type()

@inline(__always) public func GTK_SPIN_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkSpinButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SPIN_BUTTON)
}

/// 
/// A #GtkSpinButton is an ideal way to allow the user to set the value of
/// some attribute. Rather than having to directly type a number into a
/// #GtkEntry, GtkSpinButton allows the user to click on one of two arrows
/// to increment or decrement the displayed value. A value can still be
/// typed in, with the bonus that it can be checked to ensure it is in a
/// given range.
/// The main properties of a GtkSpinButton are through an adjustment.
/// See the #GtkAdjustment section for more details about an adjustment's
/// properties. Note that GtkSpinButton will by default make its entry
/// large enough to accomodate the lower and upper bounds of the adjustment,
/// which can lead to surprising results. Best practice is to set both
/// the #GtkEntry:width-chars and #GtkEntry:max-width-chars poperties
/// to the desired number of characters to display in the entry.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// spinbutton.horizontal
/// ├── undershoot.left
/// ├── undershoot.right
/// ├── entry
/// │   ╰── ...
/// ├── button.down
/// ╰── button.up
/// ]|
/// |[<!-- language="plain" -->
/// spinbutton.vertical
/// ├── undershoot.left
/// ├── undershoot.right
/// ├── button.up
/// ├── entry
/// │   ╰── ...
/// ╰── button.down
/// ]|
/// GtkSpinButtons main CSS node has the name spinbutton. It creates subnodes
/// for the entry and the two buttons, with these names. The button nodes have
/// the style classes .up and .down. The GtkEntry subnodes (if present) are put
/// below the entry node. The orientation of the spin button is reflected in
/// the .vertical or .horizontal style class on the main node.
/// ## Using a GtkSpinButton to get an integer
/// |[<!-- language="C" -->
/// // Provides a function to retrieve an integer value from a GtkSpinButton
/// // and creates a spin button to model percentage values.
/// gint
/// grab_int_value (GtkSpinButton *button,
/// gpointer       user_data)
/// {
/// return gtk_spin_button_get_value_as_int (button);
/// }
/// void
/// create_integer_spin_button (void)
/// {
/// GtkWidget *window, *button;
/// GtkAdjustment *adjustment;
/// adjustment = gtk_adjustment_new (50.0, 0.0, 100.0, 1.0, 5.0, 0.0);
/// window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
/// gtk_container_set_border_width (GTK_CONTAINER (window), 5);
/// // creates the spinbutton, with no decimal places
/// button = gtk_spin_button_new (adjustment, 1.0, 0);
/// gtk_container_add (GTK_CONTAINER (window), button);
/// gtk_widget_show_all (window);
/// }
/// ]|
/// ## Using a GtkSpinButton to get a floating point value
/// |[<!-- language="C" -->
/// // Provides a function to retrieve a floating point value from a
/// // GtkSpinButton, and creates a high precision spin button.
/// gfloat
/// grab_float_value (GtkSpinButton *button,
/// gpointer       user_data)
/// {
/// return gtk_spin_button_get_value (button);
/// }
/// void
/// create_floating_spin_button (void)
/// {
/// GtkWidget *window, *button;
/// GtkAdjustment *adjustment;
/// adjustment = gtk_adjustment_new (2.500, 0.0, 5.0, 0.001, 0.1, 0.0);
/// window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
/// gtk_container_set_border_width (GTK_CONTAINER (window), 5);
/// // creates the spinbutton, with three decimal places
/// button = gtk_spin_button_new (adjustment, 0.001, 3);
/// gtk_container_add (GTK_CONTAINER (window), button);
/// gtk_widget_show_all (window);
/// }
/// ]|


open class CGTKSpinButton : CGTKEntry {
	/// 
	/// Creates a new #GtkSpinButton.
	/// Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>?
	///	- climbRate: Double
	///	- digits: guint
	/// - Returns: CGTKWidget
	public convenience init(adjustment: UnsafeMutablePointer<GtkAdjustment>?, climbRate: Double, digits: guint) {
		self.init(withGObject: gtk_spin_button_new(adjustment, climbRate, digits))!
	}

	/// 
	/// This is a convenience constructor that allows creation of a numeric
	/// #GtkSpinButton without manually creating an adjustment. The value is
	/// initially set to the minimum value and a page increment of 10 * @step
	/// is the default. The precision of the spin button is equivalent to the
	/// precision of @step.
	/// Note that the way in which the precision is derived works best if @step
	/// is a power of ten. If the resulting precision is not suitable for your
	/// needs, use gtk_spin_button_set_digits() to correct it.
	/// Parameters:
	///	- min: Double
	///	- max: Double
	///	- step: Double
	/// - Returns: CGTKWidget
	public convenience init(withRange min: Double, max: Double, step: Double) {
		self.init(withGObject: gtk_spin_button_new_with_range(min, max, step))!
	}

	open var SPINBUTTON: UnsafeMutablePointer<GtkSpinButton>! {
		get {
			return GTK_SPIN_BUTTON(self.GOBJECT)
		}
	}

	/// 
	/// Changes the properties of an existing spin button. The adjustment,
	/// climb rate, and number of decimal places are updated accordingly.
	/// Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>?
	///	- climbRate: Double
	///	- digits: guint
	open func configure(adjustment: UnsafeMutablePointer<GtkAdjustment>?, climbRate: Double, digits: guint) {
		gtk_spin_button_configure(GTK_SPIN_BUTTON(self.GOBJECT), adjustment, climbRate, digits)
	}

	/// 
	/// Get the adjustment associated with a #GtkSpinButton
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>!
	open func getAdjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_spin_button_get_adjustment(GTK_SPIN_BUTTON(self.GOBJECT))
	}

	/// 
	/// Fetches the precision of @spin_button. See gtk_spin_button_set_digits().
	/// - Returns: guint
	open func getDigits() -> guint {
		return gtk_spin_button_get_digits(GTK_SPIN_BUTTON(self.GOBJECT))
	}

	/// 
	/// Gets the current step and page the increments used by @spin_button. See
	/// gtk_spin_button_set_increments().
	/// Parameters:
	///	- step: UnsafeMutablePointer<Double>!
	///	- page: UnsafeMutablePointer<Double>!
	open func getIncrements(step: UnsafeMutablePointer<Double>!, page: UnsafeMutablePointer<Double>!) {
		gtk_spin_button_get_increments(GTK_SPIN_BUTTON(self.GOBJECT), step, page)
	}

	/// 
	/// Returns whether non-numeric text can be typed into the spin button.
	/// See gtk_spin_button_set_numeric().
	/// - Returns: Bool
	open func getNumeric() -> Bool {
		return gtk_spin_button_get_numeric(GTK_SPIN_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the range allowed for @spin_button.
	/// See gtk_spin_button_set_range().
	/// Parameters:
	///	- min: UnsafeMutablePointer<Double>!
	///	- max: UnsafeMutablePointer<Double>!
	open func getRange(min: UnsafeMutablePointer<Double>!, max: UnsafeMutablePointer<Double>!) {
		gtk_spin_button_get_range(GTK_SPIN_BUTTON(self.GOBJECT), min, max)
	}

	/// 
	/// Returns whether the values are corrected to the nearest step.
	/// See gtk_spin_button_set_snap_to_ticks().
	/// - Returns: Bool
	open func getSnapToTicks() -> Bool {
		return gtk_spin_button_get_snap_to_ticks(GTK_SPIN_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the update behavior of a spin button.
	/// See gtk_spin_button_set_update_policy().
	/// - Returns: GtkSpinButtonUpdatePolicy
	open func getUpdatePolicy() -> GtkSpinButtonUpdatePolicy {
		return gtk_spin_button_get_update_policy(GTK_SPIN_BUTTON(self.GOBJECT))
	}

	/// 
	/// Get the value in the @spin_button.
	/// - Returns: Double
	open func getValue() -> Double {
		return gtk_spin_button_get_value(GTK_SPIN_BUTTON(self.GOBJECT))
	}

	/// 
	/// Get the value @spin_button represented as an integer.
	/// - Returns: gint
	open func getValueAsInt() -> gint {
		return gtk_spin_button_get_value_as_int(GTK_SPIN_BUTTON(self.GOBJECT))
	}

	/// 
	/// Returns whether the spin button’s value wraps around to the
	/// opposite limit when the upper or lower limit of the range is
	/// exceeded. See gtk_spin_button_set_wrap().
	/// - Returns: Bool
	open func getWrap() -> Bool {
		return gtk_spin_button_get_wrap(GTK_SPIN_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Replaces the #GtkAdjustment associated with @spin_button.
	/// Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>!
	open func setAdjustment(_ adjustment: UnsafeMutablePointer<GtkAdjustment>!) {
		gtk_spin_button_set_adjustment(GTK_SPIN_BUTTON(self.GOBJECT), adjustment)
	}

	/// 
	/// Set the precision to be displayed by @spin_button. Up to 20 digit precision
	/// is allowed.
	/// Parameters:
	///	- digits: guint
	open func setDigits(_ digits: guint) {
		gtk_spin_button_set_digits(GTK_SPIN_BUTTON(self.GOBJECT), digits)
	}

	/// 
	/// Sets the step and page increments for spin_button.  This affects how
	/// quickly the value changes when the spin button’s arrows are activated.
	/// Parameters:
	///	- step: Double
	///	- page: Double
	open func setIncrements(step: Double, page: Double) {
		gtk_spin_button_set_increments(GTK_SPIN_BUTTON(self.GOBJECT), step, page)
	}

	/// 
	/// Sets the flag that determines if non-numeric text can be typed
	/// into the spin button.
	/// Parameters:
	///	- numeric: Bool
	open func setNumeric(_ numeric: Bool) {
		gtk_spin_button_set_numeric(GTK_SPIN_BUTTON(self.GOBJECT), numeric ? 1 : 0)
	}

	/// 
	/// Sets the minimum and maximum allowable values for @spin_button.
	/// If the current value is outside this range, it will be adjusted
	/// to fit within the range, otherwise it will remain unchanged.
	/// Parameters:
	///	- min: Double
	///	- max: Double
	open func setRange(min: Double, max: Double) {
		gtk_spin_button_set_range(GTK_SPIN_BUTTON(self.GOBJECT), min, max)
	}

	/// 
	/// Sets the policy as to whether values are corrected to the
	/// nearest step increment when a spin button is activated after
	/// providing an invalid value.
	/// Parameters:
	///	- snapToTicks: Bool
	open func setSnapToTicks(_ snapToTicks: Bool) {
		gtk_spin_button_set_snap_to_ticks(GTK_SPIN_BUTTON(self.GOBJECT), snapToTicks ? 1 : 0)
	}

	/// 
	/// Sets the update behavior of a spin button.
	/// This determines whether the spin button is always updated
	/// or only when a valid value is set.
	/// Parameters:
	///	- policy: GtkSpinButtonUpdatePolicy
	open func setUpdatePolicy(_ policy: GtkSpinButtonUpdatePolicy) {
		gtk_spin_button_set_update_policy(GTK_SPIN_BUTTON(self.GOBJECT), policy)
	}

	/// 
	/// Sets the value of @spin_button.
	/// Parameters:
	///	- value: Double
	open func setValue(_ value: Double) {
		gtk_spin_button_set_value(GTK_SPIN_BUTTON(self.GOBJECT), value)
	}

	/// 
	/// Sets the flag that determines if a spin button value wraps
	/// around to the opposite limit when the upper or lower limit
	/// of the range is exceeded.
	/// Parameters:
	///	- wrap: Bool
	open func setWrap(_ wrap: Bool) {
		gtk_spin_button_set_wrap(GTK_SPIN_BUTTON(self.GOBJECT), wrap ? 1 : 0)
	}

	/// 
	/// Increment or decrement a spin button’s value in a specified
	/// direction by a specified amount.
	/// Parameters:
	///	- direction: GtkSpinType
	///	- increment: Double
	open func spin(direction: GtkSpinType, increment: Double) {
		gtk_spin_button_spin(GTK_SPIN_BUTTON(self.GOBJECT), direction, increment)
	}

	/// 
	/// Manually force an update of the spin button.
	open func update() {
		gtk_spin_button_update(GTK_SPIN_BUTTON(self.GOBJECT))
	}

}
