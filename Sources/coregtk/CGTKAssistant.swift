/*
 * CGTKAssistant.swift
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

public let GTK_TYPE_ASSISTANT: GType = gtk_assistant_get_type()

@inline(__always) public func GTK_ASSISTANT(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkAssistant>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_ASSISTANT)
}

/// A #GtkAssistant is a widget used to represent a generally complex
/// operation splitted in several steps, guiding the user through its
/// pages and controlling the page flow to collect the necessary data.
/// The design of GtkAssistant is that it controls what buttons to show
/// and to make sensitive, based on what it knows about the page sequence
/// and the [type][GtkAssistantPageType] of each page,
/// in addition to state information like the page
/// [completion][gtk-assistant-set-page-complete]
/// and [committed][gtk-assistant-commit] status.
/// If you have a case that doesn’t quite fit in #GtkAssistants way of
/// handling buttons, you can use the #GTK_ASSISTANT_PAGE_CUSTOM page
/// type and handle buttons yourself.
/// # GtkAssistant as GtkBuildable
/// The GtkAssistant implementation of the #GtkBuildable interface
/// exposes the @action_area as internal children with the name
/// “action_area”.
/// To add pages to an assistant in #GtkBuilder, simply add it as a
/// child to the GtkAssistant object, and set its child properties
/// as necessary.
/// # CSS nodes
/// GtkAssistant has a single CSS node with the name assistant.


open class CGTKAssistant : CGTKWindow {
	/// Creates a new #GtkAssistant.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_assistant_new())!
	}

	open var ASSISTANT: UnsafeMutablePointer<GtkAssistant>! {
		get {
			return GTK_ASSISTANT(self.GOBJECT)
		}
	}

	/// Adds a widget to the action area of a #GtkAssistant.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func addActionWidget(child: CGTKWidget) -> Swift.Void {
		gtk_assistant_add_action_widget(GTK_ASSISTANT(self.GOBJECT), child.WIDGET)
	}

	/// Appends a page to the @assistant.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	/// - Returns: gint (gint)
	open func appendPage(_ page: CGTKWidget) -> gint {
		return gtk_assistant_append_page(GTK_ASSISTANT(self.GOBJECT), page.WIDGET)
	}

	/// Erases the visited page history so the back button is not
	/// shown on the current page, and removes the cancel button
	/// from subsequent pages.
	/// Use this when the information provided up to the current
	/// page is hereafter deemed permanent and cannot be modified
	/// or undone. For example, showing a progress page to track
	/// a long-running, unreversible operation after the user has
	/// clicked apply on a confirmation page.
	open func commit() -> Swift.Void {
		gtk_assistant_commit(GTK_ASSISTANT(self.GOBJECT))
	}

	/// Returns the page number of the current page.
	/// - Returns: gint (gint)
	open func getCurrentPage() -> gint {
		return gtk_assistant_get_current_page(GTK_ASSISTANT(self.GOBJECT))
	}

	/// Returns the number of pages in the @assistant
	/// - Returns: gint (gint)
	open func getNpages() -> gint {
		return gtk_assistant_get_n_pages(GTK_ASSISTANT(self.GOBJECT))
	}

	/// Returns the child widget contained in page number @page_num.
	/// - Parameters:
	///	- pageNum: gint (gint)
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getNthPage<T>(pageNum: gint) -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_assistant_get_nth_page(GTK_ASSISTANT(self.GOBJECT), pageNum))
	}

	/// Gets whether @page is complete.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	/// - Returns: Bool (gboolean)
	open func getPageComplete(page: CGTKWidget) -> Bool {
		return gtk_assistant_get_page_complete(GTK_ASSISTANT(self.GOBJECT), page.WIDGET) != 0 ? true : false
	}

	/// Gets whether page has padding.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	/// - Returns: Bool (gboolean)
	open func getPageHasPadding(page: CGTKWidget) -> Bool {
		return gtk_assistant_get_page_has_padding(GTK_ASSISTANT(self.GOBJECT), page.WIDGET) != 0 ? true : false
	}

	/// Gets the header image for @page.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	/// - Returns: OpaquePointer (GdkPixbuf*)
	open func getPageHeaderImage(page: CGTKWidget) -> OpaquePointer {
		return gtk_assistant_get_page_header_image(GTK_ASSISTANT(self.GOBJECT), page.WIDGET)
	}

	/// Gets the side image for @page.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	/// - Returns: OpaquePointer (GdkPixbuf*)
	open func getPageSideImage(page: CGTKWidget) -> OpaquePointer {
		return gtk_assistant_get_page_side_image(GTK_ASSISTANT(self.GOBJECT), page.WIDGET)
	}

	/// Gets the title for @page.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	/// - Returns: String? (const gchar*)
	open func getPageTitle(page: CGTKWidget) -> String? {
		return String(utf8String: gtk_assistant_get_page_title(GTK_ASSISTANT(self.GOBJECT), page.WIDGET))
	}

	/// Gets the page type of @page.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	/// - Returns: GtkAssistantPageType (GtkAssistantPageType)
	open func getPageType(page: CGTKWidget) -> GtkAssistantPageType {
		return gtk_assistant_get_page_type(GTK_ASSISTANT(self.GOBJECT), page.WIDGET)
	}

	/// Inserts a page in the @assistant at a given position.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	///	- position: gint (gint)
	/// - Returns: gint (gint)
	open func insertPage(_ page: CGTKWidget, position: gint) -> gint {
		return gtk_assistant_insert_page(GTK_ASSISTANT(self.GOBJECT), page.WIDGET, position)
	}

	/// Navigate to the next page.
	/// It is a programming error to call this function when
	/// there is no next page.
	/// This function is for use when creating pages of the
	/// #GTK_ASSISTANT_PAGE_CUSTOM type.
	open func nextPage() -> Swift.Void {
		gtk_assistant_next_page(GTK_ASSISTANT(self.GOBJECT))
	}

	/// Prepends a page to the @assistant.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	/// - Returns: gint (gint)
	open func prependPage(_ page: CGTKWidget) -> gint {
		return gtk_assistant_prepend_page(GTK_ASSISTANT(self.GOBJECT), page.WIDGET)
	}

	/// Navigate to the previous visited page.
	/// It is a programming error to call this function when
	/// no previous page is available.
	/// This function is for use when creating pages of the
	/// #GTK_ASSISTANT_PAGE_CUSTOM type.
	open func previousPage() -> Swift.Void {
		gtk_assistant_previous_page(GTK_ASSISTANT(self.GOBJECT))
	}

	/// Removes a widget from the action area of a #GtkAssistant.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func removeActionWidget(child: CGTKWidget) -> Swift.Void {
		gtk_assistant_remove_action_widget(GTK_ASSISTANT(self.GOBJECT), child.WIDGET)
	}

	/// Removes the @page_num’s page from @assistant.
	/// - Parameters:
	///	- pageNum: gint (gint)
	open func removePage(pageNum: gint) -> Swift.Void {
		gtk_assistant_remove_page(GTK_ASSISTANT(self.GOBJECT), pageNum)
	}

	/// Switches the page to @page_num.
	/// Note that this will only be necessary in custom buttons,
	/// as the @assistant flow can be set with
	/// gtk_assistant_set_forward_page_func().
	/// - Parameters:
	///	- pageNum: gint (gint)
	open func setCurrentPage(pageNum: gint) -> Swift.Void {
		gtk_assistant_set_current_page(GTK_ASSISTANT(self.GOBJECT), pageNum)
	}

	/// Sets the page forwarding function to be @page_func.
	/// This function will be used to determine what will be
	/// the next page when the user presses the forward button.
	/// Setting @page_func to %NULL will make the assistant to
	/// use the default forward function, which just goes to the
	/// next visible page.
	/// - Parameters:
	///	- pageFunc: @escaping GtkAssistantPageFunc (GtkAssistantPageFunc)
	///	- data: gpointer (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setForwardPageFunc(_ pageFunc: @escaping GtkAssistantPageFunc, data: gpointer, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_assistant_set_forward_page_func(GTK_ASSISTANT(self.GOBJECT), pageFunc, data, destroy)
	}

	/// Sets whether @page contents are complete.
	/// This will make @assistant update the buttons state
	/// to be able to continue the task.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	///	- complete: Bool (gboolean)
	open func setPageComplete(page: CGTKWidget, complete: Bool) -> Swift.Void {
		gtk_assistant_set_page_complete(GTK_ASSISTANT(self.GOBJECT), page.WIDGET, complete ? 1 : 0)
	}

	/// Sets whether the assistant is adding padding around
	/// the page.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	///	- hasPadding: Bool (gboolean)
	open func setPageHasPadding(page: CGTKWidget, hasPadding: Bool) -> Swift.Void {
		gtk_assistant_set_page_has_padding(GTK_ASSISTANT(self.GOBJECT), page.WIDGET, hasPadding ? 1 : 0)
	}

	/// Sets a header image for @page.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	///	- pixbuf: OpaquePointer? (GdkPixbuf*)
	open func setPageHeaderImage(page: CGTKWidget, pixbuf: OpaquePointer?) -> Swift.Void {
		gtk_assistant_set_page_header_image(GTK_ASSISTANT(self.GOBJECT), page.WIDGET, pixbuf)
	}

	/// Sets a side image for @page.
	/// This image used to be displayed in the side area of the assistant
	/// when @page is the current page.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	///	- pixbuf: OpaquePointer? (GdkPixbuf*)
	open func setPageSideImage(page: CGTKWidget, pixbuf: OpaquePointer?) -> Swift.Void {
		gtk_assistant_set_page_side_image(GTK_ASSISTANT(self.GOBJECT), page.WIDGET, pixbuf)
	}

	/// Sets a title for @page.
	/// The title is displayed in the header area of the assistant
	/// when @page is the current page.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	///	- title: String (const gchar*)
	open func setPageTitle(page: CGTKWidget, title: String) -> Swift.Void {
		gtk_assistant_set_page_title(GTK_ASSISTANT(self.GOBJECT), page.WIDGET, title)
	}

	/// Sets the page type for @page.
	/// The page type determines the page behavior in the @assistant.
	/// - Parameters:
	///	- page: CGTKWidget (GtkWidget*)
	///	- type: GtkAssistantPageType (GtkAssistantPageType)
	open func setPageType(page: CGTKWidget, type: GtkAssistantPageType) -> Swift.Void {
		gtk_assistant_set_page_type(GTK_ASSISTANT(self.GOBJECT), page.WIDGET, type)
	}

	/// Forces @assistant to recompute the buttons state.
	/// GTK+ automatically takes care of this in most situations,
	/// e.g. when the user goes to a different page, or when the
	/// visibility or completeness of a page changes.
	/// One situation where it can be necessary to call this
	/// function is when changing a value on the current page
	/// affects the future page flow of the assistant.
	open func updateButtonsState() -> Swift.Void {
		gtk_assistant_update_buttons_state(GTK_ASSISTANT(self.GOBJECT))
	}

}
