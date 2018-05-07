/*
 * CGTKEditable.swift
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

public let GTK_TYPE_EDITABLE: GType = gtk_editable_get_type()

@inline(__always) public func GTK_EDITABLE(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_EDITABLE)
}

/// The #GtkEditable interface is an interface which should be implemented by
/// text editing widgets, such as #GtkEntry and #GtkSpinButton. It contains functions
/// for generically manipulating an editable widget, a large number of action
/// signals used for key bindings, and several signals that an application can
/// connect to to modify the behavior of a widget.
/// As an example of the latter usage, by connecting
/// the following handler to #GtkEditable::insert-text, an application
/// can convert all entry into a widget into uppercase.
/// ## Forcing entry to uppercase.
/// |[<!-- language="C" -->
/// #include <ctype.h>;
/// void
/// insert_text_handler (GtkEditable *editable,
/// const gchar *text,
/// gint         length,
/// gint        *position,
/// gpointer     data)
/// {
/// gchar *result = g_utf8_strup (text, length);
/// g_signal_handlers_block_by_func (editable,
/// (gpointer) insert_text_handler, data);
/// gtk_editable_insert_text (editable, result, length, position);
/// g_signal_handlers_unblock_by_func (editable,
/// (gpointer) insert_text_handler, data);
/// g_signal_stop_emission_by_name (editable, "insert_text");
/// g_free (result);
/// }
/// ]|


public protocol CGTKEditable: class {
	/// Copies the contents of the currently selected content in the editable and
	/// puts it on the clipboard.
	func copyClipboard() -> Swift.Void

	/// Removes the contents of the currently selected content in the editable and
	/// puts it on the clipboard.
	func cutClipboard() -> Swift.Void

	/// Deletes the currently selected text of the editable.
	/// This call doesn’t do anything if there is no selected text.
	func deleteSelection() -> Swift.Void

	/// Deletes a sequence of characters. The characters that are deleted are
	/// those characters at positions from @start_pos up to, but not including
	/// @end_pos. If @end_pos is negative, then the characters deleted
	/// are those from @start_pos to the end of the text.
	/// Note that the positions are specified in characters, not bytes.
	/// - Parameters:
	///	- startPos: gint (gint)
	///	- endPos: gint (gint)
	func deleteText(startPos: gint, endPos: gint) -> Swift.Void

	/// Retrieves a sequence of characters. The characters that are retrieved
	/// are those characters at positions from @start_pos up to, but not
	/// including @end_pos. If @end_pos is negative, then the characters
	/// retrieved are those characters from @start_pos to the end of the text.
	/// Note that positions are specified in characters, not bytes.
	/// - Parameters:
	///	- startPos: gint (gint)
	///	- endPos: gint (gint)
	/// - Returns: String? (gchar*)
	func getChars(startPos: gint, endPos: gint) -> String?

	/// Retrieves whether @editable is editable. See
	/// gtk_editable_set_editable().
	/// - Returns: Bool (gboolean)
	func getEditable() -> Bool

	/// Retrieves the current position of the cursor relative to the start
	/// of the content of the editable.
	/// Note that this position is in characters, not in bytes.
	/// - Returns: gint (gint)
	func getPosition() -> gint

	/// Retrieves the selection bound of the editable. start_pos will be filled
	/// with the start of the selection and @end_pos with end. If no text was
	/// selected both will be identical and %FALSE will be returned.
	/// Note that positions are specified in characters, not bytes.
	/// - Parameters:
	///	- startPos: UnsafeMutablePointer<Int32>! (gint*)
	///	- endPos: UnsafeMutablePointer<Int32>! (gint*)
	/// - Returns: Bool (gboolean)
	func getSelectionBounds(startPos: UnsafeMutablePointer<Int32>!, endPos: UnsafeMutablePointer<Int32>!) -> Bool

	/// Inserts @new_text_length bytes of @new_text into the contents of the
	/// widget, at position @position.
	/// Note that the position is in characters, not in bytes.
	/// The function updates @position to point after the newly inserted text.
	/// - Parameters:
	///	- newText: String (const gchar*)
	///	- newTextLength: gint (gint)
	///	- position: UnsafeMutablePointer<Int32>! (gint*)
	func insertText(newText: String, newTextLength: gint, position: UnsafeMutablePointer<Int32>!) -> Swift.Void

	/// Pastes the content of the clipboard to the current position of the
	/// cursor in the editable.
	func pasteClipboard() -> Swift.Void

	/// Selects a region of text. The characters that are selected are
	/// those characters at positions from @start_pos up to, but not
	/// including @end_pos. If @end_pos is negative, then the
	/// characters selected are those characters from @start_pos to
	/// the end of the text.
	/// Note that positions are specified in characters, not bytes.
	/// - Parameters:
	///	- startPos: gint (gint)
	///	- endPos: gint (gint)
	func selectRegion(startPos: gint, endPos: gint) -> Swift.Void

	/// Determines if the user can edit the text in the editable
	/// widget or not.
	/// - Parameters:
	///	- isEditable: Bool (gboolean)
	func setEditable(isEditable: Bool) -> Swift.Void

	/// Sets the cursor position in the editable to the given value.
	/// The cursor is displayed before the character with the given (base 0)
	/// index in the contents of the editable. The value must be less than or
	/// equal to the number of characters in the editable. A value of -1
	/// indicates that the position should be set after the last character
	/// of the editable. Note that @position is in characters, not in bytes.
	/// - Parameters:
	///	- position: gint (gint)
	func setPosition(_ position: gint) -> Swift.Void

}
