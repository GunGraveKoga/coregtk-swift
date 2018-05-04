/*
 * CGTKSearchBar.swift
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

public let GTK_TYPE_SEARCH_BAR: GType = gtk_search_bar_get_type()

@inline(__always) public func GTK_SEARCH_BAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkSearchBar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SEARCH_BAR)
}

/// 
/// #GtkSearchBar is a container made to have a search entry (possibly
/// with additional connex widgets, such as drop-down menus, or buttons)
/// built-in. The search bar would appear when a search is started through
/// typing on the keyboard, or the application’s search mode is toggled on.
/// For keyboard presses to start a search, events will need to be
/// forwarded from the top-level window that contains the search bar.
/// See gtk_search_bar_handle_event() for example code. Common shortcuts
/// such as Ctrl+F should be handled as an application action, or through
/// the menu items.
/// You will also need to tell the search bar about which entry you
/// are using as your search entry using gtk_search_bar_connect_entry().
/// The following example shows you how to create a more complex search
/// entry.
/// # CSS nodes
/// GtkSearchBar has a single CSS node with name searchbar.
/// ## Creating a search bar
/// [A simple example](https://git.gnome.org/browse/gtk+/tree/examples/search-bar.c)


open class CGTKSearchBar : CGTKBin {
	/// 
	/// Creates a #GtkSearchBar. You will need to tell it about
	/// which widget is going to be your text entry using
	/// gtk_search_bar_connect_entry().
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_search_bar_new())!
	}

	open var SEARCHBAR: UnsafeMutablePointer<GtkSearchBar>! {
		get {
			return GTK_SEARCH_BAR(self.GOBJECT)
		}
	}

	/// 
	/// Connects the #GtkEntry widget passed as the one to be used in
	/// this search bar. The entry should be a descendant of the search bar.
	/// This is only required if the entry isn’t the direct child of the
	/// search bar (as in our main example).
	/// Parameters:
	///	- entry: UnsafeMutablePointer<GtkEntry>!
	open func connectEntry(_ entry: UnsafeMutablePointer<GtkEntry>!) {
		gtk_search_bar_connect_entry(GTK_SEARCH_BAR(self.GOBJECT), entry)
	}

	/// 
	/// Returns whether the search mode is on or off.
	/// - Returns: Bool
	open func getSearchMode() -> Bool {
		return gtk_search_bar_get_search_mode(GTK_SEARCH_BAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the close button is shown.
	/// - Returns: Bool
	open func getShowCloseButton() -> Bool {
		return gtk_search_bar_get_show_close_button(GTK_SEARCH_BAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// This function should be called when the top-level
	/// window which contains the search bar received a key event.
	/// If the key event is handled by the search bar, the bar will
	/// be shown, the entry populated with the entered text and %GDK_EVENT_STOP
	/// will be returned. The caller should ensure that events are
	/// not propagated further.
	/// If no entry has been connected to the search bar, using
	/// gtk_search_bar_connect_entry(), this function will return
	/// immediately with a warning.
	/// ## Showing the search bar on key presses
	/// |[<!-- language="C" -->
	/// static gboolean
	/// on_key_press_event (GtkWidget *widget,
	/// GdkEvent  *event,
	/// gpointer   user_data)
	/// {
	/// GtkSearchBar *bar = GTK_SEARCH_BAR (user_data);
	/// return gtk_search_bar_handle_event (bar, event);
	/// }
	/// static void
	/// create_toplevel (void)
	/// {
	/// GtkWidget *window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
	/// GtkWindow *search_bar = gtk_search_bar_new ();
	/// // Add more widgets to the window...
	/// g_signal_connect (window,
	/// "key-press-event",
	/// G_CALLBACK (on_key_press_event),
	/// search_bar);
	/// }
	/// ]|
	/// Parameters:
	///	- event: UnsafeMutablePointer<GdkEvent>!
	/// - Returns: Bool
	open func handleEvent(_ event: UnsafeMutablePointer<GdkEvent>!) -> Bool {
		return gtk_search_bar_handle_event(GTK_SEARCH_BAR(self.GOBJECT), event) != 0 ? true : false
	}

	/// 
	/// Switches the search mode on or off.
	/// Parameters:
	///	- searchMode: Bool
	open func setSearchMode(_ searchMode: Bool) {
		gtk_search_bar_set_search_mode(GTK_SEARCH_BAR(self.GOBJECT), searchMode ? 1 : 0)
	}

	/// 
	/// Shows or hides the close button. Applications that
	/// already have a “search” toggle button should not show a close
	/// button in their search bar, as it duplicates the role of the
	/// toggle button.
	/// Parameters:
	///	- visible: Bool
	open func setShowCloseButton(visible: Bool) {
		gtk_search_bar_set_show_close_button(GTK_SEARCH_BAR(self.GOBJECT), visible ? 1 : 0)
	}

}
