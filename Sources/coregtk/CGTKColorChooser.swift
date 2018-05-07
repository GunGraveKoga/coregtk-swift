/*
 * CGTKColorChooser.swift
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

public let GTK_TYPE_COLOR_CHOOSER: GType = gtk_color_chooser_get_type()

@inline(__always) public func GTK_COLOR_CHOOSER(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_COLOR_CHOOSER)
}

/// #GtkColorChooser is an interface that is implemented by widgets
/// for choosing colors. Depending on the situation, colors may be
/// allowed to have alpha (translucency).
/// In GTK+, the main widgets that implement this interface are
/// #GtkColorChooserWidget, #GtkColorChooserDialog and #GtkColorButton.


public protocol CGTKColorChooser: class {
	/// Adds a palette to the color chooser. If @orientation is horizontal,
	/// the colors are grouped in rows, with @colors_per_line colors
	/// in each row. If @horizontal is %FALSE, the colors are grouped
	/// in columns instead.
	/// The default color palette of #GtkColorChooserWidget has
	/// 27 colors, organized in columns of 3 colors. The default gray
	/// palette has 9 grays in a single row.
	/// The layout of the color chooser widget works best when the
	/// palettes have 9-10 columns.
	/// Calling this function for the first time has the
	/// side effect of removing the default color and gray palettes
	/// from the color chooser.
	/// If @colors is %NULL, removes all previously added palettes.
	/// - Parameters:
	///	- orientation: GtkOrientation (GtkOrientation)
	///	- colorsPerLine: gint (gint)
	///	- ncolors: gint (gint)
	///	- colors: UnsafeMutablePointer<GdkRGBA>? (GdkRGBA*)
	func addPalette(orientation: GtkOrientation, colorsPerLine: gint, ncolors: gint, colors: UnsafeMutablePointer<GdkRGBA>?) -> Swift.Void

	/// Gets the currently-selected color.
	/// - Parameters:
	///	- color: UnsafeMutablePointer<GdkRGBA>! (GdkRGBA*)
	func getRgba(color: UnsafeMutablePointer<GdkRGBA>!) -> Swift.Void

	/// Returns whether the color chooser shows the alpha channel.
	/// - Returns: Bool (gboolean)
	func getUseAlpha() -> Bool

	/// Sets the color.
	/// - Parameters:
	///	- color: UnsafePointer<GdkRGBA>! (const GdkRGBA*)
	func setRgba(color: UnsafePointer<GdkRGBA>!) -> Swift.Void

	/// Sets whether or not the color chooser should use the alpha channel.
	/// - Parameters:
	///	- useAlpha: Bool (gboolean)
	func setUseAlpha(_ useAlpha: Bool) -> Swift.Void

}
