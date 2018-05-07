/*
 * CGTKOverlay.swift
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

public let GTK_TYPE_OVERLAY: GType = gtk_overlay_get_type()

@inline(__always) public func GTK_OVERLAY(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkOverlay>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_OVERLAY)
}

/// GtkOverlay is a container which contains a single main child, on top
/// of which it can place “overlay” widgets. The position of each overlay
/// widget is determined by its #GtkWidget:halign and #GtkWidget:valign
/// properties. E.g. a widget with both alignments set to %GTK_ALIGN_START
/// will be placed at the top left corner of the GtkOverlay container,
/// whereas an overlay with halign set to %GTK_ALIGN_CENTER and valign set
/// to %GTK_ALIGN_END will be placed a the bottom edge of the GtkOverlay,
/// horizontally centered. The position can be adjusted by setting the margin
/// properties of the child to non-zero values.
/// More complicated placement of overlays is possible by connecting
/// to the #GtkOverlay::get-child-position signal.
/// # GtkOverlay as GtkBuildable
/// The GtkOverlay implementation of the GtkBuildable interface
/// supports placing a child as an overlay by specifying “overlay” as
/// the “type” attribute of a `<child>` element.
/// # CSS nodes
/// GtkOverlay has a single CSS node with the name “overlay”. Overlay children
/// whose alignments cause them to be positioned at an edge get the style classes
/// “.left”, “.right”, “.top”, and/or “.bottom” according to their position.


open class CGTKOverlay : CGTKBin {
	/// Creates a new #GtkOverlay.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_overlay_new())!
	}

	open var OVERLAY: UnsafeMutablePointer<GtkOverlay>! {
		get {
			return GTK_OVERLAY(self.GOBJECT)
		}
	}

	/// Adds @widget to @overlay.
	/// The widget will be stacked on top of the main widget
	/// added with gtk_container_add().
	/// The position at which @widget is placed is determined
	/// from its #GtkWidget:halign and #GtkWidget:valign properties.
	/// - Parameters:
	///	- widget: CGTKWidget (GtkWidget*)
	open func addOverlay(widget: CGTKWidget) -> Swift.Void {
		gtk_overlay_add_overlay(GTK_OVERLAY(self.GOBJECT), widget.WIDGET)
	}

	/// Convenience function to get the value of the #GtkOverlay:pass-through
	/// child property for @widget.
	/// - Parameters:
	///	- widget: CGTKWidget (GtkWidget*)
	/// - Returns: Bool (gboolean)
	open func getOverlayPassThrough(widget: CGTKWidget) -> Bool {
		return gtk_overlay_get_overlay_pass_through(GTK_OVERLAY(self.GOBJECT), widget.WIDGET) != 0 ? true : false
	}

	/// Moves @child to a new @index in the list of @overlay children.
	/// The list contains overlays in the order that these were
	/// added to @overlay.
	/// A widget’s index in the @overlay children list determines which order
	/// the children are drawn if they overlap. The first child is drawn at
	/// the bottom. It also affects the default focus chain order.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- position: gint (gint)
	open func reorderOverlay(child: CGTKWidget, position: gint) -> Swift.Void {
		gtk_overlay_reorder_overlay(GTK_OVERLAY(self.GOBJECT), child.WIDGET, position)
	}

	/// Convenience function to set the value of the #GtkOverlay:pass-through
	/// child property for @widget.
	/// - Parameters:
	///	- widget: CGTKWidget (GtkWidget*)
	///	- passThrough: Bool (gboolean)
	open func setOverlayPassThrough(widget: CGTKWidget, passThrough: Bool) -> Swift.Void {
		gtk_overlay_set_overlay_pass_through(GTK_OVERLAY(self.GOBJECT), widget.WIDGET, passThrough ? 1 : 0)
	}

}
