/*
 * CGTKFileChooserButton.swift
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

public let GTK_TYPE_FILE_CHOOSER_BUTTON: GType = gtk_file_chooser_button_get_type()

@inline(__always) public func GTK_FILE_CHOOSER_BUTTON(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkFileChooserButton>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FILE_CHOOSER_BUTTON)
}

/// The #GtkFileChooserButton is a widget that lets the user select a
/// file.  It implements the #GtkFileChooser interface.  Visually, it is a
/// file name with a button to bring up a #GtkFileChooserDialog.
/// The user can then use that dialog to change the file associated with
/// that button.  This widget does not support setting the
/// #GtkFileChooser:select-multiple property to %TRUE.
/// ## Create a button to let the user select a file in /etc
/// |[<!-- language="C" -->
/// {
/// GtkWidget *button;
/// button = gtk_file_chooser_button_new (_("Select a file"),
/// GTK_FILE_CHOOSER_ACTION_OPEN);
/// gtk_file_chooser_set_current_folder (GTK_FILE_CHOOSER (button),
/// "/etc");
/// }
/// ]|
/// The #GtkFileChooserButton supports the #GtkFileChooserActions
/// %GTK_FILE_CHOOSER_ACTION_OPEN and %GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER.
/// > The #GtkFileChooserButton will ellipsize the label, and will thus
/// > request little horizontal space.  To give the button more space,
/// > you should call gtk_widget_get_preferred_size(),
/// > gtk_file_chooser_button_set_width_chars(), or pack the button in
/// > such a way that other interface elements give space to the
/// > widget.


open class CGTKFileChooserButton : CGTKBox, CGTKFileChooser {
	/// Creates a new file-selecting button widget.
	/// - Parameters:
	///	- title: String (const gchar*)
	///	- action: GtkFileChooserAction (GtkFileChooserAction)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(title: String, action: GtkFileChooserAction) {
		self.init(withGObject: gtk_file_chooser_button_new(title, action))!
	}

	/// Creates a #GtkFileChooserButton widget which uses @dialog as its
	/// file-picking window.
	/// Note that @dialog must be a #GtkDialog (or subclass) which
	/// implements the #GtkFileChooser interface and must not have
	/// %GTK_DIALOG_DESTROY_WITH_PARENT set.
	/// Also note that the dialog needs to have its confirmative button
	/// added with response %GTK_RESPONSE_ACCEPT or %GTK_RESPONSE_OK in
	/// order for the button to take over the file selected in the dialog.
	/// - Parameters:
	///	- dialog: CGTKWidget (GtkWidget*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withDialog dialog: CGTKWidget) {
		self.init(withGObject: gtk_file_chooser_button_new_with_dialog(dialog.WIDGET))!
	}

	open var FILECHOOSERBUTTON: UnsafeMutablePointer<GtkFileChooserButton>! {
		get {
			return GTK_FILE_CHOOSER_BUTTON(self.GOBJECT)
		}
	}

	/// Returns whether the button grabs focus when it is clicked with the mouse.
	/// See gtk_file_chooser_button_set_focus_on_click().
	/// - Returns: Bool (gboolean)
	override open func getFocusOnClick() -> Bool {
		return gtk_file_chooser_button_get_focus_on_click(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT)) != 0 ? true : false
	}

	/// Retrieves the title of the browse dialog used by @button. The returned value
	/// should not be modified or freed.
	/// - Returns: String? (const gchar*)
	open func getTitle() -> String? {
		return String(utf8String: gtk_file_chooser_button_get_title(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT)))
	}

	/// Retrieves the width in characters of the @button widget’s entry and/or label.
	/// - Returns: gint (gint)
	open func getWidthChars() -> gint {
		return gtk_file_chooser_button_get_width_chars(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT))
	}

	/// Sets whether the button will grab focus when it is clicked with the mouse.
	/// Making mouse clicks not grab focus is useful in places like toolbars where
	/// you don’t want the keyboard focus removed from the main area of the
	/// application.
	/// - Parameters:
	///	- focusOnClick: Bool (gboolean)
	override open func setFocusOnClick(_ focusOnClick: Bool) -> Swift.Void {
		gtk_file_chooser_button_set_focus_on_click(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT), focusOnClick ? 1 : 0)
	}

	/// Modifies the @title of the browse dialog used by @button.
	/// - Parameters:
	///	- title: String (const gchar*)
	open func setTitle(_ title: String) -> Swift.Void {
		gtk_file_chooser_button_set_title(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT), title)
	}

	/// Sets the width (in characters) that @button will use to @n_chars.
	/// - Parameters:
	///	- nchars: gint (gint)
	open func setWidthChars(nchars: gint) -> Swift.Void {
		gtk_file_chooser_button_set_width_chars(GTK_FILE_CHOOSER_BUTTON(self.GOBJECT), nchars)
	}

	/// Adds a 'choice' to the file chooser. This is typically implemented
	/// as a combobox or, for boolean choices, as a checkbutton. You can select
	/// a value using gtk_file_chooser_set_choice() before the dialog is shown,
	/// and you can obtain the user-selected value in the ::response signal handler
	/// using gtk_file_chooser_get_choice().
	/// Compare gtk_file_chooser_set_extra_widget().
	/// - Parameters:
	///	- id: String (const char*)
	///	- label: String (const char*)
	///	- options: UnsafeMutablePointer<UnsafePointer<CChar>?>! (char**)
	///	- optionLabels: UnsafeMutablePointer<UnsafePointer<CChar>?>! (char**)
	open func addChoice(id: String, label: String, options: UnsafeMutablePointer<UnsafePointer<CChar>?>!, optionLabels: UnsafeMutablePointer<UnsafePointer<CChar>?>!) -> Swift.Void {
		gtk_file_chooser_add_choice(GTK_FILE_CHOOSER(self.GOBJECT), id, label, options, optionLabels)
	}

	/// Adds @filter to the list of filters that the user can select between.
	/// When a filter is selected, only files that are passed by that
	/// filter are displayed.
	/// Note that the @chooser takes ownership of the filter, so you have to
	/// ref and sink it if you want to keep a reference.
	/// - Parameters:
	///	- filter: OpaquePointer! (GtkFileFilter*)
	open func addFilter(_ filter: OpaquePointer!) -> Swift.Void {
		gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(self.GOBJECT), filter)
	}

	/// Adds a folder to be displayed with the shortcut folders in a file chooser.
	/// Note that shortcut folders do not get saved, as they are provided by the
	/// application.  For example, you can use this to add a
	/// “/usr/share/mydrawprogram/Clipart” folder to the volume list.
	/// - Parameters:
	///	- folder: String (const char*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil (GError**)
	/// - Returns: Bool (gboolean)
	open func addShortcutFolder(_ folder: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_file_chooser_add_shortcut_folder(GTK_FILE_CHOOSER(self.GOBJECT), folder, err) != 0 ? true : false
	}

	/// Adds a folder URI to be displayed with the shortcut folders in a file
	/// chooser.  Note that shortcut folders do not get saved, as they are provided
	/// by the application.  For example, you can use this to add a
	/// “file:///usr/share/mydrawprogram/Clipart” folder to the volume list.
	/// - Parameters:
	///	- uri: String (const char*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil (GError**)
	/// - Returns: Bool (gboolean)
	open func addShortcutFolderUri(_ uri: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_file_chooser_add_shortcut_folder_uri(GTK_FILE_CHOOSER(self.GOBJECT), uri, err) != 0 ? true : false
	}

	/// Gets the type of operation that the file chooser is performing; see
	/// gtk_file_chooser_set_action().
	/// - Returns: GtkFileChooserAction (GtkFileChooserAction)
	open func getAction() -> GtkFileChooserAction {
		return gtk_file_chooser_get_action(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Gets the currently selected option in the 'choice' with the given ID.
	/// - Parameters:
	///	- id: String (const char*)
	/// - Returns: String? (const char*)
	open func getChoice(id: String) -> String? {
		return String(utf8String: gtk_file_chooser_get_choice(GTK_FILE_CHOOSER(self.GOBJECT), id))
	}

	/// Gets whether file choser will offer to create new folders.
	/// See gtk_file_chooser_set_create_folders().
	/// - Returns: Bool (gboolean)
	open func getCreateFolders() -> Bool {
		return gtk_file_chooser_get_create_folders(GTK_FILE_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the current folder of @chooser as a local filename.
	/// See gtk_file_chooser_set_current_folder().
	/// Note that this is the folder that the file chooser is currently displaying
	/// (e.g. "/home/username/Documents"), which is not the same
	/// as the currently-selected folder if the chooser is in
	/// %GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER mode
	/// (e.g. "/home/username/Documents/selected-folder/".  To get the
	/// currently-selected folder in that mode, use gtk_file_chooser_get_uri() as the
	/// usual way to get the selection.
	/// - Returns: String? (gchar*)
	open func getCurrentFolder() -> String? {
		return String(utf8String: gtk_file_chooser_get_current_folder(GTK_FILE_CHOOSER(self.GOBJECT)))
	}

	/// Gets the current folder of @chooser as #GFile.
	/// See gtk_file_chooser_get_current_folder_uri().
	/// - Returns: OpaquePointer (GFile*)
	open func getCurrentFolderFile() -> OpaquePointer {
		return gtk_file_chooser_get_current_folder_file(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Gets the current folder of @chooser as an URI.
	/// See gtk_file_chooser_set_current_folder_uri().
	/// Note that this is the folder that the file chooser is currently displaying
	/// (e.g. "file:///home/username/Documents"), which is not the same
	/// as the currently-selected folder if the chooser is in
	/// %GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER mode
	/// (e.g. "file:///home/username/Documents/selected-folder/".  To get the
	/// currently-selected folder in that mode, use gtk_file_chooser_get_uri() as the
	/// usual way to get the selection.
	/// - Returns: String? (gchar*)
	open func getCurrentFolderUri() -> String? {
		return String(utf8String: gtk_file_chooser_get_current_folder_uri(GTK_FILE_CHOOSER(self.GOBJECT)))
	}

	/// Gets the current name in the file selector, as entered by the user in the
	/// text entry for “Name”.
	/// This is meant to be used in save dialogs, to get the currently typed filename
	/// when the file itself does not exist yet.  For example, an application that
	/// adds a custom extra widget to the file chooser for “file format” may want to
	/// change the extension of the typed filename based on the chosen format, say,
	/// from “.jpg” to “.png”.
	/// - Returns: String? (gchar*)
	open func getCurrentName() -> String? {
		return String(utf8String: gtk_file_chooser_get_current_name(GTK_FILE_CHOOSER(self.GOBJECT)))
	}

	/// Queries whether a file chooser is set to confirm for overwriting when the user
	/// types a file name that already exists.
	/// - Returns: Bool (gboolean)
	open func getDoOverwriteConfirmation() -> Bool {
		return gtk_file_chooser_get_do_overwrite_confirmation(GTK_FILE_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the current extra widget; see
	/// gtk_file_chooser_set_extra_widget().
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getExtraWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_file_chooser_get_extra_widget(GTK_FILE_CHOOSER(self.GOBJECT)))
	}

	/// Gets the #GFile for the currently selected file in
	/// the file selector. If multiple files are selected,
	/// one of the files will be returned at random.
	/// If the file chooser is in folder mode, this function returns the selected
	/// folder.
	/// - Returns: OpaquePointer (GFile*)
	open func getFile() -> OpaquePointer {
		return gtk_file_chooser_get_file(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Gets the filename for the currently selected file in
	/// the file selector. The filename is returned as an absolute path. If
	/// multiple files are selected, one of the filenames will be returned at
	/// random.
	/// If the file chooser is in folder mode, this function returns the selected
	/// folder.
	/// - Returns: String? (gchar*)
	open func getFilename() -> String? {
		return String(utf8String: gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(self.GOBJECT)))
	}

	/// Lists all the selected files and subfolders in the current folder of
	/// @chooser. The returned names are full absolute paths. If files in the current
	/// folder cannot be represented as local filenames they will be ignored. (See
	/// gtk_file_chooser_get_uris())
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	open func getFilenames() -> UnsafeMutablePointer<GSList>! {
		return gtk_file_chooser_get_filenames(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Lists all the selected files and subfolders in the current folder of @chooser
	/// as #GFile. An internal function, see gtk_file_chooser_get_uris().
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	open func getFiles() -> UnsafeMutablePointer<GSList>! {
		return gtk_file_chooser_get_files(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Gets the current filter; see gtk_file_chooser_set_filter().
	/// - Returns: OpaquePointer? (GtkFileFilter*)
	open func getFilter() -> OpaquePointer? {
		return gtk_file_chooser_get_filter(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Gets whether only local files can be selected in the
	/// file selector. See gtk_file_chooser_set_local_only()
	/// - Returns: Bool (gboolean)
	open func getLocalOnly() -> Bool {
		return gtk_file_chooser_get_local_only(GTK_FILE_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the #GFile that should be previewed in a custom preview
	/// Internal function, see gtk_file_chooser_get_preview_uri().
	/// - Returns: OpaquePointer? (GFile*)
	open func getPreviewFile() -> OpaquePointer? {
		return gtk_file_chooser_get_preview_file(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Gets the filename that should be previewed in a custom preview
	/// widget. See gtk_file_chooser_set_preview_widget().
	/// - Returns: String? (char*)
	open func getPreviewFilename() -> String? {
		return String(utf8String: gtk_file_chooser_get_preview_filename(GTK_FILE_CHOOSER(self.GOBJECT)))
	}

	/// Gets the URI that should be previewed in a custom preview
	/// widget. See gtk_file_chooser_set_preview_widget().
	/// - Returns: String? (char*)
	open func getPreviewUri() -> String? {
		return String(utf8String: gtk_file_chooser_get_preview_uri(GTK_FILE_CHOOSER(self.GOBJECT)))
	}

	/// Gets the current preview widget; see
	/// gtk_file_chooser_set_preview_widget().
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getPreviewWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_file_chooser_get_preview_widget(GTK_FILE_CHOOSER(self.GOBJECT)))
	}

	/// Gets whether the preview widget set by gtk_file_chooser_set_preview_widget()
	/// should be shown for the current filename. See
	/// gtk_file_chooser_set_preview_widget_active().
	/// - Returns: Bool (gboolean)
	open func getPreviewWidgetActive() -> Bool {
		return gtk_file_chooser_get_preview_widget_active(GTK_FILE_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets whether multiple files can be selected in the file
	/// selector. See gtk_file_chooser_set_select_multiple().
	/// - Returns: Bool (gboolean)
	open func getSelectMultiple() -> Bool {
		return gtk_file_chooser_get_select_multiple(GTK_FILE_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets whether hidden files and folders are displayed in the file selector.
	/// See gtk_file_chooser_set_show_hidden().
	/// - Returns: Bool (gboolean)
	open func getShowHidden() -> Bool {
		return gtk_file_chooser_get_show_hidden(GTK_FILE_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the URI for the currently selected file in
	/// the file selector. If multiple files are selected,
	/// one of the filenames will be returned at random.
	/// If the file chooser is in folder mode, this function returns the selected
	/// folder.
	/// - Returns: String? (gchar*)
	open func getUri() -> String? {
		return String(utf8String: gtk_file_chooser_get_uri(GTK_FILE_CHOOSER(self.GOBJECT)))
	}

	/// Lists all the selected files and subfolders in the current folder of
	/// @chooser. The returned names are full absolute URIs.
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	open func getUris() -> UnsafeMutablePointer<GSList>! {
		return gtk_file_chooser_get_uris(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Gets whether a stock label should be drawn with the name of the previewed
	/// file.  See gtk_file_chooser_set_use_preview_label().
	/// - Returns: Bool (gboolean)
	open func getUsePreviewLabel() -> Bool {
		return gtk_file_chooser_get_use_preview_label(GTK_FILE_CHOOSER(self.GOBJECT)) != 0 ? true : false
	}

	/// Lists the current set of user-selectable filters; see
	/// gtk_file_chooser_add_filter(), gtk_file_chooser_remove_filter().
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	open func listFilters() -> UnsafeMutablePointer<GSList>! {
		return gtk_file_chooser_list_filters(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Queries the list of shortcut folders in the file chooser, as set by
	/// gtk_file_chooser_add_shortcut_folder_uri().
	/// - Returns: UnsafeMutablePointer<GSList>? (GSList*)
	open func listShortcutFolderUris() -> UnsafeMutablePointer<GSList>? {
		return gtk_file_chooser_list_shortcut_folder_uris(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Queries the list of shortcut folders in the file chooser, as set by
	/// gtk_file_chooser_add_shortcut_folder().
	/// - Returns: UnsafeMutablePointer<GSList>? (GSList*)
	open func listShortcutFolders() -> UnsafeMutablePointer<GSList>? {
		return gtk_file_chooser_list_shortcut_folders(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Removes a 'choice' that has been added with gtk_file_chooser_add_choice().
	/// - Parameters:
	///	- id: String (const char*)
	open func removeChoice(id: String) -> Swift.Void {
		gtk_file_chooser_remove_choice(GTK_FILE_CHOOSER(self.GOBJECT), id)
	}

	/// Removes @filter from the list of filters that the user can select between.
	/// - Parameters:
	///	- filter: OpaquePointer! (GtkFileFilter*)
	open func removeFilter(_ filter: OpaquePointer!) -> Swift.Void {
		gtk_file_chooser_remove_filter(GTK_FILE_CHOOSER(self.GOBJECT), filter)
	}

	/// Removes a folder from a file chooser’s list of shortcut folders.
	/// - Parameters:
	///	- folder: String (const char*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil (GError**)
	/// - Returns: Bool (gboolean)
	open func removeShortcutFolder(_ folder: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_file_chooser_remove_shortcut_folder(GTK_FILE_CHOOSER(self.GOBJECT), folder, err) != 0 ? true : false
	}

	/// Removes a folder URI from a file chooser’s list of shortcut folders.
	/// - Parameters:
	///	- uri: String (const char*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil (GError**)
	/// - Returns: Bool (gboolean)
	open func removeShortcutFolderUri(_ uri: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_file_chooser_remove_shortcut_folder_uri(GTK_FILE_CHOOSER(self.GOBJECT), uri, err) != 0 ? true : false
	}

	/// Selects all the files in the current folder of a file chooser.
	open func selectAll() -> Swift.Void {
		gtk_file_chooser_select_all(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Selects the file referred to by @file. An internal function. See
	/// _gtk_file_chooser_select_uri().
	/// - Parameters:
	///	- file: OpaquePointer! (GFile*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil (GError**)
	/// - Returns: Bool (gboolean)
	open func selectFile(_ file: OpaquePointer!, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_file_chooser_select_file(GTK_FILE_CHOOSER(self.GOBJECT), file, err) != 0 ? true : false
	}

	/// Selects a filename. If the file name isn’t in the current
	/// folder of @chooser, then the current folder of @chooser will
	/// be changed to the folder containing @filename.
	/// - Parameters:
	///	- filename: String (const char*)
	/// - Returns: Bool (gboolean)
	open func selectFilename(_ filename: String) -> Bool {
		return gtk_file_chooser_select_filename(GTK_FILE_CHOOSER(self.GOBJECT), filename) != 0 ? true : false
	}

	/// Selects the file to by @uri. If the URI doesn’t refer to a
	/// file in the current folder of @chooser, then the current folder of
	/// @chooser will be changed to the folder containing @filename.
	/// - Parameters:
	///	- uri: String (const char*)
	/// - Returns: Bool (gboolean)
	open func selectUri(_ uri: String) -> Bool {
		return gtk_file_chooser_select_uri(GTK_FILE_CHOOSER(self.GOBJECT), uri) != 0 ? true : false
	}

	/// Sets the type of operation that the chooser is performing; the
	/// user interface is adapted to suit the selected action. For example,
	/// an option to create a new folder might be shown if the action is
	/// %GTK_FILE_CHOOSER_ACTION_SAVE but not if the action is
	/// %GTK_FILE_CHOOSER_ACTION_OPEN.
	/// - Parameters:
	///	- action: GtkFileChooserAction (GtkFileChooserAction)
	open func setAction(_ action: GtkFileChooserAction) -> Swift.Void {
		gtk_file_chooser_set_action(GTK_FILE_CHOOSER(self.GOBJECT), action)
	}

	/// Selects an option in a 'choice' that has been added with
	/// gtk_file_chooser_add_choice(). For a boolean choice, the
	/// possible options are "true" and "false".
	/// - Parameters:
	///	- id: String (const char*)
	///	- option: String (const char*)
	open func setChoice(id: String, option: String) -> Swift.Void {
		gtk_file_chooser_set_choice(GTK_FILE_CHOOSER(self.GOBJECT), id, option)
	}

	/// Sets whether file choser will offer to create new folders.
	/// This is only relevant if the action is not set to be
	/// %GTK_FILE_CHOOSER_ACTION_OPEN.
	/// - Parameters:
	///	- createFolders: Bool (gboolean)
	open func setCreateFolders(_ createFolders: Bool) -> Swift.Void {
		gtk_file_chooser_set_create_folders(GTK_FILE_CHOOSER(self.GOBJECT), createFolders ? 1 : 0)
	}

	/// Sets the current folder for @chooser from a local filename.
	/// The user will be shown the full contents of the current folder,
	/// plus user interface elements for navigating to other folders.
	/// In general, you should not use this function.  See the
	/// [section on setting up a file chooser dialog][gtkfilechooserdialog-setting-up]
	/// for the rationale behind this.
	/// - Parameters:
	///	- filename: String (const gchar*)
	/// - Returns: Bool (gboolean)
	open func setCurrentFolder(filename: String) -> Bool {
		return gtk_file_chooser_set_current_folder(GTK_FILE_CHOOSER(self.GOBJECT), filename) != 0 ? true : false
	}

	/// Sets the current folder for @chooser from a #GFile.
	/// Internal function, see gtk_file_chooser_set_current_folder_uri().
	/// - Parameters:
	///	- file: OpaquePointer! (GFile*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil (GError**)
	/// - Returns: Bool (gboolean)
	open func setCurrentFolderFile(_ file: OpaquePointer!, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_file_chooser_set_current_folder_file(GTK_FILE_CHOOSER(self.GOBJECT), file, err) != 0 ? true : false
	}

	/// Sets the current folder for @chooser from an URI.
	/// The user will be shown the full contents of the current folder,
	/// plus user interface elements for navigating to other folders.
	/// In general, you should not use this function.  See the
	/// [section on setting up a file chooser dialog][gtkfilechooserdialog-setting-up]
	/// for the rationale behind this.
	/// - Parameters:
	///	- uri: String (const gchar*)
	/// - Returns: Bool (gboolean)
	open func setCurrentFolderUri(_ uri: String) -> Bool {
		return gtk_file_chooser_set_current_folder_uri(GTK_FILE_CHOOSER(self.GOBJECT), uri) != 0 ? true : false
	}

	/// Sets the current name in the file selector, as if entered
	/// by the user. Note that the name passed in here is a UTF-8
	/// string rather than a filename. This function is meant for
	/// such uses as a suggested name in a “Save As...” dialog.  You can
	/// pass “Untitled.doc” or a similarly suitable suggestion for the @name.
	/// If you want to preselect a particular existing file, you should use
	/// gtk_file_chooser_set_filename() or gtk_file_chooser_set_uri() instead.
	/// Please see the documentation for those functions for an example of using
	/// gtk_file_chooser_set_current_name() as well.
	/// - Parameters:
	///	- name: String (const gchar*)
	open func setCurrentName(_ name: String) -> Swift.Void {
		gtk_file_chooser_set_current_name(GTK_FILE_CHOOSER(self.GOBJECT), name)
	}

	/// Sets whether a file chooser in %GTK_FILE_CHOOSER_ACTION_SAVE mode will present
	/// a confirmation dialog if the user types a file name that already exists.  This
	/// is %FALSE by default.
	/// If set to %TRUE, the @chooser will emit the
	/// #GtkFileChooser::confirm-overwrite signal when appropriate.
	/// If all you need is the stock confirmation dialog, set this property to %TRUE.
	/// You can override the way confirmation is done by actually handling the
	/// #GtkFileChooser::confirm-overwrite signal; please refer to its documentation
	/// for the details.
	/// - Parameters:
	///	- doOverwriteConfirmation: Bool (gboolean)
	open func setDoOverwriteConfirmation(_ doOverwriteConfirmation: Bool) -> Swift.Void {
		gtk_file_chooser_set_do_overwrite_confirmation(GTK_FILE_CHOOSER(self.GOBJECT), doOverwriteConfirmation ? 1 : 0)
	}

	/// Sets an application-supplied widget to provide extra options to the user.
	/// - Parameters:
	///	- extraWidget: CGTKWidget (GtkWidget*)
	open func setExtraWidget(_ extraWidget: CGTKWidget) -> Swift.Void {
		gtk_file_chooser_set_extra_widget(GTK_FILE_CHOOSER(self.GOBJECT), extraWidget.WIDGET)
	}

	/// Sets @file as the current filename for the file chooser, by changing
	/// to the file’s parent folder and actually selecting the file in list.  If
	/// the @chooser is in %GTK_FILE_CHOOSER_ACTION_SAVE mode, the file’s base name
	/// will also appear in the dialog’s file name entry.
	/// If the file name isn’t in the current folder of @chooser, then the current
	/// folder of @chooser will be changed to the folder containing @filename. This
	/// is equivalent to a sequence of gtk_file_chooser_unselect_all() followed by
	/// gtk_file_chooser_select_filename().
	/// Note that the file must exist, or nothing will be done except
	/// for the directory change.
	/// If you are implementing a save dialog,
	/// you should use this function if you already have a file name to which the
	/// user may save; for example, when the user opens an existing file and then
	/// does Save As...  If you don’t have
	/// a file name already — for example, if the user just created a new
	/// file and is saving it for the first time, do not call this function.
	/// Instead, use something similar to this:
	/// |[<!-- language="C" -->
	/// if (document_is_new)
	/// {
	/// // the user just created a new document
	/// gtk_file_chooser_set_current_folder_file (chooser, default_file_for_saving);
	/// gtk_file_chooser_set_current_name (chooser, "Untitled document");
	/// }
	/// else
	/// {
	/// // the user edited an existing document
	/// gtk_file_chooser_set_file (chooser, existing_file);
	/// }
	/// ]|
	/// - Parameters:
	///	- file: OpaquePointer! (GFile*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil (GError**)
	/// - Returns: Bool (gboolean)
	open func setFile(_ file: OpaquePointer!, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? = nil) -> Bool {
		return gtk_file_chooser_set_file(GTK_FILE_CHOOSER(self.GOBJECT), file, err) != 0 ? true : false
	}

	/// Sets @filename as the current filename for the file chooser, by changing to
	/// the file’s parent folder and actually selecting the file in list; all other
	/// files will be unselected.  If the @chooser is in
	/// %GTK_FILE_CHOOSER_ACTION_SAVE mode, the file’s base name will also appear in
	/// the dialog’s file name entry.
	/// Note that the file must exist, or nothing will be done except
	/// for the directory change.
	/// You should use this function only when implementing a save
	/// dialog for which you already have a file name to which
	/// the user may save.  For example, when the user opens an existing file and
	/// then does Save As... to save a copy or
	/// a modified version.  If you don’t have a file name already — for
	/// example, if the user just created a new file and is saving it for the first
	/// time, do not call this function.  Instead, use something similar to this:
	/// |[<!-- language="C" -->
	/// if (document_is_new)
	/// {
	/// // the user just created a new document
	/// gtk_file_chooser_set_current_name (chooser, "Untitled document");
	/// }
	/// else
	/// {
	/// // the user edited an existing document
	/// gtk_file_chooser_set_filename (chooser, existing_filename);
	/// }
	/// ]|
	/// In the first case, the file chooser will present the user with useful suggestions
	/// as to where to save his new file.  In the second case, the file’s existing location
	/// is already known, so the file chooser will use it.
	/// - Parameters:
	///	- filename: String (const char*)
	/// - Returns: Bool (gboolean)
	open func setFilename(_ filename: String) -> Bool {
		return gtk_file_chooser_set_filename(GTK_FILE_CHOOSER(self.GOBJECT), filename) != 0 ? true : false
	}

	/// Sets the current filter; only the files that pass the
	/// filter will be displayed. If the user-selectable list of filters
	/// is non-empty, then the filter should be one of the filters
	/// in that list. Setting the current filter when the list of
	/// filters is empty is useful if you want to restrict the displayed
	/// set of files without letting the user change it.
	/// - Parameters:
	///	- filter: OpaquePointer! (GtkFileFilter*)
	open func setFilter(_ filter: OpaquePointer!) -> Swift.Void {
		gtk_file_chooser_set_filter(GTK_FILE_CHOOSER(self.GOBJECT), filter)
	}

	/// Sets whether only local files can be selected in the
	/// file selector. If @local_only is %TRUE (the default),
	/// then the selected file or files are guaranteed to be
	/// accessible through the operating systems native file
	/// system and therefore the application only
	/// needs to worry about the filename functions in
	/// #GtkFileChooser, like gtk_file_chooser_get_filename(),
	/// rather than the URI functions like
	/// gtk_file_chooser_get_uri(),
	/// On some systems non-native files may still be
	/// available using the native filesystem via a userspace
	/// filesystem (FUSE).
	/// - Parameters:
	///	- localOnly: Bool (gboolean)
	open func setLocalOnly(_ localOnly: Bool) -> Swift.Void {
		gtk_file_chooser_set_local_only(GTK_FILE_CHOOSER(self.GOBJECT), localOnly ? 1 : 0)
	}

	/// Sets an application-supplied widget to use to display a custom preview
	/// of the currently selected file. To implement a preview, after setting the
	/// preview widget, you connect to the #GtkFileChooser::update-preview
	/// signal, and call gtk_file_chooser_get_preview_filename() or
	/// gtk_file_chooser_get_preview_uri() on each change. If you can
	/// display a preview of the new file, update your widget and
	/// set the preview active using gtk_file_chooser_set_preview_widget_active().
	/// Otherwise, set the preview inactive.
	/// When there is no application-supplied preview widget, or the
	/// application-supplied preview widget is not active, the file chooser
	/// will display no preview at all.
	/// - Parameters:
	///	- previewWidget: CGTKWidget (GtkWidget*)
	open func setPreviewWidget(_ previewWidget: CGTKWidget) -> Swift.Void {
		gtk_file_chooser_set_preview_widget(GTK_FILE_CHOOSER(self.GOBJECT), previewWidget.WIDGET)
	}

	/// Sets whether the preview widget set by
	/// gtk_file_chooser_set_preview_widget() should be shown for the
	/// current filename. When @active is set to false, the file chooser
	/// may display an internally generated preview of the current file
	/// or it may display no preview at all. See
	/// gtk_file_chooser_set_preview_widget() for more details.
	/// - Parameters:
	///	- active: Bool (gboolean)
	open func setPreviewWidgetActive(_ active: Bool) -> Swift.Void {
		gtk_file_chooser_set_preview_widget_active(GTK_FILE_CHOOSER(self.GOBJECT), active ? 1 : 0)
	}

	/// Sets whether multiple files can be selected in the file selector.  This is
	/// only relevant if the action is set to be %GTK_FILE_CHOOSER_ACTION_OPEN or
	/// %GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER.
	/// - Parameters:
	///	- selectMultiple: Bool (gboolean)
	open func setSelectMultiple(_ selectMultiple: Bool) -> Swift.Void {
		gtk_file_chooser_set_select_multiple(GTK_FILE_CHOOSER(self.GOBJECT), selectMultiple ? 1 : 0)
	}

	/// Sets whether hidden files and folders are displayed in the file selector.
	/// - Parameters:
	///	- showHidden: Bool (gboolean)
	open func setShowHidden(_ showHidden: Bool) -> Swift.Void {
		gtk_file_chooser_set_show_hidden(GTK_FILE_CHOOSER(self.GOBJECT), showHidden ? 1 : 0)
	}

	/// Sets the file referred to by @uri as the current file for the file chooser,
	/// by changing to the URI’s parent folder and actually selecting the URI in the
	/// list.  If the @chooser is %GTK_FILE_CHOOSER_ACTION_SAVE mode, the URI’s base
	/// name will also appear in the dialog’s file name entry.
	/// Note that the URI must exist, or nothing will be done except for the
	/// directory change.
	/// You should use this function only when implementing a save
	/// dialog for which you already have a file name to which
	/// the user may save.  For example, when the user opens an existing file and then
	/// does Save As... to save a copy or a
	/// modified version.  If you don’t have a file name already — for example,
	/// if the user just created a new file and is saving it for the first time, do
	/// not call this function.  Instead, use something similar to this:
	/// |[<!-- language="C" -->
	/// if (document_is_new)
	/// {
	/// // the user just created a new document
	/// gtk_file_chooser_set_current_name (chooser, "Untitled document");
	/// }
	/// else
	/// {
	/// // the user edited an existing document
	/// gtk_file_chooser_set_uri (chooser, existing_uri);
	/// }
	/// ]|
	/// In the first case, the file chooser will present the user with useful suggestions
	/// as to where to save his new file.  In the second case, the file’s existing location
	/// is already known, so the file chooser will use it.
	/// - Parameters:
	///	- uri: String (const char*)
	/// - Returns: Bool (gboolean)
	open func setUri(_ uri: String) -> Bool {
		return gtk_file_chooser_set_uri(GTK_FILE_CHOOSER(self.GOBJECT), uri) != 0 ? true : false
	}

	/// Sets whether the file chooser should display a stock label with the name of
	/// the file that is being previewed; the default is %TRUE.  Applications that
	/// want to draw the whole preview area themselves should set this to %FALSE and
	/// display the name themselves in their preview widget.
	/// See also: gtk_file_chooser_set_preview_widget()
	/// - Parameters:
	///	- useLabel: Bool (gboolean)
	open func setUsePreviewLabel(useLabel: Bool) -> Swift.Void {
		gtk_file_chooser_set_use_preview_label(GTK_FILE_CHOOSER(self.GOBJECT), useLabel ? 1 : 0)
	}

	/// Unselects all the files in the current folder of a file chooser.
	open func unselectAll() -> Swift.Void {
		gtk_file_chooser_unselect_all(GTK_FILE_CHOOSER(self.GOBJECT))
	}

	/// Unselects the file referred to by @file. If the file is not in the current
	/// directory, does not exist, or is otherwise not currently selected, does nothing.
	/// - Parameters:
	///	- file: OpaquePointer! (GFile*)
	open func unselectFile(_ file: OpaquePointer!) -> Swift.Void {
		gtk_file_chooser_unselect_file(GTK_FILE_CHOOSER(self.GOBJECT), file)
	}

	/// Unselects a currently selected filename. If the filename
	/// is not in the current directory, does not exist, or
	/// is otherwise not currently selected, does nothing.
	/// - Parameters:
	///	- filename: String (const char*)
	open func unselectFilename(_ filename: String) -> Swift.Void {
		gtk_file_chooser_unselect_filename(GTK_FILE_CHOOSER(self.GOBJECT), filename)
	}

	/// Unselects the file referred to by @uri. If the file
	/// is not in the current directory, does not exist, or
	/// is otherwise not currently selected, does nothing.
	/// - Parameters:
	///	- uri: String (const char*)
	open func unselectUri(_ uri: String) -> Swift.Void {
		gtk_file_chooser_unselect_uri(GTK_FILE_CHOOSER(self.GOBJECT), uri)
	}

}
