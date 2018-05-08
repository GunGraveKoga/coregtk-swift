/*
 * CGTKHeaderBar.swift
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

public let GTK_TYPE_HEADER_BAR: GType = gtk_header_bar_get_type()

@inline(__always) public func GTK_HEADER_BAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkHeaderBar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_HEADER_BAR)
}

/// GtkHeaderBar is similar to a horizontal #GtkBox. It allows children to
/// be placed at the start or the end. In addition, it allows a title and
/// subtitle to be displayed. The title will be centered with respect to
/// the width of the box, even if the children at either side take up
/// different amounts of space. The height of the titlebar will be
/// set to provide sufficient space for the subtitle, even if none is
/// currently set. If a subtitle is not needed, the space reservation
/// can be turned off with gtk_header_bar_set_has_subtitle().
/// GtkHeaderBar can add typical window frame controls, such as minimize,
/// maximize and close buttons, or the window icon.
/// For these reasons, GtkHeaderBar is the natural choice for use as the custom
/// titlebar widget of a #GtkWindow (see gtk_window_set_titlebar()), as it gives
/// features typical of titlebars while allowing the addition of child widgets.


open class CGTKHeaderBar : CGTKContainer {
	/// Creates a new #GtkHeaderBar widget.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_header_bar_new())!
	}

	open var HEADERBAR: UnsafeMutablePointer<GtkHeaderBar>! {
		get {
			return GTK_HEADER_BAR(self.GOBJECT)
		}
	}

	/// Retrieves the custom title widget of the header. See
	/// gtk_header_bar_set_custom_title().
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getCustomTitle<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_header_bar_get_custom_title(GTK_HEADER_BAR(self.GOBJECT)))
	}

	/// Gets the decoration layout set with
	/// gtk_header_bar_set_decoration_layout().
	/// - Returns: String? (const gchar*)
	open func getDecorationLayout() -> String? {
		return String(utf8String: gtk_header_bar_get_decoration_layout(GTK_HEADER_BAR(self.GOBJECT)))
	}

	/// Retrieves whether the header bar reserves space for
	/// a subtitle, regardless if one is currently set or not.
	/// - Returns: Bool (gboolean)
	open func getHasSubtitle() -> Bool {
		return gtk_header_bar_get_has_subtitle(GTK_HEADER_BAR(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether this header bar shows the standard window
	/// decorations.
	/// - Returns: Bool (gboolean)
	open func getShowCloseButton() -> Bool {
		return gtk_header_bar_get_show_close_button(GTK_HEADER_BAR(self.GOBJECT)) != 0 ? true : false
	}

	/// Retrieves the subtitle of the header. See gtk_header_bar_set_subtitle().
	/// - Returns: String? (const gchar*)
	open func getSubtitle() -> String? {
		return String(utf8String: gtk_header_bar_get_subtitle(GTK_HEADER_BAR(self.GOBJECT)))
	}

	/// Retrieves the title of the header. See gtk_header_bar_set_title().
	/// - Returns: String? (const gchar*)
	open func getTitle() -> String? {
		return String(utf8String: gtk_header_bar_get_title(GTK_HEADER_BAR(self.GOBJECT)))
	}

	/// Adds @child to @bar, packed with reference to the
	/// end of the @bar.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func packEnd(child: CGTKWidget) -> Swift.Void {
		gtk_header_bar_pack_end(GTK_HEADER_BAR(self.GOBJECT), child.WIDGET)
	}

	/// Adds @child to @bar, packed with reference to the
	/// start of the @bar.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func packStart(child: CGTKWidget) -> Swift.Void {
		gtk_header_bar_pack_start(GTK_HEADER_BAR(self.GOBJECT), child.WIDGET)
	}

	/// Sets a custom title for the #GtkHeaderBar.
	/// The title should help a user identify the current view. This
	/// supersedes any title set by gtk_header_bar_set_title() or
	/// gtk_header_bar_set_subtitle(). To achieve the same style as
	/// the builtin title and subtitle, use the “title” and “subtitle”
	/// style classes.
	/// You should set the custom title to %NULL, for the header title
	/// label to be visible again.
	/// - Parameters:
	///	- titleWidget: CGTKWidget? (GtkWidget*)
	open func setCustomTitle(titleWidget: CGTKWidget?) -> Swift.Void {
		gtk_header_bar_set_custom_title(GTK_HEADER_BAR(self.GOBJECT), titleWidget?.WIDGET)
	}

	/// Sets the decoration layout for this header bar, overriding
	/// the #GtkSettings:gtk-decoration-layout setting.
	/// There can be valid reasons for overriding the setting, such
	/// as a header bar design that does not allow for buttons to take
	/// room on the right, or only offers room for a single close button.
	/// Split header bars are another example for overriding the
	/// setting.
	/// The format of the string is button names, separated by commas.
	/// A colon separates the buttons that should appear on the left
	/// from those on the right. Recognized button names are minimize,
	/// maximize, close, icon (the window icon) and menu (a menu button
	/// for the fallback app menu).
	/// For example, “menu:minimize,maximize,close” specifies a menu
	/// on the left, and minimize, maximize and close buttons on the right.
	/// - Parameters:
	///	- layout: String? (const gchar*)
	open func setDecorationLayout(_ layout: String?) -> Swift.Void {
		gtk_header_bar_set_decoration_layout(GTK_HEADER_BAR(self.GOBJECT), layout)
	}

	/// Sets whether the header bar should reserve space
	/// for a subtitle, even if none is currently set.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setHasSubtitle(setting: Bool) -> Swift.Void {
		gtk_header_bar_set_has_subtitle(GTK_HEADER_BAR(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets whether this header bar shows the standard window decorations,
	/// including close, maximize, and minimize.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setShowCloseButton(setting: Bool) -> Swift.Void {
		gtk_header_bar_set_show_close_button(GTK_HEADER_BAR(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets the subtitle of the #GtkHeaderBar. The title should give a user
	/// an additional detail to help him identify the current view.
	/// Note that GtkHeaderBar by default reserves room for the subtitle,
	/// even if none is currently set. If this is not desired, set the
	/// #GtkHeaderBar:has-subtitle property to %FALSE.
	/// - Parameters:
	///	- subtitle: String? (const gchar*)
	open func setSubtitle(_ subtitle: String?) -> Swift.Void {
		gtk_header_bar_set_subtitle(GTK_HEADER_BAR(self.GOBJECT), subtitle)
	}

	/// Sets the title of the #GtkHeaderBar. The title should help a user
	/// identify the current view. A good title should not include the
	/// application name.
	/// - Parameters:
	///	- title: String? (const gchar*)
	open func setTitle(_ title: String?) -> Swift.Void {
		gtk_header_bar_set_title(GTK_HEADER_BAR(self.GOBJECT), title)
	}

}
