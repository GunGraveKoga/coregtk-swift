/*
 * CGTKButton.swift
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

public let GTK_TYPE_BUTTON: GType = gtk_button_get_type()

@inline(__always) public func GTK_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_BUTTON)
}

/// 
/// The #GtkButton widget is generally used to trigger a callback function that is
/// called when the button is pressed.  The various signals and how to use them
/// are outlined below.
/// The #GtkButton widget can hold any valid child widget.  That is, it can hold
/// almost any other standard #GtkWidget.  The most commonly used child is the
/// #GtkLabel.
/// # CSS nodes
/// GtkButton has a single CSS node with name button. The node will get the
/// style classes .image-button or .text-button, if the content is just an
/// image or label, respectively. It may also receive the .flat style class.
/// Other style classes that are commonly used with GtkButton include
/// .suggested-action and .destructive-action. In special cases, buttons
/// can be made round by adding the .circular style class.
/// Button-like widgets like #GtkToggleButton, #GtkMenuButton, #GtkVolumeButton,
/// #GtkLockButton, #GtkColorButton, #GtkFontButton or #GtkFileChooserButton use
/// style classes such as .toggle, .popup, .scale, .lock, .color, .font, .file
/// to differentiate themselves from a plain GtkButton.


open class CGTKButton : CGTKBin {
	/// 
	/// Creates a new #GtkButton widget. To add a child widget to the button,
	/// use gtk_container_add().
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_button_new())!
	}

	/// 
	/// Creates a new button containing an icon from the current icon theme.
	/// If the icon name isn’t known, a “broken image” icon will be
	/// displayed instead. If the current icon theme is changed, the icon
	/// will be updated appropriately.
	/// This function is a convenience wrapper around gtk_button_new() and
	/// gtk_button_set_image().
	/// Parameters:
	///	- iconName: String
	///	- size: GtkIconSize
	/// - Returns: CGTKWidget
	public convenience init(fromIconName iconName: String, size: GtkIconSize) {
		self.init(withGObject: gtk_button_new_from_icon_name(iconName, size))!
	}

	/// 
	/// Creates a new #GtkButton containing the image and text from a stock item.
	/// Some stock ids have preprocessor macros like #GTK_STOCK_OK and
	/// #GTK_STOCK_APPLY.
	/// If @stock_id is unknown, then it will be treated as a mnemonic
	/// label (as for gtk_button_new_with_mnemonic()).
	/// Parameters:
	///	- stockId: String
	/// - Returns: CGTKWidget
	public convenience init(fromStock stockId: String) {
		self.init(withGObject: gtk_button_new_from_stock(stockId))!
	}

	/// 
	/// Creates a #GtkButton widget with a #GtkLabel child containing the given
	/// text.
	/// Parameters:
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withLabel label: String) {
		self.init(withGObject: gtk_button_new_with_label(label))!
	}

	/// 
	/// Creates a new #GtkButton containing a label.
	/// If characters in @label are preceded by an underscore, they are underlined.
	/// If you need a literal underscore character in a label, use “__” (two
	/// underscores). The first underlined character represents a keyboard
	/// accelerator called a mnemonic.
	/// Pressing Alt and that key activates the button.
	/// Parameters:
	///	- label: String
	/// - Returns: CGTKWidget
	public convenience init(withMnemonic label: String) {
		self.init(withGObject: gtk_button_new_with_mnemonic(label))!
	}

	open var BUTTON: UnsafeMutablePointer<GtkButton>! {
		get {
			return GTK_BUTTON(self.GOBJECT)
		}
	}

	/// 
	/// Emits a #GtkButton::clicked signal to the given #GtkButton.
	open func clicked() {
		gtk_button_clicked(GTK_BUTTON(self.GOBJECT))
	}

	/// 
	/// Emits a #GtkButton::enter signal to the given #GtkButton.
	open func enter() {
		gtk_button_enter(GTK_BUTTON(self.GOBJECT))
	}

	/// 
	/// Gets the alignment of the child in the button.
	/// Parameters:
	///	- xalign: UnsafeMutablePointer<Float>!
	///	- yalign: UnsafeMutablePointer<Float>!
	open func getAlignment(xalign: UnsafeMutablePointer<Float>!, yalign: UnsafeMutablePointer<Float>!) {
		gtk_button_get_alignment(GTK_BUTTON(self.GOBJECT), xalign, yalign)
	}

	/// 
	/// Returns whether the button will ignore the #GtkSettings:gtk-button-images
	/// setting and always show the image, if available.
	/// - Returns: Bool
	open func getAlwaysShowImage() -> Bool {
		return gtk_button_get_always_show_image(GTK_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns the button’s event window if it is realized, %NULL otherwise.
	/// This function should be rarely needed.
	/// - Returns: OpaquePointer
	open func getEventWindow() -> OpaquePointer {
		return gtk_button_get_event_window(GTK_BUTTON(self.GOBJECT))
	}

	/// 
	/// Returns whether the button grabs focus when it is clicked with the mouse.
	/// See gtk_button_set_focus_on_click().
	/// - Returns: Bool
	override open func getFocusOnClick() -> Bool {
		return gtk_button_get_focus_on_click(GTK_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the widget that is currenty set as the image of @button.
	/// This may have been explicitly set by gtk_button_set_image()
	/// or constructed by gtk_button_new_from_stock().
	/// - Returns: CGTKWidget?
	open func getImage<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_button_get_image(GTK_BUTTON(self.GOBJECT)))
	}

	/// 
	/// Gets the position of the image relative to the text
	/// inside the button.
	/// - Returns: GtkPositionType
	open func getImagePosition() -> GtkPositionType {
		return gtk_button_get_image_position(GTK_BUTTON(self.GOBJECT))
	}

	/// 
	/// Fetches the text from the label of the button, as set by
	/// gtk_button_set_label(). If the label text has not
	/// been set the return value will be %NULL. This will be the
	/// case if you create an empty button with gtk_button_new() to
	/// use as a container.
	/// - Returns: String?
	open func getLabel() -> String? {
		return String(utf8String: gtk_button_get_label(GTK_BUTTON(self.GOBJECT)))
	}

	/// 
	/// Returns the current relief style of the given #GtkButton.
	/// - Returns: GtkReliefStyle
	open func getRelief() -> GtkReliefStyle {
		return gtk_button_get_relief(GTK_BUTTON(self.GOBJECT))
	}

	/// 
	/// Returns whether the button label is a stock item.
	/// - Returns: Bool
	open func getUseStock() -> Bool {
		return gtk_button_get_use_stock(GTK_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether an embedded underline in the button label indicates a
	/// mnemonic. See gtk_button_set_use_underline ().
	/// - Returns: Bool
	open func getUseUnderline() -> Bool {
		return gtk_button_get_use_underline(GTK_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Emits a #GtkButton::leave signal to the given #GtkButton.
	open func leave() {
		gtk_button_leave(GTK_BUTTON(self.GOBJECT))
	}

	/// 
	/// Emits a #GtkButton::pressed signal to the given #GtkButton.
	open func pressed() {
		gtk_button_pressed(GTK_BUTTON(self.GOBJECT))
	}

	/// 
	/// Emits a #GtkButton::released signal to the given #GtkButton.
	open func released() {
		gtk_button_released(GTK_BUTTON(self.GOBJECT))
	}

	/// 
	/// Sets the alignment of the child. This property has no effect unless
	/// the child is a #GtkMisc or a #GtkAlignment.
	/// Parameters:
	///	- xalign: Float
	///	- yalign: Float
	open func setAlignment(xalign: Float, yalign: Float) {
		gtk_button_set_alignment(GTK_BUTTON(self.GOBJECT), xalign, yalign)
	}

	/// 
	/// If %TRUE, the button will ignore the #GtkSettings:gtk-button-images
	/// setting and always show the image, if available.
	/// Use this property if the button  would be useless or hard to use
	/// without the image.
	/// Parameters:
	///	- alwaysShow: Bool
	open func setAlwaysShowImage(alwaysShow: Bool) {
		gtk_button_set_always_show_image(GTK_BUTTON(self.GOBJECT), alwaysShow ? 1 : 0)
	}

	/// 
	/// Sets whether the button will grab focus when it is clicked with the mouse.
	/// Making mouse clicks not grab focus is useful in places like toolbars where
	/// you don’t want the keyboard focus removed from the main area of the
	/// application.
	/// Parameters:
	///	- focusOnClick: Bool
	override open func setFocusOnClick(_ focusOnClick: Bool) {
		gtk_button_set_focus_on_click(GTK_BUTTON(self.GOBJECT), focusOnClick ? 1 : 0)
	}

	/// 
	/// Set the image of @button to the given widget. The image will be
	/// displayed if the label text is %NULL or if
	/// #GtkButton:always-show-image is %TRUE. You don’t have to call
	/// gtk_widget_show() on @image yourself.
	/// Parameters:
	///	- image: CGTKWidget
	open func setImage(_ image: CGTKWidget) {
		gtk_button_set_image(GTK_BUTTON(self.GOBJECT), image.WIDGET)
	}

	/// 
	/// Sets the position of the image relative to the text
	/// inside the button.
	/// Parameters:
	///	- position: GtkPositionType
	open func setImagePosition(_ position: GtkPositionType) {
		gtk_button_set_image_position(GTK_BUTTON(self.GOBJECT), position)
	}

	/// 
	/// Sets the text of the label of the button to @str. This text is
	/// also used to select the stock item if gtk_button_set_use_stock()
	/// is used.
	/// This will also clear any previously set labels.
	/// Parameters:
	///	- label: String
	open func setLabel(_ label: String) {
		gtk_button_set_label(GTK_BUTTON(self.GOBJECT), label)
	}

	/// 
	/// Sets the relief style of the edges of the given #GtkButton widget.
	/// Two styles exist, %GTK_RELIEF_NORMAL and %GTK_RELIEF_NONE.
	/// The default style is, as one can guess, %GTK_RELIEF_NORMAL.
	/// The deprecated value %GTK_RELIEF_HALF behaves the same as
	/// %GTK_RELIEF_NORMAL.
	/// Parameters:
	///	- relief: GtkReliefStyle
	open func setRelief(_ relief: GtkReliefStyle) {
		gtk_button_set_relief(GTK_BUTTON(self.GOBJECT), relief)
	}

	/// 
	/// If %TRUE, the label set on the button is used as a
	/// stock id to select the stock item for the button.
	/// Parameters:
	///	- useStock: Bool
	open func setUseStock(_ useStock: Bool) {
		gtk_button_set_use_stock(GTK_BUTTON(self.GOBJECT), useStock ? 1 : 0)
	}

	/// 
	/// If true, an underline in the text of the button label indicates
	/// the next character should be used for the mnemonic accelerator key.
	/// Parameters:
	///	- useUnderline: Bool
	open func setUseUnderline(_ useUnderline: Bool) {
		gtk_button_set_use_underline(GTK_BUTTON(self.GOBJECT), useUnderline ? 1 : 0)
	}

}
