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

/// #GtkRecentChooserWidget is a widget suitable for selecting recently used
/// files.  It is the main building block of a #GtkRecentChooserDialog.  Most
/// applications will only need to use the latter; you can use
/// #GtkRecentChooserWidget as part of a larger window if you have special needs.
/// Note that #GtkRecentChooserWidget does not have any methods of its own.
/// Instead, you should use the functions that work on a #GtkRecentChooser.
/// Recently used files are supported since GTK+ 2.10.


open class CGTKRecentChooserWidget : CGTKBox, CGTKRecentChooser {
	/// Creates a new #GtkRecentChooserWidget object.  This is an embeddable widget
	/// used to access the recently used resources list.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_recent_chooser_widget_new())!
	}

	/// Creates a new #GtkRecentChooserWidget with a specified recent manager.
	/// This is useful if you have implemented your own recent manager, or if you
	/// have a customized instance of a #GtkRecentManager object.
	/// - Parameters:
	///	- manager: UnsafeMutablePointer<GtkRecentManager>! (GtkRecentManager*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(forManager manager: UnsafeMutablePointer<GtkRecentManager>!) {
		self.init(withGObject: gtk_recent_chooser_widget_new_for_manager(manager))!
	}

	open var RECENTCHOOSERWIDGET: UnsafeMutablePointer<GtkRecentChooserWidget>! {
		get {
			return GTK_RECENT_CHOOSER_WIDGET(self.GOBJECT)
		}
	}

	/// Adds @filter to the list of #GtkRecentFilter objects held by @chooser.
	/// If no previous filter objects were defined, this function will call
	/// gtk_recent_chooser_set_filter().
	/// - Parameters:
	///	- filter: OpaquePointer! (GtkRecentFilter*)
	open func addFilter(_ filter: OpaquePointer!) -> Swift.Void {
		gtk_recent_chooser_add_filter(GTK_RECENT_CHOOSER(self.GOBJECT), filter)
	}

	/// Gets the #GtkRecentInfo currently selected by @chooser.
	/// - Returns: OpaquePointer (GtkRecentInfo*)
	open func getCurrentItem() -> OpaquePointer {
		return gtk_recent_chooser_get_current_item(GTK_RECENT_CHOOSER(self.GOBJECT))
	}

	/// Gets the URI currently selected by @chooser.
	/// - Returns: String? (gchar*)
	open func getCurrentUri() -> String? {
		return String(utf8String: gtk_recent_chooser_get_current_uri(GTK_RECENT_CHOOSER(self.GOBJECT)))
	}

	/// Gets the #GtkRecentFilter object currently used by @chooser to affect
	/// the display of the recently used resources.
	/// - Returns: OpaquePointer (GtkRecentFilter*)
	open func getFilter() -> OpaquePointer {
		return gtk_recent_chooser_get_filter(GTK_RECENT_CHOOSER(self.GOBJECT))
	}

	/// Gets the list of recently used resources in form of #GtkRecentInfo objects.
	/// The return value of this function is affected by the “sort-type” and
	/// “limit” properties of @chooser.
	/// - Returns: UnsafeMutablePointer<GList>! (GList*)
	open func getItems() -> UnsafeMutablePointer<GList>! {
		return gtk_recent_chooser_get_items(GTK_RECENT_CHOOSER(self.GOBJECT))
	}

	/// Gets the number of items returned by gtk_recent_chooser_get_items()
	/// and gtk_recent_chooser_get_uris().
	/// - Returns: gint (gint)
	open func getLimit() -> gint {
		return gtk_recent_chooser_get_limit(GTK_RECENT_CHOOSER(self.GOBJECT))
	}

	/// Gets whether only local resources should be shown in the recently used
	/// resources selector.  See gtk_recent_chooser_set_local_only()
	/// - Returns: Bool (gboolean)
	open func getLocalOnly() -> Bool {
		return gtk_recent_chooser_get_local_only(GTK_RECENT_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets whether @chooser can select multiple items.
	/// - Returns: Bool (gboolean)
	open func getSelectMultiple() -> Bool {
		return gtk_recent_chooser_get_select_multiple(GTK_RECENT_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Retrieves whether @chooser should show an icon near the resource.
	/// - Returns: Bool (gboolean)
	open func getShowIcons() -> Bool {
		return gtk_recent_chooser_get_show_icons(GTK_RECENT_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Retrieves whether @chooser should show the recently used resources that
	/// were not found.
	/// - Returns: Bool (gboolean)
	open func getShowNotFound() -> Bool {
		return gtk_recent_chooser_get_show_not_found(GTK_RECENT_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether @chooser should display recently used resources
	/// registered as private.
	/// - Returns: Bool (gboolean)
	open func getShowPrivate() -> Bool {
		return gtk_recent_chooser_get_show_private(GTK_RECENT_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets whether @chooser should display tooltips containing the full path
	/// of a recently user resource.
	/// - Returns: Bool (gboolean)
	open func getShowTips() -> Bool {
		return gtk_recent_chooser_get_show_tips(GTK_RECENT_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the value set by gtk_recent_chooser_set_sort_type().
	/// - Returns: GtkRecentSortType (GtkRecentSortType)
	open func getSortType() -> GtkRecentSortType {
		return gtk_recent_chooser_get_sort_type(GTK_RECENT_CHOOSER(self.GOBJECT))
	}

	/// Gets the URI of the recently used resources.
	/// The return value of this function is affected by the “sort-type” and “limit”
	/// properties of @chooser.
	/// Since the returned array is %NULL terminated, @length may be %NULL.
	/// - Parameters:
	///	- length: UnsafeMutablePointer<gsize>! (gsize*)
	/// - Returns: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! (gchar**)
	open func getUris(length: UnsafeMutablePointer<gsize>!) -> UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! {
		return gtk_recent_chooser_get_uris(GTK_RECENT_CHOOSER(self.GOBJECT), length)
	}

	/// Gets the #GtkRecentFilter objects held by @chooser.
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	open func listFilters() -> UnsafeMutablePointer<GSList>! {
		return gtk_recent_chooser_list_filters(GTK_RECENT_CHOOSER(self.GOBJECT))
	}

	/// Removes @filter from the list of #GtkRecentFilter objects held by @chooser.
	/// - Parameters:
	///	- filter: OpaquePointer! (GtkRecentFilter*)
	open func removeFilter(_ filter: OpaquePointer!) -> Swift.Void {
		gtk_recent_chooser_remove_filter(GTK_RECENT_CHOOSER(self.GOBJECT), filter)
	}

	/// Selects all the items inside @chooser, if the @chooser supports
	/// multiple selection.
	open func selectAll() -> Swift.Void {
		gtk_recent_chooser_select_all(GTK_RECENT_CHOOSER(self.GOBJECT))
	}

	/// Selects @uri inside @chooser.
	/// - Parameters:
	///	- uri: String (const gchar*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil (GError**)
	/// - Returns: Bool (gboolean)
	open func selectUri(_ uri: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_recent_chooser_select_uri(GTK_RECENT_CHOOSER(self.GOBJECT), uri, err) != 0 ? true : false
	}

	/// Sets @uri as the current URI for @chooser.
	/// - Parameters:
	///	- uri: String (const gchar*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil (GError**)
	/// - Returns: Bool (gboolean)
	open func setCurrentUri(_ uri: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_recent_chooser_set_current_uri(GTK_RECENT_CHOOSER(self.GOBJECT), uri, err) != 0 ? true : false
	}

	/// Sets @filter as the current #GtkRecentFilter object used by @chooser
	/// to affect the displayed recently used resources.
	/// - Parameters:
	///	- filter: OpaquePointer? (GtkRecentFilter*)
	open func setFilter(_ filter: OpaquePointer?) -> Swift.Void {
		gtk_recent_chooser_set_filter(GTK_RECENT_CHOOSER(self.GOBJECT), filter)
	}

	/// Sets the number of items that should be returned by
	/// gtk_recent_chooser_get_items() and gtk_recent_chooser_get_uris().
	/// - Parameters:
	///	- limit: gint (gint)
	open func setLimit(_ limit: gint) -> Swift.Void {
		gtk_recent_chooser_set_limit(GTK_RECENT_CHOOSER(self.GOBJECT), limit)
	}

	/// Sets whether only local resources, that is resources using the file:// URI
	/// scheme, should be shown in the recently used resources selector.  If
	/// @local_only is %TRUE (the default) then the shown resources are guaranteed
	/// to be accessible through the operating system native file system.
	/// - Parameters:
	///	- localOnly: Bool (gboolean)
	open func setLocalOnly(_ localOnly: Bool) -> Swift.Void {
		gtk_recent_chooser_set_local_only(GTK_RECENT_CHOOSER(self.GOBJECT), localOnly ? 1 : 0)
	}

	/// Sets whether @chooser can select multiple items.
	/// - Parameters:
	///	- selectMultiple: Bool (gboolean)
	open func setSelectMultiple(_ selectMultiple: Bool) -> Swift.Void {
		gtk_recent_chooser_set_select_multiple(GTK_RECENT_CHOOSER(self.GOBJECT), selectMultiple ? 1 : 0)
	}

	/// Sets whether @chooser should show an icon near the resource when
	/// displaying it.
	/// - Parameters:
	///	- showIcons: Bool (gboolean)
	open func setShowIcons(_ showIcons: Bool) -> Swift.Void {
		gtk_recent_chooser_set_show_icons(GTK_RECENT_CHOOSER(self.GOBJECT), showIcons ? 1 : 0)
	}

	/// Sets whether @chooser should display the recently used resources that
	/// it didn’t find.  This only applies to local resources.
	/// - Parameters:
	///	- showNotFound: Bool (gboolean)
	open func setShowNotFound(_ showNotFound: Bool) -> Swift.Void {
		gtk_recent_chooser_set_show_not_found(GTK_RECENT_CHOOSER(self.GOBJECT), showNotFound ? 1 : 0)
	}

	/// Whether to show recently used resources marked registered as private.
	/// - Parameters:
	///	- showPrivate: Bool (gboolean)
	open func setShowPrivate(_ showPrivate: Bool) -> Swift.Void {
		gtk_recent_chooser_set_show_private(GTK_RECENT_CHOOSER(self.GOBJECT), showPrivate ? 1 : 0)
	}

	/// Sets whether to show a tooltips containing the full path of each
	/// recently used resource in a #GtkRecentChooser widget.
	/// - Parameters:
	///	- showTips: Bool (gboolean)
	open func setShowTips(_ showTips: Bool) -> Swift.Void {
		gtk_recent_chooser_set_show_tips(GTK_RECENT_CHOOSER(self.GOBJECT), showTips ? 1 : 0)
	}

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
	open func setSortFunc(_ sortFunc: @escaping GtkRecentSortFunc, sortData: gpointer, dataDestroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_recent_chooser_set_sort_func(GTK_RECENT_CHOOSER(self.GOBJECT), sortFunc, sortData, dataDestroy)
	}

	/// Changes the sorting order of the recently used resources list displayed by
	/// @chooser.
	/// - Parameters:
	///	- sortType: GtkRecentSortType (GtkRecentSortType)
	open func setSortType(_ sortType: GtkRecentSortType) -> Swift.Void {
		gtk_recent_chooser_set_sort_type(GTK_RECENT_CHOOSER(self.GOBJECT), sortType)
	}

	/// Unselects all the items inside @chooser.
	open func unselectAll() -> Swift.Void {
		gtk_recent_chooser_unselect_all(GTK_RECENT_CHOOSER(self.GOBJECT))
	}

	/// Unselects @uri inside @chooser.
	/// - Parameters:
	///	- uri: String (const gchar*)
	open func unselectUri(_ uri: String) -> Swift.Void {
		gtk_recent_chooser_unselect_uri(GTK_RECENT_CHOOSER(self.GOBJECT), uri)
	}

}
