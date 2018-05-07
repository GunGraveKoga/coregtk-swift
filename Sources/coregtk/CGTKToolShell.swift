/*
 * CGTKToolShell.swift
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

public let GTK_TYPE_TOOL_SHELL: GType = gtk_tool_shell_get_type()

@inline(__always) public func GTK_TOOL_SHELL(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TOOL_SHELL)
}

/// The #GtkToolShell interface allows container widgets to provide additional
/// information when embedding #GtkToolItem widgets.


public protocol CGTKToolShell: class {
	/// Retrieves the current ellipsize mode for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_ellipsize_mode()
	/// instead.
	/// - Returns: PangoEllipsizeMode (PangoEllipsizeMode)
	func getEllipsizeMode() -> PangoEllipsizeMode

	/// Retrieves the icon size for the tool shell. Tool items must not call this
	/// function directly, but rely on gtk_tool_item_get_icon_size() instead.
	/// - Returns: GtkIconSize (GtkIconSize)
	func getIconSize() -> GtkIconSize

	/// Retrieves the current orientation for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_orientation()
	/// instead.
	/// - Returns: GtkOrientation (GtkOrientation)
	func getOrientation() -> GtkOrientation

	/// Returns the relief style of buttons on @shell. Tool items must not call this
	/// function directly, but rely on gtk_tool_item_get_relief_style() instead.
	/// - Returns: GtkReliefStyle (GtkReliefStyle)
	func getReliefStyle() -> GtkReliefStyle

	/// Retrieves whether the tool shell has text, icons, or both. Tool items must
	/// not call this function directly, but rely on gtk_tool_item_get_toolbar_style()
	/// instead.
	/// - Returns: GtkToolbarStyle (GtkToolbarStyle)
	func getStyle() -> GtkToolbarStyle

	/// Retrieves the current text alignment for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_text_alignment()
	/// instead.
	/// - Returns: Float (gfloat)
	func getTextAlignment() -> Float

	/// Retrieves the current text orientation for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_text_orientation()
	/// instead.
	/// - Returns: GtkOrientation (GtkOrientation)
	func getTextOrientation() -> GtkOrientation

	/// Retrieves the current text size group for the tool shell. Tool items must not
	/// call this function directly, but rely on gtk_tool_item_get_text_size_group()
	/// instead.
	/// - Returns: UnsafeMutablePointer<GtkSizeGroup>! (GtkSizeGroup*)
	func getTextSizeGroup() -> UnsafeMutablePointer<GtkSizeGroup>!

	/// Calling this function signals the tool shell that the overflow menu item for
	/// tool items have changed. If there is an overflow menu and if it is visible
	/// when this function it called, the menu will be rebuilt.
	/// Tool items must not call this function directly, but rely on
	/// gtk_tool_item_rebuild_menu() instead.
	func rebuildMenu() -> Swift.Void

}
