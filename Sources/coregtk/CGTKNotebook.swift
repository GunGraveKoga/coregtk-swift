/*
 * CGTKNotebook.swift
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

public let GTK_TYPE_NOTEBOOK: GType = gtk_notebook_get_type()

@inline(__always) public func GTK_NOTEBOOK(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkNotebook>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_NOTEBOOK)
}

/// The #GtkNotebook widget is a #GtkContainer whose children are pages that
/// can be switched between using tab labels along one edge.
/// There are many configuration options for GtkNotebook. Among other
/// things, you can choose on which edge the tabs appear
/// (see gtk_notebook_set_tab_pos()), whether, if there are too many
/// tabs to fit the notebook should be made bigger or scrolling
/// arrows added (see gtk_notebook_set_scrollable()), and whether there
/// will be a popup menu allowing the users to switch pages.
/// (see gtk_notebook_popup_enable(), gtk_notebook_popup_disable())
/// # GtkNotebook as GtkBuildable
/// The GtkNotebook implementation of the #GtkBuildable interface
/// supports placing children into tabs by specifying “tab” as the
/// “type” attribute of a <child> element. Note that the content
/// of the tab must be created before the tab can be filled.
/// A tab child can be specified without specifying a <child>
/// type attribute.
/// To add a child widget in the notebooks action area, specify
/// "action-start" or “action-end” as the “type” attribute of the
/// <child> element.
/// An example of a UI definition fragment with GtkNotebook:
/// |[
/// <object class="GtkNotebook">
/// <child>
/// <object class="GtkLabel" id="notebook-content">
/// <property name="label">Content</property>
/// </object>
/// </child>
/// <child type="tab">
/// <object class="GtkLabel" id="notebook-tab">
/// <property name="label">Tab</property>
/// </object>
/// </child>
/// </object>
/// ]|
/// # CSS nodes
/// |[<!-- language="plain" -->
/// notebook
/// ├── header.top
/// │   ├── [<action widget>]
/// │   ├── tabs
/// │   │   ├── [arrow]
/// │   │   ├── tab
/// │   │   │   ╰── <tab label>
/// ┊   ┊   ┊
/// │   │   ├── tab[.reorderable-page]
/// │   │   │   ╰── <tab label>
/// │   │   ╰── [arrow]
/// │   ╰── [<action widget>]
/// │
/// ╰── stack
/// ├── <child>
/// ┊
/// ╰── <child>
/// ]|
/// GtkNotebook has a main CSS node with name notebook, a subnode
/// with name header and below that a subnode with name tabs which
/// contains one subnode per tab with name tab.
/// If action widgets are present, their CSS nodes are placed next
/// to the tabs node. If the notebook is scrollable, CSS nodes with
/// name arrow are placed as first and last child of the tabs node.
/// The main node gets the .frame style class when the notebook
/// has a border (see gtk_notebook_set_show_border()).
/// The header node gets one of the style class .top, .bottom,
/// .left or .right, depending on where the tabs are placed. For
/// reorderable pages, the tab node gets the .reorderable-page class.
/// A tab node gets the .dnd style class while it is moved with drag-and-drop.
/// The nodes are always arranged from left-to-right, regarldess of text direction.


open class CGTKNotebook : CGTKContainer {
	/// Creates a new #GtkNotebook widget with no pages.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_notebook_new())!
	}

	open var NOTEBOOK: UnsafeMutablePointer<GtkNotebook>! {
		get {
			return GTK_NOTEBOOK(self.GOBJECT)
		}
	}

	/// Appends a page to @notebook.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- tabLabel: CGTKWidget? (GtkWidget*)
	/// - Returns: gint (gint)
	open func appendPage(child: CGTKWidget, tabLabel: CGTKWidget?) -> gint {
		return gtk_notebook_append_page(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, tabLabel?.WIDGET)
	}

	/// Appends a page to @notebook, specifying the widget to use as the
	/// label in the popup menu.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- tabLabel: CGTKWidget? (GtkWidget*)
	///	- menuLabel: CGTKWidget? (GtkWidget*)
	/// - Returns: gint (gint)
	open func appendPageMenu(child: CGTKWidget, tabLabel: CGTKWidget?, menuLabel: CGTKWidget?) -> gint {
		return gtk_notebook_append_page_menu(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, tabLabel?.WIDGET, menuLabel?.WIDGET)
	}

	/// Removes the child from the notebook.
	/// This function is very similar to gtk_container_remove(),
	/// but additionally informs the notebook that the removal
	/// is happening as part of a tab DND operation, which should
	/// not be cancelled.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func detachTab(child: CGTKWidget) -> Swift.Void {
		gtk_notebook_detach_tab(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET)
	}

	/// Gets one of the action widgets. See gtk_notebook_set_action_widget().
	/// - Parameters:
	///	- packType: GtkPackType (GtkPackType)
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getActionWidget<T>(packType: GtkPackType) -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_notebook_get_action_widget(GTK_NOTEBOOK(self.GOBJECT), packType))
	}

	/// Returns the page number of the current page.
	/// - Returns: gint (gint)
	open func getCurrentPage() -> gint {
		return gtk_notebook_get_current_page(GTK_NOTEBOOK(self.GOBJECT))
	}

	/// Gets the current group name for @notebook.
	/// - Returns: String? (const gchar*)
	open func getGroupName() -> String? {
		return String(utf8String: gtk_notebook_get_group_name(GTK_NOTEBOOK(self.GOBJECT)))
	}

	/// Retrieves the menu label widget of the page containing @child.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getMenuLabel<T>(child: CGTKWidget) -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_notebook_get_menu_label(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET))
	}

	/// Retrieves the text of the menu label for the page containing
	/// @child.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	/// - Returns: String? (const gchar*)
	open func getMenuLabelText(child: CGTKWidget) -> String? {
		return String(utf8String: gtk_notebook_get_menu_label_text(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET))
	}

	/// Gets the number of pages in a notebook.
	/// - Returns: gint (gint)
	open func getNpages() -> gint {
		return gtk_notebook_get_n_pages(GTK_NOTEBOOK(self.GOBJECT))
	}

	/// Returns the child widget contained in page number @page_num.
	/// - Parameters:
	///	- pageNum: gint (gint)
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getNthPage<T>(pageNum: gint) -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_notebook_get_nth_page(GTK_NOTEBOOK(self.GOBJECT), pageNum))
	}

	/// Returns whether the tab label area has arrows for scrolling.
	/// See gtk_notebook_set_scrollable().
	/// - Returns: Bool (gboolean)
	open func getScrollable() -> Bool {
		return gtk_notebook_get_scrollable(GTK_NOTEBOOK(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether a bevel will be drawn around the notebook pages.
	/// See gtk_notebook_set_show_border().
	/// - Returns: Bool (gboolean)
	open func getShowBorder() -> Bool {
		return gtk_notebook_get_show_border(GTK_NOTEBOOK(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the tabs of the notebook are shown.
	/// See gtk_notebook_set_show_tabs().
	/// - Returns: Bool (gboolean)
	open func getShowTabs() -> Bool {
		return gtk_notebook_get_show_tabs(GTK_NOTEBOOK(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the tab contents can be detached from @notebook.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	/// - Returns: Bool (gboolean)
	open func getTabDetachable(child: CGTKWidget) -> Bool {
		return gtk_notebook_get_tab_detachable(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET) != 0 ? true : false
	}

	/// Returns the horizontal width of a tab border.
	/// - Returns: guint16 (guint16)
	open func getTabHborder() -> guint16 {
		return gtk_notebook_get_tab_hborder(GTK_NOTEBOOK(self.GOBJECT))
	}

	/// Returns the tab label widget for the page @child.
	/// %NULL is returned if @child is not in @notebook or
	/// if no tab label has specifically been set for @child.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getTabLabel<T>(child: CGTKWidget) -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_notebook_get_tab_label(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET))
	}

	/// Retrieves the text of the tab label for the page containing
	/// @child.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	/// - Returns: String? (const gchar*)
	open func getTabLabelText(child: CGTKWidget) -> String? {
		return String(utf8String: gtk_notebook_get_tab_label_text(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET))
	}

	/// Gets the edge at which the tabs for switching pages in the
	/// notebook are drawn.
	/// - Returns: GtkPositionType (GtkPositionType)
	open func getTabPos() -> GtkPositionType {
		return gtk_notebook_get_tab_pos(GTK_NOTEBOOK(self.GOBJECT))
	}

	/// Gets whether the tab can be reordered via drag and drop or not.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	/// - Returns: Bool (gboolean)
	open func getTabReorderable(child: CGTKWidget) -> Bool {
		return gtk_notebook_get_tab_reorderable(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET) != 0 ? true : false
	}

	/// Returns the vertical width of a tab border.
	/// - Returns: guint16 (guint16)
	open func getTabVborder() -> guint16 {
		return gtk_notebook_get_tab_vborder(GTK_NOTEBOOK(self.GOBJECT))
	}

	/// Insert a page into @notebook at the given position.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- tabLabel: CGTKWidget? (GtkWidget*)
	///	- position: gint (gint)
	/// - Returns: gint (gint)
	open func insertPage(child: CGTKWidget, tabLabel: CGTKWidget?, position: gint) -> gint {
		return gtk_notebook_insert_page(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, tabLabel?.WIDGET, position)
	}

	/// Insert a page into @notebook at the given position, specifying
	/// the widget to use as the label in the popup menu.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- tabLabel: CGTKWidget? (GtkWidget*)
	///	- menuLabel: CGTKWidget? (GtkWidget*)
	///	- position: gint (gint)
	/// - Returns: gint (gint)
	open func insertPageMenu(child: CGTKWidget, tabLabel: CGTKWidget?, menuLabel: CGTKWidget?, position: gint) -> gint {
		return gtk_notebook_insert_page_menu(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, tabLabel?.WIDGET, menuLabel?.WIDGET, position)
	}

	/// Switches to the next page. Nothing happens if the current page is
	/// the last page.
	open func nextPage() -> Swift.Void {
		gtk_notebook_next_page(GTK_NOTEBOOK(self.GOBJECT))
	}

	/// Finds the index of the page which contains the given child
	/// widget.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	/// - Returns: gint (gint)
	open func pageNum(child: CGTKWidget) -> gint {
		return gtk_notebook_page_num(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET)
	}

	/// Disables the popup menu.
	open func popupDisable() -> Swift.Void {
		gtk_notebook_popup_disable(GTK_NOTEBOOK(self.GOBJECT))
	}

	/// Enables the popup menu: if the user clicks with the right
	/// mouse button on the tab labels, a menu with all the pages
	/// will be popped up.
	open func popupEnable() -> Swift.Void {
		gtk_notebook_popup_enable(GTK_NOTEBOOK(self.GOBJECT))
	}

	/// Prepends a page to @notebook.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- tabLabel: CGTKWidget? (GtkWidget*)
	/// - Returns: gint (gint)
	open func prependPage(child: CGTKWidget, tabLabel: CGTKWidget?) -> gint {
		return gtk_notebook_prepend_page(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, tabLabel?.WIDGET)
	}

	/// Prepends a page to @notebook, specifying the widget to use as the
	/// label in the popup menu.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- tabLabel: CGTKWidget? (GtkWidget*)
	///	- menuLabel: CGTKWidget? (GtkWidget*)
	/// - Returns: gint (gint)
	open func prependPageMenu(child: CGTKWidget, tabLabel: CGTKWidget?, menuLabel: CGTKWidget?) -> gint {
		return gtk_notebook_prepend_page_menu(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, tabLabel?.WIDGET, menuLabel?.WIDGET)
	}

	/// Switches to the previous page. Nothing happens if the current page
	/// is the first page.
	open func prevPage() -> Swift.Void {
		gtk_notebook_prev_page(GTK_NOTEBOOK(self.GOBJECT))
	}

	/// Removes a page from the notebook given its index
	/// in the notebook.
	/// - Parameters:
	///	- pageNum: gint (gint)
	open func removePage(pageNum: gint) -> Swift.Void {
		gtk_notebook_remove_page(GTK_NOTEBOOK(self.GOBJECT), pageNum)
	}

	/// Reorders the page containing @child, so that it appears in position
	/// @position. If @position is greater than or equal to the number of
	/// children in the list or negative, @child will be moved to the end
	/// of the list.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- position: gint (gint)
	open func reorderChild(_ child: CGTKWidget, position: gint) -> Swift.Void {
		gtk_notebook_reorder_child(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, position)
	}

	/// Sets @widget as one of the action widgets. Depending on the pack type
	/// the widget will be placed before or after the tabs. You can use
	/// a #GtkBox if you need to pack more than one widget on the same side.
	/// Note that action widgets are “internal” children of the notebook and thus
	/// not included in the list returned from gtk_container_foreach().
	/// - Parameters:
	///	- widget: CGTKWidget (GtkWidget*)
	///	- packType: GtkPackType (GtkPackType)
	open func setActionWidget(_ widget: CGTKWidget, packType: GtkPackType) -> Swift.Void {
		gtk_notebook_set_action_widget(GTK_NOTEBOOK(self.GOBJECT), widget.WIDGET, packType)
	}

	/// Switches to the page number @page_num.
	/// Note that due to historical reasons, GtkNotebook refuses
	/// to switch to a page unless the child widget is visible.
	/// Therefore, it is recommended to show child widgets before
	/// adding them to a notebook.
	/// - Parameters:
	///	- pageNum: gint (gint)
	open func setCurrentPage(pageNum: gint) -> Swift.Void {
		gtk_notebook_set_current_page(GTK_NOTEBOOK(self.GOBJECT), pageNum)
	}

	/// Sets a group name for @notebook.
	/// Notebooks with the same name will be able to exchange tabs
	/// via drag and drop. A notebook with a %NULL group name will
	/// not be able to exchange tabs with any other notebook.
	/// - Parameters:
	///	- groupName: String? (const gchar*)
	open func setGroupName(_ groupName: String?) -> Swift.Void {
		gtk_notebook_set_group_name(GTK_NOTEBOOK(self.GOBJECT), groupName)
	}

	/// Changes the menu label for the page containing @child.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- menuLabel: CGTKWidget? (GtkWidget*)
	open func setMenuLabel(child: CGTKWidget, menuLabel: CGTKWidget?) -> Swift.Void {
		gtk_notebook_set_menu_label(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, menuLabel?.WIDGET)
	}

	/// Creates a new label and sets it as the menu label of @child.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- menuText: String (const gchar*)
	open func setMenuLabelText(child: CGTKWidget, menuText: String) -> Swift.Void {
		gtk_notebook_set_menu_label_text(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, menuText)
	}

	/// Sets whether the tab label area will have arrows for
	/// scrolling if there are too many tabs to fit in the area.
	/// - Parameters:
	///	- scrollable: Bool (gboolean)
	open func setScrollable(_ scrollable: Bool) -> Swift.Void {
		gtk_notebook_set_scrollable(GTK_NOTEBOOK(self.GOBJECT), scrollable ? 1 : 0)
	}

	/// Sets whether a bevel will be drawn around the notebook pages.
	/// This only has a visual effect when the tabs are not shown.
	/// See gtk_notebook_set_show_tabs().
	/// - Parameters:
	///	- showBorder: Bool (gboolean)
	open func setShowBorder(_ showBorder: Bool) -> Swift.Void {
		gtk_notebook_set_show_border(GTK_NOTEBOOK(self.GOBJECT), showBorder ? 1 : 0)
	}

	/// Sets whether to show the tabs for the notebook or not.
	/// - Parameters:
	///	- showTabs: Bool (gboolean)
	open func setShowTabs(_ showTabs: Bool) -> Swift.Void {
		gtk_notebook_set_show_tabs(GTK_NOTEBOOK(self.GOBJECT), showTabs ? 1 : 0)
	}

	/// Sets whether the tab can be detached from @notebook to another
	/// notebook or widget.
	/// Note that 2 notebooks must share a common group identificator
	/// (see gtk_notebook_set_group_name()) to allow automatic tabs
	/// interchange between them.
	/// If you want a widget to interact with a notebook through DnD
	/// (i.e.: accept dragged tabs from it) it must be set as a drop
	/// destination and accept the target “GTK_NOTEBOOK_TAB”. The notebook
	/// will fill the selection with a GtkWidget** pointing to the child
	/// widget that corresponds to the dropped tab.
	/// Note that you should use gtk_notebook_detach_tab() instead
	/// of gtk_container_remove() if you want to remove the tab from
	/// the source notebook as part of accepting a drop. Otherwise,
	/// the source notebook will think that the dragged tab was
	/// removed from underneath the ongoing drag operation, and
	/// will initiate a drag cancel animation.
	/// |[<!-- language="C" -->
	/// static void
	/// on_drag_data_received (GtkWidget        *widget,
	/// GdkDragContext   *context,
	/// gint              x,
	/// gint              y,
	/// GtkSelectionData *data,
	/// guint             info,
	/// guint             time,
	/// gpointer          user_data)
	/// {
	/// GtkWidget *notebook;
	/// GtkWidget **child;
	/// notebook = gtk_drag_get_source_widget (context);
	/// child = (void*) gtk_selection_data_get_data (data);
	/// // process_widget (*child);
	/// gtk_notebook_detach_tab (GTK_NOTEBOOK (notebook), *child);
	/// }
	/// ]|
	/// If you want a notebook to accept drags from other widgets,
	/// you will have to set your own DnD code to do it.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- detachable: Bool (gboolean)
	open func setTabDetachable(child: CGTKWidget, detachable: Bool) -> Swift.Void {
		gtk_notebook_set_tab_detachable(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, detachable ? 1 : 0)
	}

	/// Changes the tab label for @child.
	/// If %NULL is specified for @tab_label, then the page will
	/// have the label “page N”.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- tabLabel: CGTKWidget? (GtkWidget*)
	open func setTabLabel(child: CGTKWidget, tabLabel: CGTKWidget?) -> Swift.Void {
		gtk_notebook_set_tab_label(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, tabLabel?.WIDGET)
	}

	/// Creates a new label and sets it as the tab label for the page
	/// containing @child.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- tabText: String (const gchar*)
	open func setTabLabelText(child: CGTKWidget, tabText: String) -> Swift.Void {
		gtk_notebook_set_tab_label_text(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, tabText)
	}

	/// Sets the edge at which the tabs for switching pages in the
	/// notebook are drawn.
	/// - Parameters:
	///	- pos: GtkPositionType (GtkPositionType)
	open func setTabPos(_ pos: GtkPositionType) -> Swift.Void {
		gtk_notebook_set_tab_pos(GTK_NOTEBOOK(self.GOBJECT), pos)
	}

	/// Sets whether the notebook tab can be reordered
	/// via drag and drop or not.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- reorderable: Bool (gboolean)
	open func setTabReorderable(child: CGTKWidget, reorderable: Bool) -> Swift.Void {
		gtk_notebook_set_tab_reorderable(GTK_NOTEBOOK(self.GOBJECT), child.WIDGET, reorderable ? 1 : 0)
	}

}
