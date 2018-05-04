/*
 * CGTKAspectFrame.swift
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

public let GTK_TYPE_ASPECT_FRAME: GType = gtk_aspect_frame_get_type()

@inline(__always) public func GTK_ASPECT_FRAME(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkAspectFrame>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_ASPECT_FRAME)
}

/// 
/// The #GtkAspectFrame is useful when you want
/// pack a widget so that it can resize but always retains
/// the same aspect ratio. For instance, one might be
/// drawing a small preview of a larger image. #GtkAspectFrame
/// derives from #GtkFrame, so it can draw a label and
/// a frame around the child. The frame will be
/// “shrink-wrapped” to the size of the child.
/// # CSS nodes
/// GtkAspectFrame uses a CSS node with name frame.


open class CGTKAspectFrame : CGTKFrame {
	/// 
	/// Create a new #GtkAspectFrame.
	/// Parameters:
	///	- label: String
	///	- xalign: Float
	///	- yalign: Float
	///	- ratio: Float
	///	- obeyChild: Bool
	/// - Returns: CGTKWidget
	public convenience init(label: String, xalign: Float, yalign: Float, ratio: Float, obeyChild: Bool) {
		self.init(withGObject: gtk_aspect_frame_new(label, xalign, yalign, ratio, obeyChild ? 1 : 0))!
	}

	open var ASPECTFRAME: UnsafeMutablePointer<GtkAspectFrame>! {
		get {
			return GTK_ASPECT_FRAME(self.GOBJECT)
		}
	}

	/// 
	/// Set parameters for an existing #GtkAspectFrame.
	/// Parameters:
	///	- xalign: Float
	///	- yalign: Float
	///	- ratio: Float
	///	- obeyChild: Bool
	open func set(xalign: Float, yalign: Float, ratio: Float, obeyChild: Bool) {
		gtk_aspect_frame_set(GTK_ASPECT_FRAME(self.GOBJECT), xalign, yalign, ratio, obeyChild ? 1 : 0)
	}

}
