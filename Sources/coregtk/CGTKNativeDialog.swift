/*
 * CGTKNativeDialog.swift
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

public let GTK_TYPE_NATIVE_DIALOG: GType = gtk_native_dialog_get_type()

@inline(__always) public func GTK_NATIVE_DIALOG(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkNativeDialog>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_NATIVE_DIALOG)
}

/// Native dialogs are platform dialogs that don't use #GtkDialog or
/// #GtkWindow. They are used in order to integrate better with a
/// platform, by looking the same as other native applications and
/// supporting platform specific features.
/// The #GtkDialog functions cannot be used on such objects, but we
/// need a similar API in order to drive them. The #GtkNativeDialog
/// object is an API that allows you to do this. It allows you to set
/// various common properties on the dialog, as well as show and hide
/// it and get a #GtkNativeDialog::response signal when the user finished
/// with the dialog.
/// There is also a gtk_native_dialog_run() helper that makes it easy
/// to run any native dialog in a modal way with a recursive mainloop,
/// similar to gtk_dialog_run().


open class CGTKNativeDialog : CGTKBase {
	open var NATIVEDIALOG: UnsafeMutablePointer<GtkNativeDialog>! {
		get {
			return GTK_NATIVE_DIALOG(self.GOBJECT)
		}
	}

	/// Destroys a dialog.
	/// When a dialog is destroyed, it will break any references it holds
	/// to other objects. If it is visible it will be hidden and any underlying
	/// window system resources will be destroyed.
	/// Note that this does not release any reference to the object (as opposed to
	/// destroying a GtkWindow) because there is no reference from the windowing
	/// system to the #GtkNativeDialog.
	open func destroy() -> Swift.Void {
		gtk_native_dialog_destroy(GTK_NATIVE_DIALOG(self.GOBJECT))
	}

	/// Returns whether the dialog is modal. See gtk_native_dialog_set_modal().
	/// - Returns: Bool (gboolean)
	open func getModal() -> Bool {
		return gtk_native_dialog_get_modal(GTK_NATIVE_DIALOG(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the title of the #GtkNativeDialog.
	/// - Returns: String? (const char*)
	open func getTitle() -> String? {
		return String(utf8String: gtk_native_dialog_get_title(GTK_NATIVE_DIALOG(self.GOBJECT)))
	}

	/// Fetches the transient parent for this window. See
	/// gtk_native_dialog_set_transient_for().
	/// - Returns: CGTKWindow? (GtkWindow*)
	open func getTransientFor<T>() -> T? where T: CGTKWindow {
		return T.init(withGObject: gtk_native_dialog_get_transient_for(GTK_NATIVE_DIALOG(self.GOBJECT)))
	}

	/// Determines whether the dialog is visible.
	/// - Returns: Bool (gboolean)
	open func getVisible() -> Bool {
		return gtk_native_dialog_get_visible(GTK_NATIVE_DIALOG(self.GOBJECT)) != 0 ? true : false
	}

	/// Hides the dialog if it is visilbe, aborting any interaction. Once this
	/// is called the  #GtkNativeDialog::response signal will not be emitted
	/// until after the next call to gtk_native_dialog_show().
	/// If the dialog is not visible this does nothing.
	open func hide() -> Swift.Void {
		gtk_native_dialog_hide(GTK_NATIVE_DIALOG(self.GOBJECT))
	}

	/// Blocks in a recursive main loop until @self emits the
	/// #GtkNativeDialog::response signal. It then returns the response ID
	/// from the ::response signal emission.
	/// Before entering the recursive main loop, gtk_native_dialog_run()
	/// calls gtk_native_dialog_show() on the dialog for you.
	/// After gtk_native_dialog_run() returns, then dialog will be hidden.
	/// Typical usage of this function might be:
	/// |[<!-- language="C" -->
	/// gint result = gtk_native_dialog_run (GTK_NATIVE_DIALOG (dialog));
	/// switch (result)
	/// {
	/// case GTK_RESPONSE_ACCEPT:
	/// do_application_specific_something ();
	/// break;
	/// default:
	/// do_nothing_since_dialog_was_cancelled ();
	/// break;
	/// }
	/// g_object_unref (dialog);
	/// ]|
	/// Note that even though the recursive main loop gives the effect of a
	/// modal dialog (it prevents the user from interacting with other
	/// windows in the same window group while the dialog is run), callbacks
	/// such as timeouts, IO channel watches, DND drops, etc, will
	/// be triggered during a gtk_nautilus_dialog_run() call.
	/// - Returns: gint (gint)
	open func run() -> gint {
		return gtk_native_dialog_run(GTK_NATIVE_DIALOG(self.GOBJECT))
	}

	/// Sets a dialog modal or non-modal. Modal dialogs prevent interaction
	/// with other windows in the same application. To keep modal dialogs
	/// on top of main application windows, use
	/// gtk_native_dialog_set_transient_for() to make the dialog transient for the
	/// parent; most [window managers][gtk-X11-arch]
	/// will then disallow lowering the dialog below the parent.
	/// - Parameters:
	///	- modal: Bool (gboolean)
	open func setModal(_ modal: Bool) -> Swift.Void {
		gtk_native_dialog_set_modal(GTK_NATIVE_DIALOG(self.GOBJECT), modal ? 1 : 0)
	}

	/// Sets the title of the #GtkNativeDialog.
	/// - Parameters:
	///	- title: String (const char*)
	open func setTitle(_ title: String) -> Swift.Void {
		gtk_native_dialog_set_title(GTK_NATIVE_DIALOG(self.GOBJECT), title)
	}

	/// Dialog windows should be set transient for the main application
	/// window they were spawned from. This allows
	/// [window managers][gtk-X11-arch] to e.g. keep the
	/// dialog on top of the main window, or center the dialog over the
	/// main window.
	/// Passing %NULL for @parent unsets the current transient window.
	/// - Parameters:
	///	- parent: CGTKWindow? (GtkWindow*)
	open func setTransientFor(parent: CGTKWindow?) -> Swift.Void {
		gtk_native_dialog_set_transient_for(GTK_NATIVE_DIALOG(self.GOBJECT), parent?.WINDOW)
	}

	/// Shows the dialog on the display, allowing the user to interact with
	/// it. When the user accepts the state of the dialog the dialog will
	/// be automatically hidden and the #GtkNativeDialog::response signal
	/// will be emitted.
	/// Multiple calls while the dialog is visible will be ignored.
	open func show() -> Swift.Void {
		gtk_native_dialog_show(GTK_NATIVE_DIALOG(self.GOBJECT))
	}

}
