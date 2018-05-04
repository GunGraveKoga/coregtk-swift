/*
 * CGTKImageMenuItem.swift
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

public let GTK_TYPE_IMAGE_MENU_ITEM: GType = gtk_image_menu_item_get_type()

@inline(__always) public func GTK_IMAGE_MENU_ITEM(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkImageMenuItem>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_IMAGE_MENU_ITEM)
}

/// 
/// A GtkImageMenuItem is a menu item which has an icon next to the text label.
/// This is functionally equivalent to:
/// |[<!-- language="C" -->
/// GtkWidget *box = gtk_box_new (GTK_ORIENTATION_HORIZONTAL, 6);
/// GtkWidget *icon = gtk_image_new_from_icon_name ("folder-music-symbolic", GTK_ICON_SIZE_MENU);
/// GtkWidget *label = gtk_label_new ("Music");
/// GtkWidget *menu_item = gtk_menu_item_new ();
/// gtk_container_add (GTK_CONTAINER (box), icon);
/// gtk_container_add (GTK_CONTAINER (box), label);
/// gtk_container_add (GTK_CONTAINER (menu_item), box);
/// gtk_widget_show_all (menu_item);
/// ]|
/// Note that the user may disable display of menu icons using
/// the #GtkSettings:gtk-menu-images setting, so make sure to still
/// fill in the text label. If you want to ensure that your menu items
/// show an icon you are strongly encouraged to use a #GtkMenuItem
/// with a #GtkImage instead.
/// #GtkImageMenuItem has been deprecated since GTK+ 3.10. If you want to
/// display an icon in a menu item, you should use #GtkMenuItem and pack a
/// #GtkBox with a #GtkImage and a #GtkLabel instead. You should also consider
/// using #GtkBuilder and the XML #GMenu description for creating menus, by
/// following the [GMenu guide][https://developer.gnome.org/GMenu/]. You should
/// consider using icons in menu items only sparingly, and for "objects" (or
/// "nouns") elements only, like bookmarks, files, and links; "actions" (or
/// "verbs") should not have icons.
/// Furthermore, if you would like to display keyboard accelerator, you must
/// pack the accel label into the box using gtk_box_pack_end() and align the
/// label, otherwise the accelerator will not display correctly. The following
/// code snippet adds a keyboard accelerator to the menu item, with a key
/// binding of Ctrl+M:
/// |[<!-- language="C" -->
/// GtkWidget *box = gtk_box_new (GTK_ORIENTATION_HORIZONTAL, 6);
/// GtkWidget *icon = gtk_image_new_from_icon_name ("folder-music-symbolic", GTK_ICON_SIZE_MENU);
/// GtkWidget *label = gtk_accel_label_new ("Music");
/// GtkWidget *menu_item = gtk_menu_item_new ();
/// GtkAccelGroup *accel_group = gtk_accel_group_new ();
/// gtk_container_add (GTK_CONTAINER (box), icon);
/// gtk_label_set_use_underline (GTK_LABEL (label), TRUE);
/// gtk_label_set_xalign (GTK_LABEL (label), 0.0);
/// gtk_widget_add_accelerator (menu_item, "activate", accel_group,
/// GDK_KEY_m, GDK_CONTROL_MASK, GTK_ACCEL_VISIBLE);
/// gtk_accel_label_set_accel_widget (GTK_ACCEL_LABEL (label), menu_item);
/// gtk_box_pack_end (GTK_BOX (box), label, TRUE, TRUE, 0);
/// gtk_container_add (GTK_CONTAINER (menu_item), box);
/// gtk_widget_show_all (menu_item);
/// ]|


open class CGTKImageMenuItem : CGTKMenuItem {
	/// 
	/// Creates a new #GtkImageMenuItem with an empty label.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_image_menu_item_new())!
	}

	/// 
	/// Creates a new #GtkImageMenuItem containing the image and text from a
	/// stock item. Some stock ids have preprocessor macros like #GTK_STOCK_OK
	/// and #GTK_STOCK_APPLY.
	/// If you want this menu item to have changeable accelerators, then pass in
	/// %NULL for accel_group. Next call gtk_menu_item_set_accel_path() with an
	/// appropriate path for the menu item, use gtk_stock_lookup() to look up the
	/// standard accelerator for the stock item, and if one is found, call
	/// gtk_accel_map_add_entry() to register it.
	/// Parameters:
	///	- stockId: String
	///	- accelGroup: UnsafeMutablePointer<GtkAccelGroup>?
	/// - Returns: CGTKWidget
	public convenience init(fromStock stockId: String, accelGroup: UnsafeMutablePointer<GtkAccelGroup>?) {
		self.init(withGObject: gtk_image_menu_item_new_from_stock(stockId, accelGroup))!
	}

	/// 
	/// Creates a new #GtkImageMenuItem containing a label.
	/// Parameters:
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withLabel label: String) {
		self.init(withGObject: gtk_image_menu_item_new_with_label(label))!
	}

	/// 
	/// Creates a new #GtkImageMenuItem containing a label. The label
	/// will be created using gtk_label_new_with_mnemonic(), so underscores
	/// in @label indicate the mnemonic for the menu item.
	/// Parameters:
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withMnemonic label: String) {
		self.init(withGObject: gtk_image_menu_item_new_with_mnemonic(label))!
	}

	open var IMAGEMENUITEM: UnsafeMutablePointer<GtkImageMenuItem>! {
		get {
			return GTK_IMAGE_MENU_ITEM(self.GOBJECT)
		}
	}

	/// 
	/// Returns whether the menu item will ignore the #GtkSettings:gtk-menu-images
	/// setting and always show the image, if available.
	/// - Returns: Bool
	open func getAlwaysShowImage() -> Bool {
		return gtk_image_menu_item_get_always_show_image(GTK_IMAGE_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the widget that is currently set as the image of @image_menu_item.
	/// See gtk_image_menu_item_set_image().
	/// - Returns: CGTKWidget
	open func getImage<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_image_menu_item_get_image(GTK_IMAGE_MENU_ITEM(self.GOBJECT)))!
	}

	/// 
	/// Checks whether the label set in the menuitem is used as a
	/// stock id to select the stock item for the item.
	/// - Returns: Bool
	open func getUseStock() -> Bool {
		return gtk_image_menu_item_get_use_stock(GTK_IMAGE_MENU_ITEM(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Specifies an @accel_group to add the menu items accelerator to
	/// (this only applies to stock items so a stock item must already
	/// be set, make sure to call gtk_image_menu_item_set_use_stock()
	/// and gtk_menu_item_set_label() with a valid stock item first).
	/// If you want this menu item to have changeable accelerators then
	/// you shouldnt need this (see gtk_image_menu_item_new_from_stock()).
	/// Parameters:
	///	- accelGroup: UnsafeMutablePointer<GtkAccelGroup>!
	open func setAccelGroup(_ accelGroup: UnsafeMutablePointer<GtkAccelGroup>!) {
		gtk_image_menu_item_set_accel_group(GTK_IMAGE_MENU_ITEM(self.GOBJECT), accelGroup)
	}

	/// 
	/// If %TRUE, the menu item will ignore the #GtkSettings:gtk-menu-images
	/// setting and always show the image, if available.
	/// Use this property if the menuitem would be useless or hard to use
	/// without the image.
	/// Parameters:
	///	- alwaysShow: Bool
	open func setAlwaysShowImage(alwaysShow: Bool) {
		gtk_image_menu_item_set_always_show_image(GTK_IMAGE_MENU_ITEM(self.GOBJECT), alwaysShow ? 1 : 0)
	}

	/// 
	/// Sets the image of @image_menu_item to the given widget.
	/// Note that it depends on the show-menu-images setting whether
	/// the image will be displayed or not.
	/// Parameters:
	///	- image: CGTKWidget
	open func setImage(_ image: CGTKWidget) {
		gtk_image_menu_item_set_image(GTK_IMAGE_MENU_ITEM(self.GOBJECT), image.WIDGET)
	}

	/// 
	/// If %TRUE, the label set in the menuitem is used as a
	/// stock id to select the stock item for the item.
	/// Parameters:
	///	- useStock: Bool
	open func setUseStock(_ useStock: Bool) {
		gtk_image_menu_item_set_use_stock(GTK_IMAGE_MENU_ITEM(self.GOBJECT), useStock ? 1 : 0)
	}

}
