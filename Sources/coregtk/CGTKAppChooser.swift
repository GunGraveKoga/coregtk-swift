/*
 * CGTKAppChooser.swift
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

public let GTK_TYPE_APP_CHOOSER: GType = gtk_app_chooser_get_type()

@inline(__always) public func GTK_APP_CHOOSER(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_APP_CHOOSER)
}

/// #GtkAppChooser is an interface that can be implemented by widgets which
/// allow the user to choose an application (typically for the purpose of
/// opening a file). The main objects that implement this interface are
/// #GtkAppChooserWidget, #GtkAppChooserDialog and #GtkAppChooserButton.
/// Applications are represented by GIO #GAppInfo objects here.
/// GIO has a concept of recommended and fallback applications for a
/// given content type. Recommended applications are those that claim
/// to handle the content type itself, while fallback also includes
/// applications that handle a more generic content type. GIO also
/// knows the default and last-used application for a given content
/// type. The #GtkAppChooserWidget provides detailed control over
/// whether the shown list of applications should include default,
/// recommended or fallback applications.
/// To obtain the application that has been selected in a #GtkAppChooser,
/// use gtk_app_chooser_get_app_info().


public protocol CGTKAppChooser: class {
	/// Returns the currently selected application.
	/// - Returns: OpaquePointer? (GAppInfo*)
	func getAppInfo() -> OpaquePointer?

	/// Returns the current value of the #GtkAppChooser:content-type property.
	/// - Returns: String? (gchar*)
	func getContentType() -> String?

	/// Reloads the list of applications.
	func refresh() -> Swift.Void

}
