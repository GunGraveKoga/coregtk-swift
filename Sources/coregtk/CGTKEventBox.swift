/*
 * CGTKEventBox.swift
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

public let GTK_TYPE_EVENT_BOX: GType = gtk_event_box_get_type()

@inline(__always) public func GTK_EVENT_BOX(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkEventBox>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_EVENT_BOX)
}

/// The #GtkEventBox widget is a subclass of #GtkBin which also has its
/// own window. It is useful since it allows you to catch events for widgets
/// which do not have their own window.


open class CGTKEventBox : CGTKBin {
	/// Creates a new #GtkEventBox.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_event_box_new())!
	}

	open var EVENTBOX: UnsafeMutablePointer<GtkEventBox>! {
		get {
			return GTK_EVENT_BOX(self.GOBJECT)
		}
	}

	/// Returns whether the event box window is above or below the
	/// windows of its child. See gtk_event_box_set_above_child()
	/// for details.
	/// - Returns: Bool (gboolean)
	open func getAboveChild() -> Bool {
		return gtk_event_box_get_above_child(GTK_EVENT_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the event box has a visible window.
	/// See gtk_event_box_set_visible_window() for details.
	/// - Returns: Bool (gboolean)
	open func getVisibleWindow() -> Bool {
		return gtk_event_box_get_visible_window(GTK_EVENT_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// Set whether the event box window is positioned above the windows
	/// of its child, as opposed to below it. If the window is above, all
	/// events inside the event box will go to the event box. If the window
	/// is below, events in windows of child widgets will first got to that
	/// widget, and then to its parents.
	/// The default is to keep the window below the child.
	/// - Parameters:
	///	- aboveChild: Bool (gboolean)
	open func setAboveChild(_ aboveChild: Bool) -> Swift.Void {
		gtk_event_box_set_above_child(GTK_EVENT_BOX(self.GOBJECT), aboveChild ? 1 : 0)
	}

	/// Set whether the event box uses a visible or invisible child
	/// window. The default is to use visible windows.
	/// In an invisible window event box, the window that the
	/// event box creates is a %GDK_INPUT_ONLY window, which
	/// means that it is invisible and only serves to receive
	/// events.
	/// A visible window event box creates a visible (%GDK_INPUT_OUTPUT)
	/// window that acts as the parent window for all the widgets
	/// contained in the event box.
	/// You should generally make your event box invisible if
	/// you just want to trap events. Creating a visible window
	/// may cause artifacts that are visible to the user, especially
	/// if the user is using a theme with gradients or pixmaps.
	/// The main reason to create a non input-only event box is if
	/// you want to set the background to a different color or
	/// draw on it.
	/// There is one unexpected issue for an invisible event box that has its
	/// window below the child. (See gtk_event_box_set_above_child().)
	/// Since the input-only window is not an ancestor window of any windows
	/// that descendent widgets of the event box create, events on these
	/// windows aren’t propagated up by the windowing system, but only by GTK+.
	/// The practical effect of this is if an event isn’t in the event
	/// mask for the descendant window (see gtk_widget_add_events()),
	/// it won’t be received by the event box.
	/// This problem doesn’t occur for visible event boxes, because in
	/// that case, the event box window is actually the ancestor of the
	/// descendant windows, not just at the same place on the screen.
	/// - Parameters:
	///	- visibleWindow: Bool (gboolean)
	open func setVisibleWindow(_ visibleWindow: Bool) -> Swift.Void {
		gtk_event_box_set_visible_window(GTK_EVENT_BOX(self.GOBJECT), visibleWindow ? 1 : 0)
	}

}
