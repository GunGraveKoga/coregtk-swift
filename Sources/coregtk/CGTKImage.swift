/*
 * CGTKImage.swift
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

public let GTK_TYPE_IMAGE: GType = gtk_image_get_type()

@inline(__always) public func GTK_IMAGE(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkImage>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_IMAGE)
}

/// The #GtkImage widget displays an image. Various kinds of object
/// can be displayed as an image; most typically, you would load a
/// #GdkPixbuf ("pixel buffer") from a file, and then display that.
/// There’s a convenience function to do this, gtk_image_new_from_file(),
/// used as follows:
/// |[<!-- language="C" -->
/// GtkWidget *image;
/// image = gtk_image_new_from_file ("myfile.png");
/// ]|
/// If the file isn’t loaded successfully, the image will contain a
/// “broken image” icon similar to that used in many web browsers.
/// If you want to handle errors in loading the file yourself,
/// for example by displaying an error message, then load the image with
/// gdk_pixbuf_new_from_file(), then create the #GtkImage with
/// gtk_image_new_from_pixbuf().
/// The image file may contain an animation, if so the #GtkImage will
/// display an animation (#GdkPixbufAnimation) instead of a static image.
/// #GtkImage is a subclass of #GtkMisc, which implies that you can
/// align it (center, left, right) and add padding to it, using
/// #GtkMisc methods.
/// #GtkImage is a “no window” widget (has no #GdkWindow of its own),
/// so by default does not receive events. If you want to receive events
/// on the image, such as button clicks, place the image inside a
/// #GtkEventBox, then connect to the event signals on the event box.
/// ## Handling button press events on a #GtkImage.
/// |[<!-- language="C" -->
/// static gboolean
/// button_press_callback (GtkWidget      *event_box,
/// GdkEventButton *event,
/// gpointer        data)
/// {
/// g_print ("Event box clicked at coordinates %f,%f\n",
/// event->x, event->y);
/// // Returning TRUE means we handled the event, so the signal
/// // emission should be stopped (don’t call any further callbacks
/// // that may be connected). Return FALSE to continue invoking callbacks.
/// return TRUE;
/// }
/// static GtkWidget*
/// create_image (void)
/// {
/// GtkWidget *image;
/// GtkWidget *event_box;
/// image = gtk_image_new_from_file ("myfile.png");
/// event_box = gtk_event_box_new ();
/// gtk_container_add (GTK_CONTAINER (event_box), image);
/// g_signal_connect (G_OBJECT (event_box),
/// "button_press_event",
/// G_CALLBACK (button_press_callback),
/// image);
/// return image;
/// }
/// ]|
/// When handling events on the event box, keep in mind that coordinates
/// in the image may be different from event box coordinates due to
/// the alignment and padding settings on the image (see #GtkMisc).
/// The simplest way to solve this is to set the alignment to 0.0
/// (left/top), and set the padding to zero. Then the origin of
/// the image will be the same as the origin of the event box.
/// Sometimes an application will want to avoid depending on external data
/// files, such as image files. GTK+ comes with a program to avoid this,
/// called “gdk-pixbuf-csource”. This library
/// allows you to convert an image into a C variable declaration, which
/// can then be loaded into a #GdkPixbuf using
/// gdk_pixbuf_new_from_inline().
/// # CSS nodes
/// GtkImage has a single CSS node with the name image.


open class CGTKImage : CGTKMisc {
	/// Creates a new empty #GtkImage widget.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_image_new())!
	}

	/// Creates a #GtkImage displaying the given animation.
	/// The #GtkImage does not assume a reference to the
	/// animation; you still need to unref it if you own references.
	/// #GtkImage will add its own reference rather than adopting yours.
	/// Note that the animation frames are shown using a timeout with
	/// #G_PRIORITY_DEFAULT. When using animations to indicate busyness,
	/// keep in mind that the animation will only be shown if the main loop
	/// is not busy with something that has a higher priority.
	/// - Parameters:
	///	- animation: OpaquePointer! (GdkPixbufAnimation*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromAnimation animation: OpaquePointer!) {
		self.init(withGObject: gtk_image_new_from_animation(animation))!
	}

	/// Creates a new #GtkImage displaying the file @filename. If the file
	/// isn’t found or can’t be loaded, the resulting #GtkImage will
	/// display a “broken image” icon. This function never returns %NULL,
	/// it always returns a valid #GtkImage widget.
	/// If the file contains an animation, the image will contain an
	/// animation.
	/// If you need to detect failures to load the file, use
	/// gdk_pixbuf_new_from_file() to load the file yourself, then create
	/// the #GtkImage from the pixbuf. (Or for animations, use
	/// gdk_pixbuf_animation_new_from_file()).
	/// The storage type (gtk_image_get_storage_type()) of the returned
	/// image is not defined, it will be whatever is appropriate for
	/// displaying the file.
	/// - Parameters:
	///	- filename: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromFile filename: String) {
		self.init(withGObject: gtk_image_new_from_file(filename))!
	}

	/// Creates a #GtkImage displaying an icon from the current icon theme.
	/// If the icon name isn’t known, a “broken image” icon will be
	/// displayed instead.  If the current icon theme is changed, the icon
	/// will be updated appropriately.
	/// - Parameters:
	///	- icon: OpaquePointer! (GIcon*)
	///	- size: GtkIconSize (GtkIconSize)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromGicon icon: OpaquePointer!, size: GtkIconSize) {
		self.init(withGObject: gtk_image_new_from_gicon(icon, size))!
	}

	/// Creates a #GtkImage displaying an icon from the current icon theme.
	/// If the icon name isn’t known, a “broken image” icon will be
	/// displayed instead.  If the current icon theme is changed, the icon
	/// will be updated appropriately.
	/// - Parameters:
	///	- iconName: String (const gchar*)
	///	- size: GtkIconSize (GtkIconSize)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromIconName iconName: String, size: GtkIconSize) {
		self.init(withGObject: gtk_image_new_from_icon_name(iconName, size))!
	}

	/// Creates a #GtkImage displaying an icon set. Sample stock sizes are
	/// #GTK_ICON_SIZE_MENU, #GTK_ICON_SIZE_SMALL_TOOLBAR. Instead of using
	/// this function, usually it’s better to create a #GtkIconFactory, put
	/// your icon sets in the icon factory, add the icon factory to the
	/// list of default factories with gtk_icon_factory_add_default(), and
	/// then use gtk_image_new_from_stock(). This will allow themes to
	/// override the icon you ship with your application.
	/// The #GtkImage does not assume a reference to the
	/// icon set; you still need to unref it if you own references.
	/// #GtkImage will add its own reference rather than adopting yours.
	/// - Parameters:
	///	- iconSet: OpaquePointer! (GtkIconSet*)
	///	- size: GtkIconSize (GtkIconSize)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromIconSet iconSet: OpaquePointer!, size: GtkIconSize) {
		self.init(withGObject: gtk_image_new_from_icon_set(iconSet, size))!
	}

	/// Creates a new #GtkImage displaying @pixbuf.
	/// The #GtkImage does not assume a reference to the
	/// pixbuf; you still need to unref it if you own references.
	/// #GtkImage will add its own reference rather than adopting yours.
	/// Note that this function just creates an #GtkImage from the pixbuf. The
	/// #GtkImage created will not react to state changes. Should you want that,
	/// you should use gtk_image_new_from_icon_name().
	/// - Parameters:
	///	- pixbuf: OpaquePointer? (GdkPixbuf*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromPixbuf pixbuf: OpaquePointer?) {
		self.init(withGObject: gtk_image_new_from_pixbuf(pixbuf))!
	}

	/// Creates a new #GtkImage displaying the resource file @resource_path. If the file
	/// isn’t found or can’t be loaded, the resulting #GtkImage will
	/// display a “broken image” icon. This function never returns %NULL,
	/// it always returns a valid #GtkImage widget.
	/// If the file contains an animation, the image will contain an
	/// animation.
	/// If you need to detect failures to load the file, use
	/// gdk_pixbuf_new_from_file() to load the file yourself, then create
	/// the #GtkImage from the pixbuf. (Or for animations, use
	/// gdk_pixbuf_animation_new_from_file()).
	/// The storage type (gtk_image_get_storage_type()) of the returned
	/// image is not defined, it will be whatever is appropriate for
	/// displaying the file.
	/// - Parameters:
	///	- resourcePath: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromResource resourcePath: String) {
		self.init(withGObject: gtk_image_new_from_resource(resourcePath))!
	}

	/// Creates a #GtkImage displaying a stock icon. Sample stock icon
	/// names are #GTK_STOCK_OPEN, #GTK_STOCK_QUIT. Sample stock sizes
	/// are #GTK_ICON_SIZE_MENU, #GTK_ICON_SIZE_SMALL_TOOLBAR. If the stock
	/// icon name isn’t known, the image will be empty.
	/// You can register your own stock icon names, see
	/// gtk_icon_factory_add_default() and gtk_icon_factory_add().
	/// - Parameters:
	///	- stockId: String (const gchar*)
	///	- size: GtkIconSize (GtkIconSize)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromStock stockId: String, size: GtkIconSize) {
		self.init(withGObject: gtk_image_new_from_stock(stockId, size))!
	}

	/// Creates a new #GtkImage displaying @surface.
	/// The #GtkImage does not assume a reference to the
	/// surface; you still need to unref it if you own references.
	/// #GtkImage will add its own reference rather than adopting yours.
	/// - Parameters:
	///	- surface: OpaquePointer? (cairo_surface_t*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromSurface surface: OpaquePointer?) {
		self.init(withGObject: gtk_image_new_from_surface(surface))!
	}

	open var IMAGE: UnsafeMutablePointer<GtkImage>! {
		get {
			return GTK_IMAGE(self.GOBJECT)
		}
	}

	/// Resets the image to be empty.
	open func clear() -> Swift.Void {
		gtk_image_clear(GTK_IMAGE(self.GOBJECT))
	}

	/// Gets the #GdkPixbufAnimation being displayed by the #GtkImage.
	/// The storage type of the image must be %GTK_IMAGE_EMPTY or
	/// %GTK_IMAGE_ANIMATION (see gtk_image_get_storage_type()).
	/// The caller of this function does not own a reference to the
	/// returned animation.
	/// - Returns: OpaquePointer? (GdkPixbufAnimation*)
	open func getAnimation() -> OpaquePointer? {
		return gtk_image_get_animation(GTK_IMAGE(self.GOBJECT))
	}

	/// Gets the #GIcon and size being displayed by the #GtkImage.
	/// The storage type of the image must be %GTK_IMAGE_EMPTY or
	/// %GTK_IMAGE_GICON (see gtk_image_get_storage_type()).
	/// The caller of this function does not own a reference to the
	/// returned #GIcon.
	/// - Parameters:
	///	- gicon: UnsafeMutablePointer<OpaquePointer?> (GIcon**)
	///	- size: UnsafeMutablePointer<GtkIconSize>! (GtkIconSize*)
	open func getGicon(_ gicon: UnsafeMutablePointer<OpaquePointer?>, size: UnsafeMutablePointer<GtkIconSize>!) -> Swift.Void {
		gtk_image_get_gicon(GTK_IMAGE(self.GOBJECT), gicon, size)
	}

	/// Gets the icon name and size being displayed by the #GtkImage.
	/// The storage type of the image must be %GTK_IMAGE_EMPTY or
	/// %GTK_IMAGE_ICON_NAME (see gtk_image_get_storage_type()).
	/// The returned string is owned by the #GtkImage and should not
	/// be freed.
	/// - Parameters:
	///	- iconName: UnsafeMutablePointer<UnsafePointer<gchar>?>! (const gchar**)
	///	- size: UnsafeMutablePointer<GtkIconSize>! (GtkIconSize*)
	open func getIconName(_ iconName: UnsafeMutablePointer<UnsafePointer<gchar>?>!, size: UnsafeMutablePointer<GtkIconSize>!) -> Swift.Void {
		gtk_image_get_icon_name(GTK_IMAGE(self.GOBJECT), iconName, size)
	}

	/// Gets the icon set and size being displayed by the #GtkImage.
	/// The storage type of the image must be %GTK_IMAGE_EMPTY or
	/// %GTK_IMAGE_ICON_SET (see gtk_image_get_storage_type()).
	/// - Parameters:
	///	- iconSet: UnsafeMutablePointer<OpaquePointer?> (GtkIconSet**)
	///	- size: UnsafeMutablePointer<GtkIconSize>! (GtkIconSize*)
	open func getIconSet(_ iconSet: UnsafeMutablePointer<OpaquePointer?>, size: UnsafeMutablePointer<GtkIconSize>!) -> Swift.Void {
		gtk_image_get_icon_set(GTK_IMAGE(self.GOBJECT), iconSet, size)
	}

	/// Gets the #GdkPixbuf being displayed by the #GtkImage.
	/// The storage type of the image must be %GTK_IMAGE_EMPTY or
	/// %GTK_IMAGE_PIXBUF (see gtk_image_get_storage_type()).
	/// The caller of this function does not own a reference to the
	/// returned pixbuf.
	/// - Returns: OpaquePointer? (GdkPixbuf*)
	open func getPixbuf() -> OpaquePointer? {
		return gtk_image_get_pixbuf(GTK_IMAGE(self.GOBJECT))
	}

	/// Gets the pixel size used for named icons.
	/// - Returns: gint (gint)
	open func getPixelSize() -> gint {
		return gtk_image_get_pixel_size(GTK_IMAGE(self.GOBJECT))
	}

	/// Gets the stock icon name and size being displayed by the #GtkImage.
	/// The storage type of the image must be %GTK_IMAGE_EMPTY or
	/// %GTK_IMAGE_STOCK (see gtk_image_get_storage_type()).
	/// The returned string is owned by the #GtkImage and should not
	/// be freed.
	/// - Parameters:
	///	- stockId: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! (UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!)
	///	- size: UnsafeMutablePointer<GtkIconSize>! (GtkIconSize*)
	open func getStock(stockId: UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>!, size: UnsafeMutablePointer<GtkIconSize>!) -> Swift.Void {
		gtk_image_get_stock(GTK_IMAGE(self.GOBJECT), stockId, size)
	}

	/// Gets the type of representation being used by the #GtkImage
	/// to store image data. If the #GtkImage has no image data,
	/// the return value will be %GTK_IMAGE_EMPTY.
	/// - Returns: GtkImageType (GtkImageType)
	open func getStorageType() -> GtkImageType {
		return gtk_image_get_storage_type(GTK_IMAGE(self.GOBJECT))
	}

	/// Causes the #GtkImage to display the given animation (or display
	/// nothing, if you set the animation to %NULL).
	/// - Parameters:
	///	- animation: OpaquePointer! (GdkPixbufAnimation*)
	open func setFromAnimation(_ animation: OpaquePointer!) -> Swift.Void {
		gtk_image_set_from_animation(GTK_IMAGE(self.GOBJECT), animation)
	}

	/// See gtk_image_new_from_file() for details.
	/// - Parameters:
	///	- filename: String (const gchar*)
	open func setFromFile(filename: String) -> Swift.Void {
		gtk_image_set_from_file(GTK_IMAGE(self.GOBJECT), filename)
	}

	/// See gtk_image_new_from_gicon() for details.
	/// - Parameters:
	///	- icon: OpaquePointer! (GIcon*)
	///	- size: GtkIconSize (GtkIconSize)
	open func setFromGicon(icon: OpaquePointer!, size: GtkIconSize) -> Swift.Void {
		gtk_image_set_from_gicon(GTK_IMAGE(self.GOBJECT), icon, size)
	}

	/// See gtk_image_new_from_icon_name() for details.
	/// - Parameters:
	///	- iconName: String (const gchar*)
	///	- size: GtkIconSize (GtkIconSize)
	open func setFromIconName(_ iconName: String, size: GtkIconSize) -> Swift.Void {
		gtk_image_set_from_icon_name(GTK_IMAGE(self.GOBJECT), iconName, size)
	}

	/// See gtk_image_new_from_icon_set() for details.
	/// - Parameters:
	///	- iconSet: OpaquePointer! (GtkIconSet*)
	///	- size: GtkIconSize (GtkIconSize)
	open func setFromIconSet(_ iconSet: OpaquePointer!, size: GtkIconSize) -> Swift.Void {
		gtk_image_set_from_icon_set(GTK_IMAGE(self.GOBJECT), iconSet, size)
	}

	/// See gtk_image_new_from_pixbuf() for details.
	/// - Parameters:
	///	- pixbuf: OpaquePointer? (GdkPixbuf*)
	open func setFromPixbuf(_ pixbuf: OpaquePointer?) -> Swift.Void {
		gtk_image_set_from_pixbuf(GTK_IMAGE(self.GOBJECT), pixbuf)
	}

	/// See gtk_image_new_from_resource() for details.
	/// - Parameters:
	///	- resourcePath: String (const gchar*)
	open func setFromResource(resourcePath: String) -> Swift.Void {
		gtk_image_set_from_resource(GTK_IMAGE(self.GOBJECT), resourcePath)
	}

	/// See gtk_image_new_from_stock() for details.
	/// - Parameters:
	///	- stockId: String (const gchar*)
	///	- size: GtkIconSize (GtkIconSize)
	open func setFromStock(stockId: String, size: GtkIconSize) -> Swift.Void {
		gtk_image_set_from_stock(GTK_IMAGE(self.GOBJECT), stockId, size)
	}

	/// See gtk_image_new_from_surface() for details.
	/// - Parameters:
	///	- surface: OpaquePointer? (cairo_surface_t*)
	open func setFromSurface(_ surface: OpaquePointer?) -> Swift.Void {
		gtk_image_set_from_surface(GTK_IMAGE(self.GOBJECT), surface)
	}

	/// Sets the pixel size to use for named icons. If the pixel size is set
	/// to a value != -1, it is used instead of the icon size set by
	/// gtk_image_set_from_icon_name().
	/// - Parameters:
	///	- pixelSize: gint (gint)
	open func setPixelSize(_ pixelSize: gint) -> Swift.Void {
		gtk_image_set_pixel_size(GTK_IMAGE(self.GOBJECT), pixelSize)
	}

}
