/*
 * CGTKColorChooserWidget.swift
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

public let GTK_TYPE_COLOR_CHOOSER_WIDGET: GType = gtk_color_chooser_widget_get_type()

@inline(__always) public func GTK_COLOR_CHOOSER_WIDGET(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkColorChooserWidget>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_COLOR_CHOOSER_WIDGET)
}

/// The #GtkColorChooserWidget widget lets the user select a
/// color. By default, the chooser presents a predefined palette
/// of colors, plus a small number of settable custom colors.
/// It is also possible to select a different color with the
/// single-color editor. To enter the single-color editing mode,
/// use the context menu of any color of the palette, or use the
/// '+' button to add a new custom color.
/// The chooser automatically remembers the last selection, as well
/// as custom colors.
/// To change the initially selected color, use gtk_color_chooser_set_rgba().
/// To get the selected color use gtk_color_chooser_get_rgba().
/// The #GtkColorChooserWidget is used in the #GtkColorChooserDialog
/// to provide a dialog for selecting colors.
/// # CSS names
/// GtkColorChooserWidget has a single CSS node with name colorchooser.


open class CGTKColorChooserWidget : CGTKBox, CGTKColorChooser {
	/// Creates a new #GtkColorChooserWidget.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_color_chooser_widget_new())!
	}

	open var COLORCHOOSERWIDGET: UnsafeMutablePointer<GtkColorChooserWidget>! {
		get {
			return GTK_COLOR_CHOOSER_WIDGET(self.GOBJECT)
		}
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

	/// Returns whether the color chooser shows the alpha channel.
	/// - Returns: Bool (gboolean)
	open func getUseAlpha() -> Bool {
		return gtk_color_chooser_get_use_alpha(GTK_COLOR_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the color.
	/// - Parameters:
	///	- color: UnsafePointer<GdkRGBA>! (const GdkRGBA*)
	open func setRgba(color: UnsafePointer<GdkRGBA>!) -> Swift.Void {
		gtk_color_chooser_set_rgba(GTK_COLOR_CHOOSER(self.GOBJECT), color)
	}

	/// Sets whether or not the color chooser should use the alpha channel.
	/// - Parameters:
	///	- useAlpha: Bool (gboolean)
	open func setUseAlpha(_ useAlpha: Bool) -> Swift.Void {
		gtk_color_chooser_set_use_alpha(GTK_COLOR_CHOOSER(self.GOBJECT), useAlpha ? 1 : 0)
	}

}
