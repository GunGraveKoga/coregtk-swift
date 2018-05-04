/*
 * CGTKSearchEntry.swift
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

public let GTK_TYPE_SEARCH_ENTRY: GType = gtk_search_entry_get_type()

@inline(__always) public func GTK_SEARCH_ENTRY(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkSearchEntry>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SEARCH_ENTRY)
}

/// 
/// #GtkSearchEntry is a subclass of #GtkEntry that has been
/// tailored for use as a search entry.
/// It will show an inactive symbolic “find” icon when the search
/// entry is empty, and a symbolic “clear” icon when there is text.
/// Clicking on the “clear” icon will empty the search entry.
/// Note that the search/clear icon is shown using a secondary
/// icon, and thus does not work if you are using the secondary
/// icon position for some other purpose.
/// To make filtering appear more reactive, it is a good idea to
/// not react to every change in the entry text immediately, but
/// only after a short delay. To support this, #GtkSearchEntry
/// emits the #GtkSearchEntry::search-changed signal which can
/// be used instead of the #GtkEditable::changed signal.
/// The #GtkSearchEntry::previous-match, #GtkSearchEntry::next-match
/// and #GtkSearchEntry::stop-search signals can be used to implement
/// moving between search results and ending the search.
/// Often, GtkSearchEntry will be fed events by means of being
/// placed inside a #GtkSearchBar. If that is not the case,
/// you can use gtk_search_entry_handle_event() to pass events.


open class CGTKSearchEntry : CGTKEntry {
	/// 
	/// Creates a #GtkSearchEntry, with a find icon when the search field is
	/// empty, and a clear icon when it isn't.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_search_entry_new())!
	}

	open var SEARCHENTRY: UnsafeMutablePointer<GtkSearchEntry>! {
		get {
			return GTK_SEARCH_ENTRY(self.GOBJECT)
		}
	}

	/// 
	/// This function should be called when the top-level window
	/// which contains the search entry received a key event. If
	/// the entry is part of a #GtkSearchBar, it is preferable
	/// to call gtk_search_bar_handle_event() instead, which will
	/// reveal the entry in addition to passing the event to this
	/// function.
	/// If the key event is handled by the search entry and starts
	/// or continues a search, %GDK_EVENT_STOP will be returned.
	/// The caller should ensure that the entry is shown in this
	/// case, and not propagate the event further.
	/// Parameters:
	///	- event: UnsafeMutablePointer<GdkEvent>!
	/// - Returns: Bool
	open func handleEvent(_ event: UnsafeMutablePointer<GdkEvent>!) -> Bool {
		return gtk_search_entry_handle_event(GTK_SEARCH_ENTRY(self.GOBJECT), event) != 0 ? true : false
	}

}
