/*
 * CGTKProgressBar.swift
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

public let GTK_TYPE_PROGRESS_BAR: GType = gtk_progress_bar_get_type()

@inline(__always) public func GTK_PROGRESS_BAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkProgressBar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_PROGRESS_BAR)
}

/// 
/// The #GtkProgressBar is typically used to display the progress of a long
/// running operation. It provides a visual clue that processing is underway.
/// The GtkProgressBar can be used in two different modes: percentage mode
/// and activity mode.
/// When an application can determine how much work needs to take place
/// (e.g. read a fixed number of bytes from a file) and can monitor its
/// progress, it can use the GtkProgressBar in percentage mode and the
/// user sees a growing bar indicating the percentage of the work that
/// has been completed. In this mode, the application is required to call
/// gtk_progress_bar_set_fraction() periodically to update the progress bar.
/// When an application has no accurate way of knowing the amount of work
/// to do, it can use the #GtkProgressBar in activity mode, which shows
/// activity by a block moving back and forth within the progress area. In
/// this mode, the application is required to call gtk_progress_bar_pulse()
/// periodically to update the progress bar.
/// There is quite a bit of flexibility provided to control the appearance
/// of the #GtkProgressBar. Functions are provided to control the orientation
/// of the bar, optional text can be displayed along with the bar, and the
/// step size used in activity mode can be set.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// progressbar[.osd]
/// ├── [text]
/// ╰── trough[.empty][.full]
/// ╰── progress[.pulse]
/// ]|
/// GtkProgressBar has a main CSS node with name progressbar and subnodes with
/// names text and trough, of which the latter has a subnode named progress. The
/// text subnode is only present if text is shown. The progress subnode has the
/// style class .pulse when in activity mode. It gets the style classes .left,
/// .right, .top or .bottom added when the progress 'touches' the corresponding
/// end of the GtkProgressBar. The .osd class on the progressbar node is for use
/// in overlays like the one Epiphany has for page loading progress.


open class CGTKProgressBar : CGTKWidget {
	/// 
	/// Creates a new #GtkProgressBar.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_progress_bar_new())!
	}

	open var PROGRESSBAR: UnsafeMutablePointer<GtkProgressBar>! {
		get {
			return GTK_PROGRESS_BAR(self.GOBJECT)
		}
	}

	/// 
	/// Returns the ellipsizing position of the progress bar.
	/// See gtk_progress_bar_set_ellipsize().
	/// - Returns: PangoEllipsizeMode
	open func getEllipsize() -> PangoEllipsizeMode {
		return gtk_progress_bar_get_ellipsize(GTK_PROGRESS_BAR(self.GOBJECT))
	}

	/// 
	/// Returns the current fraction of the task that’s been completed.
	/// - Returns: Double
	open func getFraction() -> Double {
		return gtk_progress_bar_get_fraction(GTK_PROGRESS_BAR(self.GOBJECT))
	}

	/// 
	/// Gets the value set by gtk_progress_bar_set_inverted().
	/// - Returns: Bool
	open func getInverted() -> Bool {
		return gtk_progress_bar_get_inverted(GTK_PROGRESS_BAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the pulse step set with gtk_progress_bar_set_pulse_step().
	/// - Returns: Double
	open func getPulseStep() -> Double {
		return gtk_progress_bar_get_pulse_step(GTK_PROGRESS_BAR(self.GOBJECT))
	}

	/// 
	/// Gets the value of the #GtkProgressBar:show-text property.
	/// See gtk_progress_bar_set_show_text().
	/// - Returns: Bool
	open func getShowText() -> Bool {
		return gtk_progress_bar_get_show_text(GTK_PROGRESS_BAR(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the text that is displayed with the progress bar,
	/// if any, otherwise %NULL. The return value is a reference
	/// to the text, not a copy of it, so will become invalid
	/// if you change the text in the progress bar.
	/// - Returns: String?
	open func getText() -> String? {
		return String(utf8String: gtk_progress_bar_get_text(GTK_PROGRESS_BAR(self.GOBJECT)))
	}

	/// 
	/// Indicates that some progress has been made, but you don’t know how much.
	/// Causes the progress bar to enter “activity mode,” where a block
	/// bounces back and forth. Each call to gtk_progress_bar_pulse()
	/// causes the block to move by a little bit (the amount of movement
	/// per pulse is determined by gtk_progress_bar_set_pulse_step()).
	open func pulse() {
		gtk_progress_bar_pulse(GTK_PROGRESS_BAR(self.GOBJECT))
	}

	/// 
	/// Sets the mode used to ellipsize (add an ellipsis: "...") the
	/// text if there is not enough space to render the entire string.
	/// Parameters:
	///	- mode: PangoEllipsizeMode
	open func setEllipsize(mode: PangoEllipsizeMode) {
		gtk_progress_bar_set_ellipsize(GTK_PROGRESS_BAR(self.GOBJECT), mode)
	}

	/// 
	/// Causes the progress bar to “fill in” the given fraction
	/// of the bar. The fraction should be between 0.0 and 1.0,
	/// inclusive.
	/// Parameters:
	///	- fraction: Double
	open func setFraction(_ fraction: Double) {
		gtk_progress_bar_set_fraction(GTK_PROGRESS_BAR(self.GOBJECT), fraction)
	}

	/// 
	/// Progress bars normally grow from top to bottom or left to right.
	/// Inverted progress bars grow in the opposite direction.
	/// Parameters:
	///	- inverted: Bool
	open func setInverted(_ inverted: Bool) {
		gtk_progress_bar_set_inverted(GTK_PROGRESS_BAR(self.GOBJECT), inverted ? 1 : 0)
	}

	/// 
	/// Sets the fraction of total progress bar length to move the
	/// bouncing block for each call to gtk_progress_bar_pulse().
	/// Parameters:
	///	- fraction: Double
	open func setPulseStep(fraction: Double) {
		gtk_progress_bar_set_pulse_step(GTK_PROGRESS_BAR(self.GOBJECT), fraction)
	}

	/// 
	/// Sets whether the progress bar will show text next to the bar.
	/// The shown text is either the value of the #GtkProgressBar:text
	/// property or, if that is %NULL, the #GtkProgressBar:fraction value,
	/// as a percentage.
	/// To make a progress bar that is styled and sized suitably for containing
	/// text (even if the actual text is blank), set #GtkProgressBar:show-text to
	/// %TRUE and #GtkProgressBar:text to the empty string (not %NULL).
	/// Parameters:
	///	- showText: Bool
	open func setShowText(_ showText: Bool) {
		gtk_progress_bar_set_show_text(GTK_PROGRESS_BAR(self.GOBJECT), showText ? 1 : 0)
	}

	/// 
	/// Causes the given @text to appear next to the progress bar.
	/// If @text is %NULL and #GtkProgressBar:show-text is %TRUE, the current
	/// value of #GtkProgressBar:fraction will be displayed as a percentage.
	/// If @text is non-%NULL and #GtkProgressBar:show-text is %TRUE, the text
	/// will be displayed. In this case, it will not display the progress
	/// percentage. If @text is the empty string, the progress bar will still
	/// be styled and sized suitably for containing text, as long as
	/// #GtkProgressBar:show-text is %TRUE.
	/// Parameters:
	///	- text: String
	open func setText(_ text: String) {
		gtk_progress_bar_set_text(GTK_PROGRESS_BAR(self.GOBJECT), text)
	}

}
