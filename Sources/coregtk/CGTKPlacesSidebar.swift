/*
 * CGTKPlacesSidebar.swift
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

public let GTK_TYPE_PLACES_SIDEBAR: GType = gtk_places_sidebar_get_type()

@inline(__always) public func GTK_PLACES_SIDEBAR(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_PLACES_SIDEBAR)
}

/// 
/// #GtkPlacesSidebar is a widget that displays a list of frequently-used places in the
/// file system:  the user’s home directory, the user’s bookmarks, and volumes and drives.
/// This widget is used as a sidebar in #GtkFileChooser and may be used by file managers
/// and similar programs.
/// The places sidebar displays drives and volumes, and will automatically mount
/// or unmount them when the user selects them.
/// Applications can hook to various signals in the places sidebar to customize
/// its behavior.  For example, they can add extra commands to the context menu
/// of the sidebar.
/// While bookmarks are completely in control of the user, the places sidebar also
/// allows individual applications to provide extra shortcut folders that are unique
/// to each application.  For example, a Paint program may want to add a shortcut
/// for a Clipart folder.  You can do this with gtk_places_sidebar_add_shortcut().
/// To make use of the places sidebar, an application at least needs to connect
/// to the #GtkPlacesSidebar::open-location signal.  This is emitted when the
/// user selects in the sidebar a location to open.  The application should also
/// call gtk_places_sidebar_set_location() when it changes the currently-viewed
/// location.
/// # CSS nodes
/// GtkPlacesSidebar uses a single CSS node with name placessidebar and style
/// class .sidebar.
/// Among the children of the places sidebar, the following style classes can
/// be used:
/// - .sidebar-new-bookmark-row for the 'Add new bookmark' row
/// - .sidebar-placeholder-row for a row that is a placeholder
/// - .has-open-popup when a popup is open for a row


open class CGTKPlacesSidebar : CGTKScrolledWindow {
	/// 
	/// Creates a new #GtkPlacesSidebar widget.
	/// The application should connect to at least the
	/// #GtkPlacesSidebar::open-location signal to be notified
	/// when the user makes a selection in the sidebar.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_places_sidebar_new())!
	}

	open var PLACESSIDEBAR: OpaquePointer! {
		get {
			return GTK_PLACES_SIDEBAR(self.GOBJECT)
		}
	}

	/// 
	/// Applications may want to present some folders in the places sidebar if
	/// they could be immediately useful to users.  For example, a drawing
	/// program could add a “/usr/share/clipart” location when the sidebar is
	/// being used in an “Insert Clipart” dialog box.
	/// This function adds the specified @location to a special place for immutable
	/// shortcuts.  The shortcuts are application-specific; they are not shared
	/// across applications, and they are not persistent.  If this function
	/// is called multiple times with different locations, then they are added
	/// to the sidebar’s list in the same order as the function is called.
	/// Parameters:
	///	- location: OpaquePointer!
	open func addShortcut(location: OpaquePointer!) {
		gtk_places_sidebar_add_shortcut(GTK_PLACES_SIDEBAR(self.GOBJECT), location)
	}

	/// 
	/// Returns the value previously set with gtk_places_sidebar_set_local_only().
	/// - Returns: Bool
	open func getLocalOnly() -> Bool {
		return gtk_places_sidebar_get_local_only(GTK_PLACES_SIDEBAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the currently selected location in the @sidebar. This can be %NULL when
	/// nothing is selected, for example, when gtk_places_sidebar_set_location() has
	/// been called with a location that is not among the sidebar’s list of places to
	/// show.
	/// You can use this function to get the selection in the @sidebar.  Also, if you
	/// connect to the #GtkPlacesSidebar::populate-popup signal, you can use this
	/// function to get the location that is being referred to during the callbacks
	/// for your menu items.
	/// - Returns: OpaquePointer?
	open func getLocation() -> OpaquePointer? {
		return gtk_places_sidebar_get_location(GTK_PLACES_SIDEBAR(self.GOBJECT))
	}

	/// 
	/// This function queries the bookmarks added by the user to the places sidebar,
	/// and returns one of them.  This function is used by #GtkFileChooser to implement
	/// the “Alt-1”, “Alt-2”, etc. shortcuts, which activate the cooresponding bookmark.
	/// Parameters:
	///	- n: gint
	/// - Returns: OpaquePointer?
	open func getNthBookmark(n: gint) -> OpaquePointer? {
		return gtk_places_sidebar_get_nth_bookmark(GTK_PLACES_SIDEBAR(self.GOBJECT), n)
	}

	/// 
	/// Gets the open flags.
	/// - Returns: GtkPlacesOpenFlags
	open func getOpenFlags() -> GtkPlacesOpenFlags {
		return gtk_places_sidebar_get_open_flags(GTK_PLACES_SIDEBAR(self.GOBJECT))
	}

	/// 
	/// Returns the value previously set with gtk_places_sidebar_set_show_connect_to_server()
	/// - Returns: Bool
	open func getShowConnectToServer() -> Bool {
		return gtk_places_sidebar_get_show_connect_to_server(GTK_PLACES_SIDEBAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the value previously set with gtk_places_sidebar_set_show_desktop()
	/// - Returns: Bool
	open func getShowDesktop() -> Bool {
		return gtk_places_sidebar_get_show_desktop(GTK_PLACES_SIDEBAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the value previously set with gtk_places_sidebar_set_show_enter_location()
	/// - Returns: Bool
	open func getShowEnterLocation() -> Bool {
		return gtk_places_sidebar_get_show_enter_location(GTK_PLACES_SIDEBAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the value previously set with gtk_places_sidebar_set_show_other_locations()
	/// - Returns: Bool
	open func getShowOtherLocations() -> Bool {
		return gtk_places_sidebar_get_show_other_locations(GTK_PLACES_SIDEBAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the value previously set with gtk_places_sidebar_set_show_recent()
	/// - Returns: Bool
	open func getShowRecent() -> Bool {
		return gtk_places_sidebar_get_show_recent(GTK_PLACES_SIDEBAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the value previously set with gtk_places_sidebar_set_show_starred_location()
	/// - Returns: Bool
	open func getShowStarredLocation() -> Bool {
		return gtk_places_sidebar_get_show_starred_location(GTK_PLACES_SIDEBAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the value previously set with gtk_places_sidebar_set_show_trash()
	/// - Returns: Bool
	open func getShowTrash() -> Bool {
		return gtk_places_sidebar_get_show_trash(GTK_PLACES_SIDEBAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the list of shortcuts.
	/// - Returns: UnsafeMutablePointer<GSList>!
	open func listShortcuts() -> UnsafeMutablePointer<GSList>! {
		return gtk_places_sidebar_list_shortcuts(GTK_PLACES_SIDEBAR(self.GOBJECT))
	}

	/// 
	/// Removes an application-specific shortcut that has been previously been
	/// inserted with gtk_places_sidebar_add_shortcut().  If the @location is not a
	/// shortcut in the sidebar, then nothing is done.
	/// Parameters:
	///	- location: OpaquePointer!
	open func removeShortcut(location: OpaquePointer!) {
		gtk_places_sidebar_remove_shortcut(GTK_PLACES_SIDEBAR(self.GOBJECT), location)
	}

	/// 
	/// Make the GtkPlacesSidebar show drop targets, so it can show the available
	/// drop targets and a "new bookmark" row. This improves the Drag-and-Drop
	/// experience of the user and allows applications to show all available
	/// drop targets at once.
	/// This needs to be called when the application is aware of an ongoing drag
	/// that might target the sidebar. The drop-targets-visible state will be unset
	/// automatically if the drag finishes in the GtkPlacesSidebar. You only need
	/// to unset the state when the drag ends on some other widget on your application.
	/// Parameters:
	///	- visible: Bool
	///	- context: OpaquePointer!
	open func setDropTargetsVisible(_ visible: Bool, context: OpaquePointer!) {
		gtk_places_sidebar_set_drop_targets_visible(GTK_PLACES_SIDEBAR(self.GOBJECT), visible ? 1 : 0, context)
	}

	/// 
	/// Sets whether the @sidebar should only show local files.
	/// Parameters:
	///	- localOnly: Bool
	open func setLocalOnly(_ localOnly: Bool) {
		gtk_places_sidebar_set_local_only(GTK_PLACES_SIDEBAR(self.GOBJECT), localOnly ? 1 : 0)
	}

	/// 
	/// Sets the location that is being shown in the widgets surrounding the
	/// @sidebar, for example, in a folder view in a file manager.  In turn, the
	/// @sidebar will highlight that location if it is being shown in the list of
	/// places, or it will unhighlight everything if the @location is not among the
	/// places in the list.
	/// Parameters:
	///	- location: OpaquePointer?
	open func setLocation(_ location: OpaquePointer?) {
		gtk_places_sidebar_set_location(GTK_PLACES_SIDEBAR(self.GOBJECT), location)
	}

	/// 
	/// Sets the way in which the calling application can open new locations from
	/// the places sidebar.  For example, some applications only open locations
	/// “directly” into their main view, while others may support opening locations
	/// in a new notebook tab or a new window.
	/// This function is used to tell the places @sidebar about the ways in which the
	/// application can open new locations, so that the sidebar can display (or not)
	/// the “Open in new tab” and “Open in new window” menu items as appropriate.
	/// When the #GtkPlacesSidebar::open-location signal is emitted, its flags
	/// argument will be set to one of the @flags that was passed in
	/// gtk_places_sidebar_set_open_flags().
	/// Passing 0 for @flags will cause #GTK_PLACES_OPEN_NORMAL to always be sent
	/// to callbacks for the “open-location” signal.
	/// Parameters:
	///	- flags: GtkPlacesOpenFlags
	open func setOpenFlags(_ flags: GtkPlacesOpenFlags) {
		gtk_places_sidebar_set_open_flags(GTK_PLACES_SIDEBAR(self.GOBJECT), flags)
	}

	/// 
	/// Sets whether the @sidebar should show an item for connecting to a network server;
	/// this is off by default. An application may want to turn this on if it implements
	/// a way for the user to connect to network servers directly.
	/// If you enable this, you should connect to the
	/// #GtkPlacesSidebar::show-connect-to-server signal.
	/// Parameters:
	///	- showConnectToServer: Bool
	open func setShowConnectToServer(_ showConnectToServer: Bool) {
		gtk_places_sidebar_set_show_connect_to_server(GTK_PLACES_SIDEBAR(self.GOBJECT), showConnectToServer ? 1 : 0)
	}

	/// 
	/// Sets whether the @sidebar should show an item for the Desktop folder.
	/// The default value for this option is determined by the desktop
	/// environment and the user’s configuration, but this function can be
	/// used to override it on a per-application basis.
	/// Parameters:
	///	- showDesktop: Bool
	open func setShowDesktop(_ showDesktop: Bool) {
		gtk_places_sidebar_set_show_desktop(GTK_PLACES_SIDEBAR(self.GOBJECT), showDesktop ? 1 : 0)
	}

	/// 
	/// Sets whether the @sidebar should show an item for entering a location;
	/// this is off by default. An application may want to turn this on if manually
	/// entering URLs is an expected user action.
	/// If you enable this, you should connect to the
	/// #GtkPlacesSidebar::show-enter-location signal.
	/// Parameters:
	///	- showEnterLocation: Bool
	open func setShowEnterLocation(_ showEnterLocation: Bool) {
		gtk_places_sidebar_set_show_enter_location(GTK_PLACES_SIDEBAR(self.GOBJECT), showEnterLocation ? 1 : 0)
	}

	/// 
	/// Sets whether the @sidebar should show an item for the application to show
	/// an Other Locations view; this is off by default. When set to %TRUE, persistent
	/// devices such as hard drives are hidden, otherwise they are shown in the sidebar.
	/// An application may want to turn this on if it implements a way for the user to
	/// see and interact with drives and network servers directly.
	/// If you enable this, you should connect to the
	/// #GtkPlacesSidebar::show-other-locations signal.
	/// Parameters:
	///	- showOtherLocations: Bool
	open func setShowOtherLocations(_ showOtherLocations: Bool) {
		gtk_places_sidebar_set_show_other_locations(GTK_PLACES_SIDEBAR(self.GOBJECT), showOtherLocations ? 1 : 0)
	}

	/// 
	/// Sets whether the @sidebar should show an item for recent files.
	/// The default value for this option is determined by the desktop
	/// environment, but this function can be used to override it on a
	/// per-application basis.
	/// Parameters:
	///	- showRecent: Bool
	open func setShowRecent(_ showRecent: Bool) {
		gtk_places_sidebar_set_show_recent(GTK_PLACES_SIDEBAR(self.GOBJECT), showRecent ? 1 : 0)
	}

	/// 
	/// If you enable this, you should connect to the
	/// #GtkPlacesSidebar::show-starred-location signal.
	/// Parameters:
	///	- showStarredLocation: Bool
	open func setShowStarredLocation(_ showStarredLocation: Bool) {
		gtk_places_sidebar_set_show_starred_location(GTK_PLACES_SIDEBAR(self.GOBJECT), showStarredLocation ? 1 : 0)
	}

	/// 
	/// Sets whether the @sidebar should show an item for the Trash location.
	/// Parameters:
	///	- showTrash: Bool
	open func setShowTrash(_ showTrash: Bool) {
		gtk_places_sidebar_set_show_trash(GTK_PLACES_SIDEBAR(self.GOBJECT), showTrash ? 1 : 0)
	}

}
