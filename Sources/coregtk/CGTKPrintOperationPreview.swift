/*
 * CGTKPrintOperationPreview.swift
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

public let GTK_TYPE_PRINT_OPERATION_PREVIEW: GType = gtk_print_operation_preview_get_type()

@inline(__always) public func GTK_PRINT_OPERATION_PREVIEW(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_PRINT_OPERATION_PREVIEW)
}

public protocol CGTKPrintOperationPreview: class {
	/// Ends a preview.
	/// This function must be called to finish a custom print preview.
	func endPreview() -> Swift.Void

	/// Returns whether the given page is included in the set of pages that
	/// have been selected for printing.
	/// - Parameters:
	///	- pageNr: gint (gint)
	/// - Returns: Bool (gboolean)
	func isSelected(pageNr: gint) -> Bool

	/// Renders a page to the preview, using the print context that
	/// was passed to the #GtkPrintOperation::preview handler together
	/// with @preview.
	/// A custom iprint preview should use this function in its ::expose
	/// handler to render the currently selected page.
	/// Note that this function requires a suitable cairo context to
	/// be associated with the print context.
	/// - Parameters:
	///	- pageNr: gint (gint)
	func renderPage(pageNr: gint) -> Swift.Void

}
