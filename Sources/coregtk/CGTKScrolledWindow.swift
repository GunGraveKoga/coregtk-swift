/*
 * CGTKScrolledWindow.swift
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

public let GTK_TYPE_SCROLLED_WINDOW: GType = gtk_scrolled_window_get_type()

@inline(__always) public func GTK_SCROLLED_WINDOW(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkScrolledWindow>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SCROLLED_WINDOW)
}

/// GtkScrolledWindow is a container that accepts a single child widget, makes
/// that child scrollable using either internally added scrollbars or externally
/// associated adjustments, and optionally draws a frame around the child.
/// Widgets with native scrolling support, i.e. those whose classes implement the
/// #GtkScrollable interface, are added directly. For other types of widget, the
/// class #GtkViewport acts as an adaptor, giving scrollability to other widgets.
/// GtkScrolledWindow’s implementation of gtk_container_add() intelligently
/// accounts for whether or not the added child is a #GtkScrollable. If it isn’t,
/// #GtkScrolledWindow wraps the child in a #GtkViewport and adds that for you.
/// Therefore, you can just add any child widget and not worry about the details.
/// If gtk_container_add() has added a #GtkViewport for you, you can remove
/// both your added child widget from the #GtkViewport, and the #GtkViewport
/// from the GtkScrolledWindow, like this:
/// |[<!-- language="C" -->
/// GtkWidget *scrolled_window = gtk_scrolled_window_new (NULL, NULL);
/// GtkWidget *child_widget = gtk_button_new ();
/// // GtkButton is not a GtkScrollable, so GtkScrolledWindow will automatically
/// // add a GtkViewport.
/// gtk_container_add (GTK_CONTAINER (scrolled_window),
/// child_widget);
/// // Either of these will result in child_widget being unparented:
/// gtk_container_remove (GTK_CONTAINER (scrolled_window),
/// child_widget);
/// // or
/// gtk_container_remove (GTK_CONTAINER (scrolled_window),
/// gtk_bin_get_child (GTK_BIN (scrolled_window)));
/// ]|
/// Unless #GtkScrolledWindow:policy is GTK_POLICY_NEVER or GTK_POLICY_EXTERNAL,
/// GtkScrolledWindow adds internal #GtkScrollbar widgets around its child. The
/// scroll position of the child, and if applicable the scrollbars, is controlled
/// by the #GtkScrolledWindow:hadjustment and #GtkScrolledWindow:vadjustment
/// that are associated with the GtkScrolledWindow. See the docs on #GtkScrollbar
/// for the details, but note that the “step_increment” and “page_increment”
/// fields are only effective if the policy causes scrollbars to be present.
/// If a GtkScrolledWindow doesn’t behave quite as you would like, or
/// doesn’t have exactly the right layout, it’s very possible to set up
/// your own scrolling with #GtkScrollbar and for example a #GtkGrid.
/// # Touch support
/// GtkScrolledWindow has built-in support for touch devices. When a
/// touchscreen is used, swiping will move the scrolled window, and will
/// expose 'kinetic' behavior. This can be turned off with the
/// #GtkScrolledWindow:kinetic-scrolling property if it is undesired.
/// GtkScrolledWindow also displays visual 'overshoot' indication when
/// the content is pulled beyond the end, and this situation can be
/// captured with the #GtkScrolledWindow::edge-overshot signal.
/// If no mouse device is present, the scrollbars will overlayed as
/// narrow, auto-hiding indicators over the content. If traditional
/// scrollbars are desired although no mouse is present, this behaviour
/// can be turned off with the #GtkScrolledWindow:overlay-scrolling
/// property.
/// # CSS nodes
/// GtkScrolledWindow has a main CSS node with name scrolledwindow.
/// It uses subnodes with names overshoot and undershoot to
/// draw the overflow and underflow indications. These nodes get
/// the .left, .right, .top or .bottom style class added depending
/// on where the indication is drawn.
/// GtkScrolledWindow also sets the positional style classes (.left,
/// .right, .top, .bottom) and style classes related to overlay
/// scrolling (.overlay-indicator, .dragging, .hovering) on its scrollbars.
/// If both scrollbars are visible, the area where they meet is drawn
/// with a subnode named junction.


open class CGTKScrolledWindow : CGTKBin {
	/// Creates a new scrolled window.
	/// The two arguments are the scrolled window’s adjustments; these will be
	/// shared with the scrollbars and the child widget to keep the bars in sync
	/// with the child. Usually you want to pass %NULL for the adjustments, which
	/// will cause the scrolled window to create them for you.
	/// - Parameters:
	///	- hadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	///	- vadjustment: UnsafeMutablePointer<GtkAdjustment>? (GtkAdjustment*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(hadjustment: UnsafeMutablePointer<GtkAdjustment>?, vadjustment: UnsafeMutablePointer<GtkAdjustment>?) {
		self.init(withGObject: gtk_scrolled_window_new(hadjustment, vadjustment))!
	}

	open var SCROLLEDWINDOW: UnsafeMutablePointer<GtkScrolledWindow>! {
		get {
			return GTK_SCROLLED_WINDOW(self.GOBJECT)
		}
	}

	/// Used to add children without native scrolling capabilities. This
	/// is simply a convenience function; it is equivalent to adding the
	/// unscrollable child to a viewport, then adding the viewport to the
	/// scrolled window. If a child has native scrolling, use
	/// gtk_container_add() instead of this function.
	/// The viewport scrolls the child by moving its #GdkWindow, and takes
	/// the size of the child to be the size of its toplevel #GdkWindow.
	/// This will be very wrong for most widgets that support native scrolling;
	/// for example, if you add a widget such as #GtkTreeView with a viewport,
	/// the whole widget will scroll, including the column headings. Thus,
	/// widgets with native scrolling support should not be used with the
	/// #GtkViewport proxy.
	/// A widget supports scrolling natively if it implements the
	/// #GtkScrollable interface.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func addWithViewport(child: CGTKWidget) -> Swift.Void {
		gtk_scrolled_window_add_with_viewport(GTK_SCROLLED_WINDOW(self.GOBJECT), child.WIDGET)
	}

	/// Return whether button presses are captured during kinetic
	/// scrolling. See gtk_scrolled_window_set_capture_button_press().
	/// - Returns: Bool (gboolean)
	open func getCaptureButtonPress() -> Bool {
		return gtk_scrolled_window_get_capture_button_press(GTK_SCROLLED_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the horizontal scrollbar’s adjustment, used to connect the
	/// horizontal scrollbar to the child widget’s horizontal scroll
	/// functionality.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func getHadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_scrolled_window_get_hadjustment(GTK_SCROLLED_WINDOW(self.GOBJECT))
	}

	/// Returns the horizontal scrollbar of @scrolled_window.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getHscrollbar<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_scrolled_window_get_hscrollbar(GTK_SCROLLED_WINDOW(self.GOBJECT)))!
	}

	/// Returns the specified kinetic scrolling behavior.
	/// - Returns: Bool (gboolean)
	open func getKineticScrolling() -> Bool {
		return gtk_scrolled_window_get_kinetic_scrolling(GTK_SCROLLED_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the maximum content height set.
	/// - Returns: gint (gint)
	open func getMaxContentHeight() -> gint {
		return gtk_scrolled_window_get_max_content_height(GTK_SCROLLED_WINDOW(self.GOBJECT))
	}

	/// Returns the maximum content width set.
	/// - Returns: gint (gint)
	open func getMaxContentWidth() -> gint {
		return gtk_scrolled_window_get_max_content_width(GTK_SCROLLED_WINDOW(self.GOBJECT))
	}

	/// Gets the minimal content height of @scrolled_window, or -1 if not set.
	/// - Returns: gint (gint)
	open func getMinContentHeight() -> gint {
		return gtk_scrolled_window_get_min_content_height(GTK_SCROLLED_WINDOW(self.GOBJECT))
	}

	/// Gets the minimum content width of @scrolled_window, or -1 if not set.
	/// - Returns: gint (gint)
	open func getMinContentWidth() -> gint {
		return gtk_scrolled_window_get_min_content_width(GTK_SCROLLED_WINDOW(self.GOBJECT))
	}

	/// Returns whether overlay scrolling is enabled for this scrolled window.
	/// - Returns: Bool (gboolean)
	open func getOverlayScrolling() -> Bool {
		return gtk_scrolled_window_get_overlay_scrolling(GTK_SCROLLED_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the placement of the contents with respect to the scrollbars
	/// for the scrolled window. See gtk_scrolled_window_set_placement().
	/// - Returns: GtkCornerType (GtkCornerType)
	open func getPlacement() -> GtkCornerType {
		return gtk_scrolled_window_get_placement(GTK_SCROLLED_WINDOW(self.GOBJECT))
	}

	/// Retrieves the current policy values for the horizontal and vertical
	/// scrollbars. See gtk_scrolled_window_set_policy().
	/// - Parameters:
	///	- hscrollbarPolicy: UnsafeMutablePointer<GtkPolicyType>! (GtkPolicyType*)
	///	- vscrollbarPolicy: UnsafeMutablePointer<GtkPolicyType>! (GtkPolicyType*)
	open func getPolicy(hscrollbarPolicy: UnsafeMutablePointer<GtkPolicyType>!, vscrollbarPolicy: UnsafeMutablePointer<GtkPolicyType>!) -> Swift.Void {
		gtk_scrolled_window_get_policy(GTK_SCROLLED_WINDOW(self.GOBJECT), hscrollbarPolicy, vscrollbarPolicy)
	}

	/// Reports whether the natural height of the child will be calculated and propagated
	/// through the scrolled windows requested natural height.
	/// - Returns: Bool (gboolean)
	open func getPropagateNaturalHeight() -> Bool {
		return gtk_scrolled_window_get_propagate_natural_height(GTK_SCROLLED_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// Reports whether the natural width of the child will be calculated and propagated
	/// through the scrolled windows requested natural width.
	/// - Returns: Bool (gboolean)
	open func getPropagateNaturalWidth() -> Bool {
		return gtk_scrolled_window_get_propagate_natural_width(GTK_SCROLLED_WINDOW(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the shadow type of the scrolled window. See
	/// gtk_scrolled_window_set_shadow_type().
	/// - Returns: GtkShadowType (GtkShadowType)
	open func getShadowType() -> GtkShadowType {
		return gtk_scrolled_window_get_shadow_type(GTK_SCROLLED_WINDOW(self.GOBJECT))
	}

	/// Returns the vertical scrollbar’s adjustment, used to connect the
	/// vertical scrollbar to the child widget’s vertical scroll functionality.
	/// - Returns: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func getVadjustment() -> UnsafeMutablePointer<GtkAdjustment>! {
		return gtk_scrolled_window_get_vadjustment(GTK_SCROLLED_WINDOW(self.GOBJECT))
	}

	/// Returns the vertical scrollbar of @scrolled_window.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getVscrollbar<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_scrolled_window_get_vscrollbar(GTK_SCROLLED_WINDOW(self.GOBJECT)))!
	}

	/// Changes the behaviour of @scrolled_window with regard to the initial
	/// event that possibly starts kinetic scrolling. When @capture_button_press
	/// is set to %TRUE, the event is captured by the scrolled window, and
	/// then later replayed if it is meant to go to the child widget.
	/// This should be enabled if any child widgets perform non-reversible
	/// actions on #GtkWidget::button-press-event. If they don't, and handle
	/// additionally handle #GtkWidget::grab-broken-event, it might be better
	/// to set @capture_button_press to %FALSE.
	/// This setting only has an effect if kinetic scrolling is enabled.
	/// - Parameters:
	///	- captureButtonPress: Bool (gboolean)
	open func setCaptureButtonPress(_ captureButtonPress: Bool) -> Swift.Void {
		gtk_scrolled_window_set_capture_button_press(GTK_SCROLLED_WINDOW(self.GOBJECT), captureButtonPress ? 1 : 0)
	}

	/// Sets the #GtkAdjustment for the horizontal scrollbar.
	/// - Parameters:
	///	- hadjustment: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func setHadjustment(_ hadjustment: UnsafeMutablePointer<GtkAdjustment>!) -> Swift.Void {
		gtk_scrolled_window_set_hadjustment(GTK_SCROLLED_WINDOW(self.GOBJECT), hadjustment)
	}

	/// Turns kinetic scrolling on or off.
	/// Kinetic scrolling only applies to devices with source
	/// %GDK_SOURCE_TOUCHSCREEN.
	/// - Parameters:
	///	- kineticScrolling: Bool (gboolean)
	open func setKineticScrolling(_ kineticScrolling: Bool) -> Swift.Void {
		gtk_scrolled_window_set_kinetic_scrolling(GTK_SCROLLED_WINDOW(self.GOBJECT), kineticScrolling ? 1 : 0)
	}

	/// Sets the maximum height that @scrolled_window should keep visible. The
	/// @scrolled_window will grow up to this height before it starts scrolling
	/// the content.
	/// It is a programming error to set the maximum content height to a value
	/// smaller than #GtkScrolledWindow:min-content-height.
	/// - Parameters:
	///	- height: gint (gint)
	open func setMaxContentHeight(_ height: gint) -> Swift.Void {
		gtk_scrolled_window_set_max_content_height(GTK_SCROLLED_WINDOW(self.GOBJECT), height)
	}

	/// Sets the maximum width that @scrolled_window should keep visible. The
	/// @scrolled_window will grow up to this width before it starts scrolling
	/// the content.
	/// It is a programming error to set the maximum content width to a value
	/// smaller than #GtkScrolledWindow:min-content-width.
	/// - Parameters:
	///	- width: gint (gint)
	open func setMaxContentWidth(_ width: gint) -> Swift.Void {
		gtk_scrolled_window_set_max_content_width(GTK_SCROLLED_WINDOW(self.GOBJECT), width)
	}

	/// Sets the minimum height that @scrolled_window should keep visible.
	/// Note that this can and (usually will) be smaller than the minimum
	/// size of the content.
	/// It is a programming error to set the minimum content height to a
	/// value greater than #GtkScrolledWindow:max-content-height.
	/// - Parameters:
	///	- height: gint (gint)
	open func setMinContentHeight(_ height: gint) -> Swift.Void {
		gtk_scrolled_window_set_min_content_height(GTK_SCROLLED_WINDOW(self.GOBJECT), height)
	}

	/// Sets the minimum width that @scrolled_window should keep visible.
	/// Note that this can and (usually will) be smaller than the minimum
	/// size of the content.
	/// It is a programming error to set the minimum content width to a
	/// value greater than #GtkScrolledWindow:max-content-width.
	/// - Parameters:
	///	- width: gint (gint)
	open func setMinContentWidth(_ width: gint) -> Swift.Void {
		gtk_scrolled_window_set_min_content_width(GTK_SCROLLED_WINDOW(self.GOBJECT), width)
	}

	/// Enables or disables overlay scrolling for this scrolled window.
	/// - Parameters:
	///	- overlayScrolling: Bool (gboolean)
	open func setOverlayScrolling(_ overlayScrolling: Bool) -> Swift.Void {
		gtk_scrolled_window_set_overlay_scrolling(GTK_SCROLLED_WINDOW(self.GOBJECT), overlayScrolling ? 1 : 0)
	}

	/// Sets the placement of the contents with respect to the scrollbars
	/// for the scrolled window.
	/// The default is %GTK_CORNER_TOP_LEFT, meaning the child is
	/// in the top left, with the scrollbars underneath and to the right.
	/// Other values in #GtkCornerType are %GTK_CORNER_TOP_RIGHT,
	/// %GTK_CORNER_BOTTOM_LEFT, and %GTK_CORNER_BOTTOM_RIGHT.
	/// See also gtk_scrolled_window_get_placement() and
	/// gtk_scrolled_window_unset_placement().
	/// - Parameters:
	///	- windowPlacement: GtkCornerType (GtkCornerType)
	open func setPlacement(windowPlacement: GtkCornerType) -> Swift.Void {
		gtk_scrolled_window_set_placement(GTK_SCROLLED_WINDOW(self.GOBJECT), windowPlacement)
	}

	/// Sets the scrollbar policy for the horizontal and vertical scrollbars.
	/// The policy determines when the scrollbar should appear; it is a value
	/// from the #GtkPolicyType enumeration. If %GTK_POLICY_ALWAYS, the
	/// scrollbar is always present; if %GTK_POLICY_NEVER, the scrollbar is
	/// never present; if %GTK_POLICY_AUTOMATIC, the scrollbar is present only
	/// if needed (that is, if the slider part of the bar would be smaller
	/// than the trough — the display is larger than the page size).
	/// - Parameters:
	///	- hscrollbarPolicy: GtkPolicyType (GtkPolicyType)
	///	- vscrollbarPolicy: GtkPolicyType (GtkPolicyType)
	open func setPolicy(hscrollbarPolicy: GtkPolicyType, vscrollbarPolicy: GtkPolicyType) -> Swift.Void {
		gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(self.GOBJECT), hscrollbarPolicy, vscrollbarPolicy)
	}

	/// Sets whether the natural height of the child should be calculated and propagated
	/// through the scrolled windows requested natural height.
	/// - Parameters:
	///	- propagate: Bool (gboolean)
	open func setPropagateNaturalHeight(propagate: Bool) -> Swift.Void {
		gtk_scrolled_window_set_propagate_natural_height(GTK_SCROLLED_WINDOW(self.GOBJECT), propagate ? 1 : 0)
	}

	/// Sets whether the natural width of the child should be calculated and propagated
	/// through the scrolled windows requested natural width.
	/// - Parameters:
	///	- propagate: Bool (gboolean)
	open func setPropagateNaturalWidth(propagate: Bool) -> Swift.Void {
		gtk_scrolled_window_set_propagate_natural_width(GTK_SCROLLED_WINDOW(self.GOBJECT), propagate ? 1 : 0)
	}

	/// Changes the type of shadow drawn around the contents of
	/// @scrolled_window.
	/// - Parameters:
	///	- type: GtkShadowType (GtkShadowType)
	open func setShadowType(_ type: GtkShadowType) -> Swift.Void {
		gtk_scrolled_window_set_shadow_type(GTK_SCROLLED_WINDOW(self.GOBJECT), type)
	}

	/// Sets the #GtkAdjustment for the vertical scrollbar.
	/// - Parameters:
	///	- vadjustment: UnsafeMutablePointer<GtkAdjustment>! (GtkAdjustment*)
	open func setVadjustment(_ vadjustment: UnsafeMutablePointer<GtkAdjustment>!) -> Swift.Void {
		gtk_scrolled_window_set_vadjustment(GTK_SCROLLED_WINDOW(self.GOBJECT), vadjustment)
	}

	/// Unsets the placement of the contents with respect to the scrollbars
	/// for the scrolled window. If no window placement is set for a scrolled
	/// window, it defaults to %GTK_CORNER_TOP_LEFT.
	/// See also gtk_scrolled_window_set_placement() and
	/// gtk_scrolled_window_get_placement().
	open func unsetPlacement() -> Swift.Void {
		gtk_scrolled_window_unset_placement(GTK_SCROLLED_WINDOW(self.GOBJECT))
	}

}
