/*
 * CGTKActionBar.swift
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

public let GTK_TYPE_ACTION_BAR: GType = gtk_action_bar_get_type()

@inline(__always) public func GTK_ACTION_BAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkActionBar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_ACTION_BAR)
}

/// GtkActionBar is designed to present contextual actions. It is
/// expected to be displayed below the content and expand horizontally
/// to fill the area.
/// It allows placing children at the start or the end. In addition, it
/// contains an internal centered box which is centered with respect to
/// the full width of the box, even if the children at either side take
/// up different amounts of space.
/// # CSS nodes
/// GtkActionBar has a single CSS node with name actionbar.


open class CGTKActionBar : CGTKBin {
	/// Creates a new #GtkActionBar widget.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_action_bar_new())!
	}

	open var ACTIONBAR: UnsafeMutablePointer<GtkActionBar>! {
		get {
			return GTK_ACTION_BAR(self.GOBJECT)
		}
	}

	/// Retrieves the center bar widget of the bar.
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getCenterWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_action_bar_get_center_widget(GTK_ACTION_BAR(self.GOBJECT)))
	}

	/// Adds @child to @action_bar, packed with reference to the
	/// end of the @action_bar.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func packEnd(child: CGTKWidget) -> Swift.Void {
		gtk_action_bar_pack_end(GTK_ACTION_BAR(self.GOBJECT), child.WIDGET)
	}

	/// Adds @child to @action_bar, packed with reference to the
	/// start of the @action_bar.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func packStart(child: CGTKWidget) -> Swift.Void {
		gtk_action_bar_pack_start(GTK_ACTION_BAR(self.GOBJECT), child.WIDGET)
	}

	/// Sets the center widget for the #GtkActionBar.
	/// - Parameters:
	///	- centerWidget: CGTKWidget? (GtkWidget*)
	open func setCenterWidget(_ centerWidget: CGTKWidget?) -> Swift.Void {
		gtk_action_bar_set_center_widget(GTK_ACTION_BAR(self.GOBJECT), centerWidget?.WIDGET)
	}

}
