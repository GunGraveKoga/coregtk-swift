/*
 * CGTKViewport.swift
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

public let GTK_TYPE_VIEWPORT: GType = gtk_viewport_get_type()

@inline(__always) public func GTK_VIEWPORT(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkViewport>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_VIEWPORT)
}

/// 
/// The #GtkViewport widget acts as an adaptor class, implementing
/// scrollability for child widgets that lack their own scrolling
/// capabilities. Use GtkViewport to scroll child widgets such as
/// #GtkGrid, #GtkBox, and so on.
/// If a widget has native scrolling abilities, such as #GtkTextView,
/// #GtkTreeView or #GtkIconView, it can be added to a #GtkScrolledWindow
/// with gtk_container_add(). If a widget does not, you must first add the
/// widget to a #GtkViewport, then add the viewport to the scrolled window.
/// gtk_container_add() does this automatically if a child that does not
/// implement #GtkScrollable is added to a #GtkScrolledWindow, so you can
/// ignore the presence of the viewport.
/// The GtkViewport will start scrolling content only if allocated less
/// than the child widget’s minimum size in a given orientation.
/// # CSS nodes
/// GtkViewport has a single CSS node with name viewport.


open class CGTKViewport : CGTKBin {
	/// 
	/// Creates a new #GtkViewport with the given adjustments, or with default
	/// adjustments if none are given.
	/// Parameters:
	///	- hadjustment: UnsafeMutablePointer<GtkAdjustment>?
	///	- vadjustment: UnsafeMutablePointer<GtkAdjustment>?
	/// - Returns: CGTKWidget
	public convenience init(hadjustment: UnsafeMutablePointer<GtkAdjustment>?, vadjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		self.init(withGObject: gtk_viewport_new(hadjustment, vadjustment))!
	}

	open var VIEWPORT: UnsafeMutablePointer<GtkViewport>! {
		get {
			return GTK_VIEWPORT(self.GOBJECT)
		}
	}

	/// 
	/// Gets the bin window of the #GtkViewport.
	/// - Returns: OpaquePointer
	open func getBinWindow() -> OpaquePointer {
		return gtk_viewport_get_bin_window(GTK_VIEWPORT(self.GOBJECT))
	}

	/// 
	/// Returns the horizontal adjustment of the viewport.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>!
	open func getHadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_viewport_get_hadjustment(GTK_VIEWPORT(self.GOBJECT))
	}

	/// 
	/// Gets the shadow type of the #GtkViewport. See
	/// gtk_viewport_set_shadow_type().
	/// - Returns: GtkShadowType
	open func getShadowType() -> GtkShadowType {
		return gtk_viewport_get_shadow_type(GTK_VIEWPORT(self.GOBJECT))
	}

	/// 
	/// Returns the vertical adjustment of the viewport.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>!
	open func getVadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_viewport_get_vadjustment(GTK_VIEWPORT(self.GOBJECT))
	}

	/// 
	/// Gets the view window of the #GtkViewport.
	/// - Returns: OpaquePointer
	open func getViewWindow() -> OpaquePointer {
		return gtk_viewport_get_view_window(GTK_VIEWPORT(self.GOBJECT))
	}

	/// 
	/// Sets the horizontal adjustment of the viewport.
	/// Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>?
	open func setHadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		gtk_viewport_set_hadjustment(GTK_VIEWPORT(self.GOBJECT), adjustment)
	}

	/// 
	/// Sets the shadow type of the viewport.
	/// Parameters:
	///	- type: GtkShadowType
	open func setShadowType(_ type: GtkShadowType) {
		gtk_viewport_set_shadow_type(GTK_VIEWPORT(self.GOBJECT), type)
	}

	/// 
	/// Sets the vertical adjustment of the viewport.
	/// Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>?
	open func setVadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		gtk_viewport_set_vadjustment(GTK_VIEWPORT(self.GOBJECT), adjustment)
	}

}
