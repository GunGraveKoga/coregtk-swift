/*
 * CGTKListBoxRow.swift
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

public let GTK_TYPE_LIST_BOX_ROW: GType = gtk_list_box_row_get_type()

@inline(__always) public func GTK_LIST_BOX_ROW(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkListBoxRow>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_LIST_BOX_ROW)
}

open class CGTKListBoxRow : CGTKBin, CGTKActionable {
	/// Creates a new #GtkListBoxRow, to be used as a child of a #GtkListBox.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_list_box_row_new())!
	}

	open var LISTBOXROW: UnsafeMutablePointer<GtkListBoxRow>! {
		get {
			return GTK_LIST_BOX_ROW(self.GOBJECT)
		}
	}

	/// Marks @row as changed, causing any state that depends on this
	/// to be updated. This affects sorting, filtering and headers.
	/// Note that calls to this method must be in sync with the data
	/// used for the row functions. For instance, if the list is
	/// mirroring some external data set, and *two* rows changed in the
	/// external data set then when you call gtk_list_box_row_changed()
	/// on the first row the sort function must only read the new data
	/// for the first of the two changed rows, otherwise the resorting
	/// of the rows will be wrong.
	/// This generally means that if you don’t fully control the data
	/// model you have to duplicate the data that affects the listbox
	/// row functions into the row widgets themselves. Another alternative
	/// is to call gtk_list_box_invalidate_sort() on any model change,
	/// but that is more expensive.
	open func changed() -> Swift.Void {
		gtk_list_box_row_changed(GTK_LIST_BOX_ROW(self.GOBJECT))
	}

	/// Gets the value of the #GtkListBoxRow:activatable property
	/// for this row.
	/// - Returns: Bool (gboolean)
	open func getActivatable() -> Bool {
		return gtk_list_box_row_get_activatable(GTK_LIST_BOX_ROW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the current header of the @row. This can be used
	/// in a #GtkListBoxUpdateHeaderFunc to see if there is a header
	/// set already, and if so to update the state of it.
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getHeader<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_list_box_row_get_header(GTK_LIST_BOX_ROW(self.GOBJECT)))
	}

	/// Gets the current index of the @row in its #GtkListBox container.
	/// - Returns: gint (gint)
	open func getIndex() -> gint {
		return gtk_list_box_row_get_index(GTK_LIST_BOX_ROW(self.GOBJECT))
	}

	/// Gets the value of the #GtkListBoxRow:selectable property
	/// for this row.
	/// - Returns: Bool (gboolean)
	open func getSelectable() -> Bool {
		return gtk_list_box_row_get_selectable(GTK_LIST_BOX_ROW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the child is currently selected in its
	/// #GtkListBox container.
	/// - Returns: Bool (gboolean)
	open func isSelected() -> Bool {
		return gtk_list_box_row_is_selected(GTK_LIST_BOX_ROW(self.GOBJECT)) != 0 ? true : false
	}

	/// Set the #GtkListBoxRow:activatable property for this row.
	/// - Parameters:
	///	- activatable: Bool (gboolean)
	open func setActivatable(_ activatable: Bool) -> Swift.Void {
		gtk_list_box_row_set_activatable(GTK_LIST_BOX_ROW(self.GOBJECT), activatable ? 1 : 0)
	}

	/// Sets the current header of the @row. This is only allowed to be called
	/// from a #GtkListBoxUpdateHeaderFunc. It will replace any existing
	/// header in the row, and be shown in front of the row in the listbox.
	/// - Parameters:
	///	- header: CGTKWidget (GtkWidget*)
	open func setHeader(_ header: CGTKWidget) -> Swift.Void {
		gtk_list_box_row_set_header(GTK_LIST_BOX_ROW(self.GOBJECT), header.WIDGET)
	}

	/// Set the #GtkListBoxRow:selectable property for this row.
	/// - Parameters:
	///	- selectable: Bool (gboolean)
	open func setSelectable(_ selectable: Bool) -> Swift.Void {
		gtk_list_box_row_set_selectable(GTK_LIST_BOX_ROW(self.GOBJECT), selectable ? 1 : 0)
	}

	/// Gets the action name for @actionable.
	/// See gtk_actionable_set_action_name() for more information.
	/// - Returns: String? (const gchar*)
	open func getActionName() -> String? {
		return String(utf8String: gtk_actionable_get_action_name(GTK_ACTIONABLE(self.GOBJECT)))
	}

	/// Gets the current target value of @actionable.
	/// See gtk_actionable_set_action_target_value() for more information.
	/// - Returns: OpaquePointer (GVariant*)
	open func getActionTargetValue() -> OpaquePointer {
		return gtk_actionable_get_action_target_value(GTK_ACTIONABLE(self.GOBJECT))
	}

	/// Specifies the name of the action with which this widget should be
	/// associated.  If @action_name is %NULL then the widget will be
	/// unassociated from any previous action.
	/// Usually this function is used when the widget is located (or will be
	/// located) within the hierarchy of a #GtkApplicationWindow.
	/// Names are of the form “win.save” or “app.quit” for actions on the
	/// containing #GtkApplicationWindow or its associated #GtkApplication,
	/// respectively.  This is the same form used for actions in the #GMenu
	/// associated with the window.
	/// - Parameters:
	///	- actionName: String (const gchar*)
	open func setActionName(_ actionName: String) -> Swift.Void {
		gtk_actionable_set_action_name(GTK_ACTIONABLE(self.GOBJECT), actionName)
	}

	/// Sets the target value of an actionable widget.
	/// If @target_value is %NULL then the target value is unset.
	/// The target value has two purposes.  First, it is used as the
	/// parameter to activation of the action associated with the
	/// #GtkActionable widget. Second, it is used to determine if the widget
	/// should be rendered as “active” — the widget is active if the state
	/// is equal to the given target.
	/// Consider the example of associating a set of buttons with a #GAction
	/// with string state in a typical “radio button” situation.  Each button
	/// will be associated with the same action, but with a different target
	/// value for that action.  Clicking on a particular button will activate
	/// the action with the target of that button, which will typically cause
	/// the action’s state to change to that value.  Since the action’s state
	/// is now equal to the target value of the button, the button will now
	/// be rendered as active (and the other buttons, with different targets,
	/// rendered inactive).
	/// - Parameters:
	///	- targetValue: OpaquePointer! (GVariant*)
	open func setActionTargetValue(_ targetValue: OpaquePointer!) -> Swift.Void {
		gtk_actionable_set_action_target_value(GTK_ACTIONABLE(self.GOBJECT), targetValue)
	}

	/// Sets the action-name and associated string target value of an
	/// actionable widget.
	/// @detailed_action_name is a string in the format accepted by
	/// g_action_parse_detailed_name().
	/// (Note that prior to version 3.22.25,
	/// this function is only usable for actions with a simple "s" target, and
	/// @detailed_action_name must be of the form `"action::target"` where
	/// `action` is the action name and `target` is the string to use
	/// as the target.)
	/// - Parameters:
	///	- detailedActionName: String (const gchar*)
	open func setDetailedActionName(_ detailedActionName: String) -> Swift.Void {
		gtk_actionable_set_detailed_action_name(GTK_ACTIONABLE(self.GOBJECT), detailedActionName)
	}

}
