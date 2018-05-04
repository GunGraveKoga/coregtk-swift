/*
 * CGTKRecentChooserWidget.swift
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

public let GTK_TYPE_RECENT_CHOOSER_WIDGET: GType = gtk_recent_chooser_widget_get_type()

@inline(__always) public func GTK_RECENT_CHOOSER_WIDGET(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkRecentChooserWidget>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_RECENT_CHOOSER_WIDGET)
}

/// 
/// #GtkRecentChooserWidget is a widget suitable for selecting recently used
/// files.  It is the main building block of a #GtkRecentChooserDialog.  Most
/// applications will only need to use the latter; you can use
/// #GtkRecentChooserWidget as part of a larger window if you have special needs.
/// Note that #GtkRecentChooserWidget does not have any methods of its own.
/// Instead, you should use the functions that work on a #GtkRecentChooser.
/// Recently used files are supported since GTK+ 2.10.


open class CGTKRecentChooserWidget : CGTKBox {
	/// 
	/// Creates a new #GtkRecentChooserWidget object.  This is an embeddable widget
	/// used to access the recently used resources list.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_recent_chooser_widget_new())!
	}

	/// 
	/// Creates a new #GtkRecentChooserWidget with a specified recent manager.
	/// This is useful if you have implemented your own recent manager, or if you
	/// have a customized instance of a #GtkRecentManager object.
	/// Parameters:
	///	- manager: UnsafeMutablePointer<GtkRecentManager>!
	/// - Returns: CGTKWidget
	public convenience init(forManager manager: UnsafeMutablePointer<GtkRecentManager>!) {
		self.init(withGObject: gtk_recent_chooser_widget_new_for_manager(manager))!
	}

	open var RECENTCHOOSERWIDGET: UnsafeMutablePointer<GtkRecentChooserWidget>! {
		get {
			return GTK_RECENT_CHOOSER_WIDGET(self.GOBJECT)
		}
	}

}
