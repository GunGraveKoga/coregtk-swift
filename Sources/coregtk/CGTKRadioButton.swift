/*
 * CGTKRadioButton.swift
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

public let GTK_TYPE_RADIO_BUTTON: GType = gtk_radio_button_get_type()

@inline(__always) public func GTK_RADIO_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkRadioButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_RADIO_BUTTON)
}

/// 
/// A single radio button performs the same basic function as a #GtkCheckButton,
/// as its position in the object hierarchy reflects. It is only when multiple
/// radio buttons are grouped together that they become a different user
/// interface component in their own right.
/// Every radio button is a member of some group of radio buttons. When one is
/// selected, all other radio buttons in the same group are deselected. A
/// #GtkRadioButton is one way of giving the user a choice from many options.
/// Radio button widgets are created with gtk_radio_button_new(), passing %NULL
/// as the argument if this is the first radio button in a group. In subsequent
/// calls, the group you wish to add this button to should be passed as an
/// argument. Optionally, gtk_radio_button_new_with_label() can be used if you
/// want a text label on the radio button.
/// Alternatively, when adding widgets to an existing group of radio buttons,
/// use gtk_radio_button_new_from_widget() with a #GtkRadioButton that already
/// has a group assigned to it. The convenience function
/// gtk_radio_button_new_with_label_from_widget() is also provided.
/// To retrieve the group a #GtkRadioButton is assigned to, use
/// gtk_radio_button_get_group().
/// To remove a #GtkRadioButton from one group and make it part of a new one,
/// use gtk_radio_button_set_group().
/// The group list does not need to be freed, as each #GtkRadioButton will remove
/// itself and its list item when it is destroyed.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// radiobutton
/// ├── radio
/// ╰── <child>
/// ]|
/// A GtkRadioButton with indicator (see gtk_toggle_button_set_mode()) has a
/// main CSS node with name radiobutton and a subnode with name radio.
/// |[<!-- language="plain" -->
/// button.radio
/// ├── radio
/// ╰── <child>
/// ]|
/// A GtkRadioButton without indicator changes the name of its main node
/// to button and adds a .radio style class to it. The subnode is invisible
/// in this case.
/// ## How to create a group of two radio buttons.
/// |[<!-- language="C" -->
/// void create_radio_buttons (void) {
/// GtkWidget *window, *radio1, *radio2, *box, *entry;
/// window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
/// box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 2);
/// gtk_box_set_homogeneous (GTK_BOX (box), TRUE);
/// // Create a radio button with a GtkEntry widget
/// radio1 = gtk_radio_button_new (NULL);
/// entry = gtk_entry_new ();
/// gtk_container_add (GTK_CONTAINER (radio1), entry);
/// // Create a radio button with a label
/// radio2 = gtk_radio_button_new_with_label_from_widget (GTK_RADIO_BUTTON (radio1),
/// "I’m the second radio button.");
/// // Pack them into a box, then show all the widgets
/// gtk_box_pack_start (GTK_BOX (box), radio1);
/// gtk_box_pack_start (GTK_BOX (box), radio2);
/// gtk_container_add (GTK_CONTAINER (window), box);
/// gtk_widget_show_all (window);
/// return;
/// }
/// ]|
/// When an unselected button in the group is clicked the clicked button
/// receives the #GtkToggleButton::toggled signal, as does the previously
/// selected button.
/// Inside the #GtkToggleButton::toggled handler, gtk_toggle_button_get_active()
/// can be used to determine if the button has been selected or deselected.


open class CGTKRadioButton : CGTKCheckButton {
	/// 
	/// Creates a new #GtkRadioButton. To be of any practical value, a widget should
	/// then be packed into the radio button.
	/// Parameters:
	///	- group: UnsafeMutablePointer<GSList>?
	/// - Returns: CGTKWidget
	public convenience init(group: UnsafeMutablePointer<GSList>?) {
		self.init(withGObject: gtk_radio_button_new(group))!
	}

	/// 
	/// Creates a new #GtkRadioButton, adding it to the same group as
	/// @radio_group_member. As with gtk_radio_button_new(), a widget
	/// should be packed into the radio button.
	/// Parameters:
	///	- radioGroupMember: UnsafeMutablePointer<GtkRadioButton>?
	/// - Returns: CGTKWidget
	public convenience init(fromWidget radioGroupMember: UnsafeMutablePointer<GtkRadioButton>?) {
		self.init(withGObject: gtk_radio_button_new_from_widget(radioGroupMember))!
	}

	/// 
	/// Creates a new #GtkRadioButton with a text label.
	/// Parameters:
	///	- group: UnsafeMutablePointer<GSList>?
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withLabel group: UnsafeMutablePointer<GSList>?, label: String) {
		self.init(withGObject: gtk_radio_button_new_with_label(group, label))!
	}

	/// 
	/// Creates a new #GtkRadioButton with a text label, adding it to
	/// the same group as @radio_group_member.
	/// Parameters:
	///	- radioGroupMember: UnsafeMutablePointer<GtkRadioButton>?
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withLabelFromWidget radioGroupMember: UnsafeMutablePointer<GtkRadioButton>?, label: String) {
		self.init(withGObject: gtk_radio_button_new_with_label_from_widget(radioGroupMember, label))!
	}

	/// 
	/// Creates a new #GtkRadioButton containing a label, adding it to the same
	/// group as @group. The label will be created using
	/// gtk_label_new_with_mnemonic(), so underscores in @label indicate the
	/// mnemonic for the button.
	/// Parameters:
	///	- group: UnsafeMutablePointer<GSList>?
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withMnemonic group: UnsafeMutablePointer<GSList>?, label: String) {
		self.init(withGObject: gtk_radio_button_new_with_mnemonic(group, label))!
	}

	/// 
	/// Creates a new #GtkRadioButton containing a label. The label
	/// will be created using gtk_label_new_with_mnemonic(), so underscores
	/// in @label indicate the mnemonic for the button.
	/// Parameters:
	///	- radioGroupMember: UnsafeMutablePointer<GtkRadioButton>?
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withMnemonicFromWidget radioGroupMember: UnsafeMutablePointer<GtkRadioButton>?, label: String) {
		self.init(withGObject: gtk_radio_button_new_with_mnemonic_from_widget(radioGroupMember, label))!
	}

	open var RADIOBUTTON: UnsafeMutablePointer<GtkRadioButton>! {
		get {
			return GTK_RADIO_BUTTON(self.GOBJECT)
		}
	}

	/// 
	/// Retrieves the group assigned to a radio button.
	/// - Returns: UnsafeMutablePointer<GSList>!
	open func getGroup() -> UnsafeMutablePointer<GSList>! {
		return gtk_radio_button_get_group(GTK_RADIO_BUTTON(self.GOBJECT))
	}

	/// 
	/// Joins a #GtkRadioButton object to the group of another #GtkRadioButton object
	/// Use this in language bindings instead of the gtk_radio_button_get_group()
	/// and gtk_radio_button_set_group() methods
	/// A common way to set up a group of radio buttons is the following:
	/// |[<!-- language="C" -->
	/// GtkRadioButton *radio_button;
	/// GtkRadioButton *last_button;
	/// while (some_condition)
	/// {
	/// radio_button = gtk_radio_button_new (NULL);
	/// gtk_radio_button_join_group (radio_button, last_button);
	/// last_button = radio_button;
	/// }
	/// ]|
	/// Parameters:
	///	- groupSource: UnsafeMutablePointer<GtkRadioButton>?
	open func joinGroup(groupSource: UnsafeMutablePointer<GtkRadioButton>?) {
		gtk_radio_button_join_group(GTK_RADIO_BUTTON(self.GOBJECT), groupSource)
	}

	/// 
	/// Sets a #GtkRadioButton’s group. It should be noted that this does not change
	/// the layout of your interface in any way, so if you are changing the group,
	/// it is likely you will need to re-arrange the user interface to reflect these
	/// changes.
	/// Parameters:
	///	- group: UnsafeMutablePointer<GSList>?
	open func setGroup(_ group: UnsafeMutablePointer<GSList>?) {
		gtk_radio_button_set_group(GTK_RADIO_BUTTON(self.GOBJECT), group)
	}

}
