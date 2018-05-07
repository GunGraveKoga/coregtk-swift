/*
 * CGTKOffscreenWindow.swift
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

public let GTK_TYPE_OFFSCREEN_WINDOW: GType = gtk_offscreen_window_get_type()

@inline(__always) public func GTK_OFFSCREEN_WINDOW(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkOffscreenWindow>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_OFFSCREEN_WINDOW)
}

/// GtkOffscreenWindow is strictly intended to be used for obtaining
/// snapshots of widgets that are not part of a normal widget hierarchy.
/// Since #GtkOffscreenWindow is a toplevel widget you cannot obtain
/// snapshots of a full window with it since you cannot pack a toplevel
/// widget in another toplevel.
/// The idea is to take a widget and manually set the state of it,
/// add it to a GtkOffscreenWindow and then retrieve the snapshot
/// as a #cairo_surface_t or #GdkPixbuf.
/// GtkOffscreenWindow derives from #GtkWindow only as an implementation
/// detail.  Applications should not use any API specific to #GtkWindow
/// to operate on this object.  It should be treated as a #GtkBin that
/// has no parent widget.
/// When contained offscreen widgets are redrawn, GtkOffscreenWindow
/// will emit a #GtkWidget::damage-event signal.


open class CGTKOffscreenWindow : CGTKWindow {
	/// Creates a toplevel container widget that is used to retrieve
	/// snapshots of widgets without showing them on the screen.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_offscreen_window_new())!
	}

	open var OFFSCREENWINDOW: UnsafeMutablePointer<GtkOffscreenWindow>! {
		get {
			return GTK_OFFSCREEN_WINDOW(self.GOBJECT)
		}
	}

	/// Retrieves a snapshot of the contained widget in the form of
	/// a #GdkPixbuf.  This is a new pixbuf with a reference count of 1,
	/// and the application should unreference it once it is no longer
	/// needed.
	/// - Returns: OpaquePointer? (GdkPixbuf*)
	open func getPixbuf() -> OpaquePointer? {
		return gtk_offscreen_window_get_pixbuf(GTK_OFFSCREEN_WINDOW(self.GOBJECT))
	}

	/// Retrieves a snapshot of the contained widget in the form of
	/// a #cairo_surface_t.  If you need to keep this around over window
	/// resizes then you should add a reference to it.
	/// - Returns: OpaquePointer? (cairo_surface_t*)
	open func getSurface() -> OpaquePointer? {
		return gtk_offscreen_window_get_surface(GTK_OFFSCREEN_WINDOW(self.GOBJECT))
	}

}
