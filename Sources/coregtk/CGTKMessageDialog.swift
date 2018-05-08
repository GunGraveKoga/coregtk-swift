/*
 * CGTKMessageDialog.swift
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

public let GTK_TYPE_MESSAGE_DIALOG: GType = gtk_message_dialog_get_type()

@inline(__always) public func GTK_MESSAGE_DIALOG(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkMessageDialog>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_MESSAGE_DIALOG)
}

/// #GtkMessageDialog presents a dialog with some message text. It’s simply a
/// convenience widget; you could construct the equivalent of #GtkMessageDialog
/// from #GtkDialog without too much effort, but #GtkMessageDialog saves typing.
/// One difference from #GtkDialog is that #GtkMessageDialog sets the
/// #GtkWindow:skip-taskbar-hint property to %TRUE, so that the dialog is hidden
/// from the taskbar by default.
/// The easiest way to do a modal message dialog is to use gtk_dialog_run(), though
/// you can also pass in the %GTK_DIALOG_MODAL flag, gtk_dialog_run() automatically
/// makes the dialog modal and waits for the user to respond to it. gtk_dialog_run()
/// returns when any dialog button is clicked.
/// An example for using a modal dialog:
/// |[<!-- language="C" -->
/// GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT;
/// dialog = gtk_message_dialog_new (parent_window,
/// flags,
/// GTK_MESSAGE_ERROR,
/// GTK_BUTTONS_CLOSE,
/// "Error reading “%s”: %s",
/// filename,
/// g_strerror (errno));
/// gtk_dialog_run (GTK_DIALOG (dialog));
/// gtk_widget_destroy (dialog);
/// ]|
/// You might do a non-modal #GtkMessageDialog as follows:
/// An example for a non-modal dialog:
/// |[<!-- language="C" -->
/// GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT;
/// dialog = gtk_message_dialog_new (parent_window,
/// flags,
/// GTK_MESSAGE_ERROR,
/// GTK_BUTTONS_CLOSE,
/// "Error reading “%s”: %s",
/// filename,
/// g_strerror (errno));
/// // Destroy the dialog when the user responds to it
/// // (e.g. clicks a button)
/// g_signal_connect_swapped (dialog, "response",
/// G_CALLBACK (gtk_widget_destroy),
/// dialog);
/// ]|
/// # GtkMessageDialog as GtkBuildable
/// The GtkMessageDialog implementation of the GtkBuildable interface exposes
/// the message area as an internal child with the name “message_area”.


open class CGTKMessageDialog : CGTKDialog {
	public convenience init(withParent parent: CGTKWindow?, flags: GtkDialogFlags, type: GtkMessageType, buttons: GtkButtonsType, markup: String) {
		self.init(withGObject:swift_gtk_message_dialog_new_with_markup(parent?.WINDOW, flags, type, buttons, markup))!
	}

	open func formatSecondaryText(_ message: String) {
		swift_gtk_message_dialog_format_secondary_text(self.MESSAGEDIALOG, message)
	}

	open func formatSecondaryMarkup(_ markup: String) {
		swift_gtk_message_dialog_format_secondary_markup(self.MESSAGEDIALOG, markup)
	}

	public convenience init(withParent parent: CGTKWindow?, flags: GtkDialogFlags, type: GtkMessageType, buttons: GtkButtonsType, message: String) {
		self.init(withGObject:swift_gtk_message_dialog_new(parent?.WINDOW, flags, type, buttons, message))!
	}

	open var MESSAGEDIALOG: UnsafeMutablePointer<GtkMessageDialog>! {
		get {
			return GTK_MESSAGE_DIALOG(self.GOBJECT)
		}
	}

	/// Gets the dialog’s image.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getImage<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_message_dialog_get_image(GTK_MESSAGE_DIALOG(self.GOBJECT)))!
	}

	/// Returns the message area of the dialog. This is the box where the
	/// dialog’s primary and secondary labels are packed. You can add your
	/// own extra content to that box and it will appear below those labels.
	/// See gtk_dialog_get_content_area() for the corresponding
	/// function in the parent #GtkDialog.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getMessageArea<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_message_dialog_get_message_area(GTK_MESSAGE_DIALOG(self.GOBJECT)))!
	}

	/// Sets the dialog’s image to @image.
	/// - Parameters:
	///	- image: CGTKWidget (GtkWidget*)
	open func setImage(_ image: CGTKWidget) -> Swift.Void {
		gtk_message_dialog_set_image(GTK_MESSAGE_DIALOG(self.GOBJECT), image.WIDGET)
	}

	/// Sets the text of the message dialog to be @str, which is marked
	/// up with the [Pango text markup language][PangoMarkupFormat].
	/// - Parameters:
	///	- str: String (const gchar*)
	open func setMarkup(str: String) -> Swift.Void {
		gtk_message_dialog_set_markup(GTK_MESSAGE_DIALOG(self.GOBJECT), str)
	}

}
