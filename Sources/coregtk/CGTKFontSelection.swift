/*
 * CGTKFontSelection.swift
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

public let GTK_TYPE_FONT_SELECTION: GType = gtk_font_selection_get_type()

@inline(__always) public func GTK_FONT_SELECTION(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFontSelection>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FONT_SELECTION)
}

open class CGTKFontSelection : CGTKBox {
	/// Creates a new #GtkFontSelection.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_font_selection_new())!
	}

	open var FONTSELECTION: UnsafeMutablePointer<GtkFontSelection>! {
		get {
			return GTK_FONT_SELECTION(self.GOBJECT)
		}
	}

	/// Gets the #PangoFontFace representing the selected font group
	/// details (i.e. family, slant, weight, width, etc).
	/// - Returns: OpaquePointer (PangoFontFace*)
	open func getFace() -> OpaquePointer {
		return gtk_font_selection_get_face(GTK_FONT_SELECTION(self.GOBJECT))
	}

	/// This returns the #GtkTreeView which lists all styles available for
	/// the selected font. For example, “Regular”, “Bold”, etc.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getFaceList<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_font_selection_get_face_list(GTK_FONT_SELECTION(self.GOBJECT)))!
	}

	/// Gets the #PangoFontFamily representing the selected font family.
	/// - Returns: OpaquePointer (PangoFontFamily*)
	open func getFamily() -> OpaquePointer {
		return gtk_font_selection_get_family(GTK_FONT_SELECTION(self.GOBJECT))
	}

	/// This returns the #GtkTreeView that lists font families, for
	/// example, “Sans”, “Serif”, etc.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getFamilyList<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_font_selection_get_family_list(GTK_FONT_SELECTION(self.GOBJECT)))!
	}

	/// Gets the currently-selected font name.
	/// Note that this can be a different string than what you set with
	/// gtk_font_selection_set_font_name(), as the font selection widget may
	/// normalize font names and thus return a string with a different structure.
	/// For example, “Helvetica Italic Bold 12” could be normalized to
	/// “Helvetica Bold Italic 12”. Use pango_font_description_equal()
	/// if you want to compare two font descriptions.
	/// - Returns: String? (gchar*)
	open func getFontName() -> String? {
		return {
			let ptr = gtk_font_selection_get_font_name(GTK_FONT_SELECTION(self.GOBJECT))
			defer {
				if ptr != nil {
					g_free(ptr)
				}
			}
			return ptr != nil ? String(utf8String: ptr!) : nil
		}()
	}

	/// This returns the #GtkEntry used to display the font as a preview.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getPreviewEntry<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_font_selection_get_preview_entry(GTK_FONT_SELECTION(self.GOBJECT)))!
	}

	/// Gets the text displayed in the preview area.
	/// - Returns: String? (const gchar*)
	open func getPreviewText() -> String? {
		return String(utf8String: gtk_font_selection_get_preview_text(GTK_FONT_SELECTION(self.GOBJECT)))
	}

	/// The selected font size.
	/// - Returns: gint (gint)
	open func getSize() -> gint {
		return gtk_font_selection_get_size(GTK_FONT_SELECTION(self.GOBJECT))
	}

	/// This returns the #GtkEntry used to allow the user to edit the font
	/// number manually instead of selecting it from the list of font sizes.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getSizeEntry<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_font_selection_get_size_entry(GTK_FONT_SELECTION(self.GOBJECT)))!
	}

	/// This returns the #GtkTreeView used to list font sizes.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getSizeList<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_font_selection_get_size_list(GTK_FONT_SELECTION(self.GOBJECT)))!
	}

	/// Sets the currently-selected font.
	/// Note that the @fontsel needs to know the screen in which it will appear
	/// for this to work; this can be guaranteed by simply making sure that the
	/// @fontsel is inserted in a toplevel window before you call this function.
	/// - Parameters:
	///	- fontname: String (const gchar*)
	/// - Returns: Bool (gboolean)
	open func setFontName(fontname: String) -> Bool {
		return gtk_font_selection_set_font_name(GTK_FONT_SELECTION(self.GOBJECT), fontname) != 0 ? true : false
	}

	/// Sets the text displayed in the preview area.
	/// The @text is used to show how the selected font looks.
	/// - Parameters:
	///	- text: String (const gchar*)
	open func setPreviewText(_ text: String) -> Swift.Void {
		gtk_font_selection_set_preview_text(GTK_FONT_SELECTION(self.GOBJECT), text)
	}

}
