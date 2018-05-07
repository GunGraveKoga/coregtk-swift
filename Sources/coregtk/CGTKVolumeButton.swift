/*
 * CGTKVolumeButton.swift
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

public let GTK_TYPE_VOLUME_BUTTON: GType = gtk_volume_button_get_type()

@inline(__always) public func GTK_VOLUME_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkVolumeButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_VOLUME_BUTTON)
}

/// #GtkVolumeButton is a subclass of #GtkScaleButton that has
/// been tailored for use as a volume control widget with suitable
/// icons, tooltips and accessible labels.


open class CGTKVolumeButton : CGTKScaleButton {
	/// Creates a #GtkVolumeButton, with a range between 0.0 and 1.0, with
	/// a stepping of 0.02. Volume values can be obtained and modified using
	/// the functions from #GtkScaleButton.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_volume_button_new())!
	}

	open var VOLUMEBUTTON: UnsafeMutablePointer<GtkVolumeButton>! {
		get {
			return GTK_VOLUME_BUTTON(self.GOBJECT)
		}
	}

}
