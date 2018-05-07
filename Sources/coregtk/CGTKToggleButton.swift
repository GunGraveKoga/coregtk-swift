/*
 * CGTKToggleButton.swift
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

public let GTK_TYPE_TOGGLE_BUTTON: GType = gtk_toggle_button_get_type()

@inline(__always) public func GTK_TOGGLE_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkToggleButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TOGGLE_BUTTON)
}

/// A #GtkToggleButton is a #GtkButton which will remain “pressed-in” when
/// clicked. Clicking again will cause the toggle button to return to its
/// normal state.
/// A toggle button is created by calling either gtk_toggle_button_new() or
/// gtk_toggle_button_new_with_label(). If using the former, it is advisable to
/// pack a widget, (such as a #GtkLabel and/or a #GtkImage), into the toggle
/// button’s container. (See #GtkButton for more information).
/// The state of a #GtkToggleButton can be set specifically using
/// gtk_toggle_button_set_active(), and retrieved using
/// gtk_toggle_button_get_active().
/// To simply switch the state of a toggle button, use gtk_toggle_button_toggled().
/// # CSS nodes
/// GtkToggleButton has a single CSS node with name button. To differentiate
/// it from a plain #GtkButton, it gets the .toggle style class.
/// ## Creating two #GtkToggleButton widgets.
/// |[<!-- language="C" -->
/// static void output_state (GtkToggleButton *source, gpointer user_data) {
/// printf ("Active: %d\n", gtk_toggle_button_get_active (source));
/// }
/// void make_toggles (void) {
/// GtkWidget *window, *toggle1, *toggle2;
/// GtkWidget *box;
/// const char *text;
/// window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
/// box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 12);
/// text = "Hi, I’m a toggle button.";
/// toggle1 = gtk_toggle_button_new_with_label (text);
/// // Makes this toggle button invisible
/// gtk_toggle_button_set_mode (GTK_TOGGLE_BUTTON (toggle1),
/// TRUE);
/// g_signal_connect (toggle1, "toggled",
/// G_CALLBACK (output_state),
/// NULL);
/// gtk_container_add (GTK_CONTAINER (box), toggle1);
/// text = "Hi, I’m a toggle button.";
/// toggle2 = gtk_toggle_button_new_with_label (text);
/// gtk_toggle_button_set_mode (GTK_TOGGLE_BUTTON (toggle2),
/// FALSE);
/// g_signal_connect (toggle2, "toggled",
/// G_CALLBACK (output_state),
/// NULL);
/// gtk_container_add (GTK_CONTAINER (box), toggle2);
/// gtk_container_add (GTK_CONTAINER (window), box);
/// gtk_widget_show_all (window);
/// }
/// ]|


open class CGTKToggleButton : CGTKButton {
	/// Creates a new toggle button. A widget should be packed into the button, as in gtk_button_new().
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_toggle_button_new())!
	}

	/// Creates a new toggle button with a text label.
	/// - Parameters:
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withLabel label: String) {
		self.init(withGObject: gtk_toggle_button_new_with_label(label))!
	}

	/// Creates a new #GtkToggleButton containing a label. The label
	/// will be created using gtk_label_new_with_mnemonic(), so underscores
	/// in @label indicate the mnemonic for the button.
	/// - Parameters:
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withMnemonic label: String) {
		self.init(withGObject: gtk_toggle_button_new_with_mnemonic(label))!
	}

	open var TOGGLEBUTTON: UnsafeMutablePointer<GtkToggleButton>! {
		get {
			return GTK_TOGGLE_BUTTON(self.GOBJECT)
		}
	}

	/// Queries a #GtkToggleButton and returns its current state. Returns %TRUE if
	/// the toggle button is pressed in and %FALSE if it is raised.
	/// - Returns: Bool (gboolean)
	open func getActive() -> Bool {
		return gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the value set by gtk_toggle_button_set_inconsistent().
	/// - Returns: Bool (gboolean)
	open func getInconsistent() -> Bool {
		return gtk_toggle_button_get_inconsistent(GTK_TOGGLE_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Retrieves whether the button is displayed as a separate indicator
	/// and label. See gtk_toggle_button_set_mode().
	/// - Returns: Bool (gboolean)
	open func getMode() -> Bool {
		return gtk_toggle_button_get_mode(GTK_TOGGLE_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the status of the toggle button. Set to %TRUE if you want the
	/// GtkToggleButton to be “pressed in”, and %FALSE to raise it.
	/// This action causes the #GtkToggleButton::toggled signal and the
	/// #GtkButton::clicked signal to be emitted.
	/// - Parameters:
	///	- isActive: Bool (gboolean)
	open func setActive(isActive: Bool) -> Swift.Void {
		gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(self.GOBJECT), isActive ? 1 : 0)
	}

	/// If the user has selected a range of elements (such as some text or
	/// spreadsheet cells) that are affected by a toggle button, and the
	/// current values in that range are inconsistent, you may want to
	/// display the toggle in an “in between” state. This function turns on
	/// “in between” display.  Normally you would turn off the inconsistent
	/// state again if the user toggles the toggle button. This has to be
	/// done manually, gtk_toggle_button_set_inconsistent() only affects
	/// visual appearance, it doesn’t affect the semantics of the button.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setInconsistent(setting: Bool) -> Swift.Void {
		gtk_toggle_button_set_inconsistent(GTK_TOGGLE_BUTTON(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets whether the button is displayed as a separate indicator and label.
	/// You can call this function on a checkbutton or a radiobutton with
	/// @draw_indicator = %FALSE to make the button look like a normal button.
	/// This can be used to create linked strip of buttons that work like
	/// a #GtkStackSwitcher.
	/// This function only affects instances of classes like #GtkCheckButton
	/// and #GtkRadioButton that derive from #GtkToggleButton,
	/// not instances of #GtkToggleButton itself.
	/// - Parameters:
	///	- drawIndicator: Bool (gboolean)
	open func setMode(drawIndicator: Bool) -> Swift.Void {
		gtk_toggle_button_set_mode(GTK_TOGGLE_BUTTON(self.GOBJECT), drawIndicator ? 1 : 0)
	}

	/// Emits the #GtkToggleButton::toggled signal on the
	/// #GtkToggleButton. There is no good reason for an
	/// application ever to call this function.
	open func toggled() -> Swift.Void {
		gtk_toggle_button_toggled(GTK_TOGGLE_BUTTON(self.GOBJECT))
	}

}
