/*
 * CGTKAccelLabel.swift
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

public let GTK_TYPE_ACCEL_LABEL: GType = gtk_accel_label_get_type()

@inline(__always) public func GTK_ACCEL_LABEL(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkAccelLabel>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_ACCEL_LABEL)
}

/// The #GtkAccelLabel widget is a subclass of #GtkLabel that also displays an
/// accelerator key on the right of the label text, e.g. “Ctrl+S”.
/// It is commonly used in menus to show the keyboard short-cuts for commands.
/// The accelerator key to display is typically not set explicitly (although it
/// can be, with gtk_accel_label_set_accel()). Instead, the #GtkAccelLabel displays
/// the accelerators which have been added to a particular widget. This widget is
/// set by calling gtk_accel_label_set_accel_widget().
/// For example, a #GtkMenuItem widget may have an accelerator added to emit
/// the “activate” signal when the “Ctrl+S” key combination is pressed.
/// A #GtkAccelLabel is created and added to the #GtkMenuItem, and
/// gtk_accel_label_set_accel_widget() is called with the #GtkMenuItem as the
/// second argument. The #GtkAccelLabel will now display “Ctrl+S” after its label.
/// Note that creating a #GtkMenuItem with gtk_menu_item_new_with_label() (or
/// one of the similar functions for #GtkCheckMenuItem and #GtkRadioMenuItem)
/// automatically adds a #GtkAccelLabel to the #GtkMenuItem and calls
/// gtk_accel_label_set_accel_widget() to set it up for you.
/// A #GtkAccelLabel will only display accelerators which have %GTK_ACCEL_VISIBLE
/// set (see #GtkAccelFlags).
/// A #GtkAccelLabel can display multiple accelerators and even signal names,
/// though it is almost always used to display just one accelerator key.
/// ## Creating a simple menu item with an accelerator key.
/// |[<!-- language="C" -->
/// GtkWidget *window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
/// GtkWidget *menu = gtk_menu_new ();
/// GtkWidget *save_item;
/// GtkAccelGroup *accel_group;
/// // Create a GtkAccelGroup and add it to the window.
/// accel_group = gtk_accel_group_new ();
/// gtk_window_add_accel_group (GTK_WINDOW (window), accel_group);
/// // Create the menu item using the convenience function.
/// save_item = gtk_menu_item_new_with_label ("Save");
/// gtk_widget_show (save_item);
/// gtk_container_add (GTK_CONTAINER (menu), save_item);
/// // Now add the accelerator to the GtkMenuItem. Note that since we
/// // called gtk_menu_item_new_with_label() to create the GtkMenuItem
/// // the GtkAccelLabel is automatically set up to display the
/// // GtkMenuItem accelerators. We just need to make sure we use
/// // GTK_ACCEL_VISIBLE here.
/// gtk_widget_add_accelerator (save_item, "activate", accel_group,
/// GDK_KEY_s, GDK_CONTROL_MASK, GTK_ACCEL_VISIBLE);
/// ]|
/// # CSS nodes
/// |[<!-- language="plain" -->
/// label
/// ╰── accelerator
/// ]|
/// Like #GtkLabel, GtkAccelLabel has a main CSS node with the name label.
/// It adds a subnode with name accelerator.


open class CGTKAccelLabel : CGTKLabel {
	/// Creates a new #GtkAccelLabel.
	/// - Parameters:
	///	- string: String (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(string: String) {
		self.init(withGObject: gtk_accel_label_new(string))!
	}

	open var ACCELLABEL: UnsafeMutablePointer<GtkAccelLabel>! {
		get {
			return GTK_ACCEL_LABEL(self.GOBJECT)
		}
	}

	/// Gets the keyval and modifier mask set with
	/// gtk_accel_label_set_accel().
	/// - Parameters:
	///	- acceleratorKey: UnsafeMutablePointer<UInt32>! (guint*)
	///	- acceleratorMods: UnsafeMutablePointer<GdkModifierType>! (GdkModifierType*)
	open func getAccel(acceleratorKey: UnsafeMutablePointer<UInt32>!, acceleratorMods: UnsafeMutablePointer<GdkModifierType>!) -> Swift.Void {
		gtk_accel_label_get_accel(GTK_ACCEL_LABEL(self.GOBJECT), acceleratorKey, acceleratorMods)
	}

	/// Fetches the widget monitored by this accelerator label. See
	/// gtk_accel_label_set_accel_widget().
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getAccelWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_accel_label_get_accel_widget(GTK_ACCEL_LABEL(self.GOBJECT)))
	}

	/// Returns the width needed to display the accelerator key(s).
	/// This is used by menus to align all of the #GtkMenuItem widgets, and shouldn't
	/// be needed by applications.
	/// - Returns: guint (guint)
	open func getAccelWidth() -> guint {
		return gtk_accel_label_get_accel_width(GTK_ACCEL_LABEL(self.GOBJECT))
	}

	/// Recreates the string representing the accelerator keys.
	/// This should not be needed since the string is automatically updated whenever
	/// accelerators are added or removed from the associated widget.
	/// - Returns: Bool (gboolean)
	open func refetch() -> Bool {
		return gtk_accel_label_refetch(GTK_ACCEL_LABEL(self.GOBJECT)) != 0 ? true : false
	}

	/// Manually sets a keyval and modifier mask as the accelerator rendered
	/// by @accel_label.
	/// If a keyval and modifier are explicitly set then these values are
	/// used regardless of any associated accel closure or widget.
	/// Providing an @accelerator_key of 0 removes the manual setting.
	/// - Parameters:
	///	- acceleratorKey: guint (guint)
	///	- acceleratorMods: GdkModifierType (GdkModifierType)
	open func setAccel(acceleratorKey: guint, acceleratorMods: GdkModifierType) -> Swift.Void {
		gtk_accel_label_set_accel(GTK_ACCEL_LABEL(self.GOBJECT), acceleratorKey, acceleratorMods)
	}

	/// Sets the closure to be monitored by this accelerator label. The closure
	/// must be connected to an accelerator group; see gtk_accel_group_connect().
	/// Passing %NULL for @accel_closure will dissociate @accel_label from its
	/// current closure, if any.
	/// - Parameters:
	///	- accelClosure: UnsafeMutablePointer<GClosure>? (GClosure*)
	open func setAccelClosure(_ accelClosure: UnsafeMutablePointer<GClosure>?) -> Swift.Void {
		gtk_accel_label_set_accel_closure(GTK_ACCEL_LABEL(self.GOBJECT), accelClosure)
	}

	/// Sets the widget to be monitored by this accelerator label. Passing %NULL for
	/// @accel_widget will dissociate @accel_label from its current widget, if any.
	/// - Parameters:
	///	- accelWidget: CGTKWidget (GtkWidget*)
	open func setAccelWidget(_ accelWidget: CGTKWidget) -> Swift.Void {
		gtk_accel_label_set_accel_widget(GTK_ACCEL_LABEL(self.GOBJECT), accelWidget.WIDGET)
	}

}
