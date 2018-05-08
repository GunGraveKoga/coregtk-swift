/*
 * CGTKExpander.swift
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

public let GTK_TYPE_EXPANDER: GType = gtk_expander_get_type()

@inline(__always) public func GTK_EXPANDER(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkExpander>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_EXPANDER)
}

/// A #GtkExpander allows the user to hide or show its child by clicking
/// on an expander triangle similar to the triangles used in a #GtkTreeView.
/// Normally you use an expander as you would use any other descendant
/// of #GtkBin; you create the child widget and use gtk_container_add()
/// to add it to the expander. When the expander is toggled, it will take
/// care of showing and hiding the child automatically.
/// # Special Usage
/// There are situations in which you may prefer to show and hide the
/// expanded widget yourself, such as when you want to actually create
/// the widget at expansion time. In this case, create a #GtkExpander
/// but do not add a child to it. The expander widget has an
/// #GtkExpander:expanded property which can be used to monitor
/// its expansion state. You should watch this property with a signal
/// connection as follows:
/// |[<!-- language="C" -->
/// static void
/// expander_callback (GObject    *object,
/// GParamSpec *param_spec,
/// gpointer    user_data)
/// {
/// GtkExpander *expander;
/// expander = GTK_EXPANDER (object);
/// if (gtk_expander_get_expanded (expander))
/// {
/// // Show or create widgets
/// }
/// else
/// {
/// // Hide or destroy widgets
/// }
/// }
/// static void
/// create_expander (void)
/// {
/// GtkWidget *expander = gtk_expander_new_with_mnemonic ("_More Options");
/// g_signal_connect (expander, "notify::expanded",
/// G_CALLBACK (expander_callback), NULL);
/// // ...
/// }
/// ]|
/// # GtkExpander as GtkBuildable
/// The GtkExpander implementation of the GtkBuildable interface supports
/// placing a child in the label position by specifying “label” as the
/// “type” attribute of a <child> element. A normal content child can be
/// specified without specifying a <child> type attribute.
/// An example of a UI definition fragment with GtkExpander:
/// |[
/// <object class="GtkExpander">
/// <child type="label">
/// <object class="GtkLabel" id="expander-label"/>
/// </child>
/// <child>
/// <object class="GtkEntry" id="expander-content"/>
/// </child>
/// </object>
/// ]|
/// # CSS nodes
/// |[<!-- language="plain" -->
/// expander
/// ├── title
/// │   ├── arrow
/// │   ╰── <label widget>
/// ╰── <child>
/// ]|
/// GtkExpander has three CSS nodes, the main node with the name expander,
/// a subnode with name title and node below it with name arrow. The arrow of an
/// expander that is showing its child gets the :checked pseudoclass added to it.


open class CGTKExpander : CGTKBin {
	/// Creates a new expander using @label as the text of the label.
	/// - Parameters:
	///	- label: String? (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(label: String?) {
		self.init(withGObject: gtk_expander_new(label))!
	}

	/// Creates a new expander using @label as the text of the label.
	/// If characters in @label are preceded by an underscore, they are underlined.
	/// If you need a literal underscore character in a label, use “__” (two
	/// underscores). The first underlined character represents a keyboard
	/// accelerator called a mnemonic.
	/// Pressing Alt and that key activates the button.
	/// - Parameters:
	///	- label: String? (const gchar*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(withMnemonic label: String?) {
		self.init(withGObject: gtk_expander_new_with_mnemonic(label))!
	}

	open var EXPANDER: UnsafeMutablePointer<GtkExpander>! {
		get {
			return GTK_EXPANDER(self.GOBJECT)
		}
	}

	/// Queries a #GtkExpander and returns its current state. Returns %TRUE
	/// if the child widget is revealed.
	/// See gtk_expander_set_expanded().
	/// - Returns: Bool (gboolean)
	open func getExpanded() -> Bool {
		return gtk_expander_get_expanded(GTK_EXPANDER(self.GOBJECT)) != 0 ? true : false
	}

	/// Fetches the text from a label widget including any embedded
	/// underlines indicating mnemonics and Pango markup, as set by
	/// gtk_expander_set_label(). If the label text has not been set the
	/// return value will be %NULL. This will be the case if you create an
	/// empty button with gtk_button_new() to use as a container.
	/// Note that this function behaved differently in versions prior to
	/// 2.14 and used to return the label text stripped of embedded
	/// underlines indicating mnemonics and Pango markup. This problem can
	/// be avoided by fetching the label text directly from the label
	/// widget.
	/// - Returns: String? (const gchar*)
	open func getLabel() -> String? {
		return String(utf8String: gtk_expander_get_label(GTK_EXPANDER(self.GOBJECT)))
	}

	/// Returns whether the label widget will fill all available
	/// horizontal space allocated to @expander.
	/// - Returns: Bool (gboolean)
	open func getLabelFill() -> Bool {
		return gtk_expander_get_label_fill(GTK_EXPANDER(self.GOBJECT)) != 0 ? true : false
	}

	/// Retrieves the label widget for the frame. See
	/// gtk_expander_set_label_widget().
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getLabelWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_expander_get_label_widget(GTK_EXPANDER(self.GOBJECT)))
	}

	/// Returns whether the expander will resize the toplevel widget
	/// containing the expander upon resizing and collpasing.
	/// - Returns: Bool (gboolean)
	open func getResizeToplevel() -> Bool {
		return gtk_expander_get_resize_toplevel(GTK_EXPANDER(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the value set by gtk_expander_set_spacing().
	/// - Returns: gint (gint)
	open func getSpacing() -> gint {
		return gtk_expander_get_spacing(GTK_EXPANDER(self.GOBJECT))
	}

	/// Returns whether the label’s text is interpreted as marked up with
	/// the [Pango text markup language][PangoMarkupFormat].
	/// See gtk_expander_set_use_markup().
	/// - Returns: Bool (gboolean)
	open func getUseMarkup() -> Bool {
		return gtk_expander_get_use_markup(GTK_EXPANDER(self.GOBJECT)) != 0 ? true : false
	}

	/// Returns whether an embedded underline in the expander label
	/// indicates a mnemonic. See gtk_expander_set_use_underline().
	/// - Returns: Bool (gboolean)
	open func getUseUnderline() -> Bool {
		return gtk_expander_get_use_underline(GTK_EXPANDER(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the state of the expander. Set to %TRUE, if you want
	/// the child widget to be revealed, and %FALSE if you want the
	/// child widget to be hidden.
	/// - Parameters:
	///	- expanded: Bool (gboolean)
	open func setExpanded(_ expanded: Bool) -> Swift.Void {
		gtk_expander_set_expanded(GTK_EXPANDER(self.GOBJECT), expanded ? 1 : 0)
	}

	/// Sets the text of the label of the expander to @label.
	/// This will also clear any previously set labels.
	/// - Parameters:
	///	- label: String? (const gchar*)
	open func setLabel(_ label: String?) -> Swift.Void {
		gtk_expander_set_label(GTK_EXPANDER(self.GOBJECT), label)
	}

	/// Sets whether the label widget should fill all available
	/// horizontal space allocated to @expander.
	/// - Parameters:
	///	- labelFill: Bool (gboolean)
	open func setLabelFill(_ labelFill: Bool) -> Swift.Void {
		gtk_expander_set_label_fill(GTK_EXPANDER(self.GOBJECT), labelFill ? 1 : 0)
	}

	/// Set the label widget for the expander. This is the widget
	/// that will appear embedded alongside the expander arrow.
	/// - Parameters:
	///	- labelWidget: CGTKWidget? (GtkWidget*)
	open func setLabelWidget(_ labelWidget: CGTKWidget?) -> Swift.Void {
		gtk_expander_set_label_widget(GTK_EXPANDER(self.GOBJECT), labelWidget?.WIDGET)
	}

	/// Sets whether the expander will resize the toplevel widget
	/// containing the expander upon resizing and collpasing.
	/// - Parameters:
	///	- resizeToplevel: Bool (gboolean)
	open func setResizeToplevel(_ resizeToplevel: Bool) -> Swift.Void {
		gtk_expander_set_resize_toplevel(GTK_EXPANDER(self.GOBJECT), resizeToplevel ? 1 : 0)
	}

	/// Sets the spacing field of @expander, which is the number of
	/// pixels to place between expander and the child.
	/// - Parameters:
	///	- spacing: gint (gint)
	open func setSpacing(_ spacing: gint) -> Swift.Void {
		gtk_expander_set_spacing(GTK_EXPANDER(self.GOBJECT), spacing)
	}

	/// Sets whether the text of the label contains markup in
	/// [Pango’s text markup language][PangoMarkupFormat].
	/// See gtk_label_set_markup().
	/// - Parameters:
	///	- useMarkup: Bool (gboolean)
	open func setUseMarkup(_ useMarkup: Bool) -> Swift.Void {
		gtk_expander_set_use_markup(GTK_EXPANDER(self.GOBJECT), useMarkup ? 1 : 0)
	}

	/// If true, an underline in the text of the expander label indicates
	/// the next character should be used for the mnemonic accelerator key.
	/// - Parameters:
	///	- useUnderline: Bool (gboolean)
	open func setUseUnderline(_ useUnderline: Bool) -> Swift.Void {
		gtk_expander_set_use_underline(GTK_EXPANDER(self.GOBJECT), useUnderline ? 1 : 0)
	}

}
