/*
 * CGTKCheckButton.swift
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

public let GTK_TYPE_CHECK_BUTTON: GType = gtk_check_button_get_type()

@inline(__always) public func GTK_CHECK_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkCheckButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_CHECK_BUTTON)
}

/// 
/// A #GtkCheckButton places a discrete #GtkToggleButton next to a widget,
/// (usually a #GtkLabel). See the section on #GtkToggleButton widgets for
/// more information about toggle/check buttons.
/// The important signal ( #GtkToggleButton::toggled ) is also inherited from
/// #GtkToggleButton.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// checkbutton
/// ├── check
/// ╰── <child>
/// ]|
/// A GtkCheckButton with indicator (see gtk_toggle_button_set_mode()) has a
/// main CSS node with name checkbutton and a subnode with name check.
/// |[<!-- language="plain" -->
/// button.check
/// ├── check
/// ╰── <child>
/// ]|
/// A GtkCheckButton without indicator changes the name of its main node
/// to button and adds a .check style class to it. The subnode is invisible
/// in this case.


open class CGTKCheckButton : CGTKToggleButton {
	/// 
	/// Creates a new #GtkCheckButton.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_check_button_new())!
	}

	/// 
	/// Creates a new #GtkCheckButton with a #GtkLabel to the right of it.
	/// Parameters:
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withLabel label: String) {
		self.init(withGObject: gtk_check_button_new_with_label(label))!
	}

	/// 
	/// Creates a new #GtkCheckButton containing a label. The label
	/// will be created using gtk_label_new_with_mnemonic(), so underscores
	/// in @label indicate the mnemonic for the check button.
	/// Parameters:
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withMnemonic label: String) {
		self.init(withGObject: gtk_check_button_new_with_mnemonic(label))!
	}

	open var CHECKBUTTON: UnsafeMutablePointer<GtkCheckButton>! {
		get {
			return GTK_CHECK_BUTTON(self.GOBJECT)
		}
	}

}
