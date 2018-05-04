/*
 * CGTKRecentChooserMenu.swift
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

public let GTK_TYPE_RECENT_CHOOSER_MENU: GType = gtk_recent_chooser_menu_get_type()

@inline(__always) public func GTK_RECENT_CHOOSER_MENU(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkRecentChooserMenu>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_RECENT_CHOOSER_MENU)
}

/// 
/// #GtkRecentChooserMenu is a widget suitable for displaying recently used files
/// inside a menu.  It can be used to set a sub-menu of a #GtkMenuItem using
/// gtk_menu_item_set_submenu(), or as the menu of a #GtkMenuToolButton.
/// Note that #GtkRecentChooserMenu does not have any methods of its own. Instead,
/// you should use the functions that work on a #GtkRecentChooser.
/// Note also that #GtkRecentChooserMenu does not support multiple filters, as it
/// has no way to let the user choose between them as the #GtkRecentChooserWidget
/// and #GtkRecentChooserDialog widgets do. Thus using gtk_recent_chooser_add_filter()
/// on a #GtkRecentChooserMenu widget will yield the same effects as using
/// gtk_recent_chooser_set_filter(), replacing any currently set filter
/// with the supplied filter; gtk_recent_chooser_remove_filter() will remove
/// any currently set #GtkRecentFilter object and will unset the current filter;
/// gtk_recent_chooser_list_filters() will return a list containing a single
/// #GtkRecentFilter object.
/// Recently used files are supported since GTK+ 2.10.


open class CGTKRecentChooserMenu : CGTKMenu {
	/// 
	/// Creates a new #GtkRecentChooserMenu widget.
	/// This kind of widget shows the list of recently used resources as
	/// a menu, each item as a menu item.  Each item inside the menu might
	/// have an icon, representing its MIME type, and a number, for mnemonic
	/// access.
	/// This widget implements the #GtkRecentChooser interface.
	/// This widget creates its own #GtkRecentManager object.  See the
	/// gtk_recent_chooser_menu_new_for_manager() function to know how to create
	/// a #GtkRecentChooserMenu widget bound to another #GtkRecentManager object.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_recent_chooser_menu_new())!
	}

	/// 
	/// Creates a new #GtkRecentChooserMenu widget using @manager as
	/// the underlying recently used resources manager.
	/// This is useful if you have implemented your own recent manager,
	/// or if you have a customized instance of a #GtkRecentManager
	/// object or if you wish to share a common #GtkRecentManager object
	/// among multiple #GtkRecentChooser widgets.
	/// Parameters:
	///	- manager: UnsafeMutablePointer<GtkRecentManager>!
	/// - Returns: CGTKWidget
	public convenience init(forManager manager: UnsafeMutablePointer<GtkRecentManager>!) {
		self.init(withGObject: gtk_recent_chooser_menu_new_for_manager(manager))!
	}

	open var RECENTCHOOSERMENU: UnsafeMutablePointer<GtkRecentChooserMenu>! {
		get {
			return GTK_RECENT_CHOOSER_MENU(self.GOBJECT)
		}
	}

	/// 
	/// Returns the value set by gtk_recent_chooser_menu_set_show_numbers().
	/// - Returns: Bool
	open func getShowNumbers() -> Bool {
		return gtk_recent_chooser_menu_get_show_numbers(GTK_RECENT_CHOOSER_MENU(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Sets whether a number should be added to the items of @menu.  The
	/// numbers are shown to provide a unique character for a mnemonic to
	/// be used inside ten menu item’s label.  Only the first the items
	/// get a number to avoid clashes.
	/// Parameters:
	///	- showNumbers: Bool
	open func setShowNumbers(_ showNumbers: Bool) {
		gtk_recent_chooser_menu_set_show_numbers(GTK_RECENT_CHOOSER_MENU(self.GOBJECT), showNumbers ? 1 : 0)
	}

}
