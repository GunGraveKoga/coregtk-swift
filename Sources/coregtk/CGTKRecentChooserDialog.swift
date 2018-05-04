/*
 * CGTKRecentChooserDialog.swift
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

public let GTK_TYPE_RECENT_CHOOSER_DIALOG: GType = gtk_recent_chooser_dialog_get_type()

@inline(__always) public func GTK_RECENT_CHOOSER_DIALOG(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkRecentChooserDialog>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_RECENT_CHOOSER_DIALOG)
}

/// 
/// #GtkRecentChooserDialog is a dialog box suitable for displaying the recently
/// used documents.  This widgets works by putting a #GtkRecentChooserWidget inside
/// a #GtkDialog.  It exposes the #GtkRecentChooserIface interface, so you can use
/// all the #GtkRecentChooser functions on the recent chooser dialog as well as
/// those for #GtkDialog.
/// Note that #GtkRecentChooserDialog does not have any methods of its own.
/// Instead, you should use the functions that work on a #GtkRecentChooser.
/// ## Typical usage ## {#gtkrecentchooser-typical-usage}
/// In the simplest of cases, you can use the following code to use
/// a #GtkRecentChooserDialog to select a recently used file:
/// |[<!-- language="C" -->
/// GtkWidget *dialog;
/// gint res;
/// dialog = gtk_recent_chooser_dialog_new ("Recent Documents",
/// parent_window,
/// _("_Cancel"),
/// GTK_RESPONSE_CANCEL,
/// _("_Open"),
/// GTK_RESPONSE_ACCEPT,
/// NULL);
/// res = gtk_dialog_run (GTK_DIALOG (dialog));
/// if (res == GTK_RESPONSE_ACCEPT)
/// {
/// GtkRecentInfo *info;
/// GtkRecentChooser *chooser = GTK_RECENT_CHOOSER (dialog);
/// info = gtk_recent_chooser_get_current_item (chooser);
/// open_file (gtk_recent_info_get_uri (info));
/// gtk_recent_info_unref (info);
/// }
/// gtk_widget_destroy (dialog);
/// ]|
/// Recently used files are supported since GTK+ 2.10.


open class CGTKRecentChooserDialog : CGTKDialog {
	public convenience init(withTitle title: String, parent: CGTKWindow, _ buttons: [(buttonText: String, responseId: gint)]?) {

		self.init(withGObject:swift_gtk_recent_chooser_dialog_new(title, parent.WINDOW))!

		if let buttons = buttons {
			for button in buttons {
				_ = self.addButton(buttonText: button.buttonText, responseId: button.responseId)
			}
		}
	}

	public convenience init(forManagerWithTitle title: String, parent: CGTKWindow, manager: UnsafeMutablePointer<GtkRecentManager>!, _ buttons: [(buttonText: String, responseId: gint)]?) {

		self.init(withGObject:swift_gtk_recent_chooser_dialog_new_for_manager(title, parent.WINDOW, manager))!

		if let buttons = buttons {
			for button in buttons {
				_ = self.addButton(buttonText: button.buttonText, responseId: button.responseId)
			}
		}
	}

	open var RECENTCHOOSERDIALOG: UnsafeMutablePointer<GtkRecentChooserDialog>! {
		get {
			return GTK_RECENT_CHOOSER_DIALOG(self.GOBJECT)
		}
	}

}
