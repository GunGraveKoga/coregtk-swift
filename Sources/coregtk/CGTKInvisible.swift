/*
 * CGTKInvisible.swift
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

public let GTK_TYPE_INVISIBLE: GType = gtk_invisible_get_type()

@inline(__always) public func GTK_INVISIBLE(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkInvisible>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_INVISIBLE)
}

/// 
/// The #GtkInvisible widget is used internally in GTK+, and is probably not
/// very useful for application developers.
/// It is used for reliable pointer grabs and selection handling in the code
/// for drag-and-drop.


open class CGTKInvisible : CGTKWidget {
	/// 
	/// Creates a new #GtkInvisible.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_invisible_new())!
	}

	/// 
	/// Creates a new #GtkInvisible object for a specified screen
	/// Parameters:
	///	- screen: OpaquePointer!
	/// - Returns: CGTKWidget
	public convenience init(forScreen screen: OpaquePointer!) {
		self.init(withGObject: gtk_invisible_new_for_screen(screen))!
	}

	open var INVISIBLE: UnsafeMutablePointer<GtkInvisible>! {
		get {
			return GTK_INVISIBLE(self.GOBJECT)
		}
	}

	/// 
	/// Returns the #GdkScreen object associated with @invisible
	/// - Returns: OpaquePointer
	override open func getScreen() -> OpaquePointer {
		return gtk_invisible_get_screen(GTK_INVISIBLE(self.GOBJECT))
	}

	/// 
	/// Sets the #GdkScreen where the #GtkInvisible object will be displayed.
	/// Parameters:
	///	- screen: OpaquePointer!
	open func setScreen(_ screen: OpaquePointer!) {
		gtk_invisible_set_screen(GTK_INVISIBLE(self.GOBJECT), screen)
	}

}
