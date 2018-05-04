/*
 * CGTKFontChooserWidget.swift
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

public let GTK_TYPE_FONT_CHOOSER_WIDGET: GType = gtk_font_chooser_widget_get_type()

@inline(__always) public func GTK_FONT_CHOOSER_WIDGET(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFontChooserWidget>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FONT_CHOOSER_WIDGET)
}

/// 
/// The #GtkFontChooserWidget widget lists the available fonts,
/// styles and sizes, allowing the user to select a font. It is
/// used in the #GtkFontChooserDialog widget to provide a
/// dialog box for selecting fonts.
/// To set the font which is initially selected, use
/// gtk_font_chooser_set_font() or gtk_font_chooser_set_font_desc().
/// To get the selected font use gtk_font_chooser_get_font() or
/// gtk_font_chooser_get_font_desc().
/// To change the text which is shown in the preview area, use
/// gtk_font_chooser_set_preview_text().
/// # CSS nodes
/// GtkFontChooserWidget has a single CSS node with name fontchooser.


open class CGTKFontChooserWidget : CGTKBox {
	/// 
	/// Creates a new #GtkFontChooserWidget.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_font_chooser_widget_new())!
	}

	open var FONTCHOOSERWIDGET: UnsafeMutablePointer<GtkFontChooserWidget>! {
		get {
			return GTK_FONT_CHOOSER_WIDGET(self.GOBJECT)
		}
	}

}
