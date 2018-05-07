/*
 * CGTKFixed.swift
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

public let GTK_TYPE_FIXED: GType = gtk_fixed_get_type()

@inline(__always) public func GTK_FIXED(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFixed>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FIXED)
}

/// The #GtkFixed widget is a container which can place child widgets
/// at fixed positions and with fixed sizes, given in pixels. #GtkFixed
/// performs no automatic layout management.
/// For most applications, you should not use this container! It keeps
/// you from having to learn about the other GTK+ containers, but it
/// results in broken applications.  With #GtkFixed, the following
/// things will result in truncated text, overlapping widgets, and
/// other display bugs:
/// - Themes, which may change widget sizes.
/// - Fonts other than the one you used to write the app will of course
/// change the size of widgets containing text; keep in mind that
/// users may use a larger font because of difficulty reading the
/// default, or they may be using a different OS that provides different fonts.
/// - Translation of text into other languages changes its size. Also,
/// display of non-English text will use a different font in many
/// cases.
/// In addition, #GtkFixed does not pay attention to text direction and thus may
/// produce unwanted results if your app is run under right-to-left languages
/// such as Hebrew or Arabic. That is: normally GTK+ will order containers
/// appropriately for the text direction, e.g. to put labels to the right of the
/// thing they label when using an RTL language, but it can’t do that with
/// #GtkFixed. So if you need to reorder widgets depending on the text direction,
/// you would need to manually detect it and adjust child positions accordingly.
/// Finally, fixed positioning makes it kind of annoying to add/remove
/// GUI elements, since you have to reposition all the other
/// elements. This is a long-term maintenance problem for your
/// application.
/// If you know none of these things are an issue for your application,
/// and prefer the simplicity of #GtkFixed, by all means use the
/// widget. But you should be aware of the tradeoffs.
/// See also #GtkLayout, which shares the ability to perform fixed positioning
/// of child widgets and additionally adds custom drawing and scrollability.


open class CGTKFixed : CGTKContainer {
	/// Creates a new #GtkFixed.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_fixed_new())!
	}

	open var FIXED: UnsafeMutablePointer<GtkFixed>! {
		get {
			return GTK_FIXED(self.GOBJECT)
		}
	}

	/// Moves a child of a #GtkFixed container to the given position.
	/// - Parameters:
	///	- widget: CGTKWidget (GtkWidget*)
	///	- x: gint (gint)
	///	- y: gint (gint)
	open func move(widget: CGTKWidget, x: gint, y: gint) -> Swift.Void {
		gtk_fixed_move(GTK_FIXED(self.GOBJECT), widget.WIDGET, x, y)
	}

	/// Adds a widget to a #GtkFixed container at the given position.
	/// - Parameters:
	///	- widget: CGTKWidget (GtkWidget*)
	///	- x: gint (gint)
	///	- y: gint (gint)
	open func put(widget: CGTKWidget, x: gint, y: gint) -> Swift.Void {
		gtk_fixed_put(GTK_FIXED(self.GOBJECT), widget.WIDGET, x, y)
	}

}
