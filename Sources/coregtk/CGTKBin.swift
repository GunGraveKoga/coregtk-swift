/*
 * CGTKBin.swift
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

public let GTK_TYPE_BIN: GType = gtk_bin_get_type()

@inline(__always) public func GTK_BIN(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkBin>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_BIN)
}

/// The #GtkBin widget is a container with just one child.
/// It is not very useful itself, but it is useful for deriving subclasses,
/// since it provides common code needed for handling a single child widget.
/// Many GTK+ widgets are subclasses of #GtkBin, including #GtkWindow,
/// #GtkButton, #GtkFrame, #GtkHandleBox or #GtkScrolledWindow.


open class CGTKBin : CGTKContainer {
	open var BIN: UnsafeMutablePointer<GtkBin>! {
		get {
			return GTK_BIN(self.GOBJECT)
		}
	}

	/// Gets the child of the #GtkBin, or %NULL if the bin contains
	/// no child widget. The returned widget does not have a reference
	/// added, so you do not need to unref it.
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getChild<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_bin_get_child(GTK_BIN(self.GOBJECT)))
	}

}
