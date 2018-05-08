/*
 * CGTKTextView.swift
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

public let GTK_TYPE_TEXT_VIEW: GType = gtk_text_view_get_type()

@inline(__always) public func GTK_TEXT_VIEW(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkTextView>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_TEXT_VIEW)
}

/// You may wish to begin by reading the
/// [text widget conceptual overview][TextWidget]
/// which gives an overview of all the objects and data
/// types related to the text widget and how they work together.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// textview.view
/// ├── border.top
/// ├── border.left
/// ├── text
/// │   ╰── [selection]
/// ├── border.right
/// ├── border.bottom
/// ╰── [window.popup]
/// ]|
/// GtkTextView has a main css node with name textview and style class .view,
/// and subnodes for each of the border windows, and the main text area,
/// with names border and text, respectively. The border nodes each get
/// one of the style classes .left, .right, .top or .bottom.
/// A node representing the selection will appear below the text node.
/// If a context menu is opened, the window node will appear as a subnode
/// of the main node.


open class CGTKTextView : CGTKContainer, CGTKScrollable {
	/// Creates a new #GtkTextView. If you don’t call gtk_text_view_set_buffer()
	/// before using the text view, an empty default buffer will be created
	/// for you. Get the buffer with gtk_text_view_get_buffer(). If you want
	/// to specify your own buffer, consider gtk_text_view_new_with_buffer().
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_text_view_new())!
	}

	/// Creates a new #GtkTextView widget displaying the buffer
	/// @buffer. One buffer can be shared among many widgets.
	/// @buffer may be %NULL to create a default buffer, in which case
	/// this function is equivalent to gtk_text_view_new(). The
	/// text view adds its own reference count to the buffer; it does not
	/// take over an existing reference.
	/// - Parameters:
	///	- buffer: UnsafeMutablePointer<GtkTextBuffer>! (GtkTextBuffer*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withBuffer buffer: UnsafeMutablePointer<GtkTextBuffer>!) {
		self.init(withGObject: gtk_text_view_new_with_buffer(buffer))!
	}

	open var TEXTVIEW: UnsafeMutablePointer<GtkTextView>! {
		get {
			return GTK_TEXT_VIEW(self.GOBJECT)
		}
	}

	/// Adds a child widget in the text buffer, at the given @anchor.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- anchor: UnsafeMutablePointer<GtkTextChildAnchor>! (GtkTextChildAnchor*)
	open func addChildAtAnchor(child: CGTKWidget, anchor: UnsafeMutablePointer<GtkTextChildAnchor>!) -> Swift.Void {
		gtk_text_view_add_child_at_anchor(GTK_TEXT_VIEW(self.GOBJECT), child.WIDGET, anchor)
	}

	/// Adds a child at fixed coordinates in one of the text widget's
	/// windows.
	/// The window must have nonzero size (see
	/// gtk_text_view_set_border_window_size()). Note that the child
	/// coordinates are given relative to scrolling. When
	/// placing a child in #GTK_TEXT_WINDOW_WIDGET, scrolling is
	/// irrelevant, the child floats above all scrollable areas. But when
	/// placing a child in one of the scrollable windows (border windows or
	/// text window) it will move with the scrolling as needed.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- whichWindow: GtkTextWindowType (GtkTextWindowType)
	///	- xpos: gint (gint)
	///	- ypos: gint (gint)
	open func addChildInWindow(child: CGTKWidget, whichWindow: GtkTextWindowType, xpos: gint, ypos: gint) -> Swift.Void {
		gtk_text_view_add_child_in_window(GTK_TEXT_VIEW(self.GOBJECT), child.WIDGET, whichWindow, xpos, ypos)
	}

	/// Moves the given @iter backward by one display (wrapped) line.
	/// A display line is different from a paragraph. Paragraphs are
	/// separated by newlines or other paragraph separator characters.
	/// Display lines are created by line-wrapping a paragraph. If
	/// wrapping is turned off, display lines and paragraphs will be the
	/// same. Display lines are divided differently for each view, since
	/// they depend on the view’s width; paragraphs are the same in all
	/// views, since they depend on the contents of the #GtkTextBuffer.
	/// - Parameters:
	///	- iter: UnsafeMutablePointer<GtkTextIter>! (GtkTextIter*)
	/// - Returns: Bool (gboolean)
	open func backwardDisplayLine(iter: UnsafeMutablePointer<GtkTextIter>!) -> Bool {
		return gtk_text_view_backward_display_line(GTK_TEXT_VIEW(self.GOBJECT), iter) != 0 ? true : false
	}

	/// Moves the given @iter backward to the next display line start.
	/// A display line is different from a paragraph. Paragraphs are
	/// separated by newlines or other paragraph separator characters.
	/// Display lines are created by line-wrapping a paragraph. If
	/// wrapping is turned off, display lines and paragraphs will be the
	/// same. Display lines are divided differently for each view, since
	/// they depend on the view’s width; paragraphs are the same in all
	/// views, since they depend on the contents of the #GtkTextBuffer.
	/// - Parameters:
	///	- iter: UnsafeMutablePointer<GtkTextIter>! (GtkTextIter*)
	/// - Returns: Bool (gboolean)
	open func backwardDisplayLineStart(iter: UnsafeMutablePointer<GtkTextIter>!) -> Bool {
		return gtk_text_view_backward_display_line_start(GTK_TEXT_VIEW(self.GOBJECT), iter) != 0 ? true : false
	}

	/// Converts coordinate (@buffer_x, @buffer_y) to coordinates for the window
	/// @win, and stores the result in (@window_x, @window_y).
	/// Note that you can’t convert coordinates for a nonexisting window (see
	/// gtk_text_view_set_border_window_size()).
	/// - Parameters:
	///	- win: GtkTextWindowType (GtkTextWindowType)
	///	- bufferX: gint (gint)
	///	- bufferY: gint (gint)
	///	- windowX: UnsafeMutablePointer<Int32>! (gint*)
	///	- windowY: UnsafeMutablePointer<Int32>! (gint*)
	open func bufferToWindowCoords(win: GtkTextWindowType, bufferX: gint, bufferY: gint, windowX: UnsafeMutablePointer<Int32>!, windowY: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_text_view_buffer_to_window_coords(GTK_TEXT_VIEW(self.GOBJECT), win, bufferX, bufferY, windowX, windowY)
	}

	/// Moves the given @iter forward by one display (wrapped) line.
	/// A display line is different from a paragraph. Paragraphs are
	/// separated by newlines or other paragraph separator characters.
	/// Display lines are created by line-wrapping a paragraph. If
	/// wrapping is turned off, display lines and paragraphs will be the
	/// same. Display lines are divided differently for each view, since
	/// they depend on the view’s width; paragraphs are the same in all
	/// views, since they depend on the contents of the #GtkTextBuffer.
	/// - Parameters:
	///	- iter: UnsafeMutablePointer<GtkTextIter>! (GtkTextIter*)
	/// - Returns: Bool (gboolean)
	open func forwardDisplayLine(iter: UnsafeMutablePointer<GtkTextIter>!) -> Bool {
		return gtk_text_view_forward_display_line(GTK_TEXT_VIEW(self.GOBJECT), iter) != 0 ? true : false
	}

	/// Moves the given @iter forward to the next display line end.
	/// A display line is different from a paragraph. Paragraphs are
	/// separated by newlines or other paragraph separator characters.
	/// Display lines are created by line-wrapping a paragraph. If
	/// wrapping is turned off, display lines and paragraphs will be the
	/// same. Display lines are divided differently for each view, since
	/// they depend on the view’s width; paragraphs are the same in all
	/// views, since they depend on the contents of the #GtkTextBuffer.
	/// - Parameters:
	///	- iter: UnsafeMutablePointer<GtkTextIter>! (GtkTextIter*)
	/// - Returns: Bool (gboolean)
	open func forwardDisplayLineEnd(iter: UnsafeMutablePointer<GtkTextIter>!) -> Bool {
		return gtk_text_view_forward_display_line_end(GTK_TEXT_VIEW(self.GOBJECT), iter) != 0 ? true : false
	}

	/// Returns whether pressing the Tab key inserts a tab characters.
	/// gtk_text_view_set_accepts_tab().
	/// - Returns: Bool (gboolean)
	open func getAcceptsTab() -> Bool {
		return gtk_text_view_get_accepts_tab(GTK_TEXT_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the width of the specified border window. See
	/// gtk_text_view_set_border_window_size().
	/// - Parameters:
	///	- type: GtkTextWindowType (GtkTextWindowType)
	/// - Returns: gint (gint)
	open func getBorderWindowSize(type: GtkTextWindowType) -> gint {
		return gtk_text_view_get_border_window_size(GTK_TEXT_VIEW(self.GOBJECT), type)
	}

	/// Gets the bottom margin for text in the @text_view.
	/// - Returns: gint (gint)
	open func getBottomMargin() -> gint {
		return gtk_text_view_get_bottom_margin(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Returns the #GtkTextBuffer being displayed by this text view.
	/// The reference count on the buffer is not incremented; the caller
	/// of this function won’t own a new reference.
	/// - Returns: UnsafeMutablePointer<GtkTextBuffer>! (GtkTextBuffer*)
	open func getBuffer() -> UnsafeMutablePointer<GtkTextBuffer>! {
		return gtk_text_view_get_buffer(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Given an @iter within a text layout, determine the positions of the
	/// strong and weak cursors if the insertion point is at that
	/// iterator. The position of each cursor is stored as a zero-width
	/// rectangle. The strong cursor location is the location where
	/// characters of the directionality equal to the base direction of the
	/// paragraph are inserted.  The weak cursor location is the location
	/// where characters of the directionality opposite to the base
	/// direction of the paragraph are inserted.
	/// If @iter is %NULL, the actual cursor position is used.
	/// Note that if @iter happens to be the actual cursor position, and
	/// there is currently an IM preedit sequence being entered, the
	/// returned locations will be adjusted to account for the preedit
	/// cursor’s offset within the preedit sequence.
	/// The rectangle position is in buffer coordinates; use
	/// gtk_text_view_buffer_to_window_coords() to convert these
	/// coordinates to coordinates for one of the windows in the text view.
	/// - Parameters:
	///	- iter: UnsafePointer<GtkTextIter>? (const GtkTextIter*)
	///	- strong: UnsafeMutablePointer<GdkRectangle>? = nil (GdkRectangle*)
	///	- weak: UnsafeMutablePointer<GdkRectangle>? = nil (GdkRectangle*)
	open func getCursorLocations(iter: UnsafePointer<GtkTextIter>?, strong: UnsafeMutablePointer<GdkRectangle>? = nil, weak: UnsafeMutablePointer<GdkRectangle>? = nil) -> Swift.Void {
		gtk_text_view_get_cursor_locations(GTK_TEXT_VIEW(self.GOBJECT), iter, strong, weak)
	}

	/// Find out whether the cursor should be displayed.
	/// - Returns: Bool (gboolean)
	open func getCursorVisible() -> Bool {
		return gtk_text_view_get_cursor_visible(GTK_TEXT_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Obtains a copy of the default text attributes. These are the
	/// attributes used for text unless a tag overrides them.
	/// You’d typically pass the default attributes in to
	/// gtk_text_iter_get_attributes() in order to get the
	/// attributes in effect at a given text position.
	/// The return value is a copy owned by the caller of this function,
	/// and should be freed with gtk_text_attributes_unref().
	/// - Returns: UnsafeMutablePointer<GtkTextAttributes>! (GtkTextAttributes*)
	open func getDefaultAttributes() -> UnsafeMutablePointer<GtkTextAttributes>! {
		return gtk_text_view_get_default_attributes(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Returns the default editability of the #GtkTextView. Tags in the
	/// buffer may override this setting for some ranges of text.
	/// - Returns: Bool (gboolean)
	open func getEditable() -> Bool {
		return gtk_text_view_get_editable(GTK_TEXT_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the horizontal-scrolling #GtkAdjustment.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func getHadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_text_view_get_hadjustment(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the default indentation of paragraphs in @text_view.
	/// Tags in the view’s buffer may override the default.
	/// The indentation may be negative.
	/// - Returns: gint (gint)
	open func getIndent() -> gint {
		return gtk_text_view_get_indent(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the value of the #GtkTextView:input-hints property.
	/// - Returns: GtkInputHints (GtkInputHints)
	open func getInputHints() -> GtkInputHints {
		return gtk_text_view_get_input_hints(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the value of the #GtkTextView:input-purpose property.
	/// - Returns: GtkInputPurpose (GtkInputPurpose)
	open func getInputPurpose() -> GtkInputPurpose {
		return gtk_text_view_get_input_purpose(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Retrieves the iterator at buffer coordinates @x and @y. Buffer
	/// coordinates are coordinates for the entire buffer, not just the
	/// currently-displayed portion.  If you have coordinates from an
	/// event, you have to convert those to buffer coordinates with
	/// gtk_text_view_window_to_buffer_coords().
	/// - Parameters:
	///	- iter: UnsafeMutablePointer<GtkTextIter>! (GtkTextIter*)
	///	- x: gint (gint)
	///	- y: gint (gint)
	/// - Returns: Bool (gboolean)
	open func getIterAtLocation(iter: UnsafeMutablePointer<GtkTextIter>!, x: gint, y: gint) -> Bool {
		return gtk_text_view_get_iter_at_location(GTK_TEXT_VIEW(self.GOBJECT), iter, x, y) != 0 ? true : false
	}

	/// Retrieves the iterator pointing to the character at buffer
	/// coordinates @x and @y. Buffer coordinates are coordinates for
	/// the entire buffer, not just the currently-displayed portion.
	/// If you have coordinates from an event, you have to convert
	/// those to buffer coordinates with
	/// gtk_text_view_window_to_buffer_coords().
	/// Note that this is different from gtk_text_view_get_iter_at_location(),
	/// which returns cursor locations, i.e. positions between
	/// characters.
	/// - Parameters:
	///	- iter: UnsafeMutablePointer<GtkTextIter>! (GtkTextIter*)
	///	- trailing: UnsafeMutablePointer<Int32>! (gint*)
	///	- x: gint (gint)
	///	- y: gint (gint)
	/// - Returns: Bool (gboolean)
	open func getIterAtPosition(iter: UnsafeMutablePointer<GtkTextIter>!, trailing: UnsafeMutablePointer<Int32>!, x: gint, y: gint) -> Bool {
		return gtk_text_view_get_iter_at_position(GTK_TEXT_VIEW(self.GOBJECT), iter, trailing, x, y) != 0 ? true : false
	}

	/// Gets a rectangle which roughly contains the character at @iter.
	/// The rectangle position is in buffer coordinates; use
	/// gtk_text_view_buffer_to_window_coords() to convert these
	/// coordinates to coordinates for one of the windows in the text view.
	/// - Parameters:
	///	- iter: UnsafePointer<GtkTextIter>! (const GtkTextIter*)
	///	- location: UnsafeMutablePointer<GdkRectangle>! (GdkRectangle*)
	open func getIterLocation(iter: UnsafePointer<GtkTextIter>!, location: UnsafeMutablePointer<GdkRectangle>!) -> Swift.Void {
		gtk_text_view_get_iter_location(GTK_TEXT_VIEW(self.GOBJECT), iter, location)
	}

	/// Gets the default justification of paragraphs in @text_view.
	/// Tags in the buffer may override the default.
	/// - Returns: GtkJustification (GtkJustification)
	open func getJustification() -> GtkJustification {
		return gtk_text_view_get_justification(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the default left margin size of paragraphs in the @text_view.
	/// Tags in the buffer may override the default.
	/// - Returns: gint (gint)
	open func getLeftMargin() -> gint {
		return gtk_text_view_get_left_margin(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the #GtkTextIter at the start of the line containing
	/// the coordinate @y. @y is in buffer coordinates, convert from
	/// window coordinates with gtk_text_view_window_to_buffer_coords().
	/// If non-%NULL, @line_top will be filled with the coordinate of the top
	/// edge of the line.
	/// - Parameters:
	///	- targetIter: UnsafeMutablePointer<GtkTextIter>! (GtkTextIter*)
	///	- y: gint (gint)
	///	- lineTop: UnsafeMutablePointer<Int32>! (gint*)
	open func getLineAtY(targetIter: UnsafeMutablePointer<GtkTextIter>!, y: gint, lineTop: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_text_view_get_line_at_y(GTK_TEXT_VIEW(self.GOBJECT), targetIter, y, lineTop)
	}

	/// Gets the y coordinate of the top of the line containing @iter,
	/// and the height of the line. The coordinate is a buffer coordinate;
	/// convert to window coordinates with gtk_text_view_buffer_to_window_coords().
	/// - Parameters:
	///	- iter: UnsafePointer<GtkTextIter>! (const GtkTextIter*)
	///	- y: UnsafeMutablePointer<Int32>! (gint*)
	///	- height: UnsafeMutablePointer<Int32>! (gint*)
	open func getLineYrange(iter: UnsafePointer<GtkTextIter>!, y: UnsafeMutablePointer<Int32>!, height: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_text_view_get_line_yrange(GTK_TEXT_VIEW(self.GOBJECT), iter, y, height)
	}

	/// Gets the value of the #GtkTextView:monospace property.
	/// - Returns: Bool (gboolean)
	open func getMonospace() -> Bool {
		return gtk_text_view_get_monospace(GTK_TEXT_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the #GtkTextView is in overwrite mode or not.
	/// - Returns: Bool (gboolean)
	open func getOverwrite() -> Bool {
		return gtk_text_view_get_overwrite(GTK_TEXT_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the default number of pixels to put above paragraphs.
	/// Adding this function with gtk_text_view_get_pixels_below_lines()
	/// is equal to the line space between each paragraph.
	/// - Returns: gint (gint)
	open func getPixelsAboveLines() -> gint {
		return gtk_text_view_get_pixels_above_lines(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the value set by gtk_text_view_set_pixels_below_lines().
	/// The line space is the sum of the value returned by this function and the
	/// value returned by gtk_text_view_get_pixels_above_lines().
	/// - Returns: gint (gint)
	open func getPixelsBelowLines() -> gint {
		return gtk_text_view_get_pixels_below_lines(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the value set by gtk_text_view_set_pixels_inside_wrap().
	/// - Returns: gint (gint)
	open func getPixelsInsideWrap() -> gint {
		return gtk_text_view_get_pixels_inside_wrap(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the default right margin for text in @text_view. Tags
	/// in the buffer may override the default.
	/// - Returns: gint (gint)
	open func getRightMargin() -> gint {
		return gtk_text_view_get_right_margin(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the default tabs for @text_view. Tags in the buffer may
	/// override the defaults. The returned array will be %NULL if
	/// “standard” (8-space) tabs are used. Free the return value
	/// with pango_tab_array_free().
	/// - Returns: OpaquePointer? (PangoTabArray*)
	open func getTabs() -> OpaquePointer? {
		return gtk_text_view_get_tabs(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the top margin for text in the @text_view.
	/// - Returns: gint (gint)
	open func getTopMargin() -> gint {
		return gtk_text_view_get_top_margin(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Gets the vertical-scrolling #GtkAdjustment.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func getVadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_text_view_get_vadjustment(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Fills @visible_rect with the currently-visible
	/// region of the buffer, in buffer coordinates. Convert to window coordinates
	/// with gtk_text_view_buffer_to_window_coords().
	/// - Parameters:
	///	- visibleRect: UnsafeMutablePointer<GdkRectangle>! (GdkRectangle*)
	open func getVisibleRect(_ visibleRect: UnsafeMutablePointer<GdkRectangle>!) -> Swift.Void {
		gtk_text_view_get_visible_rect(GTK_TEXT_VIEW(self.GOBJECT), visibleRect)
	}

	/// Retrieves the #GdkWindow corresponding to an area of the text view;
	/// possible windows include the overall widget window, child windows
	/// on the left, right, top, bottom, and the window that displays the
	/// text buffer. Windows are %NULL and nonexistent if their width or
	/// height is 0, and are nonexistent before the widget has been
	/// realized.
	/// - Parameters:
	///	- win: GtkTextWindowType (GtkTextWindowType)
	/// - Returns: OpaquePointer? (GdkWindow*)
	open func getWindow(win: GtkTextWindowType) -> OpaquePointer? {
		return gtk_text_view_get_window(GTK_TEXT_VIEW(self.GOBJECT), win)
	}

	/// Usually used to find out which window an event corresponds to.
	/// If you connect to an event signal on @text_view, this function
	/// should be called on `event->window` to see which window it was.
	/// - Parameters:
	///	- window: OpaquePointer! (GdkWindow*)
	/// - Returns: GtkTextWindowType (GtkTextWindowType)
	open func getWindowType(window: OpaquePointer!) -> GtkTextWindowType {
		return gtk_text_view_get_window_type(GTK_TEXT_VIEW(self.GOBJECT), window)
	}

	/// Gets the line wrapping for the view.
	/// - Returns: GtkWrapMode (GtkWrapMode)
	open func getWrapMode() -> GtkWrapMode {
		return gtk_text_view_get_wrap_mode(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Allow the #GtkTextView input method to internally handle key press
	/// and release events. If this function returns %TRUE, then no further
	/// processing should be done for this key event. See
	/// gtk_im_context_filter_keypress().
	/// Note that you are expected to call this function from your handler
	/// when overriding key event handling. This is needed in the case when
	/// you need to insert your own key handling between the input method
	/// and the default key event handling of the #GtkTextView.
	/// |[<!-- language="C" -->
	/// static gboolean
	/// gtk_foo_bar_key_press_event (GtkWidget   *widget,
	/// GdkEventKey *event)
	/// {
	/// guint keyval;
	/// gdk_event_get_keyval ((GdkEvent*)event, &keyval);
	/// if (keyval == GDK_KEY_Return || keyval == GDK_KEY_KP_Enter)
	/// {
	/// if (gtk_text_view_im_context_filter_keypress (GTK_TEXT_VIEW (widget), event))
	/// return TRUE;
	/// }
	/// // Do some stuff
	/// return GTK_WIDGET_CLASS (gtk_foo_bar_parent_class)->key_press_event (widget, event);
	/// }
	/// ]|
	/// - Parameters:
	///	- event: UnsafeMutablePointer<GdkEventKey>! (GdkEventKey*)
	/// - Returns: Bool (gboolean)
	open func imContextFilterKeypress(event: UnsafeMutablePointer<GdkEventKey>!) -> Bool {
		return gtk_text_view_im_context_filter_keypress(GTK_TEXT_VIEW(self.GOBJECT), event) != 0 ? true : false
	}

	/// Updates the position of a child, as for gtk_text_view_add_child_in_window().
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- xpos: gint (gint)
	///	- ypos: gint (gint)
	open func moveChild(_ child: CGTKWidget, xpos: gint, ypos: gint) -> Swift.Void {
		gtk_text_view_move_child(GTK_TEXT_VIEW(self.GOBJECT), child.WIDGET, xpos, ypos)
	}

	/// Moves a mark within the buffer so that it's
	/// located within the currently-visible text area.
	/// - Parameters:
	///	- mark: UnsafeMutablePointer<GtkTextMark>! (GtkTextMark*)
	/// - Returns: Bool (gboolean)
	open func moveMarkOnscreen(mark: UnsafeMutablePointer<GtkTextMark>!) -> Bool {
		return gtk_text_view_move_mark_onscreen(GTK_TEXT_VIEW(self.GOBJECT), mark) != 0 ? true : false
	}

	/// Move the iterator a given number of characters visually, treating
	/// it as the strong cursor position. If @count is positive, then the
	/// new strong cursor position will be @count positions to the right of
	/// the old cursor position. If @count is negative then the new strong
	/// cursor position will be @count positions to the left of the old
	/// cursor position.
	/// In the presence of bi-directional text, the correspondence
	/// between logical and visual order will depend on the direction
	/// of the current run, and there may be jumps when the cursor
	/// is moved off of the end of a run.
	/// - Parameters:
	///	- iter: UnsafeMutablePointer<GtkTextIter>! (GtkTextIter*)
	///	- count: gint (gint)
	/// - Returns: Bool (gboolean)
	open func moveVisually(iter: UnsafeMutablePointer<GtkTextIter>!, count: gint) -> Bool {
		return gtk_text_view_move_visually(GTK_TEXT_VIEW(self.GOBJECT), iter, count) != 0 ? true : false
	}

	/// Moves the cursor to the currently visible region of the
	/// buffer, it it isn’t there already.
	/// - Returns: Bool (gboolean)
	open func placeCursorOnscreen() -> Bool {
		return gtk_text_view_place_cursor_onscreen(GTK_TEXT_VIEW(self.GOBJECT)) != 0 ? true : false
	}

	/// Ensures that the cursor is shown (i.e. not in an 'off' blink
	/// interval) and resets the time that it will stay blinking (or
	/// visible, in case blinking is disabled).
	/// This function should be called in response to user input
	/// (e.g. from derived classes that override the textview's
	/// #GtkWidget::key-press-event handler).
	open func resetCursorBlink() -> Swift.Void {
		gtk_text_view_reset_cursor_blink(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Reset the input method context of the text view if needed.
	/// This can be necessary in the case where modifying the buffer
	/// would confuse on-going input method behavior.
	open func resetImContext() -> Swift.Void {
		gtk_text_view_reset_im_context(GTK_TEXT_VIEW(self.GOBJECT))
	}

	/// Scrolls @text_view the minimum distance such that @mark is contained
	/// within the visible area of the widget.
	/// - Parameters:
	///	- mark: UnsafeMutablePointer<GtkTextMark>! (GtkTextMark*)
	open func scrollMarkOnscreen(mark: UnsafeMutablePointer<GtkTextMark>!) -> Swift.Void {
		gtk_text_view_scroll_mark_onscreen(GTK_TEXT_VIEW(self.GOBJECT), mark)
	}

	/// Scrolls @text_view so that @iter is on the screen in the position
	/// indicated by @xalign and @yalign. An alignment of 0.0 indicates
	/// left or top, 1.0 indicates right or bottom, 0.5 means center.
	/// If @use_align is %FALSE, the text scrolls the minimal distance to
	/// get the mark onscreen, possibly not scrolling at all. The effective
	/// screen for purposes of this function is reduced by a margin of size
	/// @within_margin.
	/// Note that this function uses the currently-computed height of the
	/// lines in the text buffer. Line heights are computed in an idle
	/// handler; so this function may not have the desired effect if it’s
	/// called before the height computations. To avoid oddness, consider
	/// using gtk_text_view_scroll_to_mark() which saves a point to be
	/// scrolled to after line validation.
	/// - Parameters:
	///	- iter: UnsafeMutablePointer<GtkTextIter>! (GtkTextIter*)
	///	- withinMargin: Double (gdouble)
	///	- useAlign: Bool (gboolean)
	///	- xalign: Double (gdouble)
	///	- yalign: Double (gdouble)
	/// - Returns: Bool (gboolean)
	open func scrollToIter(_ iter: UnsafeMutablePointer<GtkTextIter>!, withinMargin: Double, useAlign: Bool, xalign: Double, yalign: Double) -> Bool {
		return gtk_text_view_scroll_to_iter(GTK_TEXT_VIEW(self.GOBJECT), iter, withinMargin, useAlign ? 1 : 0, xalign, yalign) != 0 ? true : false
	}

	/// Scrolls @text_view so that @mark is on the screen in the position
	/// indicated by @xalign and @yalign. An alignment of 0.0 indicates
	/// left or top, 1.0 indicates right or bottom, 0.5 means center.
	/// If @use_align is %FALSE, the text scrolls the minimal distance to
	/// get the mark onscreen, possibly not scrolling at all. The effective
	/// screen for purposes of this function is reduced by a margin of size
	/// @within_margin.
	/// - Parameters:
	///	- mark: UnsafeMutablePointer<GtkTextMark>! (GtkTextMark*)
	///	- withinMargin: Double (gdouble)
	///	- useAlign: Bool (gboolean)
	///	- xalign: Double (gdouble)
	///	- yalign: Double (gdouble)
	open func scrollToMark(_ mark: UnsafeMutablePointer<GtkTextMark>!, withinMargin: Double, useAlign: Bool, xalign: Double, yalign: Double) -> Swift.Void {
		gtk_text_view_scroll_to_mark(GTK_TEXT_VIEW(self.GOBJECT), mark, withinMargin, useAlign ? 1 : 0, xalign, yalign)
	}

	/// Sets the behavior of the text widget when the Tab key is pressed.
	/// If @accepts_tab is %TRUE, a tab character is inserted. If @accepts_tab
	/// is %FALSE the keyboard focus is moved to the next widget in the focus
	/// chain.
	/// - Parameters:
	///	- acceptsTab: Bool (gboolean)
	open func setAcceptsTab(_ acceptsTab: Bool) -> Swift.Void {
		gtk_text_view_set_accepts_tab(GTK_TEXT_VIEW(self.GOBJECT), acceptsTab ? 1 : 0)
	}

	/// Sets the width of %GTK_TEXT_WINDOW_LEFT or %GTK_TEXT_WINDOW_RIGHT,
	/// or the height of %GTK_TEXT_WINDOW_TOP or %GTK_TEXT_WINDOW_BOTTOM.
	/// Automatically destroys the corresponding window if the size is set
	/// to 0, and creates the window if the size is set to non-zero.  This
	/// function can only be used for the “border windows”, and it won’t
	/// work with %GTK_TEXT_WINDOW_WIDGET, %GTK_TEXT_WINDOW_TEXT, or
	/// %GTK_TEXT_WINDOW_PRIVATE.
	/// - Parameters:
	///	- type: GtkTextWindowType (GtkTextWindowType)
	///	- size: gint (gint)
	open func setBorderWindowSize(type: GtkTextWindowType, size: gint) -> Swift.Void {
		gtk_text_view_set_border_window_size(GTK_TEXT_VIEW(self.GOBJECT), type, size)
	}

	/// Sets the bottom margin for text in @text_view.
	/// Note that this function is confusingly named.
	/// In CSS terms, the value set here is padding.
	/// - Parameters:
	///	- bottomMargin: gint (gint)
	open func setBottomMargin(_ bottomMargin: gint) -> Swift.Void {
		gtk_text_view_set_bottom_margin(GTK_TEXT_VIEW(self.GOBJECT), bottomMargin)
	}

	/// Sets @buffer as the buffer being displayed by @text_view. The previous
	/// buffer displayed by the text view is unreferenced, and a reference is
	/// added to @buffer. If you owned a reference to @buffer before passing it
	/// to this function, you must remove that reference yourself; #GtkTextView
	/// will not “adopt” it.
	/// - Parameters:
	///	- buffer: UnsafeMutablePointer<GtkTextBuffer>? (GtkTextBuffer*)
	open func setBuffer(_ buffer: UnsafeMutablePointer<GtkTextBuffer>?) -> Swift.Void {
		gtk_text_view_set_buffer(GTK_TEXT_VIEW(self.GOBJECT), buffer)
	}

	/// Toggles whether the insertion point should be displayed. A buffer with
	/// no editable text probably shouldn’t have a visible cursor, so you may
	/// want to turn the cursor off.
	/// Note that this property may be overridden by the
	/// #GtkSettings:gtk-keynave-use-caret settings.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setCursorVisible(setting: Bool) -> Swift.Void {
		gtk_text_view_set_cursor_visible(GTK_TEXT_VIEW(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets the default editability of the #GtkTextView. You can override
	/// this default setting with tags in the buffer, using the “editable”
	/// attribute of tags.
	/// - Parameters:
	///	- setting: Bool (gboolean)
	open func setEditable(setting: Bool) -> Swift.Void {
		gtk_text_view_set_editable(GTK_TEXT_VIEW(self.GOBJECT), setting ? 1 : 0)
	}

	/// Sets the default indentation for paragraphs in @text_view.
	/// Tags in the buffer may override the default.
	/// - Parameters:
	///	- indent: gint (gint)
	open func setIndent(_ indent: gint) -> Swift.Void {
		gtk_text_view_set_indent(GTK_TEXT_VIEW(self.GOBJECT), indent)
	}

	/// Sets the #GtkTextView:input-hints property, which
	/// allows input methods to fine-tune their behaviour.
	/// - Parameters:
	///	- hints: GtkInputHints (GtkInputHints)
	open func setInputHints(_ hints: GtkInputHints) -> Swift.Void {
		gtk_text_view_set_input_hints(GTK_TEXT_VIEW(self.GOBJECT), hints)
	}

	/// Sets the #GtkTextView:input-purpose property which
	/// can be used by on-screen keyboards and other input
	/// methods to adjust their behaviour.
	/// - Parameters:
	///	- purpose: GtkInputPurpose (GtkInputPurpose)
	open func setInputPurpose(_ purpose: GtkInputPurpose) -> Swift.Void {
		gtk_text_view_set_input_purpose(GTK_TEXT_VIEW(self.GOBJECT), purpose)
	}

	/// Sets the default justification of text in @text_view.
	/// Tags in the view’s buffer may override the default.
	/// - Parameters:
	///	- justification: GtkJustification (GtkJustification)
	open func setJustification(_ justification: GtkJustification) -> Swift.Void {
		gtk_text_view_set_justification(GTK_TEXT_VIEW(self.GOBJECT), justification)
	}

	/// Sets the default left margin for text in @text_view.
	/// Tags in the buffer may override the default.
	/// Note that this function is confusingly named.
	/// In CSS terms, the value set here is padding.
	/// - Parameters:
	///	- leftMargin: gint (gint)
	open func setLeftMargin(_ leftMargin: gint) -> Swift.Void {
		gtk_text_view_set_left_margin(GTK_TEXT_VIEW(self.GOBJECT), leftMargin)
	}

	/// Sets the #GtkTextView:monospace property, which
	/// indicates that the text view should use monospace
	/// fonts.
	/// - Parameters:
	///	- monospace: Bool (gboolean)
	open func setMonospace(_ monospace: Bool) -> Swift.Void {
		gtk_text_view_set_monospace(GTK_TEXT_VIEW(self.GOBJECT), monospace ? 1 : 0)
	}

	/// Changes the #GtkTextView overwrite mode.
	/// - Parameters:
	///	- overwrite: Bool (gboolean)
	open func setOverwrite(_ overwrite: Bool) -> Swift.Void {
		gtk_text_view_set_overwrite(GTK_TEXT_VIEW(self.GOBJECT), overwrite ? 1 : 0)
	}

	/// Sets the default number of blank pixels above paragraphs in @text_view.
	/// Tags in the buffer for @text_view may override the defaults.
	/// - Parameters:
	///	- pixelsAboveLines: gint (gint)
	open func setPixelsAboveLines(_ pixelsAboveLines: gint) -> Swift.Void {
		gtk_text_view_set_pixels_above_lines(GTK_TEXT_VIEW(self.GOBJECT), pixelsAboveLines)
	}

	/// Sets the default number of pixels of blank space
	/// to put below paragraphs in @text_view. May be overridden
	/// by tags applied to @text_view’s buffer.
	/// - Parameters:
	///	- pixelsBelowLines: gint (gint)
	open func setPixelsBelowLines(_ pixelsBelowLines: gint) -> Swift.Void {
		gtk_text_view_set_pixels_below_lines(GTK_TEXT_VIEW(self.GOBJECT), pixelsBelowLines)
	}

	/// Sets the default number of pixels of blank space to leave between
	/// display/wrapped lines within a paragraph. May be overridden by
	/// tags in @text_view’s buffer.
	/// - Parameters:
	///	- pixelsInsideWrap: gint (gint)
	open func setPixelsInsideWrap(_ pixelsInsideWrap: gint) -> Swift.Void {
		gtk_text_view_set_pixels_inside_wrap(GTK_TEXT_VIEW(self.GOBJECT), pixelsInsideWrap)
	}

	/// Sets the default right margin for text in the text view.
	/// Tags in the buffer may override the default.
	/// Note that this function is confusingly named.
	/// In CSS terms, the value set here is padding.
	/// - Parameters:
	///	- rightMargin: gint (gint)
	open func setRightMargin(_ rightMargin: gint) -> Swift.Void {
		gtk_text_view_set_right_margin(GTK_TEXT_VIEW(self.GOBJECT), rightMargin)
	}

	/// Sets the default tab stops for paragraphs in @text_view.
	/// Tags in the buffer may override the default.
	/// - Parameters:
	///	- tabs: OpaquePointer! (PangoTabArray*)
	open func setTabs(_ tabs: OpaquePointer!) -> Swift.Void {
		gtk_text_view_set_tabs(GTK_TEXT_VIEW(self.GOBJECT), tabs)
	}

	/// Sets the top margin for text in @text_view.
	/// Note that this function is confusingly named.
	/// In CSS terms, the value set here is padding.
	/// - Parameters:
	///	- topMargin: gint (gint)
	open func setTopMargin(_ topMargin: gint) -> Swift.Void {
		gtk_text_view_set_top_margin(GTK_TEXT_VIEW(self.GOBJECT), topMargin)
	}

	/// Sets the line wrapping for the view.
	/// - Parameters:
	///	- wrapMode: GtkWrapMode (GtkWrapMode)
	open func setWrapMode(_ wrapMode: GtkWrapMode) -> Swift.Void {
		gtk_text_view_set_wrap_mode(GTK_TEXT_VIEW(self.GOBJECT), wrapMode)
	}

	/// Determines whether @iter is at the start of a display line.
	/// See gtk_text_view_forward_display_line() for an explanation of
	/// display lines vs. paragraphs.
	/// - Parameters:
	///	- iter: UnsafePointer<GtkTextIter>! (const GtkTextIter*)
	/// - Returns: Bool (gboolean)
	open func startsDisplayLine(iter: UnsafePointer<GtkTextIter>!) -> Bool {
		return gtk_text_view_starts_display_line(GTK_TEXT_VIEW(self.GOBJECT), iter) != 0 ? true : false
	}

	/// Converts coordinates on the window identified by @win to buffer
	/// coordinates, storing the result in (@buffer_x,@buffer_y).
	/// Note that you can’t convert coordinates for a nonexisting window (see
	/// gtk_text_view_set_border_window_size()).
	/// - Parameters:
	///	- win: GtkTextWindowType (GtkTextWindowType)
	///	- windowX: gint (gint)
	///	- windowY: gint (gint)
	///	- bufferX: UnsafeMutablePointer<Int32>! (gint*)
	///	- bufferY: UnsafeMutablePointer<Int32>! (gint*)
	open func windowToBufferCoords(win: GtkTextWindowType, windowX: gint, windowY: gint, bufferX: UnsafeMutablePointer<Int32>!, bufferY: UnsafeMutablePointer<Int32>!) -> Swift.Void {
		gtk_text_view_window_to_buffer_coords(GTK_TEXT_VIEW(self.GOBJECT), win, windowX, windowY, bufferX, bufferY)
	}

	/// Returns the size of a non-scrolling border around the
	/// outside of the scrollable. An example for this would
	/// be treeview headers. GTK+ can use this information to
	/// display overlayed graphics, like the overshoot indication,
	/// at the right position.
	/// - Parameters:
	///	- border: UnsafeMutablePointer<GtkBorder>! (GtkBorder*)
	/// - Returns: Bool (gboolean)
	open func getBorder(_ border: UnsafeMutablePointer<GtkBorder>!) -> Bool {
		return gtk_scrollable_get_border(GTK_SCROLLABLE(self.GOBJECT), border) != 0 ? true : false
	}

	/// Gets the horizontal #GtkScrollablePolicy.
	/// - Returns: GtkScrollablePolicy (GtkScrollablePolicy)
	open func getHscrollPolicy() -> GtkScrollablePolicy {
		return gtk_scrollable_get_hscroll_policy(GTK_SCROLLABLE(self.GOBJECT))
	}

	/// Gets the vertical #GtkScrollablePolicy.
	/// - Returns: GtkScrollablePolicy (GtkScrollablePolicy)
	open func getVscrollPolicy() -> GtkScrollablePolicy {
		return gtk_scrollable_get_vscroll_policy(GTK_SCROLLABLE(self.GOBJECT))
	}

	/// Sets the horizontal adjustment of the #GtkScrollable.
	/// - Parameters:
	///	- hadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setHadjustment(_ hadjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_scrollable_set_hadjustment(GTK_SCROLLABLE(self.GOBJECT), hadjustment)
	}

	/// Sets the #GtkScrollablePolicy to determine whether
	/// horizontal scrolling should start below the minimum width or
	/// below the natural width.
	/// - Parameters:
	///	- policy: GtkScrollablePolicy (GtkScrollablePolicy)
	open func setHscrollPolicy(_ policy: GtkScrollablePolicy) -> Swift.Void {
		gtk_scrollable_set_hscroll_policy(GTK_SCROLLABLE(self.GOBJECT), policy)
	}

	/// Sets the vertical adjustment of the #GtkScrollable.
	/// - Parameters:
	///	- vadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	open func setVadjustment(_ vadjustment: UnsafeMutablePointer<GtkAdjustment>?) -> Swift.Void {
		gtk_scrollable_set_vadjustment(GTK_SCROLLABLE(self.GOBJECT), vadjustment)
	}

	/// Sets the #GtkScrollablePolicy to determine whether
	/// vertical scrolling should start below the minimum height or
	/// below the natural height.
	/// - Parameters:
	///	- policy: GtkScrollablePolicy (GtkScrollablePolicy)
	open func setVscrollPolicy(_ policy: GtkScrollablePolicy) -> Swift.Void {
		gtk_scrollable_set_vscroll_policy(GTK_SCROLLABLE(self.GOBJECT), policy)
	}

}
