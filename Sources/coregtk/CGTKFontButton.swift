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

/// The #GtkFontButton is a button which displays the currently selected
/// font an allows to open a font chooser dialog to change the font.
/// It is suitable widget for selecting a font in a preference dialog.
/// # CSS nodes
/// GtkFontButton has a single CSS node with name button and style class .font.


open class CGTKFontButton : CGTKButton, CGTKFontChooser {
	/// Creates a new font picker widget.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_font_button_new())!
	}

	/// Creates a new font picker widget.
	/// - Parameters:
	///	- fontname: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withFont fontname: String) {
		self.init(withGObject: gtk_font_button_new_with_font(fontname))!
	}

	open var FONTBUTTON: UnsafeMutablePointer<GtkFontButton>! {
		get {
			return GTK_FONT_BUTTON(self.GOBJECT)
		}
	}

	/// Retrieves the name of the currently selected font. This name includes
	/// style and size information as well. If you want to render something
	/// with the font, use this string with pango_font_description_from_string() .
	/// If you’re interested in peeking certain values (family name,
	/// style, size, weight) just query these properties from the
	/// #PangoFontDescription object.
	/// - Returns: String? (const gchar*)
	open func getFontName() -> String? {
		return String(utf8String: gtk_font_button_get_font_name(GTK_FONT_BUTTON(self.GOBJECT)))
	}

	/// Returns whether the font size will be shown in the label.
	/// - Returns: Bool (gboolean)
	open func getShowSize() -> Bool {
		return gtk_font_button_get_show_size(GTK_FONT_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the name of the font style will be shown in the label.
	/// - Returns: Bool (gboolean)
	open func getShowStyle() -> Bool {
		return gtk_font_button_get_show_style(GTK_FONT_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Retrieves the title of the font chooser dialog.
	/// - Returns: String? (const gchar*)
	open func getTitle() -> String? {
		return String(utf8String: gtk_font_button_get_title(GTK_FONT_BUTTON(self.GOBJECT)))
	}

	/// Returns whether the selected font is used in the label.
	/// - Returns: Bool (gboolean)
	open func getUseFont() -> Bool {
		return gtk_font_button_get_use_font(GTK_FONT_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the selected size is used in the label.
	/// - Returns: Bool (gboolean)
	open func getUseSize() -> Bool {
		return gtk_font_button_get_use_size(GTK_FONT_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets or updates the currently-displayed font in font picker dialog.
	/// - Parameters:
	///	- fontname: String (const gchar*)
	/// - Returns: Bool (gboolean)
	open func setFontName(fontname: String) -> Bool {
		return gtk_font_button_set_font_name(GTK_FONT_BUTTON(self.GOBJECT), fontname) != 0 ? true : false
	}

	/// If @show_size is %TRUE, the font size will be displayed along with the name of the selected font.
	/// - Parameters:
	///	- showSize: Bool (gboolean)
	open func setShowSize(_ showSize: Bool) -> Swift.Void {
		gtk_font_button_set_show_size(GTK_FONT_BUTTON(self.GOBJECT), showSize ? 1 : 0)
	}

	/// If @show_style is %TRUE, the font style will be displayed along with name of the selected font.
	/// - Parameters:
	///	- showStyle: Bool (gboolean)
	open func setShowStyle(_ showStyle: Bool) -> Swift.Void {
		gtk_font_button_set_show_style(GTK_FONT_BUTTON(self.GOBJECT), showStyle ? 1 : 0)
	}

	/// Sets the title for the font chooser dialog.
	/// - Parameters:
	///	- title: String (const gchar*)
	open func setTitle(_ title: String) -> Swift.Void {
		gtk_font_button_set_title(GTK_FONT_BUTTON(self.GOBJECT), title)
	}

	/// If @use_font is %TRUE, the font name will be written using the selected font.
	/// - Parameters:
	///	- useFont: Bool (gboolean)
	open func setUseFont(_ useFont: Bool) -> Swift.Void {
		gtk_font_button_set_use_font(GTK_FONT_BUTTON(self.GOBJECT), useFont ? 1 : 0)
	}

	/// If @use_size is %TRUE, the font name will be written using the selected size.
	/// - Parameters:
	///	- useSize: Bool (gboolean)
	open func setUseSize(_ useSize: Bool) -> Swift.Void {
		gtk_font_button_set_use_size(GTK_FONT_BUTTON(self.GOBJECT), useSize ? 1 : 0)
	}

	/// Gets the currently-selected font name.
	/// Note that this can be a different string than what you set with
	/// gtk_font_chooser_set_font(), as the font chooser widget may
	/// normalize font names and thus return a string with a different
	/// structure. For example, “Helvetica Italic Bold 12” could be
	/// normalized to “Helvetica Bold Italic 12”.
	/// Use pango_font_description_equal() if you want to compare two
	/// font descriptions.
	/// - Returns: String? (gchar*)
	open func getFont() -> String? {
		return {
			let ptr = gtk_font_chooser_get_font(GTK_FONT_CHOOSER(self.GOBJECT))
			defer {
				if ptr != nil {
					g_free(ptr)
				}
			}
			return ptr != nil ? String(utf8String: ptr!) : nil
		}()
	}

	/// Gets the currently-selected font.
	/// Note that this can be a different string than what you set with
	/// gtk_font_chooser_set_font(), as the font chooser widget may
	/// normalize font names and thus return a string with a different
	/// structure. For example, “Helvetica Italic Bold 12” could be
	/// normalized to “Helvetica Bold Italic 12”.
	/// Use pango_font_description_equal() if you want to compare two
	/// font descriptions.
	/// - Returns: OpaquePointer? (PangoFontDescription*)
	open func getFontDesc() -> OpaquePointer? {
		return gtk_font_chooser_get_font_desc(GTK_FONT_CHOOSER(self.GOBJECT))
	}

	/// Gets the #PangoFontFace representing the selected font group
	/// details (i.e. family, slant, weight, width, etc).
	/// If the selected font is not installed, returns %NULL.
	/// - Returns: OpaquePointer? (PangoFontFace*)
	open func getFontFace() -> OpaquePointer? {
		return gtk_font_chooser_get_font_face(GTK_FONT_CHOOSER(self.GOBJECT))
	}

	/// Gets the #PangoFontFamily representing the selected font family.
	/// Font families are a collection of font faces.
	/// If the selected font is not installed, returns %NULL.
	/// - Returns: OpaquePointer? (PangoFontFamily*)
	open func getFontFamily() -> OpaquePointer? {
		return gtk_font_chooser_get_font_family(GTK_FONT_CHOOSER(self.GOBJECT))
	}

	/// The selected font size.
	/// - Returns: gint (gint)
	open func getFontSize() -> gint {
		return gtk_font_chooser_get_font_size(GTK_FONT_CHOOSER(self.GOBJECT))
	}

	/// Gets the text displayed in the preview area.
	/// - Returns: String? (gchar*)
	open func getPreviewText() -> String? {
		return {
			let ptr = gtk_font_chooser_get_preview_text(GTK_FONT_CHOOSER(self.GOBJECT))
			defer {
				if ptr != nil {
					g_free(ptr)
				}
			}
			return ptr != nil ? String(utf8String: ptr!) : nil
		}()
	}

	/// Returns whether the preview entry is shown or not.
	/// - Returns: Bool (gboolean)
	open func getShowPreviewEntry() -> Bool {
		return gtk_font_chooser_get_show_preview_entry(GTK_FONT_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Adds a filter function that decides which fonts to display
	/// in the font chooser.
	/// - Parameters:
	///	- filter: @escaping GtkFontFilterFunc (GtkFontFilterFunc)
	///	- userData: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setFilterFunc(filter: @escaping GtkFontFilterFunc, userData: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_font_chooser_set_filter_func(GTK_FONT_CHOOSER(self.GOBJECT), filter, userData, destroy)
	}

	/// Sets the currently-selected font.
	/// - Parameters:
	///	- fontname: String (const gchar*)
	open func setFont(fontname: String) -> Swift.Void {
		gtk_font_chooser_set_font(GTK_FONT_CHOOSER(self.GOBJECT), fontname)
	}

	/// Sets the currently-selected font from @font_desc.
	/// - Parameters:
	///	- fontDesc: OpaquePointer! (const PangoFontDescription*)
	open func setFontDesc(_ fontDesc: OpaquePointer!) -> Swift.Void {
		gtk_font_chooser_set_font_desc(GTK_FONT_CHOOSER(self.GOBJECT), fontDesc)
	}

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
	open func setFontMap(fontmap: OpaquePointer?) -> Swift.Void {
		gtk_font_chooser_set_font_map(GTK_FONT_CHOOSER(self.GOBJECT), fontmap)
	}

	/// Sets the text displayed in the preview area.
	/// The @text is used to show how the selected font looks.
	/// - Parameters:
	///	- text: String (const gchar*)
	open func setPreviewText(_ text: String) -> Swift.Void {
		gtk_font_chooser_set_preview_text(GTK_FONT_CHOOSER(self.GOBJECT), text)
	}

	/// Shows or hides the editable preview entry.
	/// - Parameters:
	///	- showPreviewEntry: Bool (gboolean)
	open func setShowPreviewEntry(_ showPreviewEntry: Bool) -> Swift.Void {
		gtk_font_chooser_set_show_preview_entry(GTK_FONT_CHOOSER(self.GOBJECT), showPreviewEntry ? 1 : 0)
	}

}
