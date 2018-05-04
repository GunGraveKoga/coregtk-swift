/*
 * CGTKFontButton.swift
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

public let GTK_TYPE_FONT_BUTTON: GType = gtk_font_button_get_type()

@inline(__always) public func GTK_FONT_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFontButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FONT_BUTTON)
}

/// 
/// The #GtkFontButton is a button which displays the currently selected
/// font an allows to open a font chooser dialog to change the font.
/// It is suitable widget for selecting a font in a preference dialog.
/// # CSS nodes
/// GtkFontButton has a single CSS node with name button and style class .font.


open class CGTKFontButton : CGTKButton {
	/// 
	/// Creates a new font picker widget.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_font_button_new())!
	}

	/// 
	/// Creates a new font picker widget.
	/// Parameters:
	///	- fontname: String
	/// - Returns: CGTKWidget
	public convenience init(withFont fontname: String) {
		self.init(withGObject: gtk_font_button_new_with_font(fontname))!
	}

	open var FONTBUTTON: UnsafeMutablePointer<GtkFontButton>! {
		get {
			return GTK_FONT_BUTTON(self.GOBJECT)
		}
	}

	/// 
	/// Retrieves the name of the currently selected font. This name includes
	/// style and size information as well. If you want to render something
	/// with the font, use this string with pango_font_description_from_string() .
	/// If you’re interested in peeking certain values (family name,
	/// style, size, weight) just query these properties from the
	/// #PangoFontDescription object.
	/// - Returns: String?
	open func getFontName() -> String? {
		return String(utf8String: gtk_font_button_get_font_name(GTK_FONT_BUTTON(self.GOBJECT)))
	}

	/// 
	/// Returns whether the font size will be shown in the label.
	/// - Returns: Bool
	open func getShowSize() -> Bool {
		return gtk_font_button_get_show_size(GTK_FONT_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the name of the font style will be shown in the label.
	/// - Returns: Bool
	open func getShowStyle() -> Bool {
		return gtk_font_button_get_show_style(GTK_FONT_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the title of the font chooser dialog.
	/// - Returns: String?
	open func getTitle() -> String? {
		return String(utf8String: gtk_font_button_get_title(GTK_FONT_BUTTON(self.GOBJECT)))
	}

	/// 
	/// Returns whether the selected font is used in the label.
	/// - Returns: Bool
	open func getUseFont() -> Bool {
		return gtk_font_button_get_use_font(GTK_FONT_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the selected size is used in the label.
	/// - Returns: Bool
	open func getUseSize() -> Bool {
		return gtk_font_button_get_use_size(GTK_FONT_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Sets or updates the currently-displayed font in font picker dialog.
	/// Parameters:
	///	- fontname: String
	/// - Returns: Bool
	open func setFontName(fontname: String) -> Bool {
		return gtk_font_button_set_font_name(GTK_FONT_BUTTON(self.GOBJECT), fontname) != 0 ? true : false
	}

	/// 
	/// If @show_size is %TRUE, the font size will be displayed along with the name of the selected font.
	/// Parameters:
	///	- showSize: Bool
	open func setShowSize(_ showSize: Bool) {
		gtk_font_button_set_show_size(GTK_FONT_BUTTON(self.GOBJECT), showSize ? 1 : 0)
	}

	/// 
	/// If @show_style is %TRUE, the font style will be displayed along with name of the selected font.
	/// Parameters:
	///	- showStyle: Bool
	open func setShowStyle(_ showStyle: Bool) {
		gtk_font_button_set_show_style(GTK_FONT_BUTTON(self.GOBJECT), showStyle ? 1 : 0)
	}

	/// 
	/// Sets the title for the font chooser dialog.
	/// Parameters:
	///	- title: String
	open func setTitle(_ title: String) {
		gtk_font_button_set_title(GTK_FONT_BUTTON(self.GOBJECT), title)
	}

	/// 
	/// If @use_font is %TRUE, the font name will be written using the selected font.
	/// Parameters:
	///	- useFont: Bool
	open func setUseFont(_ useFont: Bool) {
		gtk_font_button_set_use_font(GTK_FONT_BUTTON(self.GOBJECT), useFont ? 1 : 0)
	}

	/// 
	/// If @use_size is %TRUE, the font name will be written using the selected size.
	/// Parameters:
	///	- useSize: Bool
	open func setUseSize(_ useSize: Bool) {
		gtk_font_button_set_use_size(GTK_FONT_BUTTON(self.GOBJECT), useSize ? 1 : 0)
	}

}
