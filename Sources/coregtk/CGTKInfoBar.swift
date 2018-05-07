/*
 * CGTKInfoBar.swift
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

public let GTK_TYPE_INFO_BAR: GType = gtk_info_bar_get_type()

@inline(__always) public func GTK_INFO_BAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkInfoBar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_INFO_BAR)
}

/// #GtkInfoBar is a widget that can be used to show messages to
/// the user without showing a dialog. It is often temporarily shown
/// at the top or bottom of a document. In contrast to #GtkDialog, which
/// has a action area at the bottom, #GtkInfoBar has an action area
/// at the side.
/// The API of #GtkInfoBar is very similar to #GtkDialog, allowing you
/// to add buttons to the action area with gtk_info_bar_add_button() or
/// gtk_info_bar_new_with_buttons(). The sensitivity of action widgets
/// can be controlled with gtk_info_bar_set_response_sensitive().
/// To add widgets to the main content area of a #GtkInfoBar, use
/// gtk_info_bar_get_content_area() and add your widgets to the container.
/// Similar to #GtkMessageDialog, the contents of a #GtkInfoBar can by
/// classified as error message, warning, informational message, etc,
/// by using gtk_info_bar_set_message_type(). GTK+ may use the message type
/// to determine how the message is displayed.
/// A simple example for using a #GtkInfoBar:
/// |[<!-- language="C" -->
/// GtkWidget *widget, *message_label, *content_area;
/// GtkWidget *grid;
/// GtkInfoBar *bar;
/// // set up info bar
/// widget = gtk_info_bar_new ();
/// bar = GTK_INFO_BAR (widget);
/// grid = gtk_grid_new ();
/// gtk_widget_set_no_show_all (widget, TRUE);
/// message_label = gtk_label_new ("");
/// content_area = gtk_info_bar_get_content_area (bar);
/// gtk_container_add (GTK_CONTAINER (content_area),
/// message_label);
/// gtk_info_bar_add_button (bar,
/// _("_OK"),
/// GTK_RESPONSE_OK);
/// g_signal_connect (bar,
/// "response",
/// G_CALLBACK (gtk_widget_hide),
/// NULL);
/// gtk_grid_attach (GTK_GRID (grid),
/// widget,
/// 0, 2, 1, 1);
/// // ...
/// // show an error message
/// gtk_label_set_text (GTK_LABEL (message_label), "An error occurred!");
/// gtk_info_bar_set_message_type (bar,
/// GTK_MESSAGE_ERROR);
/// gtk_widget_show (bar);
/// ]|
/// # GtkInfoBar as GtkBuildable
/// The GtkInfoBar implementation of the GtkBuildable interface exposes
/// the content area and action area as internal children with the names
/// “content_area” and “action_area”.
/// GtkInfoBar supports a custom <action-widgets> element, which can contain
/// multiple <action-widget> elements. The “response” attribute specifies a
/// numeric response, and the content of the element is the id of widget
/// (which should be a child of the dialogs @action_area).
/// # CSS nodes
/// GtkInfoBar has a single CSS node with name infobar. The node may get
/// one of the style classes .info, .warning, .error or .question, depending
/// on the message type.


open class CGTKInfoBar : CGTKBox {
	public convenience init(withButtons buttons: [(buttonText: String, responseId: gint)]?) {

		self.init(withGObject:gtk_info_bar_new())!

		if let buttons = buttons {
			for button in buttons {
				_ = self.addButton(buttonText: button.buttonText, responseId: button.responseId)
			}
		}
	}

	open func addButtons(_ buttons: [(buttonText: String, responseId: gint)]) {
		for button in buttons {
			_ = self.addButton(buttonText: button.buttonText, responseId: button.responseId)
		}
	}

	/// Creates a new #GtkInfoBar object.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_info_bar_new())!
	}

	open var INFOBAR: UnsafeMutablePointer<GtkInfoBar>! {
		get {
			return GTK_INFO_BAR(self.GOBJECT)
		}
	}

	/// Add an activatable widget to the action area of a #GtkInfoBar,
	/// connecting a signal handler that will emit the #GtkInfoBar::response
	/// signal on the message area when the widget is activated. The widget
	/// is appended to the end of the message areas action area.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- responseId: gint (gint)
	open func addActionWidget(child: CGTKWidget, responseId: gint) -> Swift.Void {
		gtk_info_bar_add_action_widget(GTK_INFO_BAR(self.GOBJECT), child.WIDGET, responseId)
	}

	/// Adds a button with the given text and sets things up so that
	/// clicking the button will emit the “response” signal with the given
	/// response_id. The button is appended to the end of the info bars's
	/// action area. The button widget is returned, but usually you don't
	/// need it.
	/// - Parameters:
	///	- buttonText: String (const gchar*)
	///	- responseId: gint (gint)
	/// - Returns: CGTKWidget (GtkWidget*)
	open func addButton<T>(buttonText: String, responseId: gint) -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_info_bar_add_button(GTK_INFO_BAR(self.GOBJECT), buttonText, responseId))!
	}

	/// Returns the action area of @info_bar.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getActionArea<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_info_bar_get_action_area(GTK_INFO_BAR(self.GOBJECT)))!
	}

	/// Returns the content area of @info_bar.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getContentArea<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_info_bar_get_content_area(GTK_INFO_BAR(self.GOBJECT)))!
	}

	/// Returns the message type of the message area.
	/// - Returns: GtkMessageType (GtkMessageType)
	open func getMessageType() -> GtkMessageType {
		return gtk_info_bar_get_message_type(GTK_INFO_BAR(self.GOBJECT))
	}

	/// func getRevealed() -> Bool -> Bool
	/// - Returns: Bool (gboolean)
	open func getRevealed() -> Bool {
		return gtk_info_bar_get_revealed(GTK_INFO_BAR(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the widget will display a standard close button.
	/// - Returns: Bool (gboolean)
	open func getShowCloseButton() -> Bool {
		return gtk_info_bar_get_show_close_button(GTK_INFO_BAR(self.GOBJECT)) != 0 ? true : false
	}

	/// Emits the “response” signal with the given @response_id.
	/// - Parameters:
	///	- responseId: gint (gint)
	open func response(responseId: gint) -> Swift.Void {
		gtk_info_bar_response(GTK_INFO_BAR(self.GOBJECT), responseId)
	}

	/// Sets the last widget in the info bar’s action area with
	/// the given response_id as the default widget for the dialog.
	/// Pressing “Enter” normally activates the default widget.
	/// Note that this function currently requires @info_bar to
	/// be added to a widget hierarchy.
	/// - Parameters:
	///	- responseId: gint (gint)
	open func setDefaultResponse(responseId: gint) -> Swift.Void {
		gtk_info_bar_set_default_response(GTK_INFO_BAR(self.GOBJECT), responseId)
	}

	/// Sets the message type of the message area.
	/// GTK+ uses this type to determine how the message is displayed.
	/// - Parameters:
	///	- messageType: GtkMessageType (GtkMessageType)
	open func setMessageType(_ messageType: GtkMessageType) -> Swift.Void {
		gtk_info_bar_set_message_type(GTK_INFO_BAR(self.GOBJECT), messageType)
	}

	/// Calls gtk_widget_set_sensitive (widget, setting) for each
	/// widget in the info bars’s action area with the given response_id.
	/// A convenient way to sensitize/desensitize dialog buttons.
	/// - Parameters:
	///	- responseId: gint (gint)
	///	- setting: Bool (gboolean)
	open func setResponseSensitive(responseId: gint, setting: Bool) -> Swift.Void {
		gtk_info_bar_set_response_sensitive(GTK_INFO_BAR(self.GOBJECT), responseId, setting ? 1 : 0)
	}

	/// Sets the GtkInfoBar:revealed property to @revealed. This will cause
	/// @info_bar to show up with a slide-in transition.
	/// Note that this property does not automatically show @info_bar and thus won’t
	/// have any effect if it is invisible.
	/// - Parameters:
	///	- revealed: Bool (gboolean)
	open func setRevealed(_ revealed: Bool) -> Swift.Void {
		gtk_info_bar_set_revealed(GTK_INFO_BAR(self.GOBJECT), revealed ? 1 : 0)
	}

	/// If true, a standard close button is shown. When clicked it emits
	/// the response %GTK_RESPONSE_CLOSE.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setShowCloseButton(setting: Bool) -> Swift.Void {
		gtk_info_bar_set_show_close_button(GTK_INFO_BAR(self.GOBJECT), setting ? 1 : 0)
	}

}
