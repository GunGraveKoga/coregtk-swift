/*
 * CGTKHSeparator.swift
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

public let GTK_TYPE_HSEPARATOR: GType = gtk_hseparator_get_type()

@inline(__always) public func GTK_HSEPARATOR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkHSeparator>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_HSEPARATOR)
}

/// The #GtkHSeparator widget is a horizontal separator, used to group the
/// widgets within a window. It displays a horizontal line with a shadow to
/// make it appear sunken into the interface.
/// > The #GtkHSeparator widget is not used as a separator within menus.
/// > To create a separator in a menu create an empty #GtkSeparatorMenuItem
/// > widget using gtk_separator_menu_item_new() and add it to the menu with
/// > gtk_menu_shell_append().
/// GtkHSeparator has been deprecated, use #GtkSeparator instead.


open class CGTKHSeparator : CGTKSeparator {
	/// Creates a new #GtkHSeparator.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_hseparator_new())!
	}

	open var HSEPARATOR: UnsafeMutablePointer<GtkHSeparator>! {
		get {
			return GTK_HSEPARATOR(self.GOBJECT)
		}
	}

}
