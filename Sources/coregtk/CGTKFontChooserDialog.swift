/*
 * CGTKFontChooserDialog.swift
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

public let GTK_TYPE_FONT_CHOOSER_DIALOG: GType = gtk_font_chooser_dialog_get_type()

@inline(__always) public func GTK_FONT_CHOOSER_DIALOG(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFontChooserDialog>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FONT_CHOOSER_DIALOG)
}

/// 
/// The #GtkFontChooserDialog widget is a dialog for selecting a font.
/// It implements the #GtkFontChooser interface.
/// # GtkFontChooserDialog as GtkBuildable
/// The GtkFontChooserDialog implementation of the #GtkBuildable
/// interface exposes the buttons with the names “select_button”
/// and “cancel_button”.


open class CGTKFontChooserDialog : CGTKDialog {
	/// 
	/// Creates a new #GtkFontChooserDialog.
	/// Parameters:
	///	- title: String
	///	- parent: CGTKWindow
	/// - Returns: CGTKWidget
	public convenience init(title: String, parent: CGTKWindow) {
		self.init(withGObject: gtk_font_chooser_dialog_new(title, parent.WINDOW))!
	}

	open var FONTCHOOSERDIALOG: UnsafeMutablePointer<GtkFontChooserDialog>! {
		get {
			return GTK_FONT_CHOOSER_DIALOG(self.GOBJECT)
		}
	}

}
