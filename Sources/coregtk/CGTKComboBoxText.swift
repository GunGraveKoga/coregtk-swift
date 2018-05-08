/*
 * CGTKComboBoxText.swift
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

public let GTK_TYPE_COMBO_BOX_TEXT: GType = gtk_combo_box_text_get_type()

@inline(__always) public func GTK_COMBO_BOX_TEXT(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkComboBoxText>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_COMBO_BOX_TEXT)
}

/// A GtkComboBoxText is a simple variant of #GtkComboBox that hides
/// the model-view complexity for simple text-only use cases.
/// To create a GtkComboBoxText, use gtk_combo_box_text_new() or
/// gtk_combo_box_text_new_with_entry().
/// You can add items to a GtkComboBoxText with
/// gtk_combo_box_text_append_text(), gtk_combo_box_text_insert_text()
/// or gtk_combo_box_text_prepend_text() and remove options with
/// gtk_combo_box_text_remove().
/// If the GtkComboBoxText contains an entry (via the “has-entry” property),
/// its contents can be retrieved using gtk_combo_box_text_get_active_text().
/// The entry itself can be accessed by calling gtk_bin_get_child() on the
/// combo box.
/// You should not call gtk_combo_box_set_model() or attempt to pack more cells
/// into this combo box via its GtkCellLayout interface.
/// # GtkComboBoxText as GtkBuildable
/// The GtkComboBoxText implementation of the GtkBuildable interface supports
/// adding items directly using the <items> element and specifying <item>
/// elements for each item. Each <item> element can specify the “id”
/// corresponding to the appended text and also supports the regular
/// translation attributes “translatable”, “context” and “comments”.
/// Here is a UI definition fragment specifying GtkComboBoxText items:
/// |[
/// <object class="GtkComboBoxText">
/// <items>
/// <item translatable="yes" id="factory">Factory</item>
/// <item translatable="yes" id="home">Home</item>
/// <item translatable="yes" id="subway">Subway</item>
/// </items>
/// </object>
/// ]|
/// # CSS nodes
/// |[<!-- language="plain" -->
/// combobox
/// ╰── box.linked
/// ├── entry.combo
/// ├── button.combo
/// ╰── window.popup
/// ]|
/// GtkComboBoxText has a single CSS node with name combobox. It adds
/// the style class .combo to the main CSS nodes of its entry and button
/// children, and the .linked class to the node of its internal box.


open class CGTKComboBoxText : CGTKComboBox {
	/// Creates a new #GtkComboBoxText, which is a #GtkComboBox just displaying
	/// strings. The combo box created by this function has an entry.
	/// - Returns: CGTKWidget (GtkWidget*)
	override open class func newWithEntry<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_combo_box_text_new_with_entry())!
	}

	/// Creates a new #GtkComboBoxText, which is a #GtkComboBox just displaying
	/// strings.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_combo_box_text_new())!
	}

	open var COMBOBOXTEXT: UnsafeMutablePointer<GtkComboBoxText>! {
		get {
			return GTK_COMBO_BOX_TEXT(self.GOBJECT)
		}
	}

	/// Appends @text to the list of strings stored in @combo_box.
	/// If @id is non-%NULL then it is used as the ID of the row.
	/// This is the same as calling gtk_combo_box_text_insert() with a
	/// position of -1.
	/// - Parameters:
	///	- id: String? (const gchar*)
	///	- text: String (const gchar*)
	open func append(id: String?, text: String) -> Swift.Void {
		gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(self.GOBJECT), id, text)
	}

	/// Appends @text to the list of strings stored in @combo_box.
	/// This is the same as calling gtk_combo_box_text_insert_text() with a
	/// position of -1.
	/// - Parameters:
	///	- text: String (const gchar*)
	open func appendText(_ text: String) -> Swift.Void {
		gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(self.GOBJECT), text)
	}

	/// Returns the currently active string in @combo_box, or %NULL
	/// if none is selected. If @combo_box contains an entry, this
	/// function will return its contents (which will not necessarily
	/// be an item from the list).
	/// - Returns: String? (gchar*)
	open func getActiveText() -> String? {
		return {
			let ptr = gtk_combo_box_text_get_active_text(GTK_COMBO_BOX_TEXT(self.GOBJECT))
			defer {
				if ptr != nil {
					g_free(ptr)
				}
			}
			return ptr != nil ? String(utf8String: ptr!) : nil
		}()
	}

	/// Inserts @text at @position in the list of strings stored in @combo_box.
	/// If @id is non-%NULL then it is used as the ID of the row.  See
	/// #GtkComboBox:id-column.
	/// If @position is negative then @text is appended.
	/// - Parameters:
	///	- position: gint (gint)
	///	- id: String? (const gchar*)
	///	- text: String (const gchar*)
	open func insert(position: gint, id: String?, text: String) -> Swift.Void {
		gtk_combo_box_text_insert(GTK_COMBO_BOX_TEXT(self.GOBJECT), position, id, text)
	}

	/// Inserts @text at @position in the list of strings stored in @combo_box.
	/// If @position is negative then @text is appended.
	/// This is the same as calling gtk_combo_box_text_insert() with a %NULL
	/// ID string.
	/// - Parameters:
	///	- position: gint (gint)
	///	- text: String (const gchar*)
	open func insertText(position: gint, text: String) -> Swift.Void {
		gtk_combo_box_text_insert_text(GTK_COMBO_BOX_TEXT(self.GOBJECT), position, text)
	}

	/// Prepends @text to the list of strings stored in @combo_box.
	/// If @id is non-%NULL then it is used as the ID of the row.
	/// This is the same as calling gtk_combo_box_text_insert() with a
	/// position of 0.
	/// - Parameters:
	///	- id: String? (const gchar*)
	///	- text: String (const gchar*)
	open func prepend(id: String?, text: String) -> Swift.Void {
		gtk_combo_box_text_prepend(GTK_COMBO_BOX_TEXT(self.GOBJECT), id, text)
	}

	/// Prepends @text to the list of strings stored in @combo_box.
	/// This is the same as calling gtk_combo_box_text_insert_text() with a
	/// position of 0.
	/// - Parameters:
	///	- text: String (const gchar*)
	open func prependText(_ text: String) -> Swift.Void {
		gtk_combo_box_text_prepend_text(GTK_COMBO_BOX_TEXT(self.GOBJECT), text)
	}

	/// Removes the string at @position from @combo_box.
	/// - Parameters:
	///	- position: gint (gint)
	open func remove(position: gint) -> Swift.Void {
		gtk_combo_box_text_remove(GTK_COMBO_BOX_TEXT(self.GOBJECT), position)
	}

	/// Removes all the text entries from the combo box.
	open func removeAll() -> Swift.Void {
		gtk_combo_box_text_remove_all(GTK_COMBO_BOX_TEXT(self.GOBJECT))
	}

}
