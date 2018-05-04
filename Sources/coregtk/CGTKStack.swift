/*
 * CGTKStack.swift
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

public let GTK_TYPE_STACK: GType = gtk_stack_get_type()

@inline(__always) public func GTK_STACK(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkStack>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_STACK)
}

/// 
/// The GtkStack widget is a container which only shows
/// one of its children at a time. In contrast to GtkNotebook,
/// GtkStack does not provide a means for users to change the
/// visible child. Instead, the #GtkStackSwitcher widget can be
/// used with GtkStack to provide this functionality.
/// Transitions between pages can be animated as slides or
/// fades. This can be controlled with gtk_stack_set_transition_type().
/// These animations respect the #GtkSettings:gtk-enable-animations
/// setting.
/// The GtkStack widget was added in GTK+ 3.10.
/// # CSS nodes
/// GtkStack has a single CSS node named stack.


open class CGTKStack : CGTKContainer {
	/// 
	/// Creates a new #GtkStack container.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_stack_new())!
	}

	open var STACK: UnsafeMutablePointer<GtkStack>! {
		get {
			return GTK_STACK(self.GOBJECT)
		}
	}

	/// 
	/// Adds a child to @stack.
	/// The child is identified by the @name.
	/// Parameters:
	///	- child: CGTKWidget
	///	- name: String
	open func addNamed(child: CGTKWidget, name: String) {
		gtk_stack_add_named(GTK_STACK(self.GOBJECT), child.WIDGET, name)
	}

	/// 
	/// Adds a child to @stack.
	/// The child is identified by the @name. The @title
	/// will be used by #GtkStackSwitcher to represent
	/// @child in a tab bar, so it should be short.
	/// Parameters:
	///	- child: CGTKWidget
	///	- name: String
	///	- title: String
	open func addTitled(child: CGTKWidget, name: String, title: String) {
		gtk_stack_add_titled(GTK_STACK(self.GOBJECT), child.WIDGET, name, title)
	}

	/// 
	/// Finds the child of the #GtkStack with the name given as
	/// the argument. Returns %NULL if there is no child with this
	/// name.
	/// Parameters:
	///	- name: String
	/// - Returns: CGTKWidget?
	open func getChildByName<T>(_ name: String) -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_stack_get_child_by_name(GTK_STACK(self.GOBJECT), name))
	}

	/// 
	/// Gets whether @stack is horizontally homogeneous.
	/// See gtk_stack_set_hhomogeneous().
	/// - Returns: Bool
	open func getHhomogeneous() -> Bool {
		return gtk_stack_get_hhomogeneous(GTK_STACK(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets whether @stack is homogeneous.
	/// See gtk_stack_set_homogeneous().
	/// - Returns: Bool
	open func getHomogeneous() -> Bool {
		return gtk_stack_get_homogeneous(GTK_STACK(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns wether the #GtkStack is set up to interpolate between
	/// the sizes of children on page switch.
	/// - Returns: Bool
	open func getInterpolateSize() -> Bool {
		return gtk_stack_get_interpolate_size(GTK_STACK(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the amount of time (in milliseconds) that
	/// transitions between pages in @stack will take.
	/// - Returns: guint
	open func getTransitionDuration() -> guint {
		return gtk_stack_get_transition_duration(GTK_STACK(self.GOBJECT))
	}

	/// 
	/// Returns whether the @stack is currently in a transition from one page to
	/// another.
	/// - Returns: Bool
	open func getTransitionRunning() -> Bool {
		return gtk_stack_get_transition_running(GTK_STACK(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the type of animation that will be used
	/// for transitions between pages in @stack.
	/// - Returns: GtkStackTransitionType
	open func getTransitionType() -> GtkStackTransitionType {
		return gtk_stack_get_transition_type(GTK_STACK(self.GOBJECT))
	}

	/// 
	/// Gets whether @stack is vertically homogeneous.
	/// See gtk_stack_set_vhomogeneous().
	/// - Returns: Bool
	open func getVhomogeneous() -> Bool {
		return gtk_stack_get_vhomogeneous(GTK_STACK(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the currently visible child of @stack, or %NULL if
	/// there are no visible children.
	/// - Returns: CGTKWidget?
	open func getVisibleChild<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_stack_get_visible_child(GTK_STACK(self.GOBJECT)))
	}

	/// 
	/// Returns the name of the currently visible child of @stack, or
	/// %NULL if there is no visible child.
	/// - Returns: String?
	open func getVisibleChildName() -> String? {
		return String(utf8String: gtk_stack_get_visible_child_name(GTK_STACK(self.GOBJECT)))
	}

	/// 
	/// Sets the #GtkStack to be horizontally homogeneous or not.
	/// If it is homogeneous, the #GtkStack will request the same
	/// width for all its children. If it isn't, the stack
	/// may change width when a different child becomes visible.
	/// Parameters:
	///	- hhomogeneous: Bool
	open func setHhomogeneous(_ hhomogeneous: Bool) {
		gtk_stack_set_hhomogeneous(GTK_STACK(self.GOBJECT), hhomogeneous ? 1 : 0)
	}

	/// 
	/// Sets the #GtkStack to be homogeneous or not. If it
	/// is homogeneous, the #GtkStack will request the same
	/// size for all its children. If it isn't, the stack
	/// may change size when a different child becomes visible.
	/// Since 3.16, homogeneity can be controlled separately
	/// for horizontal and vertical size, with the
	/// #GtkStack:hhomogeneous and #GtkStack:vhomogeneous.
	/// Parameters:
	///	- homogeneous: Bool
	open func setHomogeneous(_ homogeneous: Bool) {
		gtk_stack_set_homogeneous(GTK_STACK(self.GOBJECT), homogeneous ? 1 : 0)
	}

	/// 
	/// Sets whether or not @stack will interpolate its size when
	/// changing the visible child. If the #GtkStack:interpolate-size
	/// property is set to %TRUE, @stack will interpolate its size between
	/// the current one and the one it'll take after changing the
	/// visible child, according to the set transition duration.
	/// Parameters:
	///	- interpolateSize: Bool
	open func setInterpolateSize(_ interpolateSize: Bool) {
		gtk_stack_set_interpolate_size(GTK_STACK(self.GOBJECT), interpolateSize ? 1 : 0)
	}

	/// 
	/// Sets the duration that transitions between pages in @stack
	/// will take.
	/// Parameters:
	///	- duration: guint
	open func setTransitionDuration(_ duration: guint) {
		gtk_stack_set_transition_duration(GTK_STACK(self.GOBJECT), duration)
	}

	/// 
	/// Sets the type of animation that will be used for
	/// transitions between pages in @stack. Available
	/// types include various kinds of fades and slides.
	/// The transition type can be changed without problems
	/// at runtime, so it is possible to change the animation
	/// based on the page that is about to become current.
	/// Parameters:
	///	- transition: GtkStackTransitionType
	open func setTransitionType(transition: GtkStackTransitionType) {
		gtk_stack_set_transition_type(GTK_STACK(self.GOBJECT), transition)
	}

	/// 
	/// Sets the #GtkStack to be vertically homogeneous or not.
	/// If it is homogeneous, the #GtkStack will request the same
	/// height for all its children. If it isn't, the stack
	/// may change height when a different child becomes visible.
	/// Parameters:
	///	- vhomogeneous: Bool
	open func setVhomogeneous(_ vhomogeneous: Bool) {
		gtk_stack_set_vhomogeneous(GTK_STACK(self.GOBJECT), vhomogeneous ? 1 : 0)
	}

	/// 
	/// Makes @child the visible child of @stack.
	/// If @child is different from the currently
	/// visible child, the transition between the
	/// two will be animated with the current
	/// transition type of @stack.
	/// Note that the @child widget has to be visible itself
	/// (see gtk_widget_show()) in order to become the visible
	/// child of @stack.
	/// Parameters:
	///	- child: CGTKWidget
	open func setVisibleChild(_ child: CGTKWidget) {
		gtk_stack_set_visible_child(GTK_STACK(self.GOBJECT), child.WIDGET)
	}

	/// 
	/// Makes the child with the given name visible.
	/// Note that the child widget has to be visible itself
	/// (see gtk_widget_show()) in order to become the visible
	/// child of @stack.
	/// Parameters:
	///	- name: String
	///	- transition: GtkStackTransitionType
	open func setVisibleChildFull(name: String, transition: GtkStackTransitionType) {
		gtk_stack_set_visible_child_full(GTK_STACK(self.GOBJECT), name, transition)
	}

	/// 
	/// Makes the child with the given name visible.
	/// If @child is different from the currently
	/// visible child, the transition between the
	/// two will be animated with the current
	/// transition type of @stack.
	/// Note that the child widget has to be visible itself
	/// (see gtk_widget_show()) in order to become the visible
	/// child of @stack.
	/// Parameters:
	///	- name: String
	open func setVisibleChildName(_ name: String) {
		gtk_stack_set_visible_child_name(GTK_STACK(self.GOBJECT), name)
	}

}
