/*
 * CGTKFontChooser.swift
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

public let GTK_TYPE_FONT_CHOOSER: GType = gtk_font_chooser_get_type()

@inline(__always) public func GTK_FONT_CHOOSER(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FONT_CHOOSER)
}

/// #GtkFontChooser is an interface that can be implemented by widgets
/// displaying the list of fonts. In GTK+, the main objects
/// that implement this interface are #GtkFontChooserWidget,
/// #GtkFontChooserDialog and #GtkFontButton. The GtkFontChooser interface
/// has been introducted in GTK+ 3.2.


public protocol CGTKFontChooser: class {
	/// Gets the currently-selected font name.
	/// Note that this can be a different string than what you set with
	/// gtk_font_chooser_set_font(), as the font chooser widget may
	/// normalize font names and thus return a string with a different
	/// structure. For example, “Helvetica Italic Bold 12” could be
	/// normalized to “Helvetica Bold Italic 12”.
	/// Use pango_font_description_equal() if you want to compare two
	/// font descriptions.
	/// - Returns: String? (gchar*)
	func getFont() -> String?

	/// Gets the currently-selected font.
	/// Note that this can be a different string than what you set with
	/// gtk_font_chooser_set_font(), as the font chooser widget may
	/// normalize font names and thus return a string with a different
	/// structure. For example, “Helvetica Italic Bold 12” could be
	/// normalized to “Helvetica Bold Italic 12”.
	/// Use pango_font_description_equal() if you want to compare two
	/// font descriptions.
	/// - Returns: OpaquePointer? (PangoFontDescription*)
	func getFontDesc() -> OpaquePointer?

	/// Gets the #PangoFontFace representing the selected font group
	/// details (i.e. family, slant, weight, width, etc).
	/// If the selected font is not installed, returns %NULL.
	/// - Returns: OpaquePointer? (PangoFontFace*)
	func getFontFace() -> OpaquePointer?

	/// Gets the #PangoFontFamily representing the selected font family.
	/// Font families are a collection of font faces.
	/// If the selected font is not installed, returns %NULL.
	/// - Returns: OpaquePointer? (PangoFontFamily*)
	func getFontFamily() -> OpaquePointer?

	/// Gets the custom font map of this font chooser widget,
	/// or %NULL if it does not have one.
	/// - Returns: OpaquePointer? (PangoFontMap*)
	func getFontMap() -> OpaquePointer?

	/// The selected font size.
	/// - Returns: gint (gint)
	func getFontSize() -> gint

	/// Gets the text displayed in the preview area.
	/// - Returns: String? (gchar*)
	func getPreviewText() -> String?

	/// Returns whether the preview entry is shown or not.
	/// - Returns: Bool (gboolean)
	func getShowPreviewEntry() -> Bool

	/// Adds a filter function that decides which fonts to display
	/// in the font chooser.
	/// - Parameters:
	///	- filter: @escaping GtkFontFilterFunc (GtkFontFilterFunc)
	///	- userData: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	func setFilterFunc(filter: @escaping GtkFontFilterFunc, userData: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void

	/// Sets the currently-selected font.
	/// - Parameters:
	///	- fontname: String (const gchar*)
	func setFont(fontname: String) -> Swift.Void

	/// Sets the currently-selected font from @font_desc.
	/// - Parameters:
	///	- fontDesc: OpaquePointer! (const PangoFontDescription*)
	func setFontDesc(_ fontDesc: OpaquePointer!) -> Swift.Void

	/// Sets a custom font map to use for this font chooser widget.
	/// A custom font map can be used to present application-specific
	/// fonts instead of or in addition to the normal system fonts.
	/// |[<!-- language="C" -->
	/// FcConfig *config;
	/// PangoFontMap *fontmap;
	/// config = FcInitLoadConfigAndFonts ();
	/// FcConfigAppFontAddFile (config, my_app_font_file);
	/// fontmap = pango_cairo_font_map_new_for_font_type (CAIRO_FONT_TYPE_FT);
	/// pango_fc_font_map_set_config (PANGO_FC_FONT_MAP (fontmap), config);
	/// gtk_font_chooser_set_font_map (font_chooser, fontmap);
	/// ]|
	/// Note that other GTK+ widgets will only be able to use the application-specific
	/// font if it is present in the font map they use:
	/// |[
	/// context = gtk_widget_get_pango_context (label);
	/// pango_context_set_font_map (context, fontmap);
	/// ]|
	/// - Parameters:
	///	- fontmap: OpaquePointer? (PangoFontMap*)
	func setFontMap(fontmap: OpaquePointer?) -> Swift.Void

	/// Sets the text displayed in the preview area.
	/// The @text is used to show how the selected font looks.
	/// - Parameters:
	///	- text: String (const gchar*)
	func setPreviewText(_ text: String) -> Swift.Void

	/// Shows or hides the editable preview entry.
	/// - Parameters:
	///	- showPreviewEntry: Bool (gboolean)
	func setShowPreviewEntry(_ showPreviewEntry: Bool) -> Swift.Void

}
