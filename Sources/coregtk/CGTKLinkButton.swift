/*
 * CGTKLinkButton.swift
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

public let GTK_TYPE_LINK_BUTTON: GType = gtk_link_button_get_type()

@inline(__always) public func GTK_LINK_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkLinkButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_LINK_BUTTON)
}

/// A GtkLinkButton is a #GtkButton with a hyperlink, similar to the one
/// used by web browsers, which triggers an action when clicked. It is useful
/// to show quick links to resources.
/// A link button is created by calling either gtk_link_button_new() or
/// gtk_link_button_new_with_label(). If using the former, the URI you pass
/// to the constructor is used as a label for the widget.
/// The URI bound to a GtkLinkButton can be set specifically using
/// gtk_link_button_set_uri(), and retrieved using gtk_link_button_get_uri().
/// By default, GtkLinkButton calls gtk_show_uri_on_window() when the button is
/// clicked. This behaviour can be overridden by connecting to the
/// #GtkLinkButton::activate-link signal and returning %TRUE from the
/// signal handler.
/// # CSS nodes
/// GtkLinkButton has a single CSS node with name button. To differentiate
/// it from a plain #GtkButton, it gets the .link style class.


open class CGTKLinkButton : CGTKButton {
	/// Creates a new #GtkLinkButton with the URI as its text.
	/// - Parameters:
	///	- uri: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(uri: String) {
		self.init(withGObject: gtk_link_button_new(uri))!
	}

	/// Creates a new #GtkLinkButton containing a label.
	/// - Parameters:
	///	- uri: String (const gchar*)
	///	- label: String? (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withLabel uri: String, label: String?) {
		self.init(withGObject: gtk_link_button_new_with_label(uri, label))!
	}

	open var LINKBUTTON: UnsafeMutablePointer<GtkLinkButton>! {
		get {
			return GTK_LINK_BUTTON(self.GOBJECT)
		}
	}

	/// Retrieves the URI set using gtk_link_button_set_uri().
	/// - Returns: String? (const gchar*)
	open func getUri() -> String? {
		return String(utf8String: gtk_link_button_get_uri(GTK_LINK_BUTTON(self.GOBJECT)))
	}

	/// Retrieves the “visited” state of the URI where the #GtkLinkButton
	/// points. The button becomes visited when it is clicked. If the URI
	/// is changed on the button, the “visited” state is unset again.
	/// The state may also be changed using gtk_link_button_set_visited().
	/// - Returns: Bool (gboolean)
	open func getVisited() -> Bool {
		return gtk_link_button_get_visited(GTK_LINK_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets @uri as the URI where the #GtkLinkButton points. As a side-effect
	/// this unsets the “visited” state of the button.
	/// - Parameters:
	///	- uri: String (const gchar*)
	open func setUri(_ uri: String) -> Swift.Void {
		gtk_link_button_set_uri(GTK_LINK_BUTTON(self.GOBJECT), uri)
	}

	/// Sets the “visited” state of the URI where the #GtkLinkButton
	/// points.  See gtk_link_button_get_visited() for more details.
	/// - Parameters:
	///	- visited: Bool (gboolean)
	open func setVisited(_ visited: Bool) -> Swift.Void {
		gtk_link_button_set_visited(GTK_LINK_BUTTON(self.GOBJECT), visited ? 1 : 0)
	}

}
