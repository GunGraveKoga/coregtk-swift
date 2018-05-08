/*
 * CGTKBuildable.swift
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

public let GTK_TYPE_BUILDABLE: GType = gtk_buildable_get_type()

@inline(__always) public func GTK_BUILDABLE(_ ptr: UnsafeMutableRawPointer!) -> OpaquePointer! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_BUILDABLE)
}

/// GtkBuildable allows objects to extend and customize their deserialization
/// from [GtkBuilder UI descriptions][BUILDER-UI].
/// The interface includes methods for setting names and properties of objects,
/// parsing custom tags and constructing child objects.
/// The GtkBuildable interface is implemented by all widgets and
/// many of the non-widget objects that are provided by GTK+. The
/// main user of this interface is #GtkBuilder. There should be
/// very little need for applications to call any of these functions directly.
/// An object only needs to implement this interface if it needs to extend the
/// #GtkBuilder format or run any extra routines at deserialization time.


public protocol CGTKBuildable: class {
	/// Adds a child to @buildable. @type is an optional string
	/// describing how the child should be added.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- child: UnsafeMutablePointer<GObject>! (GObject*)
	///	- type: String? (const gchar*)
	func addChild(builder: UnsafeMutablePointer<GtkBuilder>!, child: UnsafeMutablePointer<GObject>!, type: String?) -> Swift.Void

	/// Constructs a child of @buildable with the name @name.
	/// #GtkBuilder calls this function if a “constructor” has been
	/// specified in the UI definition.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- name: String (const gchar*)
	/// - Returns: UnsafeMutablePointer<GObject>! (GObject*)
	func constructChild(builder: UnsafeMutablePointer<GtkBuilder>!, name: String) -> UnsafeMutablePointer<GObject>!

	/// This is similar to gtk_buildable_parser_finished() but is
	/// called once for each custom tag handled by the @buildable.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- child: UnsafeMutablePointer<GObject>? (GObject*)
	///	- tagname: String (const gchar*)
	///	- data: gpointer? (gpointer)
	func customFinished(builder: UnsafeMutablePointer<GtkBuilder>!, child: UnsafeMutablePointer<GObject>?, tagname: String, data: gpointer?) -> Swift.Void

	/// This is called at the end of each custom element handled by
	/// the buildable.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- child: UnsafeMutablePointer<GObject>? (GObject*)
	///	- tagname: String (const gchar*)
	///	- data: UnsafeMutablePointer<gpointer?>! (gpointer*)
	func customTagEnd(builder: UnsafeMutablePointer<GtkBuilder>!, child: UnsafeMutablePointer<GObject>?, tagname: String, data: UnsafeMutablePointer<gpointer?>!) -> Swift.Void

	/// This is called for each unknown element under <child>.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- child: UnsafeMutablePointer<GObject>? (GObject*)
	///	- tagname: String (const gchar*)
	///	- parser: UnsafeMutablePointer<GMarkupParser>! (GMarkupParser*)
	///	- data: UnsafeMutablePointer<gpointer?>! (gpointer*)
	/// - Returns: Bool (gboolean)
	func customTagStart(builder: UnsafeMutablePointer<GtkBuilder>!, child: UnsafeMutablePointer<GObject>?, tagname: String, parser: UnsafeMutablePointer<GMarkupParser>!, data: UnsafeMutablePointer<gpointer?>!) -> Bool

	/// Get the internal child called @childname of the @buildable object.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- childname: String (const gchar*)
	/// - Returns: UnsafeMutablePointer<GObject>! (GObject*)
	func getInternalChild(builder: UnsafeMutablePointer<GtkBuilder>!, childname: String) -> UnsafeMutablePointer<GObject>!

	/// Gets the name of the @buildable object.
	/// #GtkBuilder sets the name based on the
	/// [GtkBuilder UI definition][BUILDER-UI]
	/// used to construct the @buildable.
	/// - Returns: String? (const gchar*)
	func getName() -> String?

	/// Called when the builder finishes the parsing of a
	/// [GtkBuilder UI definition][BUILDER-UI].
	/// Note that this will be called once for each time
	/// gtk_builder_add_from_file() or gtk_builder_add_from_string()
	/// is called on a builder.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	func parserFinished(builder: UnsafeMutablePointer<GtkBuilder>!) -> Swift.Void

	/// Sets the property name @name to @value on the @buildable object.
	/// - Parameters:
	///	- builder: UnsafeMutablePointer<GtkBuilder>! (GtkBuilder*)
	///	- name: String (const gchar*)
	///	- value: UnsafePointer<GValue>! (const GValue*)
	func setBuildableProperty(builder: UnsafeMutablePointer<GtkBuilder>!, name: String, value: UnsafePointer<GValue>!) -> Swift.Void

	/// Sets the name of the @buildable object.
	/// - Parameters:
	///	- name: String (const gchar*)
	func setName(_ name: String) -> Swift.Void

}
