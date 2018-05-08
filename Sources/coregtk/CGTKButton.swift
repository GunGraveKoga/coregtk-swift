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


open class CGTKButton : CGTKBin, CGTKActionable, CGTKActivatable {
	/// Creates a new #GtkButton widget. To add a child widget to the button,
	/// use gtk_container_add().
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_button_new())!
	}

	/// Creates a new button containing an icon from the current icon theme.
	/// If the icon name isn’t known, a “broken image” icon will be
	/// displayed instead. If the current icon theme is changed, the icon
	/// will be updated appropriately.
	/// This function is a convenience wrapper around gtk_button_new() and
	/// gtk_button_set_image().
	/// - Parameters:
	///	- iconName: String? (const gchar*)
	///	- size: GtkIconSize (GtkIconSize)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromIconName iconName: String?, size: GtkIconSize) {
		self.init(withGObject: gtk_button_new_from_icon_name(iconName, size))!
	}

	/// Creates a new #GtkButton containing the image and text from a stock item.
	/// Some stock ids have preprocessor macros like #GTK_STOCK_OK and
	/// #GTK_STOCK_APPLY.
	/// If @stock_id is unknown, then it will be treated as a mnemonic
	/// label (as for gtk_button_new_with_mnemonic()).
	/// - Parameters:
	///	- stockId: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromStock stockId: String) {
		self.init(withGObject: gtk_button_new_from_stock(stockId))!
	}

	/// Creates a #GtkButton widget with a #GtkLabel child containing the given
	/// text.
	/// - Parameters:
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withLabel label: String) {
		self.init(withGObject: gtk_button_new_with_label(label))!
	}

	/// Creates a new #GtkButton containing a label.
	/// If characters in @label are preceded by an underscore, they are underlined.
	/// If you need a literal underscore character in a label, use “__” (two
	/// underscores). The first underlined character represents a keyboard
	/// accelerator called a mnemonic.
	/// Pressing Alt and that key activates the button.
	/// - Parameters:
	///	- label: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withMnemonic label: String) {
		self.init(withGObject: gtk_button_new_with_mnemonic(label))!
	}

	open var BUTTON: UnsafeMutablePointer<GtkButton>! {
		get {
			return GTK_BUTTON(self.GOBJECT)
		}
	}

	/// Emits a #GtkButton::clicked signal to the given #GtkButton.
	open func clicked() -> Swift.Void {
		gtk_button_clicked(GTK_BUTTON(self.GOBJECT))
	}

	/// Emits a #GtkButton::enter signal to the given #GtkButton.
	open func enter() -> Swift.Void {
		gtk_button_enter(GTK_BUTTON(self.GOBJECT))
	}

	/// Gets the alignment of the child in the button.
	/// - Parameters:
	///	- xalign: UnsafeMutablePointer<Float>! (gfloat*)
	///	- yalign: UnsafeMutablePointer<Float>! (gfloat*)
	open func getAlignment(xalign: UnsafeMutablePointer<Float>!, yalign: UnsafeMutablePointer<Float>!) -> Swift.Void {
		gtk_button_get_alignment(GTK_BUTTON(self.GOBJECT), xalign, yalign)
	}

	/// Returns whether the button will ignore the #GtkSettings:gtk-button-images
	/// setting and always show the image, if available.
	/// - Returns: Bool (gboolean)
	open func getAlwaysShowImage() -> Bool {
		return gtk_button_get_always_show_image(GTK_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the button’s event window if it is realized, %NULL otherwise.
	/// This function should be rarely needed.
	/// - Returns: OpaquePointer (GdkWindow*)
	open func getEventWindow() -> OpaquePointer {
		return gtk_button_get_event_window(GTK_BUTTON(self.GOBJECT))
	}

	/// Returns whether the button grabs focus when it is clicked with the mouse.
	/// See gtk_button_set_focus_on_click().
	/// - Returns: Bool (gboolean)
	override open func getFocusOnClick() -> Bool {
		return gtk_button_get_focus_on_click(GTK_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the widget that is currenty set as the image of @button.
	/// This may have been explicitly set by gtk_button_set_image()
	/// or constructed by gtk_button_new_from_stock().
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getImage<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_button_get_image(GTK_BUTTON(self.GOBJECT)))
	}

	/// Gets the position of the image relative to the text
	/// inside the button.
	/// - Returns: GtkPositionType (GtkPositionType)
	open func getImagePosition() -> GtkPositionType {
		return gtk_button_get_image_position(GTK_BUTTON(self.GOBJECT))
	}

	/// Fetches the text from the label of the button, as set by
	/// gtk_button_set_label(). If the label text has not
	/// been set the return value will be %NULL. This will be the
	/// case if you create an empty button with gtk_button_new() to
	/// use as a container.
	/// - Returns: String? (const gchar*)
	open func getLabel() -> String? {
		return String(utf8String: gtk_button_get_label(GTK_BUTTON(self.GOBJECT)))
	}

	/// Returns the current relief style of the given #GtkButton.
	/// - Returns: GtkReliefStyle (GtkReliefStyle)
	open func getRelief() -> GtkReliefStyle {
		return gtk_button_get_relief(GTK_BUTTON(self.GOBJECT))
	}

	/// Returns whether the button label is a stock item.
	/// - Returns: Bool (gboolean)
	open func getUseStock() -> Bool {
		return gtk_button_get_use_stock(GTK_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether an embedded underline in the button label indicates a
	/// mnemonic. See gtk_button_set_use_underline ().
	/// - Returns: Bool (gboolean)
	open func getUseUnderline() -> Bool {
		return gtk_button_get_use_underline(GTK_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Emits a #GtkButton::leave signal to the given #GtkButton.
	open func leave() -> Swift.Void {
		gtk_button_leave(GTK_BUTTON(self.GOBJECT))
	}

	/// Emits a #GtkButton::pressed signal to the given #GtkButton.
	open func pressed() -> Swift.Void {
		gtk_button_pressed(GTK_BUTTON(self.GOBJECT))
	}

	/// Emits a #GtkButton::released signal to the given #GtkButton.
	open func released() -> Swift.Void {
		gtk_button_released(GTK_BUTTON(self.GOBJECT))
	}

	/// Sets the alignment of the child. This property has no effect unless
	/// the child is a #GtkMisc or a #GtkAlignment.
	/// - Parameters:
	///	- xalign: Float (gfloat)
	///	- yalign: Float (gfloat)
	open func setAlignment(xalign: Float, yalign: Float) -> Swift.Void {
		gtk_button_set_alignment(GTK_BUTTON(self.GOBJECT), xalign, yalign)
	}

	/// If %TRUE, the button will ignore the #GtkSettings:gtk-button-images
	/// setting and always show the image, if available.
	/// Use this property if the button  would be useless or hard to use
	/// without the image.
	/// - Parameters:
	///	- alwaysShow: Bool (gboolean)
	open func setAlwaysShowImage(alwaysShow: Bool) -> Swift.Void {
		gtk_button_set_always_show_image(GTK_BUTTON(self.GOBJECT), alwaysShow ? 1 : 0)
	}

	/// Sets whether the button will grab focus when it is clicked with the mouse.
	/// Making mouse clicks not grab focus is useful in places like toolbars where
	/// you don’t want the keyboard focus removed from the main area of the
	/// application.
	/// - Parameters:
	///	- focusOnClick: Bool (gboolean)
	override open func setFocusOnClick(_ focusOnClick: Bool) -> Swift.Void {
		gtk_button_set_focus_on_click(GTK_BUTTON(self.GOBJECT), focusOnClick ? 1 : 0)
	}

	/// Set the image of @button to the given widget. The image will be
	/// displayed if the label text is %NULL or if
	/// #GtkButton:always-show-image is %TRUE. You don’t have to call
	/// gtk_widget_show() on @image yourself.
	/// - Parameters:
	///	- image: CGTKWidget? (GtkWidget*)
	open func setImage(_ image: CGTKWidget?) -> Swift.Void {
		gtk_button_set_image(GTK_BUTTON(self.GOBJECT), image?.WIDGET)
	}

	/// Sets the position of the image relative to the text
	/// inside the button.
	/// - Parameters:
	///	- position: GtkPositionType (GtkPositionType)
	open func setImagePosition(_ position: GtkPositionType) -> Swift.Void {
		gtk_button_set_image_position(GTK_BUTTON(self.GOBJECT), position)
	}

	/// Sets the text of the label of the button to @str. This text is
	/// also used to select the stock item if gtk_button_set_use_stock()
	/// is used.
	/// This will also clear any previously set labels.
	/// - Parameters:
	///	- label: String (const gchar*)
	open func setLabel(_ label: String) -> Swift.Void {
		gtk_button_set_label(GTK_BUTTON(self.GOBJECT), label)
	}

	/// Sets the relief style of the edges of the given #GtkButton widget.
	/// Two styles exist, %GTK_RELIEF_NORMAL and %GTK_RELIEF_NONE.
	/// The default style is, as one can guess, %GTK_RELIEF_NORMAL.
	/// The deprecated value %GTK_RELIEF_HALF behaves the same as
	/// %GTK_RELIEF_NORMAL.
	/// - Parameters:
	///	- relief: GtkReliefStyle (GtkReliefStyle)
	open func setRelief(_ relief: GtkReliefStyle) -> Swift.Void {
		gtk_button_set_relief(GTK_BUTTON(self.GOBJECT), relief)
	}

	/// If %TRUE, the label set on the button is used as a
	/// stock id to select the stock item for the button.
	/// - Parameters:
	///	- useStock: Bool (gboolean)
	open func setUseStock(_ useStock: Bool) -> Swift.Void {
		gtk_button_set_use_stock(GTK_BUTTON(self.GOBJECT), useStock ? 1 : 0)
	}

	/// If true, an underline in the text of the button label indicates
	/// the next character should be used for the mnemonic accelerator key.
	/// - Parameters:
	///	- useUnderline: Bool (gboolean)
	open func setUseUnderline(_ useUnderline: Bool) -> Swift.Void {
		gtk_button_set_use_underline(GTK_BUTTON(self.GOBJECT), useUnderline ? 1 : 0)
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
	///	- actionName: String? (const gchar*)
	open func setActionName(_ actionName: String?) -> Swift.Void {
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

	/// This is a utility function for #GtkActivatable implementors.
	/// When implementing #GtkActivatable you must call this when
	/// handling changes of the #GtkActivatable:related-action, and
	/// you must also use this to break references in #GObject->dispose().
	/// This function adds a reference to the currently set related
	/// action for you, it also makes sure the #GtkActivatable->update()
	/// method is called when the related #GtkAction properties change
	/// and registers to the action’s proxy list.
	/// > Be careful to call this before setting the local
	/// > copy of the #GtkAction property, since this function uses
	/// > gtk_activatable_get_related_action() to retrieve the
	/// > previous action.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func doSetRelatedAction(_ action: UnsafeMutablePointer<GtkAction>!) -> Swift.Void {
		gtk_activatable_do_set_related_action(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

	/// Gets the related #GtkAction for @activatable.
	/// - Returns: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func getRelatedAction() -> UnsafeMutablePointer<GtkAction>! {
		return gtk_activatable_get_related_action(GTK_ACTIVATABLE(self.GOBJECT))
	}

	/// Gets whether this activatable should reset its layout
	/// and appearance when setting the related action or when
	/// the action changes appearance.
	/// - Returns: Bool (gboolean)
	open func getUseActionAppearance() -> Bool {
		return gtk_activatable_get_use_action_appearance(GTK_ACTIVATABLE(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the related action on the @activatable object.
	/// > #GtkActivatable implementors need to handle the #GtkActivatable:related-action
	/// > property and call gtk_activatable_do_set_related_action() when it changes.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func setRelatedAction(_ action: UnsafeMutablePointer<GtkAction>!) -> Swift.Void {
		gtk_activatable_set_related_action(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

	/// Sets whether this activatable should reset its layout and appearance
	/// when setting the related action or when the action changes appearance
	/// > #GtkActivatable implementors need to handle the
	/// > #GtkActivatable:use-action-appearance property and call
	/// > gtk_activatable_sync_action_properties() to update @activatable
	/// > if needed.
	/// - Parameters:
	///	- useAppearance: Bool (gboolean)
	open func setUseActionAppearance(useAppearance: Bool) -> Swift.Void {
		gtk_activatable_set_use_action_appearance(GTK_ACTIVATABLE(self.GOBJECT), useAppearance ? 1 : 0)
	}

	/// This is called to update the activatable completely, this is called
	/// internally when the #GtkActivatable:related-action property is set
	/// or unset and by the implementing class when
	/// #GtkActivatable:use-action-appearance changes.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>? (GtkAction*)
	open func syncActionProperties(action: UnsafeMutablePointer<GtkAction>?) -> Swift.Void {
		gtk_activatable_sync_action_properties(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

}
