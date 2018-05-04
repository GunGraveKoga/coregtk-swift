/*
 * CGTKCalendar.swift
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

public let GTK_TYPE_CALENDAR: GType = gtk_calendar_get_type()

@inline(__always) public func GTK_CALENDAR(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkCalendar>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_CALENDAR)
}

/// 
/// #GtkCalendar is a widget that displays a Gregorian calendar, one month
/// at a time. It can be created with gtk_calendar_new().
/// The month and year currently displayed can be altered with
/// gtk_calendar_select_month(). The exact day can be selected from the
/// displayed month using gtk_calendar_select_day().
/// To place a visual marker on a particular day, use gtk_calendar_mark_day()
/// and to remove the marker, gtk_calendar_unmark_day(). Alternative, all
/// marks can be cleared with gtk_calendar_clear_marks().
/// The way in which the calendar itself is displayed can be altered using
/// gtk_calendar_set_display_options().
/// The selected date can be retrieved from a #GtkCalendar using
/// gtk_calendar_get_date().
/// Users should be aware that, although the Gregorian calendar is the
/// legal calendar in most countries, it was adopted progressively
/// between 1582 and 1929. Display before these dates is likely to be
/// historically incorrect.


open class CGTKCalendar : CGTKWidget {
	/// 
	/// Creates a new calendar, with the current date being selected.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_calendar_new())!
	}

	open var CALENDAR: UnsafeMutablePointer<GtkCalendar>! {
		get {
			return GTK_CALENDAR(self.GOBJECT)
		}
	}

	/// 
	/// Remove all visual markers.
	open func clearMarks() {
		gtk_calendar_clear_marks(GTK_CALENDAR(self.GOBJECT))
	}

	/// 
	/// Obtains the selected date from a #GtkCalendar.
	/// Parameters:
	///	- year: UnsafeMutablePointer<UInt32>!
	///	- month: UnsafeMutablePointer<UInt32>!
	///	- day: UnsafeMutablePointer<UInt32>!
	open func getDate(year: UnsafeMutablePointer<UInt32>!, month: UnsafeMutablePointer<UInt32>!, day: UnsafeMutablePointer<UInt32>!) {
		gtk_calendar_get_date(GTK_CALENDAR(self.GOBJECT), year, month, day)
	}

	/// 
	/// Returns if the @day of the @calendar is already marked.
	/// Parameters:
	///	- day: guint
	/// - Returns: Bool
	open func getDayIsMarked(day: guint) -> Bool {
		return gtk_calendar_get_day_is_marked(GTK_CALENDAR(self.GOBJECT), day) != 0 ? true : false
	}

	/// 
	/// Queries the height of detail cells, in rows.
	/// See #GtkCalendar:detail-width-chars.
	/// - Returns: gint
	open func getDetailHeightRows() -> gint {
		return gtk_calendar_get_detail_height_rows(GTK_CALENDAR(self.GOBJECT))
	}

	/// 
	/// Queries the width of detail cells, in characters.
	/// See #GtkCalendar:detail-width-chars.
	/// - Returns: gint
	open func getDetailWidthChars() -> gint {
		return gtk_calendar_get_detail_width_chars(GTK_CALENDAR(self.GOBJECT))
	}

	/// 
	/// Returns the current display options of @calendar.
	/// - Returns: GtkCalendarDisplayOptions
	open func getDisplayOptions() -> GtkCalendarDisplayOptions {
		return gtk_calendar_get_display_options(GTK_CALENDAR(self.GOBJECT))
	}

	/// 
	/// Places a visual marker on a particular day.
	/// Parameters:
	///	- day: guint
	open func markDay(_ day: guint) {
		gtk_calendar_mark_day(GTK_CALENDAR(self.GOBJECT), day)
	}

	/// 
	/// Selects a day from the current month.
	/// Parameters:
	///	- day: guint
	open func selectDay(_ day: guint) {
		gtk_calendar_select_day(GTK_CALENDAR(self.GOBJECT), day)
	}

	/// 
	/// Shifts the calendar to a different month.
	/// Parameters:
	///	- month: guint
	///	- year: guint
	open func selectMonth(_ month: guint, year: guint) {
		gtk_calendar_select_month(GTK_CALENDAR(self.GOBJECT), month, year)
	}

	/// 
	/// Installs a function which provides Pango markup with detail information
	/// for each day. Examples for such details are holidays or appointments. That
	/// information is shown below each day when #GtkCalendar:show-details is set.
	/// A tooltip containing with full detail information is provided, if the entire
	/// text should not fit into the details area, or if #GtkCalendar:show-details
	/// is not set.
	/// The size of the details area can be restricted by setting the
	/// #GtkCalendar:detail-width-chars and #GtkCalendar:detail-height-rows
	/// properties.
	/// Parameters:
	///	- function: @escaping GtkCalendarDetailFunc
	///	- data: gpointer
	///	- destroy: @escaping GDestroyNotify
	open func setDetailFunc(_ function: @escaping GtkCalendarDetailFunc, data: gpointer, destroy: @escaping GDestroyNotify) {
		gtk_calendar_set_detail_func(GTK_CALENDAR(self.GOBJECT), function, data, destroy)
	}

	/// 
	/// Updates the height of detail cells.
	/// See #GtkCalendar:detail-height-rows.
	/// Parameters:
	///	- rows: gint
	open func setDetailHeightRows(_ rows: gint) {
		gtk_calendar_set_detail_height_rows(GTK_CALENDAR(self.GOBJECT), rows)
	}

	/// 
	/// Updates the width of detail cells.
	/// See #GtkCalendar:detail-width-chars.
	/// Parameters:
	///	- chars: gint
	open func setDetailWidthChars(_ chars: gint) {
		gtk_calendar_set_detail_width_chars(GTK_CALENDAR(self.GOBJECT), chars)
	}

	/// 
	/// Sets display options (whether to display the heading and the month
	/// headings).
	/// Parameters:
	///	- flags: GtkCalendarDisplayOptions
	open func setDisplayOptions(flags: GtkCalendarDisplayOptions) {
		gtk_calendar_set_display_options(GTK_CALENDAR(self.GOBJECT), flags)
	}

	/// 
	/// Removes the visual marker from a particular day.
	/// Parameters:
	///	- day: guint
	open func unmarkDay(_ day: guint) {
		gtk_calendar_unmark_day(GTK_CALENDAR(self.GOBJECT), day)
	}

}
