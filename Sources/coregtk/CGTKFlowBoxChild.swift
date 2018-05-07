/*
 * CGTKFlowBoxChild.swift
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

public let GTK_TYPE_FLOW_BOX_CHILD: GType = gtk_flow_box_child_get_type()

@inline(__always) public func GTK_FLOW_BOX_CHILD(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFlowBoxChild>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FLOW_BOX_CHILD)
}

open class CGTKFlowBoxChild : CGTKBin {
	/// Creates a new #GtkFlowBoxChild, to be used as a child
	/// of a #GtkFlowBox.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_flow_box_child_new())!
	}

	open var FLOWBOXCHILD: UnsafeMutablePointer<GtkFlowBoxChild>! {
		get {
			return GTK_FLOW_BOX_CHILD(self.GOBJECT)
		}
	}

	/// Marks @child as changed, causing any state that depends on this
	/// to be updated. This affects sorting and filtering.
	/// Note that calls to this method must be in sync with the data
	/// used for the sorting and filtering functions. For instance, if
	/// the list is mirroring some external data set, and *two* children
	/// changed in the external data set when you call
	/// gtk_flow_box_child_changed() on the first child, the sort function
	/// must only read the new data for the first of the two changed
	/// children, otherwise the resorting of the children will be wrong.
	/// This generally means that if you don’t fully control the data
	/// model, you have to duplicate the data that affects the sorting
	/// and filtering functions into the widgets themselves. Another
	/// alternative is to call gtk_flow_box_invalidate_sort() on any
	/// model change, but that is more expensive.
	open func changed() -> Swift.Void {
		gtk_flow_box_child_changed(GTK_FLOW_BOX_CHILD(self.GOBJECT))
	}

	/// Gets the current index of the @child in its #GtkFlowBox container.
	/// - Returns: gint (gint)
	open func getIndex() -> gint {
		return gtk_flow_box_child_get_index(GTK_FLOW_BOX_CHILD(self.GOBJECT))
	}

	/// Returns whether the @child is currently selected in its
	/// #GtkFlowBox container.
	/// - Returns: Bool (gboolean)
	open func isSelected() -> Bool {
		return gtk_flow_box_child_is_selected(GTK_FLOW_BOX_CHILD(self.GOBJECT)) != 0 ? true : false
	}

}
