/*
 * CGTKStackSwitcher.swift
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

public let GTK_TYPE_STACK_SWITCHER: GType = gtk_stack_switcher_get_type()

@inline(__always) public func GTK_STACK_SWITCHER(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkStackSwitcher>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_STACK_SWITCHER)
}

/// 
/// The GtkStackSwitcher widget acts as a controller for a
/// #GtkStack; it shows a row of buttons to switch between
/// the various pages of the associated stack widget.
/// All the content for the buttons comes from the child properties
/// of the #GtkStack; the button visibility in a #GtkStackSwitcher
/// widget is controlled by the visibility of the child in the
/// #GtkStack.
/// It is possible to associate multiple #GtkStackSwitcher widgets
/// with the same #GtkStack widget.
/// The GtkStackSwitcher widget was added in 3.10.
/// # CSS nodes
/// GtkStackSwitcher has a single CSS node named stackswitcher and
/// style class .stack-switcher.
/// When circumstances require it, GtkStackSwitcher adds the
/// .needs-attention style class to the widgets representing the
/// stack pages.


open class CGTKStackSwitcher : CGTKBox {
	/// 
	/// Create a new #GtkStackSwitcher.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_stack_switcher_new())!
	}

	open var STACKSWITCHER: UnsafeMutablePointer<GtkStackSwitcher>! {
		get {
			return GTK_STACK_SWITCHER(self.GOBJECT)
		}
	}

	/// 
	/// Retrieves the stack.
	/// See gtk_stack_switcher_set_stack().
	/// - Returns: UnsafeMutablePointer<GtkStack>?
	open func getStack() -> UnsafeMutablePointer<GtkStack>? {
		return gtk_stack_switcher_get_stack(GTK_STACK_SWITCHER(self.GOBJECT))
	}

	/// 
	/// Sets the stack to control.
	/// Parameters:
	///	- stack: UnsafeMutablePointer<GtkStack>?
	open func setStack(_ stack: UnsafeMutablePointer<GtkStack>?) {
		gtk_stack_switcher_set_stack(GTK_STACK_SWITCHER(self.GOBJECT), stack)
	}

}
