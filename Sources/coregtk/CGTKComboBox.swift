/*
 * CGTKComboBox.swift
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

public let GTK_TYPE_COMBO_BOX: GType = gtk_combo_box_get_type()

@inline(__always) public func GTK_COMBO_BOX(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkComboBox>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_COMBO_BOX)
}

/// A GtkComboBox is a widget that allows the user to choose from a list of
/// valid choices. The GtkComboBox displays the selected choice. When
/// activated, the GtkComboBox displays a popup which allows the user to
/// make a new choice. The style in which the selected value is displayed,
/// and the style of the popup is determined by the current theme. It may
/// be similar to a Windows-style combo box.
/// The GtkComboBox uses the model-view pattern; the list of valid choices
/// is specified in the form of a tree model, and the display of the choices
/// can be adapted to the data in the model by using cell renderers, as you
/// would in a tree view. This is possible since GtkComboBox implements the
/// #GtkCellLayout interface. The tree model holding the valid choices is
/// not restricted to a flat list, it can be a real tree, and the popup will
/// reflect the tree structure.
/// To allow the user to enter values not in the model, the “has-entry”
/// property allows the GtkComboBox to contain a #GtkEntry. This entry
/// can be accessed by calling gtk_bin_get_child() on the combo box.
/// For a simple list of textual choices, the model-view API of GtkComboBox
/// can be a bit overwhelming. In this case, #GtkComboBoxText offers a
/// simple alternative. Both GtkComboBox and #GtkComboBoxText can contain
/// an entry.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// combobox
/// ├── box.linked
/// │   ╰── button.combo
/// │       ╰── box
/// │           ├── cellview
/// │           ╰── arrow
/// ╰── window.popup
/// ]|
/// A normal combobox contains a box with the .linked class, a button
/// with the .combo class and inside those buttons, there are a cellview and
/// an arrow.
/// |[<!-- language="plain" -->
/// combobox
/// ├── box.linked
/// │   ├── entry.combo
/// │   ╰── button.combo
/// │       ╰── box
/// │           ╰── arrow
/// ╰── window.popup
/// ]|
/// A GtkComboBox with an entry has a single CSS node with name combobox. It
/// contains a box with the .linked class. That box contains an entry and a
/// button, both with the .combo class added.
/// The button also contains another node with name arrow.


open class CGTKComboBox : CGTKBin, CGTKCellEditable, CGTKCellLayout {
	/// Creates a new empty #GtkComboBox with an entry.
	/// - Returns: CGTKWidget (GtkWidget*)
	open class func newWithEntry<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_combo_box_new_with_entry())!
	}

	/// Creates a new empty #GtkComboBox.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_combo_box_new())!
	}

	/// Creates a new empty #GtkComboBox using @area to layout cells.
	/// - Parameters:
	///	- area: UnsafeMutablePointer<GtkCellArea>! (GtkCellArea*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withArea area: UnsafeMutablePointer<GtkCellArea>!) {
		self.init(withGObject: gtk_combo_box_new_with_area(area))!
	}

	/// Creates a new empty #GtkComboBox with an entry.
	/// The new combo box will use @area to layout cells.
	/// - Parameters:
	///	- area: UnsafeMutablePointer<GtkCellArea>! (GtkCellArea*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withAreaAndEntry area: UnsafeMutablePointer<GtkCellArea>!) {
		self.init(withGObject: gtk_combo_box_new_with_area_and_entry(area))!
	}

	/// Creates a new #GtkComboBox with the model initialized to @model.
	/// - Parameters:
	///	- model: OpaquePointer! (GtkTreeModel*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withModel model: OpaquePointer!) {
		self.init(withGObject: gtk_combo_box_new_with_model(model))!
	}

	/// Creates a new empty #GtkComboBox with an entry
	/// and with the model initialized to @model.
	/// - Parameters:
	///	- model: OpaquePointer! (GtkTreeModel*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withModelAndEntry model: OpaquePointer!) {
		self.init(withGObject: gtk_combo_box_new_with_model_and_entry(model))!
	}

	open var COMBOBOX: UnsafeMutablePointer<GtkComboBox>! {
		get {
			return GTK_COMBO_BOX(self.GOBJECT)
		}
	}

	/// Returns the index of the currently active item, or -1 if there’s no
	/// active item. If the model is a non-flat treemodel, and the active item
	/// is not an immediate child of the root of the tree, this function returns
	/// `gtk_tree_path_get_indices (path)[0]`, where
	/// `path` is the #GtkTreePath of the active item.
	/// - Returns: gint (gint)
	open func getActive() -> gint {
		return gtk_combo_box_get_active(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Returns the ID of the active row of @combo_box.  This value is taken
	/// from the active row and the column specified by the #GtkComboBox:id-column
	/// property of @combo_box (see gtk_combo_box_set_id_column()).
	/// The returned value is an interned string which means that you can
	/// compare the pointer by value to other interned strings and that you
	/// must not free it.
	/// If the #GtkComboBox:id-column property of @combo_box is not set, or if
	/// no row is active, or if the active row has a %NULL ID value, then %NULL
	/// is returned.
	/// - Returns: String? (const gchar*)
	open func getActiveId() -> String? {
		return String(utf8String: gtk_combo_box_get_active_id(GTK_COMBO_BOX(self.GOBJECT)))
	}

	/// Sets @iter to point to the currently active item, if any item is active.
	/// Otherwise, @iter is left unchanged.
	/// - Parameters:
	///	- iter: UnsafeMutablePointer<GtkTreeIter>! (GtkTreeIter*)
	/// - Returns: Bool (gboolean)
	open func getActiveIter(_ iter: UnsafeMutablePointer<GtkTreeIter>!) -> Bool {
		return gtk_combo_box_get_active_iter(GTK_COMBO_BOX(self.GOBJECT), iter) != 0 ? true : false
	}

	/// Gets the current value of the :add-tearoffs property.
	/// - Returns: Bool (gboolean)
	open func getAddTearoffs() -> Bool {
		return gtk_combo_box_get_add_tearoffs(GTK_COMBO_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the combo box sets the dropdown button
	/// sensitive or not when there are no items in the model.
	/// - Returns: GtkSensitivityType (GtkSensitivityType)
	open func getButtonSensitivity() -> GtkSensitivityType {
		return gtk_combo_box_get_button_sensitivity(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Returns the column with column span information for @combo_box.
	/// - Returns: gint (gint)
	open func getColumnSpanColumn() -> gint {
		return gtk_combo_box_get_column_span_column(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Returns the column which @combo_box is using to get the strings
	/// from to display in the internal entry.
	/// - Returns: gint (gint)
	open func getEntryTextColumn() -> gint {
		return gtk_combo_box_get_entry_text_column(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Returns whether the combo box grabs focus when it is clicked
	/// with the mouse. See gtk_combo_box_set_focus_on_click().
	/// - Returns: Bool (gboolean)
	override open func getFocusOnClick() -> Bool {
		return gtk_combo_box_get_focus_on_click(GTK_COMBO_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether the combo box has an entry.
	/// - Returns: Bool (gboolean)
	open func getHasEntry() -> Bool {
		return gtk_combo_box_get_has_entry(GTK_COMBO_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the column which @combo_box is using to get string IDs
	/// for values from.
	/// - Returns: gint (gint)
	open func getIdColumn() -> gint {
		return gtk_combo_box_get_id_column(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Returns the #GtkTreeModel which is acting as data source for @combo_box.
	/// - Returns: OpaquePointer (GtkTreeModel*)
	open func getModel() -> OpaquePointer {
		return gtk_combo_box_get_model(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Gets the accessible object corresponding to the combo box’s popup.
	/// This function is mostly intended for use by accessibility technologies;
	/// applications should have little use for it.
	/// - Returns: UnsafeMutablePointer<AtkObject>! (AtkObject*)
	open func getPopupAccessible() -> UnsafeMutablePointer<AtkObject>! {
		return gtk_combo_box_get_popup_accessible(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Gets whether the popup uses a fixed width matching
	/// the allocated width of the combo box.
	/// - Returns: Bool (gboolean)
	open func getPopupFixedWidth() -> Bool {
		return gtk_combo_box_get_popup_fixed_width(GTK_COMBO_BOX(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns the current row separator function.
	/// - Returns: GtkTreeViewRowSeparatorFunc (GtkTreeViewRowSeparatorFunc)
	open func getRowSeparatorFunc() -> GtkTreeViewRowSeparatorFunc {
		return gtk_combo_box_get_row_separator_func(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Returns the column with row span information for @combo_box.
	/// - Returns: gint (gint)
	open func getRowSpanColumn() -> gint {
		return gtk_combo_box_get_row_span_column(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Gets the current title of the menu in tearoff mode. See
	/// gtk_combo_box_set_add_tearoffs().
	/// - Returns: String? (const gchar*)
	open func getTitle() -> String? {
		return String(utf8String: gtk_combo_box_get_title(GTK_COMBO_BOX(self.GOBJECT)))
	}

	/// Returns the wrap width which is used to determine the number of columns
	/// for the popup menu. If the wrap width is larger than 1, the combo box
	/// is in table mode.
	/// - Returns: gint (gint)
	open func getWrapWidth() -> gint {
		return gtk_combo_box_get_wrap_width(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Hides the menu or dropdown list of @combo_box.
	/// This function is mostly intended for use by accessibility technologies;
	/// applications should have little use for it.
	open func popdown() -> Swift.Void {
		gtk_combo_box_popdown(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Pops up the menu or dropdown list of @combo_box.
	/// This function is mostly intended for use by accessibility technologies;
	/// applications should have little use for it.
	/// Before calling this, @combo_box must be mapped, or nothing will happen.
	open func popup() -> Swift.Void {
		gtk_combo_box_popup(GTK_COMBO_BOX(self.GOBJECT))
	}

	/// Pops up the menu or dropdown list of @combo_box, the popup window
	/// will be grabbed so only @device and its associated pointer/keyboard
	/// are the only #GdkDevices able to send events to it.
	/// - Parameters:
	///	- device: OpaquePointer! (GdkDevice*)
	open func popupForDevice(_ device: OpaquePointer!) -> Swift.Void {
		gtk_combo_box_popup_for_device(GTK_COMBO_BOX(self.GOBJECT), device)
	}

	/// Sets the active item of @combo_box to be the item at @index.
	/// - Parameters:
	///	- index: gint (gint)
	open func setActive(index: gint) -> Swift.Void {
		gtk_combo_box_set_active(GTK_COMBO_BOX(self.GOBJECT), index)
	}

	/// Changes the active row of @combo_box to the one that has an ID equal to
	/// @active_id, or unsets the active row if @active_id is %NULL.  Rows having
	/// a %NULL ID string cannot be made active by this function.
	/// If the #GtkComboBox:id-column property of @combo_box is unset or if no
	/// row has the given ID then the function does nothing and returns %FALSE.
	/// - Parameters:
	///	- activeId: String? (const gchar*)
	/// - Returns: Bool (gboolean)
	open func setActiveId(_ activeId: String?) -> Bool {
		return gtk_combo_box_set_active_id(GTK_COMBO_BOX(self.GOBJECT), activeId) != 0 ? true : false
	}

	/// Sets the current active item to be the one referenced by @iter, or
	/// unsets the active item if @iter is %NULL.
	/// - Parameters:
	///	- iter: UnsafeMutablePointer<GtkTreeIter>? (GtkTreeIter*)
	open func setActiveIter(_ iter: UnsafeMutablePointer<GtkTreeIter>?) -> Swift.Void {
		gtk_combo_box_set_active_iter(GTK_COMBO_BOX(self.GOBJECT), iter)
	}

	/// Sets whether the popup menu should have a tearoff
	/// menu item.
	/// - Parameters:
	///	- addTearoffs: Bool (gboolean)
	open func setAddTearoffs(_ addTearoffs: Bool) -> Swift.Void {
		gtk_combo_box_set_add_tearoffs(GTK_COMBO_BOX(self.GOBJECT), addTearoffs ? 1 : 0)
	}

	/// Sets whether the dropdown button of the combo box should be
	/// always sensitive (%GTK_SENSITIVITY_ON), never sensitive (%GTK_SENSITIVITY_OFF)
	/// or only if there is at least one item to display (%GTK_SENSITIVITY_AUTO).
	/// - Parameters:
	///	- sensitivity: GtkSensitivityType (GtkSensitivityType)
	open func setButtonSensitivity(_ sensitivity: GtkSensitivityType) -> Swift.Void {
		gtk_combo_box_set_button_sensitivity(GTK_COMBO_BOX(self.GOBJECT), sensitivity)
	}

	/// Sets the column with column span information for @combo_box to be
	/// @column_span. The column span column contains integers which indicate
	/// how many columns an item should span.
	/// - Parameters:
	///	- columnSpan: gint (gint)
	open func setColumnSpanColumn(columnSpan: gint) -> Swift.Void {
		gtk_combo_box_set_column_span_column(GTK_COMBO_BOX(self.GOBJECT), columnSpan)
	}

	/// Sets the model column which @combo_box should use to get strings from
	/// to be @text_column. The column @text_column in the model of @combo_box
	/// must be of type %G_TYPE_STRING.
	/// This is only relevant if @combo_box has been created with
	/// #GtkComboBox:has-entry as %TRUE.
	/// - Parameters:
	///	- textColumn: gint (gint)
	open func setEntryTextColumn(_ textColumn: gint) -> Swift.Void {
		gtk_combo_box_set_entry_text_column(GTK_COMBO_BOX(self.GOBJECT), textColumn)
	}

	/// Sets whether the combo box will grab focus when it is clicked with
	/// the mouse. Making mouse clicks not grab focus is useful in places
	/// like toolbars where you don’t want the keyboard focus removed from
	/// the main area of the application.
	/// - Parameters:
	///	- focusOnClick: Bool (gboolean)
	override open func setFocusOnClick(_ focusOnClick: Bool) -> Swift.Void {
		gtk_combo_box_set_focus_on_click(GTK_COMBO_BOX(self.GOBJECT), focusOnClick ? 1 : 0)
	}

	/// Sets the model column which @combo_box should use to get string IDs
	/// for values from. The column @id_column in the model of @combo_box
	/// must be of type %G_TYPE_STRING.
	/// - Parameters:
	///	- idColumn: gint (gint)
	open func setIdColumn(_ idColumn: gint) -> Swift.Void {
		gtk_combo_box_set_id_column(GTK_COMBO_BOX(self.GOBJECT), idColumn)
	}

	/// Sets the model used by @combo_box to be @model. Will unset a previously set
	/// model (if applicable). If model is %NULL, then it will unset the model.
	/// Note that this function does not clear the cell renderers, you have to
	/// call gtk_cell_layout_clear() yourself if you need to set up different
	/// cell renderers for the new model.
	/// - Parameters:
	///	- model: OpaquePointer? (GtkTreeModel*)
	open func setModel(_ model: OpaquePointer?) -> Swift.Void {
		gtk_combo_box_set_model(GTK_COMBO_BOX(self.GOBJECT), model)
	}

	/// Specifies whether the popup’s width should be a fixed width
	/// matching the allocated width of the combo box.
	/// - Parameters:
	///	- fixed: Bool (gboolean)
	open func setPopupFixedWidth(fixed: Bool) -> Swift.Void {
		gtk_combo_box_set_popup_fixed_width(GTK_COMBO_BOX(self.GOBJECT), fixed ? 1 : 0)
	}

	/// Sets the row separator function, which is used to determine
	/// whether a row should be drawn as a separator. If the row separator
	/// function is %NULL, no separators are drawn. This is the default value.
	/// - Parameters:
	///	- function: @escaping GtkTreeViewRowSeparatorFunc (GtkTreeViewRowSeparatorFunc)
	///	- data: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setRowSeparatorFunc(_ function: @escaping GtkTreeViewRowSeparatorFunc, data: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_combo_box_set_row_separator_func(GTK_COMBO_BOX(self.GOBJECT), function, data, destroy)
	}

	/// Sets the column with row span information for @combo_box to be @row_span.
	/// The row span column contains integers which indicate how many rows
	/// an item should span.
	/// - Parameters:
	///	- rowSpan: gint (gint)
	open func setRowSpanColumn(rowSpan: gint) -> Swift.Void {
		gtk_combo_box_set_row_span_column(GTK_COMBO_BOX(self.GOBJECT), rowSpan)
	}

	/// Sets the menu’s title in tearoff mode.
	/// - Parameters:
	///	- title: String (const gchar*)
	open func setTitle(_ title: String) -> Swift.Void {
		gtk_combo_box_set_title(GTK_COMBO_BOX(self.GOBJECT), title)
	}

	/// Sets the wrap width of @combo_box to be @width. The wrap width is basically
	/// the preferred number of columns when you want the popup to be layed out
	/// in a table.
	/// - Parameters:
	///	- width: gint (gint)
	open func setWrapWidth(_ width: gint) -> Swift.Void {
		gtk_combo_box_set_wrap_width(GTK_COMBO_BOX(self.GOBJECT), width)
	}

	/// Emits the #GtkCellEditable::editing-done signal.
	open func editingDone() -> Swift.Void {
		gtk_cell_editable_editing_done(GTK_CELL_EDITABLE(self.GOBJECT))
	}

	/// Emits the #GtkCellEditable::remove-widget signal.
	open func removeWidget() -> Swift.Void {
		gtk_cell_editable_remove_widget(GTK_CELL_EDITABLE(self.GOBJECT))
	}

	/// Begins editing on a @cell_editable. @event is the #GdkEvent that began
	/// the editing process. It may be %NULL, in the instance that editing was
	/// initiated through programatic means.
	/// - Parameters:
	///	- event: UnsafeMutablePointer<GdkEvent>? (GdkEvent*)
	open func startEditing(event: UnsafeMutablePointer<GdkEvent>?) -> Swift.Void {
		gtk_cell_editable_start_editing(GTK_CELL_EDITABLE(self.GOBJECT), event)
	}

	/// Adds an attribute mapping to the list in @cell_layout.
	/// The @column is the column of the model to get a value from, and the
	/// @attribute is the parameter on @cell to be set from the value. So for
	/// example if column 2 of the model contains strings, you could have the
	/// “text” attribute of a #GtkCellRendererText get its values from column 2.
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- attribute: String (const gchar*)
	///	- column: gint (gint)
	open func addAttribute(cell: UnsafeMutablePointer<GtkCellRenderer>!, attribute: String, column: gint) -> Swift.Void {
		gtk_cell_layout_add_attribute(GTK_CELL_LAYOUT(self.GOBJECT), cell, attribute, column)
	}

	/// Unsets all the mappings on all renderers on @cell_layout and
	/// removes all renderers from @cell_layout.
	open func clear() -> Swift.Void {
		gtk_cell_layout_clear(GTK_CELL_LAYOUT(self.GOBJECT))
	}

	/// Clears all existing attributes previously set with
	/// gtk_cell_layout_set_attributes().
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	open func clearAttributes(cell: UnsafeMutablePointer<GtkCellRenderer>!) -> Swift.Void {
		gtk_cell_layout_clear_attributes(GTK_CELL_LAYOUT(self.GOBJECT), cell)
	}

	/// Returns the underlying #GtkCellArea which might be @cell_layout
	/// if called on a #GtkCellArea or might be %NULL if no #GtkCellArea
	/// is used by @cell_layout.
	/// - Returns: UnsafeMutablePointer<GtkCellArea>? (GtkCellArea*)
	open func getArea() -> UnsafeMutablePointer<GtkCellArea>? {
		return gtk_cell_layout_get_area(GTK_CELL_LAYOUT(self.GOBJECT))
	}

	/// Returns the cell renderers which have been added to @cell_layout.
	/// - Returns: UnsafeMutablePointer<GList>! (GList*)
	open func getCells() -> UnsafeMutablePointer<GList>! {
		return gtk_cell_layout_get_cells(GTK_CELL_LAYOUT(self.GOBJECT))
	}

	/// Adds the @cell to the end of @cell_layout. If @expand is %FALSE, then the
	/// @cell is allocated no more space than it needs. Any unused space is
	/// divided evenly between cells for which @expand is %TRUE.
	/// Note that reusing the same cell renderer is not supported.
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- expand: Bool (gboolean)
	open func packEnd(cell: UnsafeMutablePointer<GtkCellRenderer>!, expand: Bool) -> Swift.Void {
		gtk_cell_layout_pack_end(GTK_CELL_LAYOUT(self.GOBJECT), cell, expand ? 1 : 0)
	}

	/// Packs the @cell into the beginning of @cell_layout. If @expand is %FALSE,
	/// then the @cell is allocated no more space than it needs. Any unused space
	/// is divided evenly between cells for which @expand is %TRUE.
	/// Note that reusing the same cell renderer is not supported.
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- expand: Bool (gboolean)
	open func packStart(cell: UnsafeMutablePointer<GtkCellRenderer>!, expand: Bool) -> Swift.Void {
		gtk_cell_layout_pack_start(GTK_CELL_LAYOUT(self.GOBJECT), cell, expand ? 1 : 0)
	}

	/// Re-inserts @cell at @position.
	/// Note that @cell has already to be packed into @cell_layout
	/// for this to function properly.
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- position: gint (gint)
	open func reorder(cell: UnsafeMutablePointer<GtkCellRenderer>!, position: gint) -> Swift.Void {
		gtk_cell_layout_reorder(GTK_CELL_LAYOUT(self.GOBJECT), cell, position)
	}

	/// Sets the #GtkCellLayoutDataFunc to use for @cell_layout.
	/// This function is used instead of the standard attributes mapping
	/// for setting the column value, and should set the value of @cell_layout’s
	/// cell renderer(s) as appropriate.
	/// @func may be %NULL to remove a previously set function.
	/// - Parameters:
	///	- cell: UnsafeMutablePointer<GtkCellRenderer>! (GtkCellRenderer*)
	///	- function: @escaping GtkCellLayoutDataFunc (GtkCellLayoutDataFunc)
	///	- funcData: gpointer? (gpointer)
	///	- destroy: @escaping GDestroyNotify (GDestroyNotify)
	open func setCellDataFunc(cell: UnsafeMutablePointer<GtkCellRenderer>!, function: @escaping GtkCellLayoutDataFunc, funcData: gpointer?, destroy: @escaping GDestroyNotify) -> Swift.Void {
		gtk_cell_layout_set_cell_data_func(GTK_CELL_LAYOUT(self.GOBJECT), cell, function, funcData, destroy)
	}

}
