/*
 * CGTKRevealer.swift
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

public let GTK_TYPE_REVEALER: GType = gtk_revealer_get_type()

@inline(__always) public func GTK_REVEALER(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkRevealer>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_REVEALER)
}

/// 
/// The GtkRevealer widget is a container which animates
/// the transition of its child from invisible to visible.
/// The style of transition can be controlled with
/// gtk_revealer_set_transition_type().
/// These animations respect the #GtkSettings:gtk-enable-animations
/// setting.
/// # CSS nodes
/// GtkRevealer has a single CSS node with name revealer.
/// The GtkRevealer widget was added in GTK+ 3.10.


open class CGTKRevealer : CGTKBin {
	/// 
	/// Creates a new #GtkRevealer.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_revealer_new())!
	}

	open var REVEALER: UnsafeMutablePointer<GtkRevealer>! {
		get {
			return GTK_REVEALER(self.GOBJECT)
		}
	}

	/// 
	/// Returns whether the child is fully revealed, in other words whether
	/// the transition to the revealed state is completed.
	/// - Returns: Bool
	open func getChildRevealed() -> Bool {
		return gtk_revealer_get_child_revealed(GTK_REVEALER(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the child is currently
	/// revealed. See gtk_revealer_set_reveal_child().
	/// This function returns %TRUE as soon as the transition
	/// is to the revealed state is started. To learn whether
	/// the child is fully revealed (ie the transition is completed),
	/// use gtk_revealer_get_child_revealed().
	/// - Returns: Bool
	open func getRevealChild() -> Bool {
		return gtk_revealer_get_reveal_child(GTK_REVEALER(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the amount of time (in milliseconds) that
	/// transitions will take.
	/// - Returns: guint
	open func getTransitionDuration() -> guint {
		return gtk_revealer_get_transition_duration(GTK_REVEALER(self.GOBJECT))
	}

	/// 
	/// Gets the type of animation that will be used
	/// for transitions in @revealer.
	/// - Returns: GtkRevealerTransitionType
	open func getTransitionType() -> GtkRevealerTransitionType {
		return gtk_revealer_get_transition_type(GTK_REVEALER(self.GOBJECT))
	}

	/// 
	/// Tells the #GtkRevealer to reveal or conceal its child.
	/// The transition will be animated with the current
	/// transition type of @revealer.
	/// Parameters:
	///	- revealChild: Bool
	open func setRevealChild(_ revealChild: Bool) {
		gtk_revealer_set_reveal_child(GTK_REVEALER(self.GOBJECT), revealChild ? 1 : 0)
	}

	/// 
	/// Sets the duration that transitions will take.
	/// Parameters:
	///	- duration: guint
	open func setTransitionDuration(_ duration: guint) {
		gtk_revealer_set_transition_duration(GTK_REVEALER(self.GOBJECT), duration)
	}

	/// 
	/// Sets the type of animation that will be used for
	/// transitions in @revealer. Available types include
	/// various kinds of fades and slides.
	/// Parameters:
	///	- transition: GtkRevealerTransitionType
	open func setTransitionType(transition: GtkRevealerTransitionType) {
		gtk_revealer_set_transition_type(GTK_REVEALER(self.GOBJECT), transition)
	}

}
