/*
 * CGTKStackSidebar.swift
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

public let GTK_TYPE_STACK_SIDEBAR: GType = gtk_stack_sidebar_get_type()

@inline(__always) public func GTK_STACK_SIDEBAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkStackSidebar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_STACK_SIDEBAR)
}

/// 
/// A GtkStackSidebar enables you to quickly and easily provide a
/// consistent "sidebar" object for your user interface.
/// In order to use a GtkStackSidebar, you simply use a GtkStack to
/// organize your UI flow, and add the sidebar to your sidebar area. You
/// can use gtk_stack_sidebar_set_stack() to connect the #GtkStackSidebar
/// to the #GtkStack.
/// # CSS nodes
/// GtkStackSidebar has a single CSS node with name stacksidebar and
/// style class .sidebar.
/// When circumstances require it, GtkStackSidebar adds the
/// .needs-attention style class to the widgets representing the stack
/// pages.


open class CGTKStackSidebar : CGTKBin {
	/// 
	/// Creates a new sidebar.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_stack_sidebar_new())!
	}

	open var STACKSIDEBAR: UnsafeMutablePointer<GtkStackSidebar>! {
		get {
			return GTK_STACK_SIDEBAR(self.GOBJECT)
		}
	}

	/// 
	/// Retrieves the stack.
	/// See gtk_stack_sidebar_set_stack().
	/// - Returns: UnsafeMutablePointer<GtkStack>?
	open func getStack() -> UnsafeMutablePointer<GtkStack>? {
		return gtk_stack_sidebar_get_stack(GTK_STACK_SIDEBAR(self.GOBJECT))
	}

	/// 
	/// Set the #GtkStack associated with this #GtkStackSidebar.
	/// The sidebar widget will automatically update according to the order
	/// (packing) and items within the given #GtkStack.
	/// Parameters:
	///	- stack: UnsafeMutablePointer<GtkStack>!
	open func setStack(_ stack: UnsafeMutablePointer<GtkStack>!) {
		gtk_stack_sidebar_set_stack(GTK_STACK_SIDEBAR(self.GOBJECT), stack)
	}

}
