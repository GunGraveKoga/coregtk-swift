/*
 * CGTKFileChooserWidget.swift
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

public let GTK_TYPE_FILE_CHOOSER_WIDGET: GType = gtk_file_chooser_widget_get_type()

@inline(__always) public func GTK_FILE_CHOOSER_WIDGET(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFileChooserWidget>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FILE_CHOOSER_WIDGET)
}

/// 
/// #GtkFileChooserWidget is a widget for choosing files.
/// It exposes the #GtkFileChooser interface, and you should
/// use the methods of this interface to interact with the
/// widget.
/// # CSS nodes
/// GtkFileChooserWidget has a single CSS node with name filechooser.


open class CGTKFileChooserWidget : CGTKBox {
	/// 
	/// Creates a new #GtkFileChooserWidget. This is a file chooser widget that can
	/// be embedded in custom windows, and it is the same widget that is used by
	/// #GtkFileChooserDialog.
	/// Parameters:
	///	- action: GtkFileChooserAction
	/// - Returns: CGTKWidget
	public convenience init(action: GtkFileChooserAction) {
		self.init(withGObject: gtk_file_chooser_widget_new(action))!
	}

	open var FILECHOOSERWIDGET: UnsafeMutablePointer<GtkFileChooserWidget>! {
		get {
			return GTK_FILE_CHOOSER_WIDGET(self.GOBJECT)
		}
	}

}
