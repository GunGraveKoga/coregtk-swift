/*
 * CGTKFrame.swift
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

public let GTK_TYPE_FRAME: GType = gtk_frame_get_type()

@inline(__always) public func GTK_FRAME(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFrame>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FRAME)
}

/// The frame widget is a bin that surrounds its child with a decorative
/// frame and an optional label. If present, the label is drawn in a gap
/// in the top side of the frame. The position of the label can be
/// controlled with gtk_frame_set_label_align().
/// # GtkFrame as GtkBuildable
/// The GtkFrame implementation of the GtkBuildable interface supports
/// placing a child in the label position by specifying “label” as the
/// “type” attribute of a <child> element. A normal content child can
/// be specified without specifying a <child> type attribute.
/// An example of a UI definition fragment with GtkFrame:
/// |[
/// <object class="GtkFrame">
/// <child type="label">
/// <object class="GtkLabel" id="frame-label"/>
/// </child>
/// <child>
/// <object class="GtkEntry" id="frame-content"/>
/// </child>
/// </object>
/// ]|
/// # CSS nodes
/// |[<!-- language="plain" -->
/// frame
/// ├── border[.flat]
/// ├── <label widget>
/// ╰── <child>
/// ]|
/// GtkFrame has a main CSS node named “frame” and a subnode named “border”. The
/// “border” node is used to draw the visible border. You can set the appearance
/// of the border using CSS properties like “border-style” on the “border” node.
/// The border node can be given the style class “.flat”, which is used by themes
/// to disable drawing of the border. To do this from code, call
/// gtk_frame_set_shadow_type() with %GTK_SHADOW_NONE to add the “.flat” class or
/// any other shadow type to remove it.


open class CGTKFrame : CGTKBin {
	/// Creates a new #GtkFrame, with optional label @label.
	/// If @label is %NULL, the label is omitted.
	/// - Parameters:
	///	- label: String? (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(label: String?) {
		self.init(withGObject: gtk_frame_new(label))!
	}

	open var FRAME: UnsafeMutablePointer<GtkFrame>! {
		get {
			return GTK_FRAME(self.GOBJECT)
		}
	}

	/// If the frame’s label widget is a #GtkLabel, returns the
	/// text in the label widget. (The frame will have a #GtkLabel
	/// for the label widget if a non-%NULL argument was passed
	/// to gtk_frame_new().)
	/// - Returns: String? (const gchar*)
	open func getLabel() -> String? {
		return String(utf8String: gtk_frame_get_label(GTK_FRAME(self.GOBJECT)))
	}

	/// Retrieves the X and Y alignment of the frame’s label. See
	/// gtk_frame_set_label_align().
	/// - Parameters:
	///	- xalign: UnsafeMutablePointer<Float>! (gfloat*)
	///	- yalign: UnsafeMutablePointer<Float>! (gfloat*)
	open func getLabelAlign(xalign: UnsafeMutablePointer<Float>!, yalign: UnsafeMutablePointer<Float>!) -> Swift.Void {
		gtk_frame_get_label_align(GTK_FRAME(self.GOBJECT), xalign, yalign)
	}

	/// Retrieves the label widget for the frame. See
	/// gtk_frame_set_label_widget().
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getLabelWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_frame_get_label_widget(GTK_FRAME(self.GOBJECT)))
	}

	/// Retrieves the shadow type of the frame. See
	/// gtk_frame_set_shadow_type().
	/// - Returns: GtkShadowType (GtkShadowType)
	open func getShadowType() -> GtkShadowType {
		return gtk_frame_get_shadow_type(GTK_FRAME(self.GOBJECT))
	}

	/// Removes the current #GtkFrame:label-widget. If @label is not %NULL, creates a
	/// new #GtkLabel with that text and adds it as the #GtkFrame:label-widget.
	/// - Parameters:
	///	- label: String? (const gchar*)
	open func setLabel(_ label: String?) -> Swift.Void {
		gtk_frame_set_label(GTK_FRAME(self.GOBJECT), label)
	}

	/// Sets the alignment of the frame widget’s label. The
	/// default values for a newly created frame are 0.0 and 0.5.
	/// - Parameters:
	///	- xalign: Float (gfloat)
	///	- yalign: Float (gfloat)
	open func setLabelAlign(xalign: Float, yalign: Float) -> Swift.Void {
		gtk_frame_set_label_align(GTK_FRAME(self.GOBJECT), xalign, yalign)
	}

	/// Sets the #GtkFrame:label-widget for the frame. This is the widget that
	/// will appear embedded in the top edge of the frame as a title.
	/// - Parameters:
	///	- labelWidget: CGTKWidget? (GtkWidget*)
	open func setLabelWidget(_ labelWidget: CGTKWidget?) -> Swift.Void {
		gtk_frame_set_label_widget(GTK_FRAME(self.GOBJECT), labelWidget?.WIDGET)
	}

	/// Sets the #GtkFrame:shadow-type for @frame, i.e. whether it is drawn without
	/// (%GTK_SHADOW_NONE) or with (other values) a visible border. Values other than
	/// %GTK_SHADOW_NONE are treated identically by GtkFrame. The chosen type is
	/// applied by removing or adding the .flat class to the CSS node named border.
	/// - Parameters:
	///	- type: GtkShadowType (GtkShadowType)
	open func setShadowType(_ type: GtkShadowType) -> Swift.Void {
		gtk_frame_set_shadow_type(GTK_FRAME(self.GOBJECT), type)
	}

}
