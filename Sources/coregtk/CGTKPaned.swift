/*
 * CGTKPaned.swift
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

public let GTK_TYPE_PANED: GType = gtk_paned_get_type()

@inline(__always) public func GTK_PANED(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkPaned>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_PANED)
}

/// #GtkPaned has two panes, arranged either
/// horizontally or vertically. The division between
/// the two panes is adjustable by the user by dragging
/// a handle.
/// Child widgets are
/// added to the panes of the widget with gtk_paned_pack1() and
/// gtk_paned_pack2(). The division between the two children is set by default
/// from the size requests of the children, but it can be adjusted by the
/// user.
/// A paned widget draws a separator between the two child widgets and a
/// small handle that the user can drag to adjust the division. It does not
/// draw any relief around the children or around the separator. (The space
/// in which the separator is called the gutter.) Often, it is useful to put
/// each child inside a #GtkFrame with the shadow type set to %GTK_SHADOW_IN
/// so that the gutter appears as a ridge. No separator is drawn if one of
/// the children is missing.
/// Each child has two options that can be set, @resize and @shrink. If
/// @resize is true, then when the #GtkPaned is resized, that child will
/// expand or shrink along with the paned widget. If @shrink is true, then
/// that child can be made smaller than its requisition by the user.
/// Setting @shrink to %FALSE allows the application to set a minimum size.
/// If @resize is false for both children, then this is treated as if
/// @resize is true for both children.
/// The application can set the position of the slider as if it were set
/// by the user, by calling gtk_paned_set_position().
/// # CSS nodes
/// |[<!-- language="plain" -->
/// paned
/// ├── <child>
/// ├── separator[.wide]
/// ╰── <child>
/// ]|
/// GtkPaned has a main CSS node with name paned, and a subnode for
/// the separator with name separator. The subnode gets a .wide style
/// class when the paned is supposed to be wide.
/// In horizontal orientation, the nodes of the children are always arranged
/// from left to right. So :first-child will always select the leftmost child,
/// regardless of text direction.
/// ## Creating a paned widget with minimum sizes.
/// |[<!-- language="C" -->
/// GtkWidget *hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);
/// GtkWidget *frame1 = gtk_frame_new (NULL);
/// GtkWidget *frame2 = gtk_frame_new (NULL);
/// gtk_frame_set_shadow_type (GTK_FRAME (frame1), GTK_SHADOW_IN);
/// gtk_frame_set_shadow_type (GTK_FRAME (frame2), GTK_SHADOW_IN);
/// gtk_widget_set_size_request (hpaned, 200, -1);
/// gtk_paned_pack1 (GTK_PANED (hpaned), frame1, TRUE, FALSE);
/// gtk_widget_set_size_request (frame1, 50, -1);
/// gtk_paned_pack2 (GTK_PANED (hpaned), frame2, FALSE, FALSE);
/// gtk_widget_set_size_request (frame2, 50, -1);
/// ]|


open class CGTKPaned : CGTKContainer, CGTKOrientable {
	/// Creates a new #GtkPaned widget.
	/// - Parameters:
	///	- orientation: GtkOrientation (GtkOrientation)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(orientation: GtkOrientation) {
		self.init(withGObject: gtk_paned_new(orientation))!
	}

	open var PANED: UnsafeMutablePointer<GtkPaned>! {
		get {
			return GTK_PANED(self.GOBJECT)
		}
	}

	/// Adds a child to the top or left pane with default parameters. This is
	/// equivalent to
	/// `gtk_paned_pack1 (paned, child, FALSE, TRUE)`.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func add1(child: CGTKWidget) -> Swift.Void {
		gtk_paned_add1(GTK_PANED(self.GOBJECT), child.WIDGET)
	}

	/// Adds a child to the bottom or right pane with default parameters. This
	/// is equivalent to
	/// `gtk_paned_pack2 (paned, child, TRUE, TRUE)`.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func add2(child: CGTKWidget) -> Swift.Void {
		gtk_paned_add2(GTK_PANED(self.GOBJECT), child.WIDGET)
	}

	/// Obtains the first child of the paned widget.
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getChild1<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_paned_get_child1(GTK_PANED(self.GOBJECT)))
	}

	/// Obtains the second child of the paned widget.
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getChild2<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_paned_get_child2(GTK_PANED(self.GOBJECT)))
	}

	/// Returns the #GdkWindow of the handle. This function is
	/// useful when handling button or motion events because it
	/// enables the callback to distinguish between the window
	/// of the paned, a child and the handle.
	/// - Returns: OpaquePointer (GdkWindow*)
	open func getHandleWindow() -> OpaquePointer {
		return gtk_paned_get_handle_window(GTK_PANED(self.GOBJECT))
	}

	/// Obtains the position of the divider between the two panes.
	/// - Returns: gint (gint)
	open func getPosition() -> gint {
		return gtk_paned_get_position(GTK_PANED(self.GOBJECT))
	}

	/// Gets the #GtkPaned:wide-handle property.
	/// - Returns: Bool (gboolean)
	open func getWideHandle() -> Bool {
		return gtk_paned_get_wide_handle(GTK_PANED(self.GOBJECT)) != 0 ? true : false
	}

	/// Adds a child to the top or left pane.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- resize: Bool (gboolean)
	///	- shrink: Bool (gboolean)
	open func pack1(child: CGTKWidget, resize: Bool, shrink: Bool) -> Swift.Void {
		gtk_paned_pack1(GTK_PANED(self.GOBJECT), child.WIDGET, resize ? 1 : 0, shrink ? 1 : 0)
	}

	/// Adds a child to the bottom or right pane.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- resize: Bool (gboolean)
	///	- shrink: Bool (gboolean)
	open func pack2(child: CGTKWidget, resize: Bool, shrink: Bool) -> Swift.Void {
		gtk_paned_pack2(GTK_PANED(self.GOBJECT), child.WIDGET, resize ? 1 : 0, shrink ? 1 : 0)
	}

	/// Sets the position of the divider between the two panes.
	/// - Parameters:
	///	- position: gint (gint)
	open func setPosition(_ position: gint) -> Swift.Void {
		gtk_paned_set_position(GTK_PANED(self.GOBJECT), position)
	}

	/// Sets the #GtkPaned:wide-handle property.
	/// - Parameters:
	///	- wide: Bool (gboolean)
	open func setWideHandle(wide: Bool) -> Swift.Void {
		gtk_paned_set_wide_handle(GTK_PANED(self.GOBJECT), wide ? 1 : 0)
	}

	/// Retrieves the orientation of the @orientable.
	/// - Returns: GtkOrientation (GtkOrientation)
	open func getOrientation() -> GtkOrientation {
		return gtk_orientable_get_orientation(GTK_ORIENTABLE(self.GOBJECT))
	}

	/// Sets the orientation of the @orientable.
	/// - Parameters:
	///	- orientation: GtkOrientation (GtkOrientation)
	open func setOrientation(_ orientation: GtkOrientation) -> Swift.Void {
		gtk_orientable_set_orientation(GTK_ORIENTABLE(self.GOBJECT), orientation)
	}

}
