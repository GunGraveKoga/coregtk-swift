/*
 * CGTKSpinner.swift
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

public let GTK_TYPE_SPINNER: GType = gtk_spinner_get_type()

@inline(__always) public func GTK_SPINNER(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkSpinner>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SPINNER)
}

/// 
/// A GtkSpinner widget displays an icon-size spinning animation.
/// It is often used as an alternative to a #GtkProgressBar for
/// displaying indefinite activity, instead of actual progress.
/// To start the animation, use gtk_spinner_start(), to stop it
/// use gtk_spinner_stop().
/// # CSS nodes
/// GtkSpinner has a single CSS node with the name spinner. When the animation is
/// active, the :checked pseudoclass is added to this node.


open class CGTKSpinner : CGTKWidget {
	/// 
	/// Returns a new spinner widget. Not yet started.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_spinner_new())!
	}

	open var SPINNER: UnsafeMutablePointer<GtkSpinner>! {
		get {
			return GTK_SPINNER(self.GOBJECT)
		}
	}

	/// 
	/// Starts the animation of the spinner.
	open func start() {
		gtk_spinner_start(GTK_SPINNER(self.GOBJECT))
	}

	/// 
	/// Stops the animation of the spinner.
	open func stop() {
		gtk_spinner_stop(GTK_SPINNER(self.GOBJECT))
	}

}
