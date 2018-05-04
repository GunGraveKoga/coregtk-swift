/*
 * CGTKAppChooserDialog.swift
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

public let GTK_TYPE_APP_CHOOSER_DIALOG: GType = gtk_app_chooser_dialog_get_type()

@inline(__always) public func GTK_APP_CHOOSER_DIALOG(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkAppChooserDialog>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_APP_CHOOSER_DIALOG)
}

/// 
/// #GtkAppChooserDialog shows a #GtkAppChooserWidget inside a #GtkDialog.
/// Note that #GtkAppChooserDialog does not have any interesting methods
/// of its own. Instead, you should get the embedded #GtkAppChooserWidget
/// using gtk_app_chooser_dialog_get_widget() and call its methods if
/// the generic #GtkAppChooser interface is not sufficient for your needs.
/// To set the heading that is shown above the #GtkAppChooserWidget,
/// use gtk_app_chooser_dialog_set_heading().


open class CGTKAppChooserDialog : CGTKDialog {
	/// 
	/// Creates a new #GtkAppChooserDialog for the provided #GFile,
	/// to allow the user to select an application for it.
	/// Parameters:
	///	- parent: CGTKWindow
	///	- flags: GtkDialogFlags
	///	- file: OpaquePointer!
	/// - Returns: CGTKWidget
	public convenience init(parent: CGTKWindow, flags: GtkDialogFlags, file: OpaquePointer!) {
		self.init(withGObject: gtk_app_chooser_dialog_new(parent.WINDOW, flags, file))!
	}

	/// 
	/// Creates a new #GtkAppChooserDialog for the provided content type,
	/// to allow the user to select an application for it.
	/// Parameters:
	///	- parent: CGTKWindow
	///	- flags: GtkDialogFlags
	///	- contentType: String
	/// - Returns: CGTKWidget
	public convenience init(forContentType parent: CGTKWindow, flags: GtkDialogFlags, contentType: String) {
		self.init(withGObject: gtk_app_chooser_dialog_new_for_content_type(parent.WINDOW, flags, contentType))!
	}

	open var APPCHOOSERDIALOG: UnsafeMutablePointer<GtkAppChooserDialog>! {
		get {
			return GTK_APP_CHOOSER_DIALOG(self.GOBJECT)
		}
	}

	/// 
	/// Returns the text to display at the top of the dialog.
	/// - Returns: String?
	open func getHeading() -> String? {
		return String(utf8String: gtk_app_chooser_dialog_get_heading(GTK_APP_CHOOSER_DIALOG(self.GOBJECT)))
	}

	/// 
	/// Returns the #GtkAppChooserWidget of this dialog.
	/// - Returns: CGTKWidget
	open func getWidget<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_app_chooser_dialog_get_widget(GTK_APP_CHOOSER_DIALOG(self.GOBJECT)))!
	}

	/// 
	/// Sets the text to display at the top of the dialog.
	/// If the heading is not set, the dialog displays a default text.
	/// Parameters:
	///	- heading: String
	open func setHeading(_ heading: String) {
		gtk_app_chooser_dialog_set_heading(GTK_APP_CHOOSER_DIALOG(self.GOBJECT), heading)
	}

}
