/*
 * CGTKVButtonBox.swift
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

public let GTK_TYPE_VBUTTON_BOX: GType = gtk_vbutton_box_get_type()

@inline(__always) public func GTK_VBUTTON_BOX(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkVButtonBox>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_VBUTTON_BOX)
}

open class CGTKVButtonBox : CGTKButtonBox {
	/// 
	/// Creates a new vertical button box.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_vbutton_box_new())!
	}

	open var VBUTTONBOX: UnsafeMutablePointer<GtkVButtonBox>! {
		get {
			return GTK_VBUTTON_BOX(self.GOBJECT)
		}
	}

}
