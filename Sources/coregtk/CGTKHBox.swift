/*
 * CGTKHBox.swift
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

public let GTK_TYPE_HBOX: GType = gtk_hbox_get_type()

@inline(__always) public func GTK_HBOX(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkHBox>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_HBOX)
}

/// #GtkHBox is a container that organizes child widgets into a single row.
/// Use the #GtkBox packing interface to determine the arrangement,
/// spacing, width, and alignment of #GtkHBox children.
/// All children are allocated the same height.
/// GtkHBox has been deprecated. You can use #GtkBox instead, which is a
/// very quick and easy change. If you have derived your own classes from
/// GtkHBox, you can simply change the inheritance to derive directly
/// from #GtkBox. No further changes are needed, since the default
/// value of the #GtkOrientable:orientation property is
/// %GTK_ORIENTATION_HORIZONTAL.
/// If you don’t need first-child or last-child styling, and want your code
/// to be future-proof, the recommendation is to switch to #GtkGrid instead
/// of nested boxes. For more information about migrating to #GtkGrid,
/// see [Migrating from other containers to GtkGrid][gtk-migrating-GtkGrid].


open class CGTKHBox : CGTKBox {
	/// Creates a new #GtkHBox.
	/// - Parameters:
	///	- homogeneous: Bool (gboolean)
	///	- spacing: gint (gint)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(homogeneous: Bool, spacing: gint) {
		self.init(withGObject: gtk_hbox_new(homogeneous ? 1 : 0, spacing))!
	}

	open var HBOX: UnsafeMutablePointer<GtkHBox>! {
		get {
			return GTK_HBOX(self.GOBJECT)
		}
	}

}
