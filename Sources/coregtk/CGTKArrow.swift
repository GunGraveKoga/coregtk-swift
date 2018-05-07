/*
 * CGTKArrow.swift
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

public let GTK_TYPE_ARROW: GType = gtk_arrow_get_type()

@inline(__always) public func GTK_ARROW(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkArrow>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_ARROW)
}

/// GtkArrow should be used to draw simple arrows that need to point in
/// one of the four cardinal directions (up, down, left, or right).  The
/// style of the arrow can be one of shadow in, shadow out, etched in, or
/// etched out.  Note that these directions and style types may be
/// amended in versions of GTK+ to come.
/// GtkArrow will fill any space alloted to it, but since it is inherited
/// from #GtkMisc, it can be padded and/or aligned, to fill exactly the
/// space the programmer desires.
/// Arrows are created with a call to gtk_arrow_new().  The direction or
/// style of an arrow can be changed after creation by using gtk_arrow_set().
/// GtkArrow has been deprecated; you can simply use a #GtkImage with a
/// suitable icon name, such as “pan-down-symbolic“. When replacing
/// GtkArrow by an image, pay attention to the fact that GtkArrow is
/// doing automatic flipping between #GTK_ARROW_LEFT and #GTK_ARROW_RIGHT,
/// depending on the text direction. To get the same effect with an image,
/// use the icon names “pan-start-symbolic“ and “pan-end-symbolic“, which
/// react to the text direction.


open class CGTKArrow : CGTKMisc {
	/// Creates a new #GtkArrow widget.
	/// - Parameters:
	///	- arrowType: GtkArrowType (GtkArrowType)
	///	- shadowType: GtkShadowType (GtkShadowType)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(arrowType: GtkArrowType, shadowType: GtkShadowType) {
		self.init(withGObject: gtk_arrow_new(arrowType, shadowType))!
	}

	open var ARROW: UnsafeMutablePointer<GtkArrow>! {
		get {
			return GTK_ARROW(self.GOBJECT)
		}
	}

	/// Sets the direction and style of the #GtkArrow, @arrow.
	/// - Parameters:
	///	- arrowType: GtkArrowType (GtkArrowType)
	///	- shadowType: GtkShadowType (GtkShadowType)
	open func set(arrowType: GtkArrowType, shadowType: GtkShadowType) -> Swift.Void {
		gtk_arrow_set(GTK_ARROW(self.GOBJECT), arrowType, shadowType)
	}

}
