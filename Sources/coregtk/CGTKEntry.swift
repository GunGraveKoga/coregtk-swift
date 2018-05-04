/*
 * CGTKEntry.swift
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

public let GTK_TYPE_ENTRY: GType = gtk_entry_get_type()

@inline(__always) public func GTK_ENTRY(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkEntry>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_ENTRY)
}

/// 
/// The #GtkEntry widget is a single line text entry
/// widget. A fairly large set of key bindings are supported
/// by default. If the entered text is longer than the allocation
/// of the widget, the widget will scroll so that the cursor
/// position is visible.
/// When using an entry for passwords and other sensitive information,
/// it can be put into “password mode” using gtk_entry_set_visibility().
/// In this mode, entered text is displayed using a “invisible” character.
/// By default, GTK+ picks the best invisible character that is available
/// in the current font, but it can be changed with
/// gtk_entry_set_invisible_char(). Since 2.16, GTK+ displays a warning
/// when Caps Lock or input methods might interfere with entering text in
/// a password entry. The warning can be turned off with the
/// #GtkEntry:caps-lock-warning property.
/// Since 2.16, GtkEntry has the ability to display progress or activity
/// information behind the text. To make an entry display such information,
/// use gtk_entry_set_progress_fraction() or gtk_entry_set_progress_pulse_step().
/// Additionally, GtkEntry can show icons at either side of the entry. These
/// icons can be activatable by clicking, can be set up as drag source and
/// can have tooltips. To add an icon, use gtk_entry_set_icon_from_gicon() or
/// one of the various other functions that set an icon from a stock id, an
/// icon name or a pixbuf. To trigger an action when the user clicks an icon,
/// connect to the #GtkEntry::icon-press signal. To allow DND operations
/// from an icon, use gtk_entry_set_icon_drag_source(). To set a tooltip on
/// an icon, use gtk_entry_set_icon_tooltip_text() or the corresponding function
/// for markup.
/// Note that functionality or information that is only available by clicking
/// on an icon in an entry may not be accessible at all to users which are not
/// able to use a mouse or other pointing device. It is therefore recommended
/// that any such functionality should also be available by other means, e.g.
/// via the context menu of the entry.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// entry
/// ├── image.left
/// ├── image.right
/// ├── undershoot.left
/// ├── undershoot.right
/// ├── [selection]
/// ├── [progress[.pulse]]
/// ╰── [window.popup]
/// ]|
/// GtkEntry has a main node with the name entry. Depending on the properties
/// of the entry, the style classes .read-only and .flat may appear. The style
/// classes .warning and .error may also be used with entries.
/// When the entry shows icons, it adds subnodes with the name image and the
/// style class .left or .right, depending on where the icon appears.
/// When the entry has a selection, it adds a subnode with the name selection.
/// When the entry shows progress, it adds a subnode with the name progress.
/// The node has the style class .pulse when the shown progress is pulsing.
/// The CSS node for a context menu is added as a subnode below entry as well.
/// The undershoot nodes are used to draw the underflow indication when content
/// is scrolled out of view. These nodes get the .left and .right style classes
/// added depending on where the indication is drawn.
/// When touch is used and touch selection handles are shown, they are using
/// CSS nodes with name cursor-handle. They get the .top or .bottom style class
/// depending on where they are shown in relation to the selection. If there is
/// just a single handle for the text cursor, it gets the style class
/// .insertion-cursor.


open class CGTKEntry : CGTKWidget {
	/// 
	/// Creates a new entry.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_entry_new())!
	}

	/// 
	/// Creates a new entry with the specified text buffer.
	/// Parameters:
	///	- buffer: UnsafeMutablePointer<GtkEntryBuffer>!
	/// - Returns: CGTKWidget
	public convenience init(withBuffer buffer: UnsafeMutablePointer<GtkEntryBuffer>!) {
		self.init(withGObject: gtk_entry_new_with_buffer(buffer))!
	}

	open var ENTRY: UnsafeMutablePointer<GtkEntry>! {
		get {
			return GTK_ENTRY(self.GOBJECT)
		}
	}

	/// 
	/// Retrieves the value set by gtk_entry_set_activates_default().
	/// - Returns: Bool
	open func getActivatesDefault() -> Bool {
		return gtk_entry_get_activates_default(GTK_ENTRY(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the value set by gtk_entry_set_alignment().
	/// - Returns: Float
	open func getAlignment() -> Float {
		return gtk_entry_get_alignment(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Gets the attribute list that was set on the entry using
	/// gtk_entry_set_attributes(), if any.
	/// - Returns: OpaquePointer?
	open func getAttributes() -> OpaquePointer? {
		return gtk_entry_get_attributes(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Get the #GtkEntryBuffer object which holds the text for
	/// this widget.
	/// - Returns: UnsafeMutablePointer<GtkEntryBuffer>!
	open func getBuffer() -> UnsafeMutablePointer<GtkEntryBuffer>! {
		return gtk_entry_get_buffer(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Returns the auxiliary completion object currently in use by @entry.
	/// - Returns: UnsafeMutablePointer<GtkEntryCompletion>!
	open func getCompletion() -> UnsafeMutablePointer<GtkEntryCompletion>! {
		return gtk_entry_get_completion(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Returns the index of the icon which is the source of the current
	/// DND operation, or -1.
	/// This function is meant to be used in a #GtkWidget::drag-data-get
	/// callback.
	/// - Returns: gint
	open func getCurrentIconDragSource() -> gint {
		return gtk_entry_get_current_icon_drag_source(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Retrieves the horizontal cursor adjustment for the entry.
	/// See gtk_entry_set_cursor_hadjustment().
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>?
	open func getCursorHadjustment() -> UnsafeMutablePointer<GtkAdjustment>? {
		return gtk_entry_get_cursor_hadjustment(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Gets the value set by gtk_entry_set_has_frame().
	/// - Returns: Bool
	open func getHasFrame() -> Bool {
		return gtk_entry_get_has_frame(GTK_ENTRY(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the icon is activatable.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	/// - Returns: Bool
	open func getIconActivatable(iconPos: GtkEntryIconPosition) -> Bool {
		return gtk_entry_get_icon_activatable(GTK_ENTRY(self.GOBJECT), iconPos) != 0 ? true : false
	}

	/// 
	/// Gets the area where entry’s icon at @icon_pos is drawn.
	/// This function is useful when drawing something to the
	/// entry in a draw callback.
	/// If the entry is not realized or has no icon at the given position,
	/// @icon_area is filled with zeros. Otherwise, @icon_area will be filled
	/// with the icon’s allocation, relative to @entry’s allocation.
	/// See also gtk_entry_get_text_area()
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	///	- iconArea: UnsafeMutablePointer<GdkRectangle>!
	open func getIconArea(iconPos: GtkEntryIconPosition, iconArea: UnsafeMutablePointer<GdkRectangle>!) {
		gtk_entry_get_icon_area(GTK_ENTRY(self.GOBJECT), iconPos, iconArea)
	}

	/// 
	/// Finds the icon at the given position and return its index. The
	/// position’s coordinates are relative to the @entry’s top left corner.
	/// If @x, @y doesn’t lie inside an icon, -1 is returned.
	/// This function is intended for use in a #GtkWidget::query-tooltip
	/// signal handler.
	/// Parameters:
	///	- x: gint
	///	- y: gint
	/// - Returns: gint
	open func getIconAtPos(x: gint, y: gint) -> gint {
		return gtk_entry_get_icon_at_pos(GTK_ENTRY(self.GOBJECT), x, y)
	}

	/// 
	/// Retrieves the #GIcon used for the icon, or %NULL if there is
	/// no icon or if the icon was set by some other method (e.g., by
	/// stock, pixbuf, or icon name).
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	/// - Returns: OpaquePointer?
	open func getIconGicon(iconPos: GtkEntryIconPosition) -> OpaquePointer? {
		return gtk_entry_get_icon_gicon(GTK_ENTRY(self.GOBJECT), iconPos)
	}

	/// 
	/// Retrieves the icon name used for the icon, or %NULL if there is
	/// no icon or if the icon was set by some other method (e.g., by
	/// pixbuf, stock or gicon).
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	/// - Returns: String?
	open func getIconName(iconPos: GtkEntryIconPosition) -> String? {
		return String(utf8String: gtk_entry_get_icon_name(GTK_ENTRY(self.GOBJECT), iconPos))
	}

	/// 
	/// Retrieves the image used for the icon.
	/// Unlike the other methods of setting and getting icon data, this
	/// method will work regardless of whether the icon was set using a
	/// #GdkPixbuf, a #GIcon, a stock item, or an icon name.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	/// - Returns: OpaquePointer?
	open func getIconPixbuf(iconPos: GtkEntryIconPosition) -> OpaquePointer? {
		return gtk_entry_get_icon_pixbuf(GTK_ENTRY(self.GOBJECT), iconPos)
	}

	/// 
	/// Returns whether the icon appears sensitive or insensitive.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	/// - Returns: Bool
	open func getIconSensitive(iconPos: GtkEntryIconPosition) -> Bool {
		return gtk_entry_get_icon_sensitive(GTK_ENTRY(self.GOBJECT), iconPos) != 0 ? true : false
	}

	/// 
	/// Retrieves the stock id used for the icon, or %NULL if there is
	/// no icon or if the icon was set by some other method (e.g., by
	/// pixbuf, icon name or gicon).
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	/// - Returns: String?
	open func getIconStock(iconPos: GtkEntryIconPosition) -> String? {
		return String(utf8String: gtk_entry_get_icon_stock(GTK_ENTRY(self.GOBJECT), iconPos))
	}

	/// 
	/// Gets the type of representation being used by the icon
	/// to store image data. If the icon has no image data,
	/// the return value will be %GTK_IMAGE_EMPTY.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	/// - Returns: GtkImageType
	open func getIconStorageType(iconPos: GtkEntryIconPosition) -> GtkImageType {
		return gtk_entry_get_icon_storage_type(GTK_ENTRY(self.GOBJECT), iconPos)
	}

	/// 
	/// Gets the contents of the tooltip on the icon at the specified
	/// position in @entry.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	/// - Returns: String?
	open func getIconTooltipMarkup(iconPos: GtkEntryIconPosition) -> String? {
		return String(utf8String: gtk_entry_get_icon_tooltip_markup(GTK_ENTRY(self.GOBJECT), iconPos))
	}

	/// 
	/// Gets the contents of the tooltip on the icon at the specified
	/// position in @entry.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	/// - Returns: String?
	open func getIconTooltipText(iconPos: GtkEntryIconPosition) -> String? {
		return String(utf8String: gtk_entry_get_icon_tooltip_text(GTK_ENTRY(self.GOBJECT), iconPos))
	}

	/// 
	/// This function returns the entry’s #GtkEntry:inner-border property. See
	/// gtk_entry_set_inner_border() for more information.
	/// - Returns: UnsafePointer<GtkBorder>?
	open func getInnerBorder() -> UnsafePointer<GtkBorder>? {
		return gtk_entry_get_inner_border(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Gets the value of the #GtkEntry:input-hints property.
	/// - Returns: GtkInputHints
	open func getInputHints() -> GtkInputHints {
		return gtk_entry_get_input_hints(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Gets the value of the #GtkEntry:input-purpose property.
	/// - Returns: GtkInputPurpose
	open func getInputPurpose() -> GtkInputPurpose {
		return gtk_entry_get_input_purpose(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Retrieves the character displayed in place of the real characters
	/// for entries with visibility set to false. See gtk_entry_set_invisible_char().
	/// - Returns: gunichar
	open func getInvisibleChar() -> gunichar {
		return gtk_entry_get_invisible_char(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Gets the #PangoLayout used to display the entry.
	/// The layout is useful to e.g. convert text positions to
	/// pixel positions, in combination with gtk_entry_get_layout_offsets().
	/// The returned layout is owned by the entry and must not be
	/// modified or freed by the caller.
	/// Keep in mind that the layout text may contain a preedit string, so
	/// gtk_entry_layout_index_to_text_index() and
	/// gtk_entry_text_index_to_layout_index() are needed to convert byte
	/// indices in the layout to byte indices in the entry contents.
	/// - Returns: OpaquePointer
	open func getLayout() -> OpaquePointer {
		return gtk_entry_get_layout(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Obtains the position of the #PangoLayout used to render text
	/// in the entry, in widget coordinates. Useful if you want to line
	/// up the text in an entry with some other text, e.g. when using the
	/// entry to implement editable cells in a sheet widget.
	/// Also useful to convert mouse events into coordinates inside the
	/// #PangoLayout, e.g. to take some action if some part of the entry text
	/// is clicked.
	/// Note that as the user scrolls around in the entry the offsets will
	/// change; you’ll need to connect to the “notify::scroll-offset”
	/// signal to track this. Remember when using the #PangoLayout
	/// functions you need to convert to and from pixels using
	/// PANGO_PIXELS() or #PANGO_SCALE.
	/// Keep in mind that the layout text may contain a preedit string, so
	/// gtk_entry_layout_index_to_text_index() and
	/// gtk_entry_text_index_to_layout_index() are needed to convert byte
	/// indices in the layout to byte indices in the entry contents.
	/// Parameters:
	///	- x: UnsafeMutablePointer<Int32>!
	///	- y: UnsafeMutablePointer<Int32>!
	open func getLayoutOffsets(x: UnsafeMutablePointer<Int32>!, y: UnsafeMutablePointer<Int32>!) {
		gtk_entry_get_layout_offsets(GTK_ENTRY(self.GOBJECT), x, y)
	}

	/// 
	/// Retrieves the maximum allowed length of the text in
	/// @entry. See gtk_entry_set_max_length().
	/// This is equivalent to getting @entry's #GtkEntryBuffer and
	/// calling gtk_entry_buffer_get_max_length() on it.
	/// - Returns: gint
	open func getMaxLength() -> gint {
		return gtk_entry_get_max_length(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Retrieves the desired maximum width of @entry, in characters.
	/// See gtk_entry_set_max_width_chars().
	/// - Returns: gint
	open func getMaxWidthChars() -> gint {
		return gtk_entry_get_max_width_chars(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Gets the value set by gtk_entry_set_overwrite_mode().
	/// - Returns: Bool
	open func getOverwriteMode() -> Bool {
		return gtk_entry_get_overwrite_mode(GTK_ENTRY(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the text that will be displayed when @entry is empty and unfocused
	/// - Returns: String?
	open func getPlaceholderText() -> String? {
		return String(utf8String: gtk_entry_get_placeholder_text(GTK_ENTRY(self.GOBJECT)))
	}

	/// 
	/// Returns the current fraction of the task that’s been completed.
	/// See gtk_entry_set_progress_fraction().
	/// - Returns: Double
	open func getProgressFraction() -> Double {
		return gtk_entry_get_progress_fraction(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Retrieves the pulse step set with gtk_entry_set_progress_pulse_step().
	/// - Returns: Double
	open func getProgressPulseStep() -> Double {
		return gtk_entry_get_progress_pulse_step(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Gets the tabstops that were set on the entry using gtk_entry_set_tabs(), if
	/// any.
	/// - Returns: OpaquePointer?
	open func getTabs() -> OpaquePointer? {
		return gtk_entry_get_tabs(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Retrieves the contents of the entry widget.
	/// See also gtk_editable_get_chars().
	/// This is equivalent to getting @entry's #GtkEntryBuffer and calling
	/// gtk_entry_buffer_get_text() on it.
	/// - Returns: String?
	open func getText() -> String? {
		return String(utf8String: gtk_entry_get_text(GTK_ENTRY(self.GOBJECT)))
	}

	/// 
	/// Gets the area where the entry’s text is drawn. This function is
	/// useful when drawing something to the entry in a draw callback.
	/// If the entry is not realized, @text_area is filled with zeros.
	/// See also gtk_entry_get_icon_area().
	/// Parameters:
	///	- textArea: UnsafeMutablePointer<GdkRectangle>!
	open func getTextArea(_ textArea: UnsafeMutablePointer<GdkRectangle>!) {
		gtk_entry_get_text_area(GTK_ENTRY(self.GOBJECT), textArea)
	}

	/// 
	/// Retrieves the current length of the text in
	/// @entry.
	/// This is equivalent to getting @entry's #GtkEntryBuffer and
	/// calling gtk_entry_buffer_get_length() on it.
	/// - Returns: guint16
	open func getTextLength() -> guint16 {
		return gtk_entry_get_text_length(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Retrieves whether the text in @entry is visible. See
	/// gtk_entry_set_visibility().
	/// - Returns: Bool
	open func getVisibility() -> Bool {
		return gtk_entry_get_visibility(GTK_ENTRY(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Gets the value set by gtk_entry_set_width_chars().
	/// - Returns: gint
	open func getWidthChars() -> gint {
		return gtk_entry_get_width_chars(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Causes @entry to have keyboard focus.
	/// It behaves like gtk_widget_grab_focus(),
	/// except that it doesn't select the contents of the entry.
	/// You only want to call this on some special entries
	/// which the user usually doesn't want to replace all text in,
	/// such as search-as-you-type entries.
	open func grabFocusWithoutSelecting() {
		gtk_entry_grab_focus_without_selecting(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Allow the #GtkEntry input method to internally handle key press
	/// and release events. If this function returns %TRUE, then no further
	/// processing should be done for this key event. See
	/// gtk_im_context_filter_keypress().
	/// Note that you are expected to call this function from your handler
	/// when overriding key event handling. This is needed in the case when
	/// you need to insert your own key handling between the input method
	/// and the default key event handling of the #GtkEntry.
	/// See gtk_text_view_reset_im_context() for an example of use.
	/// Parameters:
	///	- event: UnsafeMutablePointer<GdkEventKey>!
	/// - Returns: Bool
	open func imContextFilterKeypress(event: UnsafeMutablePointer<GdkEventKey>!) -> Bool {
		return gtk_entry_im_context_filter_keypress(GTK_ENTRY(self.GOBJECT), event) != 0 ? true : false
	}

	/// 
	/// Converts from a position in the entry’s #PangoLayout (returned by
	/// gtk_entry_get_layout()) to a position in the entry contents
	/// (returned by gtk_entry_get_text()).
	/// Parameters:
	///	- layoutIndex: gint
	/// - Returns: gint
	open func layoutIndexToTextIndex(layoutIndex: gint) -> gint {
		return gtk_entry_layout_index_to_text_index(GTK_ENTRY(self.GOBJECT), layoutIndex)
	}

	/// 
	/// Indicates that some progress is made, but you don’t know how much.
	/// Causes the entry’s progress indicator to enter “activity mode,”
	/// where a block bounces back and forth. Each call to
	/// gtk_entry_progress_pulse() causes the block to move by a little bit
	/// (the amount of movement per pulse is determined by
	/// gtk_entry_set_progress_pulse_step()).
	open func progressPulse() {
		gtk_entry_progress_pulse(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// Reset the input method context of the entry if needed.
	/// This can be necessary in the case where modifying the buffer
	/// would confuse on-going input method behavior.
	open func resetImContext() {
		gtk_entry_reset_im_context(GTK_ENTRY(self.GOBJECT))
	}

	/// 
	/// If @setting is %TRUE, pressing Enter in the @entry will activate the default
	/// widget for the window containing the entry. This usually means that
	/// the dialog box containing the entry will be closed, since the default
	/// widget is usually one of the dialog buttons.
	/// (For experts: if @setting is %TRUE, the entry calls
	/// gtk_window_activate_default() on the window containing the entry, in
	/// the default handler for the #GtkEntry::activate signal.)
	/// Parameters:
	///	- setting: Bool
	open func setActivatesDefault(setting: Bool) {
		gtk_entry_set_activates_default(GTK_ENTRY(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Sets the alignment for the contents of the entry. This controls
	/// the horizontal positioning of the contents when the displayed
	/// text is shorter than the width of the entry.
	/// Parameters:
	///	- xalign: Float
	open func setAlignment(xalign: Float) {
		gtk_entry_set_alignment(GTK_ENTRY(self.GOBJECT), xalign)
	}

	/// 
	/// Sets a #PangoAttrList; the attributes in the list are applied to the
	/// entry text.
	/// Parameters:
	///	- attrs: OpaquePointer!
	open func setAttributes(attrs: OpaquePointer!) {
		gtk_entry_set_attributes(GTK_ENTRY(self.GOBJECT), attrs)
	}

	/// 
	/// Set the #GtkEntryBuffer object which holds the text for
	/// this widget.
	/// Parameters:
	///	- buffer: UnsafeMutablePointer<GtkEntryBuffer>!
	open func setBuffer(_ buffer: UnsafeMutablePointer<GtkEntryBuffer>!) {
		gtk_entry_set_buffer(GTK_ENTRY(self.GOBJECT), buffer)
	}

	/// 
	/// Sets @completion to be the auxiliary completion object to use with @entry.
	/// All further configuration of the completion mechanism is done on
	/// @completion using the #GtkEntryCompletion API. Completion is disabled if
	/// @completion is set to %NULL.
	/// Parameters:
	///	- completion: UnsafeMutablePointer<GtkEntryCompletion>?
	open func setCompletion(_ completion: UnsafeMutablePointer<GtkEntryCompletion>?) {
		gtk_entry_set_completion(GTK_ENTRY(self.GOBJECT), completion)
	}

	/// 
	/// Hooks up an adjustment to the cursor position in an entry, so that when
	/// the cursor is moved, the adjustment is scrolled to show that position.
	/// See gtk_scrolled_window_get_hadjustment() for a typical way of obtaining
	/// the adjustment.
	/// The adjustment has to be in pixel units and in the same coordinate system
	/// as the entry.
	/// Parameters:
	///	- adjustment: UnsafeMutablePointer<GtkAdjustment>?
	open func setCursorHadjustment(adjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		gtk_entry_set_cursor_hadjustment(GTK_ENTRY(self.GOBJECT), adjustment)
	}

	/// 
	/// Sets whether the entry has a beveled frame around it.
	/// Parameters:
	///	- setting: Bool
	open func setHasFrame(setting: Bool) {
		gtk_entry_set_has_frame(GTK_ENTRY(self.GOBJECT), setting ? 1 : 0)
	}

	/// 
	/// Sets whether the icon is activatable.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	///	- activatable: Bool
	open func setIconActivatable(iconPos: GtkEntryIconPosition, activatable: Bool) {
		gtk_entry_set_icon_activatable(GTK_ENTRY(self.GOBJECT), iconPos, activatable ? 1 : 0)
	}

	/// 
	/// Sets up the icon at the given position so that GTK+ will start a drag
	/// operation when the user clicks and drags the icon.
	/// To handle the drag operation, you need to connect to the usual
	/// #GtkWidget::drag-data-get (or possibly #GtkWidget::drag-data-delete)
	/// signal, and use gtk_entry_get_current_icon_drag_source() in
	/// your signal handler to find out if the drag was started from
	/// an icon.
	/// By default, GTK+ uses the icon as the drag icon. You can use the
	/// #GtkWidget::drag-begin signal to set a different icon. Note that you
	/// have to use g_signal_connect_after() to ensure that your signal handler
	/// gets executed after the default handler.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	///	- targetList: OpaquePointer!
	///	- actions: GdkDragAction
	open func setIconDragSource(iconPos: GtkEntryIconPosition, targetList: OpaquePointer!, actions: GdkDragAction) {
		gtk_entry_set_icon_drag_source(GTK_ENTRY(self.GOBJECT), iconPos, targetList, actions)
	}

	/// 
	/// Sets the icon shown in the entry at the specified position
	/// from the current icon theme.
	/// If the icon isn’t known, a “broken image” icon will be displayed
	/// instead.
	/// If @icon is %NULL, no icon will be shown in the specified position.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	///	- icon: OpaquePointer?
	open func setIconFromGicon(iconPos: GtkEntryIconPosition, icon: OpaquePointer?) {
		gtk_entry_set_icon_from_gicon(GTK_ENTRY(self.GOBJECT), iconPos, icon)
	}

	/// 
	/// Sets the icon shown in the entry at the specified position
	/// from the current icon theme.
	/// If the icon name isn’t known, a “broken image” icon will be displayed
	/// instead.
	/// If @icon_name is %NULL, no icon will be shown in the specified position.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	///	- iconName: String
	open func setIconFromIconName(iconPos: GtkEntryIconPosition, iconName: String) {
		gtk_entry_set_icon_from_icon_name(GTK_ENTRY(self.GOBJECT), iconPos, iconName)
	}

	/// 
	/// Sets the icon shown in the specified position using a pixbuf.
	/// If @pixbuf is %NULL, no icon will be shown in the specified position.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	///	- pixbuf: OpaquePointer?
	open func setIconFromPixbuf(iconPos: GtkEntryIconPosition, pixbuf: OpaquePointer?) {
		gtk_entry_set_icon_from_pixbuf(GTK_ENTRY(self.GOBJECT), iconPos, pixbuf)
	}

	/// 
	/// Sets the icon shown in the entry at the specified position from
	/// a stock image.
	/// If @stock_id is %NULL, no icon will be shown in the specified position.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	///	- stockId: String
	open func setIconFromStock(iconPos: GtkEntryIconPosition, stockId: String) {
		gtk_entry_set_icon_from_stock(GTK_ENTRY(self.GOBJECT), iconPos, stockId)
	}

	/// 
	/// Sets the sensitivity for the specified icon.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	///	- sensitive: Bool
	open func setIconSensitive(iconPos: GtkEntryIconPosition, sensitive: Bool) {
		gtk_entry_set_icon_sensitive(GTK_ENTRY(self.GOBJECT), iconPos, sensitive ? 1 : 0)
	}

	/// 
	/// Sets @tooltip as the contents of the tooltip for the icon at
	/// the specified position. @tooltip is assumed to be marked up with
	/// the [Pango text markup language][PangoMarkupFormat].
	/// Use %NULL for @tooltip to remove an existing tooltip.
	/// See also gtk_widget_set_tooltip_markup() and
	/// gtk_entry_set_icon_tooltip_text().
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	///	- tooltip: String
	open func setIconTooltipMarkup(iconPos: GtkEntryIconPosition, tooltip: String) {
		gtk_entry_set_icon_tooltip_markup(GTK_ENTRY(self.GOBJECT), iconPos, tooltip)
	}

	/// 
	/// Sets @tooltip as the contents of the tooltip for the icon
	/// at the specified position.
	/// Use %NULL for @tooltip to remove an existing tooltip.
	/// See also gtk_widget_set_tooltip_text() and
	/// gtk_entry_set_icon_tooltip_markup().
	/// If you unset the widget tooltip via gtk_widget_set_tooltip_text() or
	/// gtk_widget_set_tooltip_markup(), this sets GtkWidget:has-tooltip to %FALSE,
	/// which suppresses icon tooltips too. You can resolve this by then calling
	/// gtk_widget_set_has_tooltip() to set GtkWidget:has-tooltip back to %TRUE, or
	/// setting at least one non-empty tooltip on any icon achieves the same result.
	/// Parameters:
	///	- iconPos: GtkEntryIconPosition
	///	- tooltip: String
	open func setIconTooltipText(iconPos: GtkEntryIconPosition, tooltip: String) {
		gtk_entry_set_icon_tooltip_text(GTK_ENTRY(self.GOBJECT), iconPos, tooltip)
	}

	/// 
	/// Sets %entry’s inner-border property to @border, or clears it if %NULL
	/// is passed. The inner-border is the area around the entry’s text, but
	/// inside its frame.
	/// If set, this property overrides the inner-border style property.
	/// Overriding the style-provided border is useful when you want to do
	/// in-place editing of some text in a canvas or list widget, where
	/// pixel-exact positioning of the entry is important.
	/// Parameters:
	///	- border: UnsafePointer<GtkBorder>?
	open func setInnerBorder(_ border: UnsafePointer<GtkBorder>?) {
		gtk_entry_set_inner_border(GTK_ENTRY(self.GOBJECT), border)
	}

	/// 
	/// Sets the #GtkEntry:input-hints property, which
	/// allows input methods to fine-tune their behaviour.
	/// Parameters:
	///	- hints: GtkInputHints
	open func setInputHints(_ hints: GtkInputHints) {
		gtk_entry_set_input_hints(GTK_ENTRY(self.GOBJECT), hints)
	}

	/// 
	/// Sets the #GtkEntry:input-purpose property which
	/// can be used by on-screen keyboards and other input
	/// methods to adjust their behaviour.
	/// Parameters:
	///	- purpose: GtkInputPurpose
	open func setInputPurpose(_ purpose: GtkInputPurpose) {
		gtk_entry_set_input_purpose(GTK_ENTRY(self.GOBJECT), purpose)
	}

	/// 
	/// Sets the character to use in place of the actual text when
	/// gtk_entry_set_visibility() has been called to set text visibility
	/// to %FALSE. i.e. this is the character used in “password mode” to
	/// show the user how many characters have been typed. By default, GTK+
	/// picks the best invisible char available in the current font. If you
	/// set the invisible char to 0, then the user will get no feedback
	/// at all; there will be no text on the screen as they type.
	/// Parameters:
	///	- ch: gunichar
	open func setInvisibleChar(ch: gunichar) {
		gtk_entry_set_invisible_char(GTK_ENTRY(self.GOBJECT), ch)
	}

	/// 
	/// Sets the maximum allowed length of the contents of the widget. If
	/// the current contents are longer than the given length, then they
	/// will be truncated to fit.
	/// This is equivalent to getting @entry's #GtkEntryBuffer and
	/// calling gtk_entry_buffer_set_max_length() on it.
	/// ]|
	/// Parameters:
	///	- max: gint
	open func setMaxLength(max: gint) {
		gtk_entry_set_max_length(GTK_ENTRY(self.GOBJECT), max)
	}

	/// 
	/// Sets the desired maximum width in characters of @entry.
	/// Parameters:
	///	- nchars: gint
	open func setMaxWidthChars(nchars: gint) {
		gtk_entry_set_max_width_chars(GTK_ENTRY(self.GOBJECT), nchars)
	}

	/// 
	/// Sets whether the text is overwritten when typing in the #GtkEntry.
	/// Parameters:
	///	- overwrite: Bool
	open func setOverwriteMode(overwrite: Bool) {
		gtk_entry_set_overwrite_mode(GTK_ENTRY(self.GOBJECT), overwrite ? 1 : 0)
	}

	/// 
	/// Sets text to be displayed in @entry when it is empty and unfocused.
	/// This can be used to give a visual hint of the expected contents of
	/// the #GtkEntry.
	/// Note that since the placeholder text gets removed when the entry
	/// received focus, using this feature is a bit problematic if the entry
	/// is given the initial focus in a window. Sometimes this can be
	/// worked around by delaying the initial focus setting until the
	/// first key event arrives.
	/// Parameters:
	///	- text: String
	open func setPlaceholderText(_ text: String) {
		gtk_entry_set_placeholder_text(GTK_ENTRY(self.GOBJECT), text)
	}

	/// 
	/// Causes the entry’s progress indicator to “fill in” the given
	/// fraction of the bar. The fraction should be between 0.0 and 1.0,
	/// inclusive.
	/// Parameters:
	///	- fraction: Double
	open func setProgressFraction(_ fraction: Double) {
		gtk_entry_set_progress_fraction(GTK_ENTRY(self.GOBJECT), fraction)
	}

	/// 
	/// Sets the fraction of total entry width to move the progress
	/// bouncing block for each call to gtk_entry_progress_pulse().
	/// Parameters:
	///	- fraction: Double
	open func setProgressPulseStep(fraction: Double) {
		gtk_entry_set_progress_pulse_step(GTK_ENTRY(self.GOBJECT), fraction)
	}

	/// 
	/// Sets a #PangoTabArray; the tabstops in the array are applied to the entry
	/// text.
	/// Parameters:
	///	- tabs: OpaquePointer!
	open func setTabs(_ tabs: OpaquePointer!) {
		gtk_entry_set_tabs(GTK_ENTRY(self.GOBJECT), tabs)
	}

	/// 
	/// Sets the text in the widget to the given
	/// value, replacing the current contents.
	/// See gtk_entry_buffer_set_text().
	/// Parameters:
	///	- text: String
	open func setText(_ text: String) {
		gtk_entry_set_text(GTK_ENTRY(self.GOBJECT), text)
	}

	/// 
	/// Sets whether the contents of the entry are visible or not.
	/// When visibility is set to %FALSE, characters are displayed
	/// as the invisible char, and will also appear that way when
	/// the text in the entry widget is copied elsewhere.
	/// By default, GTK+ picks the best invisible character available
	/// in the current font, but it can be changed with
	/// gtk_entry_set_invisible_char().
	/// Note that you probably want to set #GtkEntry:input-purpose
	/// to %GTK_INPUT_PURPOSE_PASSWORD or %GTK_INPUT_PURPOSE_PIN to
	/// inform input methods about the purpose of this entry,
	/// in addition to setting visibility to %FALSE.
	/// Parameters:
	///	- visible: Bool
	open func setVisibility(visible: Bool) {
		gtk_entry_set_visibility(GTK_ENTRY(self.GOBJECT), visible ? 1 : 0)
	}

	/// 
	/// Changes the size request of the entry to be about the right size
	/// for @n_chars characters. Note that it changes the size
	/// request, the size can still be affected by
	/// how you pack the widget into containers. If @n_chars is -1, the
	/// size reverts to the default entry size.
	/// Parameters:
	///	- nchars: gint
	open func setWidthChars(nchars: gint) {
		gtk_entry_set_width_chars(GTK_ENTRY(self.GOBJECT), nchars)
	}

	/// 
	/// Converts from a position in the entry contents (returned
	/// by gtk_entry_get_text()) to a position in the
	/// entry’s #PangoLayout (returned by gtk_entry_get_layout(),
	/// with text retrieved via pango_layout_get_text()).
	/// Parameters:
	///	- textIndex: gint
	/// - Returns: gint
	open func textIndexToLayoutIndex(textIndex: gint) -> gint {
		return gtk_entry_text_index_to_layout_index(GTK_ENTRY(self.GOBJECT), textIndex)
	}

	/// 
	/// Unsets the invisible char previously set with
	/// gtk_entry_set_invisible_char(). So that the
	/// default invisible char is used again.
	open func unsetInvisibleChar() {
		gtk_entry_unset_invisible_char(GTK_ENTRY(self.GOBJECT))
	}

}
