/*
 * CGTKRecentChooser.swift
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

public let GTK_TYPE_RECENT_CHOOSER: GType = gtk_recent_chooser_get_type()

@inline(__always) public func GTK_RECENT_CHOOSER(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_RECENT_CHOOSER)
}

/// #GtkRecentChooser is an interface that can be implemented by widgets
/// displaying the list of recently used files.  In GTK+, the main objects
/// that implement this interface are #GtkRecentChooserWidget,
/// #GtkRecentChooserDialog and #GtkRecentChooserMenu.
/// Recently used files are supported since GTK+ 2.10.


public protocol CGTKRecentChooser: class {
	/// Adds @filter to the list of #GtkRecentFilter objects held by @chooser.
	/// If no previous filter objects were defined, this function will call
	/// gtk_recent_chooser_set_filter().
	/// - Parameters:
	///	- filter: OpaquePointer! (GtkRecentFilter*)
	func addFilter(_ filter: OpaquePointer!) -> Swift.Void

	/// Gets the #GtkRecentInfo currently selected by @chooser.
	/// - Returns: OpaquePointer (GtkRecentInfo*)
	func getCurrentItem() -> OpaquePointer

	/// Gets the URI currently selected by @chooser.
	/// - Returns: String? (gchar*)
	func getCurrentUri() -> String?

	/// Gets the #GtkRecentFilter object currently used by @chooser to affect
	/// the display of the recently used resources.
	/// - Returns: OpaquePointer (GtkRecentFilter*)
	func getFilter() -> OpaquePointer

	/// Gets the list of recently used resources in form of #GtkRecentInfo objects.
	/// The return value of this function is affected by the “sort-type” and
	/// “limit” properties of @chooser.
	/// - Returns: UnsafeMutablePointer<GList>! (GList*)
	func getItems() -> UnsafeMutablePointer<GList>!

	/// Gets the number of items returned by gtk_recent_chooser_get_items()
	/// and gtk_recent_chooser_get_uris().
	/// - Returns: gint (gint)
	func getLimit() -> gint

	/// Gets whether only local resources should be shown in the recently used
	/// resources selector.  See gtk_recent_chooser_set_local_only()
	/// - Returns: Bool (gboolean)
	func getLocalOnly() -> Bool

	/// Gets whether @chooser can select multiple items.
	/// - Returns: Bool (gboolean)
	func getSelectMultiple() -> Bool

	/// Retrieves whether @chooser should show an icon near the resource.
	/// - Returns: Bool (gboolean)
	func getShowIcons() -> Bool

	/// Retrieves whether @chooser should show the recently used resources that
	/// were not found.
	/// - Returns: Bool (gboolean)
	func getShowNotFound() -> Bool

	/// Returns whether @chooser should display recently used resources
	/// registered as private.
	/// - Returns: Bool (gboolean)
	func getShowPrivate() -> Bool

	/// Gets whether @chooser should display tooltips containing the full path
	/// of a recently user resource.
	/// - Returns: Bool (gboolean)
	func getShowTips() -> Bool

	/// Gets the value set by gtk_recent_chooser_set_sort_type().
	/// - Returns: GtkRecentSortType (GtkRecentSortType)
	func getSortType() -> GtkRecentSortType

	/// Gets the URI of the recently used resources.
	/// The return value of this function is affected by the “sort-type” and “limit”
	/// properties of @chooser.
	/// Since the returned array is %NULL terminated, @length may be %NULL.
	/// - Parameters:
	///	- length: UnsafeMutablePointer<gsize>! (gsize*)
	/// - Returns: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! (gchar**)
	func getUris(length: UnsafeMutablePointer<gsize>!) -> UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!

	/// Gets the #GtkRecentFilter objects held by @chooser.
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	func listFilters() -> UnsafeMutablePointer<GSList>!

	/// Removes @filter from the list of #GtkRecentFilter objects held by @chooser.
	/// - Parameters:
	///	- filter: OpaquePointer! (GtkRecentFilter*)
	func removeFilter(_ filter: OpaquePointer!) -> Swift.Void

	/// Selects all the items inside @chooser, if the @chooser supports
	/// multiple selection.
	func selectAll() -> Swift.Void

	/// Selects @uri inside @chooser.
	/// - Parameters:
	///	- uri: String (const gchar*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? (GError**)
	/// - Returns: Bool (gboolean)
	func selectUri(_ uri: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>?) -> Bool

	/// Sets @uri as the current URI for @chooser.
	/// - Parameters:
	///	- uri: String (const gchar*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? (GError**)
	/// - Returns: Bool (gboolean)
	func setCurrentUri(_ uri: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>?) -> Bool

	/// Sets @filter as the current #GtkRecentFilter object used by @chooser
	/// to affect the displayed recently used resources.
	/// - Parameters:
	///	- filter: OpaquePointer? (GtkRecentFilter*)
	func setFilter(_ filter: OpaquePointer?) -> Swift.Void

	/// Sets the number of items that should be returned by
	/// gtk_recent_chooser_get_items() and gtk_recent_chooser_get_uris().
	/// - Parameters:
	///	- limit: gint (gint)
	func setLimit(_ limit: gint) -> Swift.Void

	/// Sets whether only local resources, that is resources using the file:// URI
	/// scheme, should be shown in the recently used resources selector.  If
	/// @local_only is %TRUE (the default) then the shown resources are guaranteed
	/// to be accessible through the operating system native file system.
	/// - Parameters:
	///	- localOnly: Bool (gboolean)
	func setLocalOnly(_ localOnly: Bool) -> Swift.Void

	/// Sets whether @chooser can select multiple items.
	/// - Parameters:
	///	- selectMultiple: Bool (gboolean)
	func setSelectMultiple(_ selectMultiple: Bool) -> Swift.Void

	/// Sets whether @chooser should show an icon near the resource when
	/// displaying it.
	/// - Parameters:
	///	- showIcons: Bool (gboolean)
	func setShowIcons(_ showIcons: Bool) -> Swift.Void

	/// Sets whether @chooser should display the recently used resources that
	/// it didn’t find.  This only applies to local resources.
	/// - Parameters:
	///	- showNotFound: Bool (gboolean)
	func setShowNotFound(_ showNotFound: Bool) -> Swift.Void

	/// Whether to show recently used resources marked registered as private.
	/// - Parameters:
	///	- showPrivate: Bool (gboolean)
	func setShowPrivate(_ showPrivate: Bool) -> Swift.Void

	/// Sets whether to show a tooltips containing the full path of each
	/// recently used resource in a #GtkRecentChooser widget.
	/// - Parameters:
	///	- showTips: Bool (gboolean)
	func setShowTips(_ showTips: Bool) -> Swift.Void

	/// Sets the comparison function used when sorting to be @sort_func.  If
	/// the @chooser has the sort type set to #GTK_RECENT_SORT_CUSTOM then
	/// the chooser will sort using this function.
	/// To the comparison function will be passed two #GtkRecentInfo structs and
	/// @sort_data;  @sort_func should return a positive integer if the first
	/// item comes before the second, zero if the two items are equal and
	/// a negative integer if the first item comes after the second.
	/// - Parameters:
	///	- sortFunc: @escaping GtkRecentSortFunc (GtkRecentSortFunc)
	///	- sortData: gpointer (gpointer)
	///	- dataDestroy: @escaping GDestroyNotify (GDestroyNotify)
	func setSortFunc(_ sortFunc: @escaping GtkRecentSortFunc, sortData: gpointer, dataDestroy: @escaping GDestroyNotify) -> Swift.Void

	/// Changes the sorting order of the recently used resources list displayed by
	/// @chooser.
	/// - Parameters:
	///	- sortType: GtkRecentSortType (GtkRecentSortType)
	func setSortType(_ sortType: GtkRecentSortType) -> Swift.Void

	/// Unselects all the items inside @chooser.
	func unselectAll() -> Swift.Void

	/// Unselects @uri inside @chooser.
	/// - Parameters:
	///	- uri: String (const gchar*)
	func unselectUri(_ uri: String) -> Swift.Void

}
