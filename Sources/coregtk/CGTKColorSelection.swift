/*
 * CGTKColorSelection.swift
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

public let GTK_TYPE_COLOR_SELECTION: GType = gtk_color_selection_get_type()

@inline(__always) public func GTK_COLOR_SELECTION(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkColorSelection>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_COLOR_SELECTION)
}

open class CGTKColorSelection : CGTKBox {
	/// 
	/// Parses a color palette string; the string is a colon-separated
	/// list of color names readable by gdk_color_parse().
	/// Parameters:
	///	- str: String
	///	- colors: UnsafeMutablePointer<UnsafeMutablePointer<GdkColor>?>!
	///	- ncolors: UnsafeMutablePointer<Int32>!
	/// - Returns: Bool
	open class func paletteFromString(str: String, colors: UnsafeMutablePointer<UnsafeMutablePointer<GdkColor>?>!, ncolors: UnsafeMutablePointer<Int32>!) -> Bool {
		return gtk_color_selection_palette_from_string(str, colors, ncolors) != 0 ? true : false
	}

	/// 
	/// Encodes a palette as a string, useful for persistent storage.
	/// Parameters:
	///	- colors: UnsafeMutablePointer<GdkColor>!
	///	- ncolors: gint
	/// - Returns: String?
	open class func paletteToString(colors: UnsafeMutablePointer<GdkColor>!, ncolors: gint) -> String? {
		return String(utf8String: gtk_color_selection_palette_to_string(colors, ncolors))
	}

	/// 
	/// Installs a global function to be called whenever the user
	/// tries to modify the palette in a color selection.
	/// This function should save the new palette contents, and update
	/// the #GtkSettings:gtk-color-palette GtkSettings property so all
	/// GtkColorSelection widgets will be modified.
	/// Parameters:
	///	- function: @escaping GtkColorSelectionChangePaletteWithScreenFunc
	/// - Returns: GtkColorSelectionChangePaletteWithScreenFunc
	open class func setChangePaletteWithScreenHook(function: @escaping GtkColorSelectionChangePaletteWithScreenFunc) -> GtkColorSelectionChangePaletteWithScreenFunc {
		return gtk_color_selection_set_change_palette_with_screen_hook(function)
	}

	/// 
	/// Creates a new GtkColorSelection.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_color_selection_new())!
	}

	open var COLORSELECTION: UnsafeMutablePointer<GtkColorSelection>! {
		get {
			return GTK_COLOR_SELECTION(self.GOBJECT)
		}
	}

	/// 
	/// Returns the current alpha value.
	/// - Returns: guint16
	open func getCurrentAlpha() -> guint16 {
		return gtk_color_selection_get_current_alpha(GTK_COLOR_SELECTION(self.GOBJECT))
	}

	/// 
	/// Sets @color to be the current color in the GtkColorSelection widget.
	/// Parameters:
	///	- color: UnsafeMutablePointer<GdkColor>!
	open func getCurrentColor(_ color: UnsafeMutablePointer<GdkColor>!) {
		gtk_color_selection_get_current_color(GTK_COLOR_SELECTION(self.GOBJECT), color)
	}

	/// 
	/// Sets @rgba to be the current color in the GtkColorSelection widget.
	/// Parameters:
	///	- rgba: UnsafeMutablePointer<GdkRGBA>!
	open func getCurrentRgba(_ rgba: UnsafeMutablePointer<GdkRGBA>!) {
		gtk_color_selection_get_current_rgba(GTK_COLOR_SELECTION(self.GOBJECT), rgba)
	}

	/// 
	/// Determines whether the colorsel has an opacity control.
	/// - Returns: Bool
	open func getHasOpacityControl() -> Bool {
		return gtk_color_selection_get_has_opacity_control(GTK_COLOR_SELECTION(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Determines whether the color selector has a color palette.
	/// - Returns: Bool
	open func getHasPalette() -> Bool {
		return gtk_color_selection_get_has_palette(GTK_COLOR_SELECTION(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the previous alpha value.
	/// - Returns: guint16
	open func getPreviousAlpha() -> guint16 {
		return gtk_color_selection_get_previous_alpha(GTK_COLOR_SELECTION(self.GOBJECT))
	}

	/// 
	/// Fills @color in with the original color value.
	/// Parameters:
	///	- color: UnsafeMutablePointer<GdkColor>!
	open func getPreviousColor(_ color: UnsafeMutablePointer<GdkColor>!) {
		gtk_color_selection_get_previous_color(GTK_COLOR_SELECTION(self.GOBJECT), color)
	}

	/// 
	/// Fills @rgba in with the original color value.
	/// Parameters:
	///	- rgba: UnsafeMutablePointer<GdkRGBA>!
	open func getPreviousRgba(_ rgba: UnsafeMutablePointer<GdkRGBA>!) {
		gtk_color_selection_get_previous_rgba(GTK_COLOR_SELECTION(self.GOBJECT), rgba)
	}

	/// 
	/// Gets the current state of the @colorsel.
	/// - Returns: Bool
	open func isAdjusting() -> Bool {
		return gtk_color_selection_is_adjusting(GTK_COLOR_SELECTION(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Sets the current opacity to be @alpha.
	/// The first time this is called, it will also set
	/// the original opacity to be @alpha too.
	/// Parameters:
	///	- alpha: guint16
	open func setCurrentAlpha(_ alpha: guint16) {
		gtk_color_selection_set_current_alpha(GTK_COLOR_SELECTION(self.GOBJECT), alpha)
	}

	/// 
	/// Sets the current color to be @color.
	/// The first time this is called, it will also set
	/// the original color to be @color too.
	/// Parameters:
	///	- color: UnsafePointer<GdkColor>!
	open func setCurrentColor(_ color: UnsafePointer<GdkColor>!) {
		gtk_color_selection_set_current_color(GTK_COLOR_SELECTION(self.GOBJECT), color)
	}

	/// 
	/// Sets the current color to be @rgba.
	/// The first time this is called, it will also set
	/// the original color to be @rgba too.
	/// Parameters:
	///	- rgba: UnsafePointer<GdkRGBA>!
	open func setCurrentRgba(_ rgba: UnsafePointer<GdkRGBA>!) {
		gtk_color_selection_set_current_rgba(GTK_COLOR_SELECTION(self.GOBJECT), rgba)
	}

	/// 
	/// Sets the @colorsel to use or not use opacity.
	/// Parameters:
	///	- hasOpacity: Bool
	open func setHasOpacityControl(hasOpacity: Bool) {
		gtk_color_selection_set_has_opacity_control(GTK_COLOR_SELECTION(self.GOBJECT), hasOpacity ? 1 : 0)
	}

	/// 
	/// Shows and hides the palette based upon the value of @has_palette.
	/// Parameters:
	///	- hasPalette: Bool
	open func setHasPalette(_ hasPalette: Bool) {
		gtk_color_selection_set_has_palette(GTK_COLOR_SELECTION(self.GOBJECT), hasPalette ? 1 : 0)
	}

	/// 
	/// Sets the “previous” alpha to be @alpha.
	/// This function should be called with some hesitations,
	/// as it might seem confusing to have that alpha change.
	/// Parameters:
	///	- alpha: guint16
	open func setPreviousAlpha(_ alpha: guint16) {
		gtk_color_selection_set_previous_alpha(GTK_COLOR_SELECTION(self.GOBJECT), alpha)
	}

	/// 
	/// Sets the “previous” color to be @color.
	/// This function should be called with some hesitations,
	/// as it might seem confusing to have that color change.
	/// Calling gtk_color_selection_set_current_color() will also
	/// set this color the first time it is called.
	/// Parameters:
	///	- color: UnsafePointer<GdkColor>!
	open func setPreviousColor(_ color: UnsafePointer<GdkColor>!) {
		gtk_color_selection_set_previous_color(GTK_COLOR_SELECTION(self.GOBJECT), color)
	}

	/// 
	/// Sets the “previous” color to be @rgba.
	/// This function should be called with some hesitations,
	/// as it might seem confusing to have that color change.
	/// Calling gtk_color_selection_set_current_rgba() will also
	/// set this color the first time it is called.
	/// Parameters:
	///	- rgba: UnsafePointer<GdkRGBA>!
	open func setPreviousRgba(_ rgba: UnsafePointer<GdkRGBA>!) {
		gtk_color_selection_set_previous_rgba(GTK_COLOR_SELECTION(self.GOBJECT), rgba)
	}

}
