/*
 * CGTKFileChooserButton.swift
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

public let GTK_TYPE_FILE_CHOOSER_BUTTON: GType = gtk_file_chooser_button_get_type()

@inline(__always) public func GTK_FILE_CHOOSER_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFileChooserButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FILE_CHOOSER_BUTTON)
}

/// 
/// The #GtkFileChooserButton is a widget that lets the user select a
/// file.  It implements the #GtkFileChooser interface.  Visually, it is a
/// file name with a button to bring up a #GtkFileChooserDialog.
/// The user can then use that dialog to change the file associated with
/// that button.  This widget does not support setting the
/// #GtkFileChooser:select-multiple property to %TRUE.
/// ## Create a button to let the user select a file in /etc
/// |[<!-- language="C" -->
/// {
/// GtkWidget *button;
/// button = gtk_file_chooser_button_new (_("Select a file"),
/// GTK_FILE_CHOOSER_ACTION_OPEN);
/// gtk_file_chooser_set_current_folder (GTK_FILE_CHOOSER (button),
/// "/etc");
/// }
/// ]|
/// The #GtkFileChooserButton supports the #GtkFileChooserActions
/// %GTK_FILE_CHOOSER_ACTION_OPEN and %GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER.
/// > The #GtkFileChooserButton will ellipsize the label, and will thus
/// > request little horizontal space.  To give the button more space,
/// > you should call gtk_widget_get_preferred_size(),
/// > gtk_file_chooser_button_set_width_chars(), or pack the button in
/// > such a way that other interface elements give space to the
/// > widget.


open class CGTKFileChooserButton : CGTKBox {
	/// 
	/// Creates a new file-selecting button widget.
	/// Parameters:
	///	- title: String
	///	- action: GtkFileChooserAction
	/// - Returns: CGTKWidget
	public convenience init(title: String, action: GtkFileChooserAction) {
		self.init(withGObject: gtk_file_chooser_button_new(title, action))!
	}

	/// 
	/// Creates a #GtkFileChooserButton widget which uses @dialog as its
	/// file-picking window.
	/// Note that @dialog must be a #GtkDialog (or subclass) which
	/// implements the #GtkFileChooser interface and must not have
	/// %GTK_DIALOG_DESTROY_WITH_PARENT set.
	/// Also note that the dialog needs to have its confirmative button
	/// added with response %GTK_RESPONSE_ACCEPT or %GTK_RESPONSE_OK in
	/// order for the button to take over the file selected in the dialog.
	/// Parameters:
	///	- dialog: CGTKWidget
	/// - Returns: CGTKWidget
	public convenience init(withDialog dialog: CGTKWidget) {
		self.init(withGObject: gtk_file_chooser_button_new_with_dialog(dialog.WIDGET))!
	}

	open var FILECHOOSERBUTTON: UnsafeMutablePointer<GtkFileChooserButton>! {
		get {
			return GTK_FILE_CHOOSER_BUTTON(self.GOBJECT)
		}
	}

	/// 
	/// Returns whether the button grabs focus when it is clicked with the mouse.
	/// See gtk_file_chooser_button_set_focus_on_click().
	/// - Returns: Bool
	override open func getFocusOnClick() -> Bool {
		return gtk_file_chooser_button_get_focus_on_click(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the title of the browse dialog used by @button. The returned value
	/// should not be modified or freed.
	/// - Returns: String?
	open func getTitle() -> String? {
		return String(utf8String: gtk_file_chooser_button_get_title(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT)))
	}

	/// 
	/// Retrieves the width in characters of the @button widget’s entry and/or label.
	/// - Returns: gint
	open func getWidthChars() -> gint {
		return gtk_file_chooser_button_get_width_chars(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT))
	}

	/// 
	/// Sets whether the button will grab focus when it is clicked with the mouse.
	/// Making mouse clicks not grab focus is useful in places like toolbars where
	/// you don’t want the keyboard focus removed from the main area of the
	/// application.
	/// Parameters:
	///	- focusOnClick: Bool
	override open func setFocusOnClick(_ focusOnClick: Bool) {
		gtk_file_chooser_button_set_focus_on_click(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT), focusOnClick ? 1 : 0)
	}

	/// 
	/// Modifies the @title of the browse dialog used by @button.
	/// Parameters:
	///	- title: String
	open func setTitle(_ title: String) {
		gtk_file_chooser_button_set_title(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT), title)
	}

	/// 
	/// Sets the width (in characters) that @button will use to @n_chars.
	/// Parameters:
	///	- nchars: gint
	open func setWidthChars(nchars: gint) {
		gtk_file_chooser_button_set_width_chars(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT), nchars)
	}

}
