/*
 * CGTKAppChooserButton.swift
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

public let GTK_TYPE_APP_CHOOSER_BUTTON: GType = gtk_app_chooser_button_get_type()

@inline(__always) public func GTK_APP_CHOOSER_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkAppChooserButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_APP_CHOOSER_BUTTON)
}

/// The #GtkAppChooserButton is a widget that lets the user select
/// an application. It implements the #GtkAppChooser interface.
/// Initially, a #GtkAppChooserButton selects the first application
/// in its list, which will either be the most-recently used application
/// or, if #GtkAppChooserButton:show-default-item is %TRUE, the
/// default application.
/// The list of applications shown in a #GtkAppChooserButton includes
/// the recommended applications for the given content type. When
/// #GtkAppChooserButton:show-default-item is set, the default application
/// is also included. To let the user chooser other applications,
/// you can set the #GtkAppChooserButton:show-dialog-item property,
/// which allows to open a full #GtkAppChooserDialog.
/// It is possible to add custom items to the list, using
/// gtk_app_chooser_button_append_custom_item(). These items cause
/// the #GtkAppChooserButton::custom-item-activated signal to be
/// emitted when they are selected.
/// To track changes in the selected application, use the
/// #GtkComboBox::changed signal.


open class CGTKAppChooserButton : CGTKComboBox, CGTKAppChooser {
	/// Creates a new #GtkAppChooserButton for applications
	/// that can handle content of the given type.
	/// - Parameters:
	///	- contentType: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(contentType: String) {
		self.init(withGObject: gtk_app_chooser_button_new(contentType))!
	}

	open var APPCHOOSERBUTTON: UnsafeMutablePointer<GtkAppChooserButton>! {
		get {
			return GTK_APP_CHOOSER_BUTTON(self.GOBJECT)
		}
	}

	/// Appends a custom item to the list of applications that is shown
	/// in the popup; the item name must be unique per-widget.
	/// Clients can use the provided name as a detail for the
	/// #GtkAppChooserButton::custom-item-activated signal, to add a
	/// callback for the activation of a particular custom item in the list.
	/// See also gtk_app_chooser_button_append_separator().
	/// - Parameters:
	///	- name: String (const gchar*)
	///	- label: String (const gchar*)
	///	- icon: OpaquePointer! (GIcon*)
	open func appendCustomItem(name: String, label: String, icon: OpaquePointer!) -> Swift.Void {
		gtk_app_chooser_button_append_custom_item(GTK_APP_CHOOSER_BUTTON(self.GOBJECT), name, label, icon)
	}

	/// Appends a separator to the list of applications that is shown
	/// in the popup.
	open func appendSeparator() -> Swift.Void {
		gtk_app_chooser_button_append_separator(GTK_APP_CHOOSER_BUTTON(self.GOBJECT))
	}

	/// Returns the text to display at the top of the dialog.
	/// - Returns: String? (const gchar*)
	open func getHeading() -> String? {
		return String(utf8String: gtk_app_chooser_button_get_heading(GTK_APP_CHOOSER_BUTTON(self.GOBJECT)))
	}

	/// Returns the current value of the #GtkAppChooserButton:show-default-item
	/// property.
	/// - Returns: Bool (gboolean)
	open func getShowDefaultItem() -> Bool {
		return gtk_app_chooser_button_get_show_default_item(GTK_APP_CHOOSER_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the current value of the #GtkAppChooserButton:show-dialog-item
	/// property.
	/// - Returns: Bool (gboolean)
	open func getShowDialogItem() -> Bool {
		return gtk_app_chooser_button_get_show_dialog_item(GTK_APP_CHOOSER_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Selects a custom item previously added with
	/// gtk_app_chooser_button_append_custom_item().
	/// Use gtk_app_chooser_refresh() to bring the selection
	/// to its initial state.
	/// - Parameters:
	///	- name: String (const gchar*)
	open func setActiveCustomItem(name: String) -> Swift.Void {
		gtk_app_chooser_button_set_active_custom_item(GTK_APP_CHOOSER_BUTTON(self.GOBJECT), name)
	}

	/// Sets the text to display at the top of the dialog.
	/// If the heading is not set, the dialog displays a default text.
	/// - Parameters:
	///	- heading: String (const gchar*)
	open func setHeading(_ heading: String) -> Swift.Void {
		gtk_app_chooser_button_set_heading(GTK_APP_CHOOSER_BUTTON(self.GOBJECT), heading)
	}

	/// Sets whether the dropdown menu of this button should show the
	/// default application for the given content type at top.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setShowDefaultItem(setting: Bool) -> Swift.Void {
		gtk_app_chooser_button_set_show_default_item(GTK_APP_CHOOSER_BUTTON(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets whether the dropdown menu of this button should show an
	/// entry to trigger a #GtkAppChooserDialog.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setShowDialogItem(setting: Bool) -> Swift.Void {
		gtk_app_chooser_button_set_show_dialog_item(GTK_APP_CHOOSER_BUTTON(self.GOBJECT), setting ? 1 : 0)
	}

	/// Returns the currently selected application.
	/// - Returns: OpaquePointer? (GAppInfo*)
	open func getAppInfo() -> OpaquePointer? {
		return gtk_app_chooser_get_app_info(GTK_APP_CHOOSER(self.GOBJECT))
	}

	/// Returns the current value of the #GtkAppChooser:content-type property.
	/// - Returns: String? (gchar*)
	open func getContentType() -> String? {
		return String(utf8String: gtk_app_chooser_get_content_type(GTK_APP_CHOOSER(self.GOBJECT)))
	}

	/// Reloads the list of applications.
	open func refresh() -> Swift.Void {
		gtk_app_chooser_refresh(GTK_APP_CHOOSER(self.GOBJECT))
	}

}
