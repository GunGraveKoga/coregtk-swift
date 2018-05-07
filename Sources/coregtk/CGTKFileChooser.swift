/*
 * CGTKFileChooser.swift
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

public let GTK_TYPE_FILE_CHOOSER: GType = gtk_file_chooser_get_type()

@inline(__always) public func GTK_FILE_CHOOSER(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_FILE_CHOOSER)
}

/// #GtkFileChooser is an interface that can be implemented by file
/// selection widgets.  In GTK+, the main objects that implement this
/// interface are #GtkFileChooserWidget, #GtkFileChooserDialog, and
/// #GtkFileChooserButton.  You do not need to write an object that
/// implements the #GtkFileChooser interface unless you are trying to
/// adapt an existing file selector to expose a standard programming
/// interface.
/// #GtkFileChooser allows for shortcuts to various places in the filesystem.
/// In the default implementation these are displayed in the left pane. It
/// may be a bit confusing at first that these shortcuts come from various
/// sources and in various flavours, so lets explain the terminology here:
/// - Bookmarks: are created by the user, by dragging folders from the
/// right pane to the left pane, or by using the “Add”. Bookmarks
/// can be renamed and deleted by the user.
/// - Shortcuts: can be provided by the application. For example, a Paint
/// program may want to add a shortcut for a Clipart folder. Shortcuts
/// cannot be modified by the user.
/// - Volumes: are provided by the underlying filesystem abstraction. They are
/// the “roots” of the filesystem.
/// # File Names and Encodings
/// When the user is finished selecting files in a
/// #GtkFileChooser, your program can get the selected names
/// either as filenames or as URIs.  For URIs, the normal escaping
/// rules are applied if the URI contains non-ASCII characters.
/// However, filenames are always returned in
/// the character set specified by the
/// `G_FILENAME_ENCODING` environment variable.
/// Please see the GLib documentation for more details about this
/// variable.
/// This means that while you can pass the result of
/// gtk_file_chooser_get_filename() to open() or fopen(),
/// you may not be able to directly set it as the text of a
/// #GtkLabel widget unless you convert it first to UTF-8,
/// which all GTK+ widgets expect. You should use g_filename_to_utf8()
/// to convert filenames into strings that can be passed to GTK+
/// widgets.
/// # Adding a Preview Widget
/// You can add a custom preview widget to a file chooser and then
/// get notification about when the preview needs to be updated.
/// To install a preview widget, use
/// gtk_file_chooser_set_preview_widget().  Then, connect to the
/// #GtkFileChooser::update-preview signal to get notified when
/// you need to update the contents of the preview.
/// Your callback should use
/// gtk_file_chooser_get_preview_filename() to see what needs
/// previewing.  Once you have generated the preview for the
/// corresponding file, you must call
/// gtk_file_chooser_set_preview_widget_active() with a boolean
/// flag that indicates whether your callback could successfully
/// generate a preview.
/// ## Example: Using a Preview Widget ## {#gtkfilechooser-preview}
/// |[<!-- language="C" -->
/// {
/// GtkImage *preview;
/// ...
/// preview = gtk_image_new ();
/// gtk_file_chooser_set_preview_widget (my_file_chooser, preview);
/// g_signal_connect (my_file_chooser, "update-preview",
/// G_CALLBACK (update_preview_cb), preview);
/// }
/// static void
/// update_preview_cb (GtkFileChooser *file_chooser, gpointer data)
/// {
/// GtkWidget *preview;
/// char *filename;
/// GdkPixbuf *pixbuf;
/// gboolean have_preview;
/// preview = GTK_WIDGET (data);
/// filename = gtk_file_chooser_get_preview_filename (file_chooser);
/// pixbuf = gdk_pixbuf_new_from_file_at_size (filename, 128, 128, NULL);
/// have_preview = (pixbuf != NULL);
/// g_free (filename);
/// gtk_image_set_from_pixbuf (GTK_IMAGE (preview), pixbuf);
/// if (pixbuf)
/// g_object_unref (pixbuf);
/// gtk_file_chooser_set_preview_widget_active (file_chooser, have_preview);
/// }
/// ]|
/// # Adding Extra Widgets
/// You can add extra widgets to a file chooser to provide options
/// that are not present in the default design.  For example, you
/// can add a toggle button to give the user the option to open a
/// file in read-only mode.  You can use
/// gtk_file_chooser_set_extra_widget() to insert additional
/// widgets in a file chooser.
/// An example for adding extra widgets:
/// |[<!-- language="C" -->
/// GtkWidget *toggle;
/// ...
/// toggle = gtk_check_button_new_with_label ("Open file read-only");
/// gtk_widget_show (toggle);
/// gtk_file_chooser_set_extra_widget (my_file_chooser, toggle);
/// }
/// ]|
/// If you want to set more than one extra widget in the file
/// chooser, you can a container such as a #GtkBox or a #GtkGrid
/// and include your widgets in it.  Then, set the container as
/// the whole extra widget.


public protocol CGTKFileChooser: class {
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
	func addChoice(id: String, label: String, options: UnsafeMutablePointer<UnsafePointer<CChar>?>!, optionLabels: UnsafeMutablePointer<UnsafePointer<CChar>?>!) -> Swift.Void

	/// Adds @filter to the list of filters that the user can select between.
	/// When a filter is selected, only files that are passed by that
	/// filter are displayed.
	/// Note that the @chooser takes ownership of the filter, so you have to
	/// ref and sink it if you want to keep a reference.
	/// - Parameters:
	///	- filter: OpaquePointer! (GtkFileFilter*)
	func addFilter(_ filter: OpaquePointer!) -> Swift.Void

	/// Adds a folder to be displayed with the shortcut folders in a file chooser.
	/// Note that shortcut folders do not get saved, as they are provided by the
	/// application.  For example, you can use this to add a
	/// “/usr/share/mydrawprogram/Clipart” folder to the volume list.
	/// - Parameters:
	///	- folder: String (const char*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? (GError**)
	/// - Returns: Bool (gboolean)
	func addShortcutFolder(_ folder: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>?) -> Bool

	/// Adds a folder URI to be displayed with the shortcut folders in a file
	/// chooser.  Note that shortcut folders do not get saved, as they are provided
	/// by the application.  For example, you can use this to add a
	/// “file:///usr/share/mydrawprogram/Clipart” folder to the volume list.
	/// - Parameters:
	///	- uri: String (const char*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? (GError**)
	/// - Returns: Bool (gboolean)
	func addShortcutFolderUri(_ uri: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>?) -> Bool

	/// Gets the type of operation that the file chooser is performing; see
	/// gtk_file_chooser_set_action().
	/// - Returns: GtkFileChooserAction (GtkFileChooserAction)
	func getAction() -> GtkFileChooserAction

	/// Gets the currently selected option in the 'choice' with the given ID.
	/// - Parameters:
	///	- id: String (const char*)
	/// - Returns: String? (const char*)
	func getChoice(id: String) -> String?

	/// Gets whether file choser will offer to create new folders.
	/// See gtk_file_chooser_set_create_folders().
	/// - Returns: Bool (gboolean)
	func getCreateFolders() -> Bool

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
	func getCurrentFolder() -> String?

	/// Gets the current folder of @chooser as #GFile.
	/// See gtk_file_chooser_get_current_folder_uri().
	/// - Returns: OpaquePointer (GFile*)
	func getCurrentFolderFile() -> OpaquePointer

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
	func getCurrentFolderUri() -> String?

	/// Gets the current name in the file selector, as entered by the user in the
	/// text entry for “Name”.
	/// This is meant to be used in save dialogs, to get the currently typed filename
	/// when the file itself does not exist yet.  For example, an application that
	/// adds a custom extra widget to the file chooser for “file format” may want to
	/// change the extension of the typed filename based on the chosen format, say,
	/// from “.jpg” to “.png”.
	/// - Returns: String? (gchar*)
	func getCurrentName() -> String?

	/// Queries whether a file chooser is set to confirm for overwriting when the user
	/// types a file name that already exists.
	/// - Returns: Bool (gboolean)
	func getDoOverwriteConfirmation() -> Bool

	/// Gets the current extra widget; see
	/// gtk_file_chooser_set_extra_widget().
	/// - Returns: CGTKWidget? (GtkWidget*)
	func getExtraWidget<T>() -> T? where T: CGTKWidget

	/// Gets the #GFile for the currently selected file in
	/// the file selector. If multiple files are selected,
	/// one of the files will be returned at random.
	/// If the file chooser is in folder mode, this function returns the selected
	/// folder.
	/// - Returns: OpaquePointer (GFile*)
	func getFile() -> OpaquePointer

	/// Gets the filename for the currently selected file in
	/// the file selector. The filename is returned as an absolute path. If
	/// multiple files are selected, one of the filenames will be returned at
	/// random.
	/// If the file chooser is in folder mode, this function returns the selected
	/// folder.
	/// - Returns: String? (gchar*)
	func getFilename() -> String?

	/// Lists all the selected files and subfolders in the current folder of
	/// @chooser. The returned names are full absolute paths. If files in the current
	/// folder cannot be represented as local filenames they will be ignored. (See
	/// gtk_file_chooser_get_uris())
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	func getFilenames() -> UnsafeMutablePointer<GSList>!

	/// Lists all the selected files and subfolders in the current folder of @chooser
	/// as #GFile. An internal function, see gtk_file_chooser_get_uris().
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	func getFiles() -> UnsafeMutablePointer<GSList>!

	/// Gets the current filter; see gtk_file_chooser_set_filter().
	/// - Returns: OpaquePointer? (GtkFileFilter*)
	func getFilter() -> OpaquePointer?

	/// Gets whether only local files can be selected in the
	/// file selector. See gtk_file_chooser_set_local_only()
	/// - Returns: Bool (gboolean)
	func getLocalOnly() -> Bool

	/// Gets the #GFile that should be previewed in a custom preview
	/// Internal function, see gtk_file_chooser_get_preview_uri().
	/// - Returns: OpaquePointer? (GFile*)
	func getPreviewFile() -> OpaquePointer?

	/// Gets the filename that should be previewed in a custom preview
	/// widget. See gtk_file_chooser_set_preview_widget().
	/// - Returns: String? (char*)
	func getPreviewFilename() -> String?

	/// Gets the URI that should be previewed in a custom preview
	/// widget. See gtk_file_chooser_set_preview_widget().
	/// - Returns: String? (char*)
	func getPreviewUri() -> String?

	/// Gets the current preview widget; see
	/// gtk_file_chooser_set_preview_widget().
	/// - Returns: CGTKWidget? (GtkWidget*)
	func getPreviewWidget<T>() -> T? where T: CGTKWidget

	/// Gets whether the preview widget set by gtk_file_chooser_set_preview_widget()
	/// should be shown for the current filename. See
	/// gtk_file_chooser_set_preview_widget_active().
	/// - Returns: Bool (gboolean)
	func getPreviewWidgetActive() -> Bool

	/// Gets whether multiple files can be selected in the file
	/// selector. See gtk_file_chooser_set_select_multiple().
	/// - Returns: Bool (gboolean)
	func getSelectMultiple() -> Bool

	/// Gets whether hidden files and folders are displayed in the file selector.
	/// See gtk_file_chooser_set_show_hidden().
	/// - Returns: Bool (gboolean)
	func getShowHidden() -> Bool

	/// Gets the URI for the currently selected file in
	/// the file selector. If multiple files are selected,
	/// one of the filenames will be returned at random.
	/// If the file chooser is in folder mode, this function returns the selected
	/// folder.
	/// - Returns: String? (gchar*)
	func getUri() -> String?

	/// Lists all the selected files and subfolders in the current folder of
	/// @chooser. The returned names are full absolute URIs.
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	func getUris() -> UnsafeMutablePointer<GSList>!

	/// Gets whether a stock label should be drawn with the name of the previewed
	/// file.  See gtk_file_chooser_set_use_preview_label().
	/// - Returns: Bool (gboolean)
	func getUsePreviewLabel() -> Bool

	/// Lists the current set of user-selectable filters; see
	/// gtk_file_chooser_add_filter(), gtk_file_chooser_remove_filter().
	/// - Returns: UnsafeMutablePointer<GSList>! (GSList*)
	func listFilters() -> UnsafeMutablePointer<GSList>!

	/// Queries the list of shortcut folders in the file chooser, as set by
	/// gtk_file_chooser_add_shortcut_folder_uri().
	/// - Returns: UnsafeMutablePointer<GSList>? (GSList*)
	func listShortcutFolderUris() -> UnsafeMutablePointer<GSList>?

	/// Queries the list of shortcut folders in the file chooser, as set by
	/// gtk_file_chooser_add_shortcut_folder().
	/// - Returns: UnsafeMutablePointer<GSList>? (GSList*)
	func listShortcutFolders() -> UnsafeMutablePointer<GSList>?

	/// Removes a 'choice' that has been added with gtk_file_chooser_add_choice().
	/// - Parameters:
	///	- id: String (const char*)
	func removeChoice(id: String) -> Swift.Void

	/// Removes @filter from the list of filters that the user can select between.
	/// - Parameters:
	///	- filter: OpaquePointer! (GtkFileFilter*)
	func removeFilter(_ filter: OpaquePointer!) -> Swift.Void

	/// Removes a folder from a file chooser’s list of shortcut folders.
	/// - Parameters:
	///	- folder: String (const char*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? (GError**)
	/// - Returns: Bool (gboolean)
	func removeShortcutFolder(_ folder: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>?) -> Bool

	/// Removes a folder URI from a file chooser’s list of shortcut folders.
	/// - Parameters:
	///	- uri: String (const char*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? (GError**)
	/// - Returns: Bool (gboolean)
	func removeShortcutFolderUri(_ uri: String, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>?) -> Bool

	/// Selects all the files in the current folder of a file chooser.
	func selectAll() -> Swift.Void

	/// Selects the file referred to by @file. An internal function. See
	/// _gtk_file_chooser_select_uri().
	/// - Parameters:
	///	- file: OpaquePointer! (GFile*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? (GError**)
	/// - Returns: Bool (gboolean)
	func selectFile(_ file: OpaquePointer!, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>?) -> Bool

	/// Selects a filename. If the file name isn’t in the current
	/// folder of @chooser, then the current folder of @chooser will
	/// be changed to the folder containing @filename.
	/// - Parameters:
	///	- filename: String (const char*)
	/// - Returns: Bool (gboolean)
	func selectFilename(_ filename: String) -> Bool

	/// Selects the file to by @uri. If the URI doesn’t refer to a
	/// file in the current folder of @chooser, then the current folder of
	/// @chooser will be changed to the folder containing @filename.
	/// - Parameters:
	///	- uri: String (const char*)
	/// - Returns: Bool (gboolean)
	func selectUri(_ uri: String) -> Bool

	/// Sets the type of operation that the chooser is performing; the
	/// user interface is adapted to suit the selected action. For example,
	/// an option to create a new folder might be shown if the action is
	/// %GTK_FILE_CHOOSER_ACTION_SAVE but not if the action is
	/// %GTK_FILE_CHOOSER_ACTION_OPEN.
	/// - Parameters:
	///	- action: GtkFileChooserAction (GtkFileChooserAction)
	func setAction(_ action: GtkFileChooserAction) -> Swift.Void

	/// Selects an option in a 'choice' that has been added with
	/// gtk_file_chooser_add_choice(). For a boolean choice, the
	/// possible options are "true" and "false".
	/// - Parameters:
	///	- id: String (const char*)
	///	- option: String (const char*)
	func setChoice(id: String, option: String) -> Swift.Void

	/// Sets whether file choser will offer to create new folders.
	/// This is only relevant if the action is not set to be
	/// %GTK_FILE_CHOOSER_ACTION_OPEN.
	/// - Parameters:
	///	- createFolders: Bool (gboolean)
	func setCreateFolders(_ createFolders: Bool) -> Swift.Void

	/// Sets the current folder for @chooser from a local filename.
	/// The user will be shown the full contents of the current folder,
	/// plus user interface elements for navigating to other folders.
	/// In general, you should not use this function.  See the
	/// [section on setting up a file chooser dialog][gtkfilechooserdialog-setting-up]
	/// for the rationale behind this.
	/// - Parameters:
	///	- filename: String (const gchar*)
	/// - Returns: Bool (gboolean)
	func setCurrentFolder(filename: String) -> Bool

	/// Sets the current folder for @chooser from a #GFile.
	/// Internal function, see gtk_file_chooser_set_current_folder_uri().
	/// - Parameters:
	///	- file: OpaquePointer! (GFile*)
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? (GError**)
	/// - Returns: Bool (gboolean)
	func setCurrentFolderFile(_ file: OpaquePointer!, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>?) -> Bool

	/// Sets the current folder for @chooser from an URI.
	/// The user will be shown the full contents of the current folder,
	/// plus user interface elements for navigating to other folders.
	/// In general, you should not use this function.  See the
	/// [section on setting up a file chooser dialog][gtkfilechooserdialog-setting-up]
	/// for the rationale behind this.
	/// - Parameters:
	///	- uri: String (const gchar*)
	/// - Returns: Bool (gboolean)
	func setCurrentFolderUri(_ uri: String) -> Bool

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
	func setCurrentName(_ name: String) -> Swift.Void

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
	func setDoOverwriteConfirmation(_ doOverwriteConfirmation: Bool) -> Swift.Void

	/// Sets an application-supplied widget to provide extra options to the user.
	/// - Parameters:
	///	- extraWidget: CGTKWidget (GtkWidget*)
	func setExtraWidget(_ extraWidget: CGTKWidget) -> Swift.Void

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
	///	- err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>? (GError**)
	/// - Returns: Bool (gboolean)
	func setFile(_ file: OpaquePointer!, err: UnsafeMutablePointer<UnsafeMutablePointer<GError>?>?) -> Bool

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
	func setFilename(_ filename: String) -> Bool

	/// Sets the current filter; only the files that pass the
	/// filter will be displayed. If the user-selectable list of filters
	/// is non-empty, then the filter should be one of the filters
	/// in that list. Setting the current filter when the list of
	/// filters is empty is useful if you want to restrict the displayed
	/// set of files without letting the user change it.
	/// - Parameters:
	///	- filter: OpaquePointer! (GtkFileFilter*)
	func setFilter(_ filter: OpaquePointer!) -> Swift.Void

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
	func setLocalOnly(_ localOnly: Bool) -> Swift.Void

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
	func setPreviewWidget(_ previewWidget: CGTKWidget) -> Swift.Void

	/// Sets whether the preview widget set by
	/// gtk_file_chooser_set_preview_widget() should be shown for the
	/// current filename. When @active is set to false, the file chooser
	/// may display an internally generated preview of the current file
	/// or it may display no preview at all. See
	/// gtk_file_chooser_set_preview_widget() for more details.
	/// - Parameters:
	///	- active: Bool (gboolean)
	func setPreviewWidgetActive(_ active: Bool) -> Swift.Void

	/// Sets whether multiple files can be selected in the file selector.  This is
	/// only relevant if the action is set to be %GTK_FILE_CHOOSER_ACTION_OPEN or
	/// %GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER.
	/// - Parameters:
	///	- selectMultiple: Bool (gboolean)
	func setSelectMultiple(_ selectMultiple: Bool) -> Swift.Void

	/// Sets whether hidden files and folders are displayed in the file selector.
	/// - Parameters:
	///	- showHidden: Bool (gboolean)
	func setShowHidden(_ showHidden: Bool) -> Swift.Void

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
	func setUri(_ uri: String) -> Bool

	/// Sets whether the file chooser should display a stock label with the name of
	/// the file that is being previewed; the default is %TRUE.  Applications that
	/// want to draw the whole preview area themselves should set this to %FALSE and
	/// display the name themselves in their preview widget.
	/// See also: gtk_file_chooser_set_preview_widget()
	/// - Parameters:
	///	- useLabel: Bool (gboolean)
	func setUsePreviewLabel(useLabel: Bool) -> Swift.Void

	/// Unselects all the files in the current folder of a file chooser.
	func unselectAll() -> Swift.Void

	/// Unselects the file referred to by @file. If the file is not in the current
	/// directory, does not exist, or is otherwise not currently selected, does nothing.
	/// - Parameters:
	///	- file: OpaquePointer! (GFile*)
	func unselectFile(_ file: OpaquePointer!) -> Swift.Void

	/// Unselects a currently selected filename. If the filename
	/// is not in the current directory, does not exist, or
	/// is otherwise not currently selected, does nothing.
	/// - Parameters:
	///	- filename: String (const char*)
	func unselectFilename(_ filename: String) -> Swift.Void

	/// Unselects the file referred to by @uri. If the file
	/// is not in the current directory, does not exist, or
	/// is otherwise not currently selected, does nothing.
	/// - Parameters:
	///	- uri: String (const char*)
	func unselectUri(_ uri: String) -> Swift.Void

}
