/*
 * CGTKFlowBox.swift
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

public let GTK_TYPE_FLOW_BOX: GType = gtk_flow_box_get_type()

@inline(__always) public func GTK_FLOW_BOX(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFlowBox>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FLOW_BOX)
}

/// A GtkFlowBox positions child widgets in sequence according to its
/// orientation.
/// For instance, with the horizontal orientation, the widgets will be
/// arranged from left to right, starting a new row under the previous
/// row when necessary. Reducing the width in this case will require more
/// rows, so a larger height will be requested.
/// Likewise, with the vertical orientation, the widgets will be arranged
/// from top to bottom, starting a new column to the right when necessary.
/// Reducing the height will require more columns, so a larger width will
/// be requested.
/// The size request of a GtkFlowBox alone may not be what you expect; if you
/// need to be able to shrink it along both axes and dynamically reflow its
/// children, you may have to wrap it in a #GtkScrolledWindow to enable that.
/// The children of a GtkFlowBox can be dynamically sorted and filtered.
/// Although a GtkFlowBox must have only #GtkFlowBoxChild children,
/// you can add any kind of widget to it via gtk_container_add(), and
/// a GtkFlowBoxChild widget will automatically be inserted between
/// the box and the widget.
/// Also see #GtkListBox.
/// GtkFlowBox was added in GTK+ 3.12.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// flowbox
/// ├── flowboxchild
/// │   ╰── <child>
/// ├── flowboxchild
/// │   ╰── <child>
/// ┊
/// ╰── [rubberband]
/// ]|
/// GtkFlowBox uses a single CSS node with name flowbox. GtkFlowBoxChild
/// uses a single CSS node with name flowboxchild.
/// For rubberband selection, a subnode with name rubberband is used.


open class CGTKFlowBox : CGTKContainer, CGTKOrientable {
	/// Creates a GtkFlowBox.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_flow_box_new())!
	}

	open var FLOWBOX: UnsafeMutablePointer<GtkFlowBox>! {
		get {
			return GTK_FLOW_BOX(self.GOBJECT)
		}
	}

	/// Binds @model to @box.
	/// If @box was already bound to a model, that previous binding is
	/// destroyed.
	/// The contents of @box are cleared and then filled with widgets that
	/// represent items from @model. @box is updated whenever @model changes.
	/// If @model is %NULL, @box is left empty.
	/// It is undefined to add or remove widgets directly (for example, with
	/// gtk_flow_box_insert() or gtk_container_add()) while @box is bound to a
	/// model.
	/// Note that using a model is incompatible with the filtering and sorting
	/// functionality in GtkFlowBox. When using a model, filtering and sorting
	/// should be implemented by the model.
	/// - Parameters:
	///	- model: OpaquePointer? (GListModel*)
	///	- createWidgetFunc: @escaping GtkFlowBoxCreateWidgetFunc (GtkFlowBoxCreateWidgetFunc)
	///	- userData: gpointer? (gpointer)
	///	- userDataFreeFunc: @escaping GDestroyNotify (GDestroyNotify)
	open func bindModel(_ model: OpaquePointer?, createWidgetFunc: @escaping GtkFlowBoxCreateWidgetFunc, userData: gpointer?, userDataFreeFunc: @escaping GDestroyNotify) -> Swift.Void {
		gtk_flow_box_bind_model(GTK_FLOW_BOX(self.GOBJECT), model, createWidgetFunc, userData, userDataFreeFunc)
	}

	/// Returns whether children activate on single clicks.
	/// - Returns: Bool (gboolean)
	open func getActivateOnSingleClick() -> Bool {
		return gtk_flow_box_get_activate_on_single_click(GTK_FLOW_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the nth child in the @box.
	/// - Parameters:
	///	- idx: gint (gint)
	/// - Returns: UnsafeMutablePointer<GtkFlowBoxChild>? (GtkFlowBoxChild*)
	open func getChildAtIndex(idx: gint) -> UnsafeMutablePointer<GtkFlowBoxChild>? {
		return gtk_flow_box_get_child_at_index(GTK_FLOW_BOX(self.GOBJECT), idx)
	}

	/// Gets the child in the (@x, @y) position.
	/// - Parameters:
	///	- x: gint (gint)
	///	- y: gint (gint)
	/// - Returns: UnsafeMutablePointer<GtkFlowBoxChild>? (GtkFlowBoxChild*)
	open func getChildAtPos(x: gint, y: gint) -> UnsafeMutablePointer<GtkFlowBoxChild>? {
		return gtk_flow_box_get_child_at_pos(GTK_FLOW_BOX(self.GOBJECT), x, y)
	}

	/// Gets the horizontal spacing.
	/// - Returns: guint (guint)
	open func getColumnSpacing() -> guint {
		return gtk_flow_box_get_column_spacing(GTK_FLOW_BOX(self.GOBJECT))
	}

	/// Returns whether the box is homogeneous (all children are the
	/// same size). See gtk_box_set_homogeneous().
	/// - Returns: Bool (gboolean)
	open func getHomogeneous() -> Bool {
		return gtk_flow_box_get_homogeneous(GTK_FLOW_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the maximum number of children per line.
	/// - Returns: guint (guint)
	open func getMaxChildrenPerLine() -> guint {
		return gtk_flow_box_get_max_children_per_line(GTK_FLOW_BOX(self.GOBJECT))
	}

	/// Gets the minimum number of children per line.
	/// - Returns: guint (guint)
	open func getMinChildrenPerLine() -> guint {
		return gtk_flow_box_get_min_children_per_line(GTK_FLOW_BOX(self.GOBJECT))
	}

	/// Gets the vertical spacing.
	/// - Returns: guint (guint)
	open func getRowSpacing() -> guint {
		return gtk_flow_box_get_row_spacing(GTK_FLOW_BOX(self.GOBJECT))
	}

	/// Creates a list of all selected children.
	/// - Returns: UnsafeMutablePointer<GList>! (GList*)
	open func getSelectedChildren() -> UnsafeMutablePointer<GList>! {
		return gtk_flow_box_get_selected_children(GTK_FLOW_BOX(self.GOBJECT))
	}

	/// Gets the selection mode of @box.
	/// - Returns: GtkSelectionMode (GtkSelectionMode)
	open func getSelectionMode() -> GtkSelectionMode {
		return gtk_flow_box_get_selection_mode(GTK_FLOW_BOX(self.GOBJECT))
	}

	/// Inserts the @widget into @box at @position.
	/// If a sort function is set, the widget will actually be inserted
	/// at the calculated position and this function has the same effect
	/// as gtk_container_add().
	/// If @position is -1, or larger than the total number of children
	/// in the @box, then the @widget will be appended to the end.
	/// - Parameters:
	///	- widget: CGTKWidget (GtkWidget*)
	///	- position: gint (gint)
	open func insert(widget: CGTKWidget, position: gint) -> Swift.Void {
		gtk_flow_box_insert(GTK_FLOW_BOX(self.GOBJECT), widget.WIDGET, position)
	}

	/// Updates the filtering for all children.
	/// Call this function when the result of the filter
	/// function on the @box is changed due ot an external
	/// factor. For instance, this would be used if the
	/// filter function just looked for a specific search
	/// term, and the entry with the string has changed.
	open func invalidateFilter() -> Swift.Void {
		gtk_flow_box_invalidate_filter(GTK_FLOW_BOX(self.GOBJECT))
	}

	/// Updates the sorting for all children.
	/// Call this when the result of the sort function on
	/// @box is changed due to an external factor.
	open func invalidateSort() -> Swift.Void {
		gtk_flow_box_invalidate_sort(GTK_FLOW_BOX(self.GOBJECT))
	}

	/// Select all children of @box, if the selection
	/// mode allows it.
	open func selectAll() -> Swift.Void {
		gtk_flow_box_select_all(GTK_FLOW_BOX(self.GOBJECT))
	}

	/// Selects a single child of @box, if the selection
	/// mode allows it.
	/// - Parameters:
	///	- child: UnsafeMutablePointer<GtkFlowBoxChild>! (GtkFlowBoxChild*)
	open func selectChild(_ child: UnsafeMutablePointer<GtkFlowBoxChild>!) -> Swift.Void {
		gtk_flow_box_select_child(GTK_FLOW_BOX(self.GOBJECT), child)
	}

	/// Calls a function for each selected child.
	/// Note that the selection cannot be modified from within
	/// this function.
	/// - Parameters:
	///	- function: @escaping GtkFlowBoxForeachFunc (GtkFlowBoxForeachFunc)
	///	- data: gpointer? (gpointer)
	open func selectedForeach(function: @escaping GtkFlowBoxForeachFunc, data: gpointer?) -> Swift.Void {
		gtk_flow_box_selected_foreach(GTK_FLOW_BOX(self.GOBJECT), function, data)
	}

	/// If @single is %TRUE, children will be activated when you click
	/// on them, otherwise you need to double-click.
	/// - Parameters:
	///	- single: Bool (gboolean)
	open func setActivateOnSingleClick(single: Bool) -> Swift.Void {
		gtk_flow_box_set_activate_on_single_click(GTK_FLOW_BOX(self.GOBJECT), single ? 1 : 0)
	}

	/// Sets the horizontal space to add between children.
	/// See the #GtkFlowBox:column-spacing property.
	/// - Parameters:
	///	- spacing: guint (guint)
	open func setColumnSpacing(_ spacing: guint) -> Swift.Void {
		gtk_flow_box_set_column_spacing(GTK_FLOW_BOX(self.GOBJECT), spacing)
	}

	/// By setting a filter function on the @box one can decide dynamically
	/// which of the children to show. For instance, to implement a search
	/// function that only shows the children matching the search terms.
	/// The @filter_func will be called for each child after the call, and
	/// it will continue to be called each time a child changes (via
	/// gtk_flow_box_child_changed()) or when gtk_flow_box_invalidate_filter()
	/// is called.
	/// Note that using a filter function is incompatible with using a model
	/// (see gtk_flow_box_bind_model()).
	/// - Parameters:
	///	- filterFunc: @escaping GtkFlowBoxFilterFunc (GtkFlowBoxFilterFunc)
	///	- userData: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setFilterFunc(_ filterFunc: @escaping GtkFlowBoxFilterFunc, userData: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_flow_box_set_filter_func(GTK_FLOW_BOX(self.GOBJECT), filterFunc, userData, destroy)
	}

	/// Hooks up an adjustment to focus handling in @box.
	/// The adjustment is also used for autoscrolling during
	/// rubberband selection. See gtk_scrolled_window_get_hadjustment()
	/// for a typical way of obtaining the adjustment, and
	/// gtk_flow_box_set_vadjustment()for setting the vertical
	/// adjustment.
	/// The adjustments have to be in pixel units and in the same
	/// coordinate system as the allocation for immediate children
	/// of the box.
	/// - Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func setHadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>!) -> Swift.Void {
		gtk_flow_box_set_hadjustment(GTK_FLOW_BOX(self.GOBJECT), adjustment)
	}

	/// Sets the #GtkFlowBox:homogeneous property of @box, controlling
	/// whether or not all children of @box are given equal space
	/// in the box.
	/// - Parameters:
	///	- homogeneous: Bool (gboolean)
	open func setHomogeneous(_ homogeneous: Bool) -> Swift.Void {
		gtk_flow_box_set_homogeneous(GTK_FLOW_BOX(self.GOBJECT), homogeneous ? 1 : 0)
	}

	/// Sets the maximum number of children to request and
	/// allocate space for in @box’s orientation.
	/// Setting the maximum number of children per line
	/// limits the overall natural size request to be no more
	/// than @n_children children long in the given orientation.
	/// - Parameters:
	///	- nchildren: guint (guint)
	open func setMaxChildrenPerLine(nchildren: guint) -> Swift.Void {
		gtk_flow_box_set_max_children_per_line(GTK_FLOW_BOX(self.GOBJECT), nchildren)
	}

	/// Sets the minimum number of children to line up
	/// in @box’s orientation before flowing.
	/// - Parameters:
	///	- nchildren: guint (guint)
	open func setMinChildrenPerLine(nchildren: guint) -> Swift.Void {
		gtk_flow_box_set_min_children_per_line(GTK_FLOW_BOX(self.GOBJECT), nchildren)
	}

	/// Sets the vertical space to add between children.
	/// See the #GtkFlowBox:row-spacing property.
	/// - Parameters:
	///	- spacing: guint (guint)
	open func setRowSpacing(_ spacing: guint) -> Swift.Void {
		gtk_flow_box_set_row_spacing(GTK_FLOW_BOX(self.GOBJECT), spacing)
	}

	/// Sets how selection works in @box.
	/// See #GtkSelectionMode for details.
	/// - Parameters:
	///	- mode: GtkSelectionMode (GtkSelectionMode)
	open func setSelectionMode(_ mode: GtkSelectionMode) -> Swift.Void {
		gtk_flow_box_set_selection_mode(GTK_FLOW_BOX(self.GOBJECT), mode)
	}

	/// By setting a sort function on the @box, one can dynamically
	/// reorder the children of the box, based on the contents of
	/// the children.
	/// The @sort_func will be called for each child after the call,
	/// and will continue to be called each time a child changes (via
	/// gtk_flow_box_child_changed()) and when gtk_flow_box_invalidate_sort()
	/// is called.
	/// Note that using a sort function is incompatible with using a model
	/// (see gtk_flow_box_bind_model()).
	/// - Parameters:
	///	- sortFunc: @escaping GtkFlowBoxSortFunc (GtkFlowBoxSortFunc)
	///	- userData: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setSortFunc(_ sortFunc: @escaping GtkFlowBoxSortFunc, userData: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_flow_box_set_sort_func(GTK_FLOW_BOX(self.GOBJECT), sortFunc, userData, destroy)
	}

	/// Hooks up an adjustment to focus handling in @box.
	/// The adjustment is also used for autoscrolling during
	/// rubberband selection. See gtk_scrolled_window_get_vadjustment()
	/// for a typical way of obtaining the adjustment, and
	/// gtk_flow_box_set_hadjustment()for setting the horizontal
	/// adjustment.
	/// The adjustments have to be in pixel units and in the same
	/// coordinate system as the allocation for immediate children
	/// of the box.
	/// - Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func setVadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>!) -> Swift.Void {
		gtk_flow_box_set_vadjustment(GTK_FLOW_BOX(self.GOBJECT), adjustment)
	}

	/// Unselect all children of @box, if the selection
	/// mode allows it.
	open func unselectAll() -> Swift.Void {
		gtk_flow_box_unselect_all(GTK_FLOW_BOX(self.GOBJECT))
	}

	/// Unselects a single child of @box, if the selection
	/// mode allows it.
	/// - Parameters:
	///	- child: UnsafeMutablePointer<GtkFlowBoxChild>! (GtkFlowBoxChild*)
	open func unselectChild(_ child: UnsafeMutablePointer<GtkFlowBoxChild>!) -> Swift.Void {
		gtk_flow_box_unselect_child(GTK_FLOW_BOX(self.GOBJECT), child)
	}

	/// Retrieves the orientation of the @orientable.
	/// - Returns: GtkOrientation (GtkOrientation)
	open func getOrientation() -> GtkOrientation {
		return gtk_orientable_get_orientation(GTK_ORIENTABLE(self.GOBJECT))
	}

	/// Sets the orientation of the @orientable.
	/// - Parameters:
	///	- orientation: GtkOrientation (GtkOrientation)
	open func setOrientation(_ orientation: GtkOrientation) -> Swift.Void {
		gtk_orientable_set_orientation(GTK_ORIENTABLE(self.GOBJECT), orientation)
	}

}
