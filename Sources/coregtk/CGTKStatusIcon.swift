/*
 * CGTKStatusIcon.swift
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

public let GTK_TYPE_STATUS_ICON: GType = gtk_status_icon_get_type()

@inline(__always) public func GTK_STATUS_ICON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkStatusIcon>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_STATUS_ICON)
}

/// 
/// The “system tray” or notification area is normally used for transient icons
/// that indicate some special state. For example, a system tray icon might
/// appear to tell the user that they have new mail, or have an incoming instant
/// message, or something along those lines. The basic idea is that creating an
/// icon in the notification area is less annoying than popping up a dialog.
/// A #GtkStatusIcon object can be used to display an icon in a “system tray”.
/// The icon can have a tooltip, and the user can interact with it by
/// activating it or popping up a context menu.
/// It is very important to notice that status icons depend on the existence
/// of a notification area being available to the user; you should not use status
/// icons as the only way to convey critical information regarding your application,
/// as the notification area may not exist on the user's environment, or may have
/// been removed. You should always check that a status icon has been embedded into
/// a notification area by using gtk_status_icon_is_embedded(), and gracefully
/// recover if the function returns %FALSE.
/// On X11, the implementation follows the
/// [FreeDesktop System Tray Specification](http://www.freedesktop.org/wiki/Specifications/systemtray-spec).
/// Implementations of the “tray” side of this specification can
/// be found e.g. in the GNOME 2 and KDE panel applications.
/// Note that a GtkStatusIcon is not a widget, but just a #GObject. Making it a
/// widget would be impractical, since the system tray on Windows doesn’t allow
/// to embed arbitrary widgets.
/// GtkStatusIcon has been deprecated in 3.14. You should consider using
/// notifications or more modern platform-specific APIs instead. GLib provides
/// the #GNotification API which works well with #GtkApplication on multiple
/// platforms and environments, and should be the preferred mechanism to notify
/// the users of transient status updates. See this [HowDoI](https://wiki.gnome.org/HowDoI/GNotification)
/// for code examples.


open class CGTKStatusIcon : CGTKBase {
	/// 
	/// Menu positioning function to use with gtk_menu_popup()
	/// to position @menu aligned to the status icon @user_data.
	/// Parameters:
	///	- menu: UnsafeMutablePointer<GtkMenu>!
	///	- x: UnsafeMutablePointer<Int32>!
	///	- y: UnsafeMutablePointer<Int32>!
	///	- pushIn: UnsafeMutablePointer<gboolean>!
	///	- userData: gpointer
	open class func positionMenu(_ menu: UnsafeMutablePointer<GtkMenu>!, x: UnsafeMutablePointer<Int32>!, y: UnsafeMutablePointer<Int32>!, pushIn: UnsafeMutablePointer<gboolean>!, userData: gpointer) {
		gtk_status_icon_position_menu(menu, x, y, pushIn, userData)
	}

	/// 
	/// Creates an empty status icon object.
	/// - Returns: UnsafeMutablePointer<GtkStatusIcon>!
	public convenience init() {
		self.init(withGObject: gtk_status_icon_new())!
	}

	/// 
	/// Creates a status icon displaying the file @filename.
	/// The image will be scaled down to fit in the available
	/// space in the notification area, if necessary.
	/// Parameters:
	///	- filename: String
	/// - Returns: UnsafeMutablePointer<GtkStatusIcon>!
	public convenience init(fromFile filename: String) {
		self.init(withGObject: gtk_status_icon_new_from_file(filename))!
	}

	/// 
	/// Creates a status icon displaying a #GIcon. If the icon is a
	/// themed icon, it will be updated when the theme changes.
	/// Parameters:
	///	- icon: OpaquePointer!
	/// - Returns: UnsafeMutablePointer<GtkStatusIcon>!
	public convenience init(fromGicon icon: OpaquePointer!) {
		self.init(withGObject: gtk_status_icon_new_from_gicon(icon))!
	}

	/// 
	/// Creates a status icon displaying an icon from the current icon theme.
	/// If the current icon theme is changed, the icon will be updated
	/// appropriately.
	/// Parameters:
	///	- iconName: String
	/// - Returns: UnsafeMutablePointer<GtkStatusIcon>!
	public convenience init(fromIconName iconName: String) {
		self.init(withGObject: gtk_status_icon_new_from_icon_name(iconName))!
	}

	/// 
	/// Creates a status icon displaying @pixbuf.
	/// The image will be scaled down to fit in the available
	/// space in the notification area, if necessary.
	/// Parameters:
	///	- pixbuf: OpaquePointer!
	/// - Returns: UnsafeMutablePointer<GtkStatusIcon>!
	public convenience init(fromPixbuf pixbuf: OpaquePointer!) {
		self.init(withGObject: gtk_status_icon_new_from_pixbuf(pixbuf))!
	}

	/// 
	/// Creates a status icon displaying a stock icon. Sample stock icon
	/// names are #GTK_STOCK_OPEN, #GTK_STOCK_QUIT. You can register your
	/// own stock icon names, see gtk_icon_factory_add_default() and
	/// gtk_icon_factory_add().
	/// Parameters:
	///	- stockId: String
	/// - Returns: UnsafeMutablePointer<GtkStatusIcon>!
	public convenience init(fromStock stockId: String) {
		self.init(withGObject: gtk_status_icon_new_from_stock(stockId))!
	}

	open var STATUSICON: UnsafeMutablePointer<GtkStatusIcon>! {
		get {
			return GTK_STATUS_ICON(self.GOBJECT)
		}
	}

	/// 
	/// Obtains information about the location of the status icon
	/// on screen. This information can be used to e.g. position
	/// popups like notification bubbles.
	/// See gtk_status_icon_position_menu() for a more convenient
	/// alternative for positioning menus.
	/// Note that some platforms do not allow GTK+ to provide
	/// this information, and even on platforms that do allow it,
	/// the information is not reliable unless the status icon
	/// is embedded in a notification area, see
	/// gtk_status_icon_is_embedded().
	/// Parameters:
	///	- screen: UnsafeMutablePointer<OpaquePointer?>
	///	- area: UnsafeMutablePointer<GdkRectangle>!
	///	- orientation: UnsafeMutablePointer<GtkOrientation>!
	/// - Returns: Bool
	open func getGeometry(screen: UnsafeMutablePointer<OpaquePointer?>, area: UnsafeMutablePointer<GdkRectangle>!, orientation: UnsafeMutablePointer<GtkOrientation>!) -> Bool {
		return gtk_status_icon_get_geometry(GTK_STATUS_ICON(self.GOBJECT), screen, area, orientation) != 0 ? true : false
	}

	/// 
	/// Retrieves the #GIcon being displayed by the #GtkStatusIcon.
	/// The storage type of the status icon must be %GTK_IMAGE_EMPTY or
	/// %GTK_IMAGE_GICON (see gtk_status_icon_get_storage_type()).
	/// The caller of this function does not own a reference to the
	/// returned #GIcon.
	/// If this function fails, @icon is left unchanged;
	/// - Returns: OpaquePointer?
	open func getGicon() -> OpaquePointer? {
		return gtk_status_icon_get_gicon(GTK_STATUS_ICON(self.GOBJECT))
	}

	/// 
	/// Returns the current value of the has-tooltip property.
	/// See #GtkStatusIcon:has-tooltip for more information.
	/// - Returns: Bool
	open func getHasTooltip() -> Bool {
		return gtk_status_icon_get_has_tooltip(GTK_STATUS_ICON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the name of the icon being displayed by the #GtkStatusIcon.
	/// The storage type of the status icon must be %GTK_IMAGE_EMPTY or
	/// %GTK_IMAGE_ICON_NAME (see gtk_status_icon_get_storage_type()).
	/// The returned string is owned by the #GtkStatusIcon and should not
	/// be freed or modified.
	/// - Returns: String?
	open func getIconName() -> String? {
		return String(utf8String: gtk_status_icon_get_icon_name(GTK_STATUS_ICON(self.GOBJECT)))
	}

	/// 
	/// Gets the #GdkPixbuf being displayed by the #GtkStatusIcon.
	/// The storage type of the status icon must be %GTK_IMAGE_EMPTY or
	/// %GTK_IMAGE_PIXBUF (see gtk_status_icon_get_storage_type()).
	/// The caller of this function does not own a reference to the
	/// returned pixbuf.
	/// - Returns: OpaquePointer?
	open func getPixbuf() -> OpaquePointer? {
		return gtk_status_icon_get_pixbuf(GTK_STATUS_ICON(self.GOBJECT))
	}

	/// 
	/// Returns the #GdkScreen associated with @status_icon.
	/// - Returns: OpaquePointer
	open func getScreen() -> OpaquePointer {
		return gtk_status_icon_get_screen(GTK_STATUS_ICON(self.GOBJECT))
	}

	/// 
	/// Gets the size in pixels that is available for the image.
	/// Stock icons and named icons adapt their size automatically
	/// if the size of the notification area changes. For other
	/// storage types, the size-changed signal can be used to
	/// react to size changes.
	/// Note that the returned size is only meaningful while the
	/// status icon is embedded (see gtk_status_icon_is_embedded()).
	/// - Returns: gint
	open func getSize() -> gint {
		return gtk_status_icon_get_size(GTK_STATUS_ICON(self.GOBJECT))
	}

	/// 
	/// Gets the id of the stock icon being displayed by the #GtkStatusIcon.
	/// The storage type of the status icon must be %GTK_IMAGE_EMPTY or
	/// %GTK_IMAGE_STOCK (see gtk_status_icon_get_storage_type()).
	/// The returned string is owned by the #GtkStatusIcon and should not
	/// be freed or modified.
	/// - Returns: String?
	open func getStock() -> String? {
		return String(utf8String: gtk_status_icon_get_stock(GTK_STATUS_ICON(self.GOBJECT)))
	}

	/// 
	/// Gets the type of representation being used by the #GtkStatusIcon
	/// to store image data. If the #GtkStatusIcon has no image data,
	/// the return value will be %GTK_IMAGE_EMPTY.
	/// - Returns: GtkImageType
	open func getStorageType() -> GtkImageType {
		return gtk_status_icon_get_storage_type(GTK_STATUS_ICON(self.GOBJECT))
	}

	/// 
	/// Gets the title of this tray icon. See gtk_status_icon_set_title().
	/// - Returns: String?
	open func getTitle() -> String? {
		return String(utf8String: gtk_status_icon_get_title(GTK_STATUS_ICON(self.GOBJECT)))
	}

	/// 
	/// Gets the contents of the tooltip for @status_icon.
	/// - Returns: String?
	open func getTooltipMarkup() -> String? {
		return String(utf8String: gtk_status_icon_get_tooltip_markup(GTK_STATUS_ICON(self.GOBJECT)))
	}

	/// 
	/// Gets the contents of the tooltip for @status_icon.
	/// - Returns: String?
	open func getTooltipText() -> String? {
		return String(utf8String: gtk_status_icon_get_tooltip_text(GTK_STATUS_ICON(self.GOBJECT)))
	}

	/// 
	/// Returns whether the status icon is visible or not.
	/// Note that being visible does not guarantee that
	/// the user can actually see the icon, see also
	/// gtk_status_icon_is_embedded().
	/// - Returns: Bool
	open func getVisible() -> Bool {
		return gtk_status_icon_get_visible(GTK_STATUS_ICON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// This function is only useful on the X11/freedesktop.org platform.
	/// It returns a window ID for the widget in the underlying
	/// status icon implementation.  This is useful for the Galago
	/// notification service, which can send a window ID in the protocol
	/// in order for the server to position notification windows
	/// pointing to a status icon reliably.
	/// This function is not intended for other use cases which are
	/// more likely to be met by one of the non-X11 specific methods, such
	/// as gtk_status_icon_position_menu().
	/// - Returns: guint32
	open func getX11WindowId() -> guint32 {
		return gtk_status_icon_get_x11_window_id(GTK_STATUS_ICON(self.GOBJECT))
	}

	/// 
	/// Returns whether the status icon is embedded in a notification
	/// area.
	/// - Returns: Bool
	open func isEmbedded() -> Bool {
		return gtk_status_icon_is_embedded(GTK_STATUS_ICON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Makes @status_icon display the file @filename.
	/// See gtk_status_icon_new_from_file() for details.
	/// Parameters:
	///	- filename: String
	open func setFromFile(filename: String) {
		gtk_status_icon_set_from_file(GTK_STATUS_ICON(self.GOBJECT), filename)
	}

	/// 
	/// Makes @status_icon display the #GIcon.
	/// See gtk_status_icon_new_from_gicon() for details.
	/// Parameters:
	///	- icon: OpaquePointer!
	open func setFromGicon(icon: OpaquePointer!) {
		gtk_status_icon_set_from_gicon(GTK_STATUS_ICON(self.GOBJECT), icon)
	}

	/// 
	/// Makes @status_icon display the icon named @icon_name from the
	/// current icon theme.
	/// See gtk_status_icon_new_from_icon_name() for details.
	/// Parameters:
	///	- iconName: String
	open func setFromIconName(_ iconName: String) {
		gtk_status_icon_set_from_icon_name(GTK_STATUS_ICON(self.GOBJECT), iconName)
	}

	/// 
	/// Makes @status_icon display @pixbuf.
	/// See gtk_status_icon_new_from_pixbuf() for details.
	/// Parameters:
	///	- pixbuf: OpaquePointer?
	open func setFromPixbuf(_ pixbuf: OpaquePointer?) {
		gtk_status_icon_set_from_pixbuf(GTK_STATUS_ICON(self.GOBJECT), pixbuf)
	}

	/// 
	/// Makes @status_icon display the stock icon with the id @stock_id.
	/// See gtk_status_icon_new_from_stock() for details.
	/// Parameters:
	///	- stockId: String
	open func setFromStock(stockId: String) {
		gtk_status_icon_set_from_stock(GTK_STATUS_ICON(self.GOBJECT), stockId)
	}

	/// 
	/// Sets the has-tooltip property on @status_icon to @has_tooltip.
	/// See #GtkStatusIcon:has-tooltip for more information.
	/// Parameters:
	///	- hasTooltip: Bool
	open func setHasTooltip(_ hasTooltip: Bool) {
		gtk_status_icon_set_has_tooltip(GTK_STATUS_ICON(self.GOBJECT), hasTooltip ? 1 : 0)
	}

	/// 
	/// Sets the name of this tray icon.
	/// This should be a string identifying this icon. It is may be
	/// used for sorting the icons in the tray and will not be shown to
	/// the user.
	/// Parameters:
	///	- name: String
	open func setName(_ name: String) {
		gtk_status_icon_set_name(GTK_STATUS_ICON(self.GOBJECT), name)
	}

	/// 
	/// Sets the #GdkScreen where @status_icon is displayed; if
	/// the icon is already mapped, it will be unmapped, and
	/// then remapped on the new screen.
	/// Parameters:
	///	- screen: OpaquePointer!
	open func setScreen(_ screen: OpaquePointer!) {
		gtk_status_icon_set_screen(GTK_STATUS_ICON(self.GOBJECT), screen)
	}

	/// 
	/// Sets the title of this tray icon.
	/// This should be a short, human-readable, localized string
	/// describing the tray icon. It may be used by tools like screen
	/// readers to render the tray icon.
	/// Parameters:
	///	- title: String
	open func setTitle(_ title: String) {
		gtk_status_icon_set_title(GTK_STATUS_ICON(self.GOBJECT), title)
	}

	/// 
	/// Sets @markup as the contents of the tooltip, which is marked up with
	/// the [Pango text markup language][PangoMarkupFormat].
	/// This function will take care of setting #GtkStatusIcon:has-tooltip to %TRUE
	/// and of the default handler for the #GtkStatusIcon::query-tooltip signal.
	/// See also the #GtkStatusIcon:tooltip-markup property and
	/// gtk_tooltip_set_markup().
	/// Parameters:
	///	- markup: String
	open func setTooltipMarkup(_ markup: String) {
		gtk_status_icon_set_tooltip_markup(GTK_STATUS_ICON(self.GOBJECT), markup)
	}

	/// 
	/// Sets @text as the contents of the tooltip.
	/// This function will take care of setting #GtkStatusIcon:has-tooltip to
	/// %TRUE and of the default handler for the #GtkStatusIcon::query-tooltip
	/// signal.
	/// See also the #GtkStatusIcon:tooltip-text property and
	/// gtk_tooltip_set_text().
	/// Parameters:
	///	- text: String
	open func setTooltipText(_ text: String) {
		gtk_status_icon_set_tooltip_text(GTK_STATUS_ICON(self.GOBJECT), text)
	}

	/// 
	/// Shows or hides a status icon.
	/// Parameters:
	///	- visible: Bool
	open func setVisible(_ visible: Bool) {
		gtk_status_icon_set_visible(GTK_STATUS_ICON(self.GOBJECT), visible ? 1 : 0)
	}

}
