/*
 * CGTKSwitch.swift
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

public let GTK_TYPE_SWITCH: GType = gtk_switch_get_type()

@inline(__always) public func GTK_SWITCH(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkSwitch>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SWITCH)
}

/// 
/// #GtkSwitch is a widget that has two states: on or off. The user can control
/// which state should be active by clicking the empty area, or by dragging the
/// handle.
/// GtkSwitch can also handle situations where the underlying state changes with
/// a delay. See #GtkSwitch::state-set for details.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// switch
/// ╰── slider
/// ]|
/// GtkSwitch has two css nodes, the main node with the name switch and a subnode
/// named slider. Neither of them is using any style classes.


open class CGTKSwitch : CGTKWidget {
	/// 
	/// Creates a new #GtkSwitch widget.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_switch_new())!
	}

	open var SWITCH: UnsafeMutablePointer<GtkSwitch>! {
		get {
			return GTK_SWITCH(self.GOBJECT)
		}
	}

	/// 
	/// Gets whether the #GtkSwitch is in its “on” or “off” state.
	/// - Returns: Bool
	open func getActive() -> Bool {
		return gtk_switch_get_active(GTK_SWITCH(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the underlying state of the #GtkSwitch.
	/// - Returns: Bool
	open func getState() -> Bool {
		return gtk_switch_get_state(GTK_SWITCH(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Changes the state of @sw to the desired one.
	/// Parameters:
	///	- isActive: Bool
	open func setActive(isActive: Bool) {
		gtk_switch_set_active(GTK_SWITCH(self.GOBJECT), isActive ? 1 : 0)
	}

	/// 
	/// Sets the underlying state of the #GtkSwitch.
	/// Normally, this is the same as #GtkSwitch:active, unless the switch
	/// is set up for delayed state changes. This function is typically
	/// called from a #GtkSwitch::state-set signal handler.
	/// See #GtkSwitch::state-set for details.
	/// Parameters:
	///	- state: Bool
	open func setState(_ state: Bool) {
		gtk_switch_set_state(GTK_SWITCH(self.GOBJECT), state ? 1 : 0)
	}

}
