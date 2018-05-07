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


open class CGTKRecentChooserMenu : CGTKMenu, CGTKActivatable, CGTKRecentChooser {
	/// Creates a new #GtkRecentChooserMenu widget.
	/// This kind of widget shows the list of recently used resources as
	/// a menu, each item as a menu item.  Each item inside the menu might
	/// have an icon, representing its MIME type, and a number, for mnemonic
	/// access.
	/// This widget implements the #GtkRecentChooser interface.
	/// This widget creates its own #GtkRecentManager object.  See the
	/// gtk_recent_chooser_menu_new_for_manager() function to know how to create
	/// a #GtkRecentChooserMenu widget bound to another #GtkRecentManager object.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_recent_chooser_menu_new())!
	}

	/// Creates a new #GtkRecentChooserMenu widget using @manager as
	/// the underlying recently used resources manager.
	/// This is useful if you have implemented your own recent manager,
	/// or if you have a customized instance of a #GtkRecentManager
	/// object or if you wish to share a common #GtkRecentManager object
	/// among multiple #GtkRecentChooser widgets.
	/// - Parameters:
	///	- manager: UnsafeMutablePointer<GtkRecentManager>! (GtkRecentManager*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(forManager manager: UnsafeMutablePointer<GtkRecentManager>!) {
		self.init(withGObject: gtk_recent_chooser_menu_new_for_manager(manager))!
	}

	open var RECENTCHOOSERMENU: UnsafeMutablePointer<GtkRecentChooserMenu>! {
		get {
			return GTK_RECENT_CHOOSER_MENU(self.GOBJECT)
		}
	}

	/// Returns the value set by gtk_recent_chooser_menu_set_show_numbers().
	/// - Returns: Bool (gboolean)
	open func getShowNumbers() -> Bool {
		return gtk_recent_chooser_menu_get_show_numbers(GTK_RECENT_CHOOSER_MENU(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets whether a number should be added to the items of @menu.  The
	/// numbers are shown to provide a unique character for a mnemonic to
	/// be used inside ten menu item’s label.  Only the first the items
	/// get a number to avoid clashes.
	/// - Parameters:
	///	- showNumbers: Bool (gboolean)
	open func setShowNumbers(_ showNumbers: Bool) -> Swift.Void {
		gtk_recent_chooser_menu_set_show_numbers(GTK_RECENT_CHOOSER_MENU(self.GOBJECT), showNumbers ? 1 : 0)
	}

	/// This is a utility function for #GtkActivatable implementors.
	/// When implementing #GtkActivatable you must call this when
	/// handling changes of the #GtkActivatable:related-action, and
	/// you must also use this to break references in #GObject->dispose().
	/// This function adds a reference to the currently set related
	/// action for you, it also makes sure the #GtkActivatable->update()
	/// method is called when the related #GtkAction properties change
	/// and registers to the action’s proxy list.
	/// > Be careful to call this before setting the local
	/// > copy of the #GtkAction property, since this function uses
	/// > gtk_activatable_get_related_action() to retrieve the
	/// > previous action.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func doSetRelatedAction(_ action: UnsafeMutablePointer<GtkAction>!) -> Swift.Void {
		gtk_activatable_do_set_related_action(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

	/// Gets the related #GtkAction for @activatable.
	/// - Returns: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func getRelatedAction() -> UnsafeMutablePointer<GtkAction>! {
		return gtk_activatable_get_related_action(GTK_ACTIVATABLE(self.GOBJECT))
	}

	/// Gets whether this activatable should reset its layout
	/// and appearance when setting the related action or when
	/// the action changes appearance.
	/// - Returns: Bool (gboolean)
	open func getUseActionAppearance() -> Bool {
		return gtk_activatable_get_use_action_appearance(GTK_ACTIVATABLE(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the related action on the @activatable object.
	/// > #GtkActivatable implementors need to handle the #GtkActivatable:related-action
	/// > property and call gtk_activatable_do_set_related_action() when it changes.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func setRelatedAction(_ action: UnsafeMutablePointer<GtkAction>!) -> Swift.Void {
		gtk_activatable_set_related_action(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

	/// Sets whether this activatable should reset its layout and appearance
	/// when setting the related action or when the action changes appearance
	/// > #GtkActivatable implementors need to handle the
	/// > #GtkActivatable:use-action-appearance property and call
	/// > gtk_activatable_sync_action_properties() to update @activatable
	/// > if needed.
	/// - Parameters:
	///	- useAppearance: Bool (gboolean)
	open func setUseActionAppearance(useAppearance: Bool) -> Swift.Void {
		gtk_activatable_set_use_action_appearance(GTK_ACTIVATABLE(self.GOBJECT), useAppearance ? 1 : 0)
	}

	/// This is called to update the activatable completely, this is called
	/// internally when the #GtkActivatable:related-action property is set
	/// or unset and by the implementing class when
	/// #GtkActivatable:use-action-appearance changes.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>? (GtkAction*)
	open func syncActionProperties(action: UnsafeMutablePointer<GtkAction>?) -> Swift.Void {
		gtk_activatable_sync_action_properties(GTK_ACTIVATABLE(self.GOBJECT), action)
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
