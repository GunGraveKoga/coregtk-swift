/*
 * CGTKLockButton.swift
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

public let GTK_TYPE_LOCK_BUTTON: GType = gtk_lock_button_get_type()

@inline(__always) public func GTK_LOCK_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkLockButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_LOCK_BUTTON)
}

/// GtkLockButton is a widget that can be used in control panels or
/// preference dialogs to allow users to obtain and revoke authorizations
/// needed to operate the controls. The required authorization is represented
/// by a #GPermission object. Concrete implementations of #GPermission may use
/// PolicyKit or some other authorization framework. To obtain a PolicyKit-based
/// #GPermission, use polkit_permission_new().
/// If the user is not currently allowed to perform the action, but can obtain
/// the permission, the widget looks like this:
/// ![](lockbutton-locked.png)
/// and the user can click the button to request the permission. Depending
/// on the platform, this may pop up an authentication dialog or ask the user
/// to authenticate in some other way. Once the user has obtained the permission,
/// the widget changes to this:
/// ![](lockbutton-unlocked.png)
/// and the permission can be dropped again by clicking the button. If the user
/// is not able to obtain the permission at all, the widget looks like this:
/// ![](lockbutton-sorry.png)
/// If the user has the permission and cannot drop it, the button is hidden.
/// The text (and tooltips) that are shown in the various cases can be adjusted
/// with the #GtkLockButton:text-lock, #GtkLockButton:text-unlock,
/// #GtkLockButton:tooltip-lock, #GtkLockButton:tooltip-unlock and
/// #GtkLockButton:tooltip-not-authorized properties.


open class CGTKLockButton : CGTKButton {
	/// Creates a new lock button which reflects the @permission.
	/// - Parameters:
	///	- permission: UnsafeMutablePointer<GPermission>? (GPermission*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(permission: UnsafeMutablePointer<GPermission>?) {
		self.init(withGObject: gtk_lock_button_new(permission))!
	}

	open var LOCKBUTTON: UnsafeMutablePointer<GtkLockButton>! {
		get {
			return GTK_LOCK_BUTTON(self.GOBJECT)
		}
	}

	/// Obtains the #GPermission object that controls @button.
	/// - Returns: UnsafeMutablePointer<GPermission>! (GPermission*)
	open func getPermission() -> UnsafeMutablePointer<GPermission>! {
		return gtk_lock_button_get_permission(GTK_LOCK_BUTTON(self.GOBJECT))
	}

	/// Sets the #GPermission object that controls @button.
	/// - Parameters:
	///	- permission: UnsafeMutablePointer<GPermission>? (GPermission*)
	open func setPermission(_ permission: UnsafeMutablePointer<GPermission>?) -> Swift.Void {
		gtk_lock_button_set_permission(GTK_LOCK_BUTTON(self.GOBJECT), permission)
	}

}
