/*
 * CGTKBox.swift
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

public let GTK_TYPE_BOX: GType = gtk_box_get_type()

@inline(__always) public func GTK_BOX(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkBox>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_BOX)
}

/// 
/// The GtkBox widget organizes child widgets into a rectangular area.
/// The rectangular area of a GtkBox is organized into either a single row
/// or a single column of child widgets depending upon the orientation.
/// Thus, all children of a GtkBox are allocated one dimension in common,
/// which is the height of a row, or the width of a column.
/// GtkBox uses a notion of packing. Packing refers
/// to adding widgets with reference to a particular position in a
/// #GtkContainer. For a GtkBox, there are two reference positions: the
/// start and the end of the box.
/// For a vertical #GtkBox, the start is defined as the top of the box and
/// the end is defined as the bottom. For a horizontal #GtkBox the start
/// is defined as the left side and the end is defined as the right side.
/// Use repeated calls to gtk_box_pack_start() to pack widgets into a
/// GtkBox from start to end. Use gtk_box_pack_end() to add widgets from
/// end to start. You may intersperse these calls and add widgets from
/// both ends of the same GtkBox.
/// Because GtkBox is a #GtkContainer, you may also use gtk_container_add()
/// to insert widgets into the box, and they will be packed with the default
/// values for expand and fill child properties. Use gtk_container_remove()
/// to remove widgets from the GtkBox.
/// Use gtk_box_set_homogeneous() to specify whether or not all children
/// of the GtkBox are forced to get the same amount of space.
/// Use gtk_box_set_spacing() to determine how much space will be
/// minimally placed between all children in the GtkBox. Note that
/// spacing is added between the children, while
/// padding added by gtk_box_pack_start() or gtk_box_pack_end() is added
/// on either side of the widget it belongs to.
/// Use gtk_box_reorder_child() to move a GtkBox child to a different
/// place in the box.
/// Use gtk_box_set_child_packing() to reset the expand,
/// fill and padding child properties.
/// Use gtk_box_query_child_packing() to query these fields.
/// Note that a single-row or single-column #GtkGrid provides exactly
/// the same functionality as #GtkBox.
/// # CSS nodes
/// GtkBox uses a single CSS node with name box.
/// In horizontal orientation, the nodes of the children are always arranged
/// from left to right. So :first-child will always select the leftmost child,
/// regardless of text direction.


open class CGTKBox : CGTKContainer {
	/// 
	/// Creates a new #GtkBox.
	/// Parameters:
	///	- orientation: GtkOrientation
	///	- spacing: gint
	/// - Returns: CGTKWidget
	public convenience init(orientation: GtkOrientation, spacing: gint) {
		self.init(withGObject: gtk_box_new(orientation, spacing))!
	}

	open var BOX: UnsafeMutablePointer<GtkBox>! {
		get {
			return GTK_BOX(self.GOBJECT)
		}
	}

	/// 
	/// Gets the value set by gtk_box_set_baseline_position().
	/// - Returns: GtkBaselinePosition
	open func getBaselinePosition() -> GtkBaselinePosition {
		return gtk_box_get_baseline_position(GTK_BOX(self.GOBJECT))
	}

	/// 
	/// Retrieves the center widget of the box.
	/// - Returns: CGTKWidget?
	open func getCenterWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_box_get_center_widget(GTK_BOX(self.GOBJECT)))
	}

	/// 
	/// Returns whether the box is homogeneous (all children are the
	/// same size). See gtk_box_set_homogeneous().
	/// - Returns: Bool
	open func getHomogeneous() -> Bool {
		return gtk_box_get_homogeneous(GTK_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the value set by gtk_box_set_spacing().
	/// - Returns: gint
	open func getSpacing() -> gint {
		return gtk_box_get_spacing(GTK_BOX(self.GOBJECT))
	}

	/// 
	/// Adds @child to @box, packed with reference to the end of @box.
	/// The @child is packed after (away from end of) any other child
	/// packed with reference to the end of @box.
	/// Parameters:
	///	- child: CGTKWidget
	///	- expand: Bool
	///	- fill: Bool
	///	- padding: guint
	open func packEnd(child: CGTKWidget, expand: Bool, fill: Bool, padding: guint) {
		gtk_box_pack_end(GTK_BOX(self.GOBJECT), child.WIDGET, expand ? 1 : 0, fill ? 1 : 0, padding)
	}

	/// 
	/// Adds @child to @box, packed with reference to the start of @box.
	/// The @child is packed after any other child packed with reference
	/// to the start of @box.
	/// Parameters:
	///	- child: CGTKWidget
	///	- expand: Bool
	///	- fill: Bool
	///	- padding: guint
	open func packStart(child: CGTKWidget, expand: Bool, fill: Bool, padding: guint) {
		gtk_box_pack_start(GTK_BOX(self.GOBJECT), child.WIDGET, expand ? 1 : 0, fill ? 1 : 0, padding)
	}

	/// 
	/// Obtains information about how @child is packed into @box.
	/// Parameters:
	///	- child: CGTKWidget
	///	- expand: UnsafeMutablePointer<gboolean>!
	///	- fill: UnsafeMutablePointer<gboolean>!
	///	- padding: UnsafeMutablePointer<UInt32>!
	///	- packType: UnsafeMutablePointer<GtkPackType>!
	open func queryChildPacking(child: CGTKWidget, expand: UnsafeMutablePointer<gboolean>!, fill: UnsafeMutablePointer<gboolean>!, padding: UnsafeMutablePointer<UInt32>!, packType: UnsafeMutablePointer<GtkPackType>!) {
		gtk_box_query_child_packing(GTK_BOX(self.GOBJECT), child.WIDGET, expand, fill, padding, packType)
	}

	/// 
	/// Moves @child to a new @position in the list of @box children.
	/// The list contains widgets packed #GTK_PACK_START
	/// as well as widgets packed #GTK_PACK_END, in the order that these
	/// widgets were added to @box.
	/// A widget’s position in the @box children list determines where
	/// the widget is packed into @box.  A child widget at some position
	/// in the list will be packed just after all other widgets of the
	/// same packing type that appear earlier in the list.
	/// Parameters:
	///	- child: CGTKWidget
	///	- position: gint
	open func reorderChild(_ child: CGTKWidget, position: gint) {
		gtk_box_reorder_child(GTK_BOX(self.GOBJECT), child.WIDGET, position)
	}

	/// 
	/// Sets the baseline position of a box. This affects
	/// only horizontal boxes with at least one baseline aligned
	/// child. If there is more vertical space available than requested,
	/// and the baseline is not allocated by the parent then
	/// @position is used to allocate the baseline wrt the
	/// extra space available.
	/// Parameters:
	///	- position: GtkBaselinePosition
	open func setBaselinePosition(_ position: GtkBaselinePosition) {
		gtk_box_set_baseline_position(GTK_BOX(self.GOBJECT), position)
	}

	/// 
	/// Sets a center widget; that is a child widget that will be
	/// centered with respect to the full width of the box, even
	/// if the children at either side take up different amounts
	/// of space.
	/// Parameters:
	///	- widget: CGTKWidget
	open func setCenterWidget(_ widget: CGTKWidget) {
		gtk_box_set_center_widget(GTK_BOX(self.GOBJECT), widget.WIDGET)
	}

	/// 
	/// Sets the way @child is packed into @box.
	/// Parameters:
	///	- child: CGTKWidget
	///	- expand: Bool
	///	- fill: Bool
	///	- padding: guint
	///	- packType: GtkPackType
	open func setChildPacking(child: CGTKWidget, expand: Bool, fill: Bool, padding: guint, packType: GtkPackType) {
		gtk_box_set_child_packing(GTK_BOX(self.GOBJECT), child.WIDGET, expand ? 1 : 0, fill ? 1 : 0, padding, packType)
	}

	/// 
	/// Sets the #GtkBox:homogeneous property of @box, controlling
	/// whether or not all children of @box are given equal space
	/// in the box.
	/// Parameters:
	///	- homogeneous: Bool
	open func setHomogeneous(_ homogeneous: Bool) {
		gtk_box_set_homogeneous(GTK_BOX(self.GOBJECT), homogeneous ? 1 : 0)
	}

	/// 
	/// Sets the #GtkBox:spacing property of @box, which is the
	/// number of pixels to place between children of @box.
	/// Parameters:
	///	- spacing: gint
	open func setSpacing(_ spacing: gint) {
		gtk_box_set_spacing(GTK_BOX(self.GOBJECT), spacing)
	}

}
