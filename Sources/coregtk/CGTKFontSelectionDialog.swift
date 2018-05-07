/*
 * CGTKFontSelectionDialog.swift
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

public let GTK_TYPE_FONT_SELECTION_DIALOG: GType = gtk_font_selection_dialog_get_type()

@inline(__always) public func GTK_FONT_SELECTION_DIALOG(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFontSelectionDialog>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FONT_SELECTION_DIALOG)
}

open class CGTKFontSelectionDialog : CGTKDialog {
	/// Creates a new #GtkFontSelectionDialog.
	/// - Parameters:
	///	- title: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(title: String) {
		self.init(withGObject: gtk_font_selection_dialog_new(title))!
	}

	open var FONTSELECTIONDIALOG: UnsafeMutablePointer<GtkFontSelectionDialog>! {
		get {
			return GTK_FONT_SELECTION_DIALOG(self.GOBJECT)
		}
	}

	/// Gets the “Cancel” button.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getCancelButton<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_font_selection_dialog_get_cancel_button(GTK_FONT_SELECTION_DIALOG(self.GOBJECT)))!
	}

	/// Gets the currently-selected font name.
	/// Note that this can be a different string than what you set with
	/// gtk_font_selection_dialog_set_font_name(), as the font selection widget
	/// may normalize font names and thus return a string with a different
	/// structure. For example, “Helvetica Italic Bold 12” could be normalized
	/// to “Helvetica Bold Italic 12”.  Use pango_font_description_equal()
	/// if you want to compare two font descriptions.
	/// - Returns: String? (gchar*)
	open func getFontName() -> String? {
		return String(utf8String: gtk_font_selection_dialog_get_font_name(GTK_FONT_SELECTION_DIALOG(self.GOBJECT)))
	}

	/// Retrieves the #GtkFontSelection widget embedded in the dialog.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getFontSelection<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_font_selection_dialog_get_font_selection(GTK_FONT_SELECTION_DIALOG(self.GOBJECT)))!
	}

	/// Gets the “OK” button.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getOkButton<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_font_selection_dialog_get_ok_button(GTK_FONT_SELECTION_DIALOG(self.GOBJECT)))!
	}

	/// Gets the text displayed in the preview area.
	/// - Returns: String? (const gchar*)
	open func getPreviewText() -> String? {
		return String(utf8String: gtk_font_selection_dialog_get_preview_text(GTK_FONT_SELECTION_DIALOG(self.GOBJECT)))
	}

	/// Sets the currently selected font.
	/// - Parameters:
	///	- fontname: String (const gchar*)
	/// - Returns: Bool (gboolean)
	open func setFontName(fontname: String) -> Bool {
		return gtk_font_selection_dialog_set_font_name(GTK_FONT_SELECTION_DIALOG(self.GOBJECT), fontname) != 0 ? true : false
	}

	/// Sets the text displayed in the preview area.
	/// - Parameters:
	///	- text: String (const gchar*)
	open func setPreviewText(_ text: String) -> Swift.Void {
		gtk_font_selection_dialog_set_preview_text(GTK_FONT_SELECTION_DIALOG(self.GOBJECT), text)
	}

}
