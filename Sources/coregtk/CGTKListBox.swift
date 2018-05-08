/*
 * CGTKListBox.swift
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

public let GTK_TYPE_LIST_BOX: GType = gtk_list_box_get_type()

@inline(__always) public func GTK_LIST_BOX(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkListBox>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_LIST_BOX)
}

/// A GtkListBox is a vertical container that contains GtkListBoxRow
/// children. These rows can by dynamically sorted and filtered, and
/// headers can be added dynamically depending on the row content.
/// It also allows keyboard and mouse navigation and selection like
/// a typical list.
/// Using GtkListBox is often an alternative to #GtkTreeView, especially
/// when the list contents has a more complicated layout than what is allowed
/// by a #GtkCellRenderer, or when the contents is interactive (i.e. has a
/// button in it).
/// Although a #GtkListBox must have only #GtkListBoxRow children you can
/// add any kind of widget to it via gtk_container_add(), and a #GtkListBoxRow
/// widget will automatically be inserted between the list and the widget.
/// #GtkListBoxRows can be marked as activatable or selectable. If a row
/// is activatable, #GtkListBox::row-activated will be emitted for it when
/// the user tries to activate it. If it is selectable, the row will be marked
/// as selected when the user tries to select it.
/// The GtkListBox widget was added in GTK+ 3.10.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// list
/// ╰── row[.activatable]
/// ]|
/// GtkListBox uses a single CSS node named list. Each GtkListBoxRow uses
/// a single CSS node named row. The row nodes get the .activatable
/// style class added when appropriate.


open class CGTKListBox : CGTKContainer {
	/// Creates a new #GtkListBox container.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_list_box_new())!
	}

	open var LISTBOX: UnsafeMutablePointer<GtkListBox>! {
		get {
			return GTK_LIST_BOX(self.GOBJECT)
		}
	}

	/// Binds @model to @box.
	/// If @box was already bound to a model, that previous binding is
	/// destroyed.
	/// The contents of @box are cleared and then filled with widgets that
	/// represent items from @model. @box is updated whenever @model changes.
	/// If @model is %NULL, @box is left empty.
	/// It is undefined to add or remove widgets directly (for example, with
	/// gtk_list_box_insert() or gtk_container_add()) while @box is bound to a
	/// model.
	/// Note that using a model is incompatible with the filtering and sorting
	/// functionality in GtkListBox. When using a model, filtering and sorting
	/// should be implemented by the model.
	/// - Parameters:
	///	- model: OpaquePointer? (GListModel*)
	///	- createWidgetFunc: @escaping GtkListBoxCreateWidgetFunc (GtkListBoxCreateWidgetFunc)
	///	- userData: gpointer? (gpointer)
	///	- userDataFreeFunc: @escaping GDestroyNotify (GDestroyNotify)
	open func bindModel(_ model: OpaquePointer?, createWidgetFunc: @escaping GtkListBoxCreateWidgetFunc, userData: gpointer?, userDataFreeFunc: @escaping GDestroyNotify) -> Swift.Void {
		gtk_list_box_bind_model(GTK_LIST_BOX(self.GOBJECT), model, createWidgetFunc, userData, userDataFreeFunc)
	}

	/// This is a helper function for implementing DnD onto a #GtkListBox.
	/// The passed in @row will be highlighted via gtk_drag_highlight(),
	/// and any previously highlighted row will be unhighlighted.
	/// The row will also be unhighlighted when the widget gets
	/// a drag leave event.
	/// - Parameters:
	///	- row: UnsafeMutablePointer<GtkListBoxRow>! (GtkListBoxRow*)
	open func dragHighlightRow(_ row: UnsafeMutablePointer<GtkListBoxRow>!) -> Swift.Void {
		gtk_list_box_drag_highlight_row(GTK_LIST_BOX(self.GOBJECT), row)
	}

	/// If a row has previously been highlighted via gtk_list_box_drag_highlight_row()
	/// it will have the highlight removed.
	open func dragUnhighlightRow() -> Swift.Void {
		gtk_list_box_drag_unhighlight_row(GTK_LIST_BOX(self.GOBJECT))
	}

	/// Returns whether rows activate on single clicks.
	/// - Returns: Bool (gboolean)
	open func getActivateOnSingleClick() -> Bool {
		return gtk_list_box_get_activate_on_single_click(GTK_LIST_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the adjustment (if any) that the widget uses to
	/// for vertical scrolling.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func getAdjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_list_box_get_adjustment(GTK_LIST_BOX(self.GOBJECT))
	}

	/// Gets the n-th child in the list (not counting headers).
	/// If @_index is negative or larger than the number of items in the
	/// list, %NULL is returned.
	/// - Parameters:
	///	- index: gint (gint)
	/// - Returns: UnsafeMutablePointer<GtkListBoxRow>? (GtkListBoxRow*)
	open func getRowAtIndex(_ index: gint) -> UnsafeMutablePointer<GtkListBoxRow>? {
		return gtk_list_box_get_row_at_index(GTK_LIST_BOX(self.GOBJECT), index)
	}

	/// Gets the row at the @y position.
	/// - Parameters:
	///	- y: gint (gint)
	/// - Returns: UnsafeMutablePointer<GtkListBoxRow>? (GtkListBoxRow*)
	open func getRowAtY(_ y: gint) -> UnsafeMutablePointer<GtkListBoxRow>? {
		return gtk_list_box_get_row_at_y(GTK_LIST_BOX(self.GOBJECT), y)
	}

	/// Gets the selected row.
	/// Note that the box may allow multiple selection, in which
	/// case you should use gtk_list_box_selected_foreach() to
	/// find all selected rows.
	/// - Returns: UnsafeMutablePointer<GtkListBoxRow>! (GtkListBoxRow*)
	open func getSelectedRow() -> UnsafeMutablePointer<GtkListBoxRow>! {
		return gtk_list_box_get_selected_row(GTK_LIST_BOX(self.GOBJECT))
	}

	/// Creates a list of all selected children.
	/// - Returns: UnsafeMutablePointer<GList>! (GList*)
	open func getSelectedRows() -> UnsafeMutablePointer<GList>! {
		return gtk_list_box_get_selected_rows(GTK_LIST_BOX(self.GOBJECT))
	}

	/// Gets the selection mode of the listbox.
	/// - Returns: GtkSelectionMode (GtkSelectionMode)
	open func getSelectionMode() -> GtkSelectionMode {
		return gtk_list_box_get_selection_mode(GTK_LIST_BOX(self.GOBJECT))
	}

	/// Insert the @child into the @box at @position. If a sort function is
	/// set, the widget will actually be inserted at the calculated position and
	/// this function has the same effect of gtk_container_add().
	/// If @position is -1, or larger than the total number of items in the
	/// @box, then the @child will be appended to the end.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- position: gint (gint)
	open func insert(child: CGTKWidget, position: gint) -> Swift.Void {
		gtk_list_box_insert(GTK_LIST_BOX(self.GOBJECT), child.WIDGET, position)
	}

	/// Update the filtering for all rows. Call this when result
	/// of the filter function on the @box is changed due
	/// to an external factor. For instance, this would be used
	/// if the filter function just looked for a specific search
	/// string and the entry with the search string has changed.
	open func invalidateFilter() -> Swift.Void {
		gtk_list_box_invalidate_filter(GTK_LIST_BOX(self.GOBJECT))
	}

	/// Update the separators for all rows. Call this when result
	/// of the header function on the @box is changed due
	/// to an external factor.
	open func invalidateHeaders() -> Swift.Void {
		gtk_list_box_invalidate_headers(GTK_LIST_BOX(self.GOBJECT))
	}

	/// Update the sorting for all rows. Call this when result
	/// of the sort function on the @box is changed due
	/// to an external factor.
	open func invalidateSort() -> Swift.Void {
		gtk_list_box_invalidate_sort(GTK_LIST_BOX(self.GOBJECT))
	}

	/// Prepend a widget to the list. If a sort function is set, the widget will
	/// actually be inserted at the calculated position and this function has the
	/// same effect of gtk_container_add().
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func prepend(child: CGTKWidget) -> Swift.Void {
		gtk_list_box_prepend(GTK_LIST_BOX(self.GOBJECT), child.WIDGET)
	}

	/// Select all children of @box, if the selection mode allows it.
	open func selectAll() -> Swift.Void {
		gtk_list_box_select_all(GTK_LIST_BOX(self.GOBJECT))
	}

	/// Make @row the currently selected row.
	/// - Parameters:
	///	- row: UnsafeMutablePointer<GtkListBoxRow>? (GtkListBoxRow*)
	open func selectRow(_ row: UnsafeMutablePointer<GtkListBoxRow>?) -> Swift.Void {
		gtk_list_box_select_row(GTK_LIST_BOX(self.GOBJECT), row)
	}

	/// Calls a function for each selected child.
	/// Note that the selection cannot be modified from within this function.
	/// - Parameters:
	///	- function: @escaping GtkListBoxForeachFunc (GtkListBoxForeachFunc)
	///	- data: gpointer? (gpointer)
	open func selectedForeach(function: @escaping GtkListBoxForeachFunc, data: gpointer?) -> Swift.Void {
		gtk_list_box_selected_foreach(GTK_LIST_BOX(self.GOBJECT), function, data)
	}

	/// If @single is %TRUE, rows will be activated when you click on them,
	/// otherwise you need to double-click.
	/// - Parameters:
	///	- single: Bool (gboolean)
	open func setActivateOnSingleClick(single: Bool) -> Swift.Void {
		gtk_list_box_set_activate_on_single_click(GTK_LIST_BOX(self.GOBJECT), single ? 1 : 0)
	}

	/// Sets the adjustment (if any) that the widget uses to
	/// for vertical scrolling. For instance, this is used
	/// to get the page size for PageUp/Down key handling.
	/// In the normal case when the @box is packed inside
	/// a #GtkScrolledWindow the adjustment from that will
	/// be picked up automatically, so there is no need
	/// to manually do that.
	/// - Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setAdjustment(_ adjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_list_box_set_adjustment(GTK_LIST_BOX(self.GOBJECT), adjustment)
	}

	/// By setting a filter function on the @box one can decide dynamically which
	/// of the rows to show. For instance, to implement a search function on a list that
	/// filters the original list to only show the matching rows.
	/// The @filter_func will be called for each row after the call, and it will
	/// continue to be called each time a row changes (via gtk_list_box_row_changed()) or
	/// when gtk_list_box_invalidate_filter() is called.
	/// Note that using a filter function is incompatible with using a model
	/// (see gtk_list_box_bind_model()).
	/// - Parameters:
	///	- filterFunc: @escaping GtkListBoxFilterFunc (GtkListBoxFilterFunc)
	///	- userData: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setFilterFunc(_ filterFunc: @escaping GtkListBoxFilterFunc, userData: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_list_box_set_filter_func(GTK_LIST_BOX(self.GOBJECT), filterFunc, userData, destroy)
	}

	/// By setting a header function on the @box one can dynamically add headers
	/// in front of rows, depending on the contents of the row and its position in the list.
	/// For instance, one could use it to add headers in front of the first item of a
	/// new kind, in a list sorted by the kind.
	/// The @update_header can look at the current header widget using gtk_list_box_row_get_header()
	/// and either update the state of the widget as needed, or set a new one using
	/// gtk_list_box_row_set_header(). If no header is needed, set the header to %NULL.
	/// Note that you may get many calls @update_header to this for a particular row when e.g.
	/// changing things that don’t affect the header. In this case it is important for performance
	/// to not blindly replace an existing header with an identical one.
	/// The @update_header function will be called for each row after the call, and it will
	/// continue to be called each time a row changes (via gtk_list_box_row_changed()) and when
	/// the row before changes (either by gtk_list_box_row_changed() on the previous row, or when
	/// the previous row becomes a different row). It is also called for all rows when
	/// gtk_list_box_invalidate_headers() is called.
	/// - Parameters:
	///	- updateHeader: @escaping GtkListBoxUpdateHeaderFunc (GtkListBoxUpdateHeaderFunc)
	///	- userData: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setHeaderFunc(updateHeader: @escaping GtkListBoxUpdateHeaderFunc, userData: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_list_box_set_header_func(GTK_LIST_BOX(self.GOBJECT), updateHeader, userData, destroy)
	}

	/// Sets the placeholder widget that is shown in the list when
	/// it doesn't display any visible children.
	/// - Parameters:
	///	- placeholder: CGTKWidget? (GtkWidget*)
	open func setPlaceholder(_ placeholder: CGTKWidget?) -> Swift.Void {
		gtk_list_box_set_placeholder(GTK_LIST_BOX(self.GOBJECT), placeholder?.WIDGET)
	}

	/// Sets how selection works in the listbox.
	/// See #GtkSelectionMode for details.
	/// - Parameters:
	///	- mode: GtkSelectionMode (GtkSelectionMode)
	open func setSelectionMode(_ mode: GtkSelectionMode) -> Swift.Void {
		gtk_list_box_set_selection_mode(GTK_LIST_BOX(self.GOBJECT), mode)
	}

	/// By setting a sort function on the @box one can dynamically reorder the rows
	/// of the list, based on the contents of the rows.
	/// The @sort_func will be called for each row after the call, and will continue to
	/// be called each time a row changes (via gtk_list_box_row_changed()) and when
	/// gtk_list_box_invalidate_sort() is called.
	/// Note that using a sort function is incompatible with using a model
	/// (see gtk_list_box_bind_model()).
	/// - Parameters:
	///	- sortFunc: @escaping GtkListBoxSortFunc (GtkListBoxSortFunc)
	///	- userData: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setSortFunc(_ sortFunc: @escaping GtkListBoxSortFunc, userData: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_list_box_set_sort_func(GTK_LIST_BOX(self.GOBJECT), sortFunc, userData, destroy)
	}

	/// Unselect all children of @box, if the selection mode allows it.
	open func unselectAll() -> Swift.Void {
		gtk_list_box_unselect_all(GTK_LIST_BOX(self.GOBJECT))
	}

	/// Unselects a single row of @box, if the selection mode allows it.
	/// - Parameters:
	///	- row: UnsafeMutablePointer<GtkListBoxRow>! (GtkListBoxRow*)
	open func unselectRow(_ row: UnsafeMutablePointer<GtkListBoxRow>!) -> Swift.Void {
		gtk_list_box_unselect_row(GTK_LIST_BOX(self.GOBJECT), row)
	}

}
