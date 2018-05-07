/*
 * CGTKColorSelectionDialog.swift
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

public let GTK_TYPE_COLOR_SELECTION_DIALOG: GType = gtk_color_selection_dialog_get_type()

@inline(__always) public func GTK_COLOR_SELECTION_DIALOG(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkColorSelectionDialog>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_COLOR_SELECTION_DIALOG)
}

open class CGTKColorSelectionDialog : CGTKDialog {
	/// Creates a new #GtkColorSelectionDialog.
	/// - Parameters:
	///	- title: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(title: String) {
		self.init(withGObject: gtk_color_selection_dialog_new(title))!
	}

	open var COLORSELECTIONDIALOG: UnsafeMutablePointer<GtkColorSelectionDialog>! {
		get {
			return GTK_COLOR_SELECTION_DIALOG(self.GOBJECT)
		}
	}

	/// Retrieves the #GtkColorSelection widget embedded in the dialog.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getColorSelection<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_color_selection_dialog_get_color_selection(GTK_COLOR_SELECTION_DIALOG(self.GOBJECT)))!
	}

}
