/*
 * CGTKHandleBox.swift
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

public let GTK_TYPE_HANDLE_BOX: GType = gtk_handle_box_get_type()

@inline(__always) public func GTK_HANDLE_BOX(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkHandleBox>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_HANDLE_BOX)
}

/// The #GtkHandleBox widget allows a portion of a window to be "torn
/// off". It is a bin widget which displays its child and a handle that
/// the user can drag to tear off a separate window (the “float
/// window”) containing the child widget. A thin
/// “ghost” is drawn in the original location of the
/// handlebox. By dragging the separate window back to its original
/// location, it can be reattached.
/// When reattaching, the ghost and float window, must be aligned
/// along one of the edges, the “snap edge”.
/// This either can be specified by the application programmer
/// explicitly, or GTK+ will pick a reasonable default based
/// on the handle position.
/// To make detaching and reattaching the handlebox as minimally confusing
/// as possible to the user, it is important to set the snap edge so that
/// the snap edge does not move when the handlebox is deattached. For
/// instance, if the handlebox is packed at the bottom of a VBox, then
/// when the handlebox is detached, the bottom edge of the handlebox's
/// allocation will remain fixed as the height of the handlebox shrinks,
/// so the snap edge should be set to %GTK_POS_BOTTOM.
/// > #GtkHandleBox has been deprecated. It is very specialized, lacks features
/// > to make it useful and most importantly does not fit well into modern
/// > application design. Do not use it. There is no replacement.


open class CGTKHandleBox : CGTKBin {
	/// Create a new handle box.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_handle_box_new())!
	}

	open var HANDLEBOX: UnsafeMutablePointer<GtkHandleBox>! {
		get {
			return GTK_HANDLE_BOX(self.GOBJECT)
		}
	}

	/// Whether the handlebox’s child is currently detached.
	/// - Returns: Bool (gboolean)
	open func getChildDetached() -> Bool {
		return gtk_handle_box_get_child_detached(GTK_HANDLE_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the handle position of the handle box. See
	/// gtk_handle_box_set_handle_position().
	/// - Returns: GtkPositionType (GtkPositionType)
	open func getHandlePosition() -> GtkPositionType {
		return gtk_handle_box_get_handle_position(GTK_HANDLE_BOX(self.GOBJECT))
	}

	/// Gets the type of shadow drawn around the handle box. See
	/// gtk_handle_box_set_shadow_type().
	/// - Returns: GtkShadowType (GtkShadowType)
	open func getShadowType() -> GtkShadowType {
		return gtk_handle_box_get_shadow_type(GTK_HANDLE_BOX(self.GOBJECT))
	}

	/// Gets the edge used for determining reattachment of the handle box.
	/// See gtk_handle_box_set_snap_edge().
	/// - Returns: GtkPositionType (GtkPositionType)
	open func getSnapEdge() -> GtkPositionType {
		return gtk_handle_box_get_snap_edge(GTK_HANDLE_BOX(self.GOBJECT))
	}

	/// Sets the side of the handlebox where the handle is drawn.
	/// - Parameters:
	///	- position: GtkPositionType (GtkPositionType)
	open func setHandlePosition(_ position: GtkPositionType) -> Swift.Void {
		gtk_handle_box_set_handle_position(GTK_HANDLE_BOX(self.GOBJECT), position)
	}

	/// Sets the type of shadow to be drawn around the border
	/// of the handle box.
	/// - Parameters:
	///	- type: GtkShadowType (GtkShadowType)
	open func setShadowType(_ type: GtkShadowType) -> Swift.Void {
		gtk_handle_box_set_shadow_type(GTK_HANDLE_BOX(self.GOBJECT), type)
	}

	/// Sets the snap edge of a handlebox. The snap edge is
	/// the edge of the detached child that must be aligned
	/// with the corresponding edge of the “ghost” left
	/// behind when the child was detached to reattach
	/// the torn-off window. Usually, the snap edge should
	/// be chosen so that it stays in the same place on
	/// the screen when the handlebox is torn off.
	/// If the snap edge is not set, then an appropriate value
	/// will be guessed from the handle position. If the
	/// handle position is %GTK_POS_RIGHT or %GTK_POS_LEFT,
	/// then the snap edge will be %GTK_POS_TOP, otherwise
	/// it will be %GTK_POS_LEFT.
	/// - Parameters:
	///	- edge: GtkPositionType (GtkPositionType)
	open func setSnapEdge(_ edge: GtkPositionType) -> Swift.Void {
		gtk_handle_box_set_snap_edge(GTK_HANDLE_BOX(self.GOBJECT), edge)
	}

}
