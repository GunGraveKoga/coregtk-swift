/*
 * CGTKButtonBox.swift
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

public let GTK_TYPE_BUTTON_BOX: GType = gtk_button_box_get_type()

@inline(__always) public func GTK_BUTTON_BOX(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkButtonBox>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_BUTTON_BOX)
}

open class CGTKButtonBox : CGTKBox {
	/// 
	/// Creates a new #GtkButtonBox.
	/// Parameters:
	///	- orientation: GtkOrientation
	/// - Returns: CGTKWidget
	public convenience init(orientation: GtkOrientation) {
		self.init(withGObject: gtk_button_box_new(orientation))!
	}

	open var BUTTONBOX: UnsafeMutablePointer<GtkButtonBox>! {
		get {
			return GTK_BUTTON_BOX(self.GOBJECT)
		}
	}

	/// 
	/// Returns whether the child is exempted from homogenous
	/// sizing.
	/// Parameters:
	///	- child: CGTKWidget
	/// - Returns: Bool
	open func getChildNonHomogeneous(child: CGTKWidget) -> Bool {
		return gtk_button_box_get_child_non_homogeneous(GTK_BUTTON_BOX(self.GOBJECT), child.WIDGET) != 0 ? true : false
	}

	/// 
	/// Returns whether @child should appear in a secondary group of children.
	/// Parameters:
	///	- child: CGTKWidget
	/// - Returns: Bool
	open func getChildSecondary(child: CGTKWidget) -> Bool {
		return gtk_button_box_get_child_secondary(GTK_BUTTON_BOX(self.GOBJECT), child.WIDGET) != 0 ? true : false
	}

	/// 
	/// Retrieves the method being used to arrange the buttons in a button box.
	/// - Returns: GtkButtonBoxStyle
	open func getLayout() -> GtkButtonBoxStyle {
		return gtk_button_box_get_layout(GTK_BUTTON_BOX(self.GOBJECT))
	}

	/// 
	/// Sets whether the child is exempted from homogeous sizing.
	/// Parameters:
	///	- child: CGTKWidget
	///	- nonHomogeneous: Bool
	open func setChildNonHomogeneous(child: CGTKWidget, nonHomogeneous: Bool) {
		gtk_button_box_set_child_non_homogeneous(GTK_BUTTON_BOX(self.GOBJECT), child.WIDGET, nonHomogeneous ? 1 : 0)
	}

	/// 
	/// Sets whether @child should appear in a secondary group of children.
	/// A typical use of a secondary child is the help button in a dialog.
	/// This group appears after the other children if the style
	/// is %GTK_BUTTONBOX_START, %GTK_BUTTONBOX_SPREAD or
	/// %GTK_BUTTONBOX_EDGE, and before the other children if the style
	/// is %GTK_BUTTONBOX_END. For horizontal button boxes, the definition
	/// of before/after depends on direction of the widget (see
	/// gtk_widget_set_direction()). If the style is %GTK_BUTTONBOX_START
	/// or %GTK_BUTTONBOX_END, then the secondary children are aligned at
	/// the other end of the button box from the main children. For the
	/// other styles, they appear immediately next to the main children.
	/// Parameters:
	///	- child: CGTKWidget
	///	- isSecondary: Bool
	open func setChildSecondary(child: CGTKWidget, isSecondary: Bool) {
		gtk_button_box_set_child_secondary(GTK_BUTTON_BOX(self.GOBJECT), child.WIDGET, isSecondary ? 1 : 0)
	}

	/// 
	/// Changes the way buttons are arranged in their container.
	/// Parameters:
	///	- layoutStyle: GtkButtonBoxStyle
	open func setLayout(layoutStyle: GtkButtonBoxStyle) {
		gtk_button_box_set_layout(GTK_BUTTON_BOX(self.GOBJECT), layoutStyle)
	}

}
