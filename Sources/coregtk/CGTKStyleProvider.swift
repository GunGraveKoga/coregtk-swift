/*
 * CGTKStyleProvider.swift
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

public let GTK_TYPE_STYLE_PROVIDER: GType = gtk_style_provider_get_type()

@inline(__always) public func GTK_STYLE_PROVIDER(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_STYLE_PROVIDER)
}

/// GtkStyleProvider is an interface used to provide style information to a #GtkStyleContext.
/// See gtk_style_context_add_provider() and gtk_style_context_add_provider_for_screen().


public protocol CGTKStyleProvider: class {
	/// Returns the #GtkIconFactory defined to be in use for @path, or %NULL if none
	/// is defined.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkWidgetPath*)
	/// - Returns: UnsafeMutablePointer<GtkIconFactory>? (GtkIconFactory*)
	func getIconFactory(path: OpaquePointer!) -> UnsafeMutablePointer<GtkIconFactory>?

	/// Returns the style settings affecting a widget defined by @path, or %NULL if
	/// @provider doesn’t contemplate styling @path.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkWidgetPath*)
	/// - Returns: UnsafeMutablePointer<GtkStyleProperties>? (GtkStyleProperties*)
	func getStyle(path: OpaquePointer!) -> UnsafeMutablePointer<GtkStyleProperties>?

	/// Looks up a widget style property as defined by @provider for
	/// the widget represented by @path.
	/// - Parameters:
	///	- path: OpaquePointer! (GtkWidgetPath*)
	///	- state: GtkStateFlags (GtkStateFlags)
	///	- pspec: UnsafeMutablePointer<GParamSpec>! (GParamSpec*)
	///	- value: UnsafeMutablePointer<GValue>! (GValue*)
	/// - Returns: Bool (gboolean)
	func getStyleProperty(path: OpaquePointer!, state: GtkStateFlags, pspec: UnsafeMutablePointer<GParamSpec>!, value: UnsafeMutablePointer<GValue>!) -> Bool

}
