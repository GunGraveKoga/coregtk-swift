/*
 * CGTKAppChooserWidget.swift
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

public let GTK_TYPE_APP_CHOOSER_WIDGET: GType = gtk_app_chooser_widget_get_type()

@inline(__always) public func GTK_APP_CHOOSER_WIDGET(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkAppChooserWidget>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_APP_CHOOSER_WIDGET)
}

/// #GtkAppChooserWidget is a widget for selecting applications.
/// It is the main building block for #GtkAppChooserDialog. Most
/// applications only need to use the latter; but you can use
/// this widget as part of a larger widget if you have special needs.
/// #GtkAppChooserWidget offers detailed control over what applications
/// are shown, using the
/// #GtkAppChooserWidget:show-default,
/// #GtkAppChooserWidget:show-recommended,
/// #GtkAppChooserWidget:show-fallback,
/// #GtkAppChooserWidget:show-other and
/// #GtkAppChooserWidget:show-all
/// properties. See the #GtkAppChooser documentation for more information
/// about these groups of applications.
/// To keep track of the selected application, use the
/// #GtkAppChooserWidget::application-selected and #GtkAppChooserWidget::application-activated signals.
/// # CSS nodes
/// GtkAppChooserWidget has a single CSS node with name appchooser.


open class CGTKAppChooserWidget : CGTKBox, CGTKAppChooser {
	/// Creates a new #GtkAppChooserWidget for applications
	/// that can handle content of the given type.
	/// - Parameters:
	///	- contentType: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(contentType: String) {
		self.init(withGObject: gtk_app_chooser_widget_new(contentType))!
	}

	open var APPCHOOSERWIDGET: UnsafeMutablePointer<GtkAppChooserWidget>! {
		get {
			return GTK_APP_CHOOSER_WIDGET(self.GOBJECT)
		}
	}

	/// Returns the text that is shown if there are not applications
	/// that can handle the content type.
	/// - Returns: String? (const gchar*)
	open func getDefaultText() -> String? {
		return String(utf8String: gtk_app_chooser_widget_get_default_text(GTK_APP_CHOOSER_WIDGET(self.GOBJECT)))
	}

	/// Returns the current value of the #GtkAppChooserWidget:show-all
	/// property.
	/// - Returns: Bool (gboolean)
	open func getShowAll() -> Bool {
		return gtk_app_chooser_widget_get_show_all(GTK_APP_CHOOSER_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the current value of the #GtkAppChooserWidget:show-default
	/// property.
	/// - Returns: Bool (gboolean)
	open func getShowDefault() -> Bool {
		return gtk_app_chooser_widget_get_show_default(GTK_APP_CHOOSER_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the current value of the #GtkAppChooserWidget:show-fallback
	/// property.
	/// - Returns: Bool (gboolean)
	open func getShowFallback() -> Bool {
		return gtk_app_chooser_widget_get_show_fallback(GTK_APP_CHOOSER_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the current value of the #GtkAppChooserWidget:show-other
	/// property.
	/// - Returns: Bool (gboolean)
	open func getShowOther() -> Bool {
		return gtk_app_chooser_widget_get_show_other(GTK_APP_CHOOSER_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the current value of the #GtkAppChooserWidget:show-recommended
	/// property.
	/// - Returns: Bool (gboolean)
	open func getShowRecommended() -> Bool {
		return gtk_app_chooser_widget_get_show_recommended(GTK_APP_CHOOSER_WIDGET(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the text that is shown if there are not applications
	/// that can handle the content type.
	/// - Parameters:
	///	- text: String (const gchar*)
	open func setDefaultText(_ text: String) -> Swift.Void {
		gtk_app_chooser_widget_set_default_text(GTK_APP_CHOOSER_WIDGET(self.GOBJECT), text)
	}

	/// Sets whether the app chooser should show all applications
	/// in a flat list.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setShowAll(setting: Bool) -> Swift.Void {
		gtk_app_chooser_widget_set_show_all(GTK_APP_CHOOSER_WIDGET(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets whether the app chooser should show the default handler
	/// for the content type in a separate section.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setShowDefault(setting: Bool) -> Swift.Void {
		gtk_app_chooser_widget_set_show_default(GTK_APP_CHOOSER_WIDGET(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets whether the app chooser should show related applications
	/// for the content type in a separate section.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setShowFallback(setting: Bool) -> Swift.Void {
		gtk_app_chooser_widget_set_show_fallback(GTK_APP_CHOOSER_WIDGET(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets whether the app chooser should show applications
	/// which are unrelated to the content type.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setShowOther(setting: Bool) -> Swift.Void {
		gtk_app_chooser_widget_set_show_other(GTK_APP_CHOOSER_WIDGET(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets whether the app chooser should show recommended applications
	/// for the content type in a separate section.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setShowRecommended(setting: Bool) -> Swift.Void {
		gtk_app_chooser_widget_set_show_recommended(GTK_APP_CHOOSER_WIDGET(self.GOBJECT), setting ? 1 : 0)
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
