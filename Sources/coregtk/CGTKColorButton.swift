/*
 * CGTKColorButton.swift
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

public let GTK_TYPE_COLOR_BUTTON: GType = gtk_color_button_get_type()

@inline(__always) public func GTK_COLOR_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkColorButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_COLOR_BUTTON)
}

/// The #GtkColorButton is a button which displays the currently selected
/// color and allows to open a color selection dialog to change the color.
/// It is suitable widget for selecting a color in a preference dialog.
/// # CSS nodes
/// GtkColorButton has a single CSS node with name button. To differentiate
/// it from a plain #GtkButton, it gets the .color style class.


open class CGTKColorButton : CGTKButton, CGTKColorChooser {
	/// Creates a new color button.
	/// This returns a widget in the form of a small button containing
	/// a swatch representing the current selected color. When the button
	/// is clicked, a color-selection dialog will open, allowing the user
	/// to select a color. The swatch will be updated to reflect the new
	/// color when the user finishes.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_color_button_new())!
	}

	/// Creates a new color button.
	/// - Parameters:
	///	- color: UnsafePointer<GdkColor>! (const GdkColor*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withColor color: UnsafePointer<GdkColor>!) {
		self.init(withGObject: gtk_color_button_new_with_color(color))!
	}

	/// Creates a new color button.
	/// - Parameters:
	///	- rgba: UnsafePointer<GdkRGBA>! (const GdkRGBA*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withRgba rgba: UnsafePointer<GdkRGBA>!) {
		self.init(withGObject: gtk_color_button_new_with_rgba(rgba))!
	}

	open var COLORBUTTON: UnsafeMutablePointer<GtkColorButton>! {
		get {
			return GTK_COLOR_BUTTON(self.GOBJECT)
		}
	}

	/// Returns the current alpha value.
	/// - Returns: guint16 (guint16)
	open func getAlpha() -> guint16 {
		return gtk_color_button_get_alpha(GTK_COLOR_BUTTON(self.GOBJECT))
	}

	/// Sets @color to be the current color in the #GtkColorButton widget.
	/// - Parameters:
	///	- color: UnsafeMutablePointer<GdkColor>! (GdkColor*)
	open func getColor(_ color: UnsafeMutablePointer<GdkColor>!) -> Swift.Void {
		gtk_color_button_get_color(GTK_COLOR_BUTTON(self.GOBJECT), color)
	}

	/// Sets @rgba to be the current color in the #GtkColorButton widget.
	/// - Parameters:
	///	- rgba: UnsafeMutablePointer<GdkRGBA>! (GdkRGBA*)
	open func getRgba(_ rgba: UnsafeMutablePointer<GdkRGBA>!) -> Swift.Void {
		gtk_color_button_get_rgba(GTK_COLOR_BUTTON(self.GOBJECT), rgba)
	}

	/// Gets the title of the color selection dialog.
	/// - Returns: String? (const gchar*)
	open func getTitle() -> String? {
		return String(utf8String: gtk_color_button_get_title(GTK_COLOR_BUTTON(self.GOBJECT)))
	}

	/// Does the color selection dialog use the alpha channel ?
	/// - Returns: Bool (gboolean)
	open func getUseAlpha() -> Bool {
		return gtk_color_button_get_use_alpha(GTK_COLOR_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the current opacity to be @alpha.
	/// - Parameters:
	///	- alpha: guint16 (guint16)
	open func setAlpha(_ alpha: guint16) -> Swift.Void {
		gtk_color_button_set_alpha(GTK_COLOR_BUTTON(self.GOBJECT), alpha)
	}

	/// Sets the current color to be @color.
	/// - Parameters:
	///	- color: UnsafePointer<GdkColor>! (const GdkColor*)
	open func setColor(_ color: UnsafePointer<GdkColor>!) -> Swift.Void {
		gtk_color_button_set_color(GTK_COLOR_BUTTON(self.GOBJECT), color)
	}

	/// Sets the current color to be @rgba.
	/// - Parameters:
	///	- rgba: UnsafePointer<GdkRGBA>! (const GdkRGBA*)
	open func setRgba(_ rgba: UnsafePointer<GdkRGBA>!) -> Swift.Void {
		gtk_color_button_set_rgba(GTK_COLOR_BUTTON(self.GOBJECT), rgba)
	}

	/// Sets the title for the color selection dialog.
	/// - Parameters:
	///	- title: String (const gchar*)
	open func setTitle(_ title: String) -> Swift.Void {
		gtk_color_button_set_title(GTK_COLOR_BUTTON(self.GOBJECT), title)
	}

	/// Sets whether or not the color button should use the alpha channel.
	/// - Parameters:
	///	- useAlpha: Bool (gboolean)
	open func setUseAlpha(_ useAlpha: Bool) -> Swift.Void {
		gtk_color_button_set_use_alpha(GTK_COLOR_BUTTON(self.GOBJECT), useAlpha ? 1 : 0)
	}

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
	open func addPalette(orientation: GtkOrientation, colorsPerLine: gint, ncolors: gint, colors: UnsafeMutablePointer<GdkRGBA>?) -> Swift.Void {
		gtk_color_chooser_add_palette(GTK_COLOR_CHOOSER(self.GOBJECT), orientation, colorsPerLine, ncolors, colors)
	}

	/// Gets the currently-selected color.
	/// - Parameters:
	///	- color: UnsafeMutablePointer<GdkRGBA>! (GdkRGBA*)
	open func getRgba(color: UnsafeMutablePointer<GdkRGBA>!) -> Swift.Void {
		gtk_color_chooser_get_rgba(GTK_COLOR_CHOOSER(self.GOBJECT), color)
	}

	/// Sets the color.
	/// - Parameters:
	///	- color: UnsafePointer<GdkRGBA>! (const GdkRGBA*)
	open func setRgba(color: UnsafePointer<GdkRGBA>!) -> Swift.Void {
		gtk_color_chooser_set_rgba(GTK_COLOR_CHOOSER(self.GOBJECT), color)
	}

}
