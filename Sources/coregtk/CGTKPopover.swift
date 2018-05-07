/*
 * CGTKPopover.swift
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

public let GTK_TYPE_POPOVER: GType = gtk_popover_get_type()

@inline(__always) public func GTK_POPOVER(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkPopover>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_POPOVER)
}

/// GtkPopover is a bubble-like context window, primarily meant to
/// provide context-dependent information or options. Popovers are
/// attached to a widget, passed at construction time on gtk_popover_new(),
/// or updated afterwards through gtk_popover_set_relative_to(), by
/// default they will point to the whole widget area, although this
/// behavior can be changed through gtk_popover_set_pointing_to().
/// The position of a popover relative to the widget it is attached to
/// can also be changed through gtk_popover_set_position().
/// By default, #GtkPopover performs a GTK+ grab, in order to ensure
/// input events get redirected to it while it is shown, and also so
/// the popover is dismissed in the expected situations (clicks outside
/// the popover, or the Esc key being pressed). If no such modal behavior
/// is desired on a popover, gtk_popover_set_modal() may be called on it
/// to tweak its behavior.
/// ## GtkPopover as menu replacement
/// GtkPopover is often used to replace menus. To facilitate this, it
/// supports being populated from a #GMenuModel, using
/// gtk_popover_new_from_model(). In addition to all the regular menu
/// model features, this function supports rendering sections in the
/// model in a more compact form, as a row of icon buttons instead of
/// menu items.
/// To use this rendering, set the ”display-hint” attribute of the
/// section to ”horizontal-buttons” and set the icons of your items
/// with the ”verb-icon” attribute.
/// |[
/// <section>
/// <attribute name="display-hint">horizontal-buttons</attribute>
/// <item>
/// <attribute name="label">Cut</attribute>
/// <attribute name="action">app.cut</attribute>
/// <attribute name="verb-icon">edit-cut-symbolic</attribute>
/// </item>
/// <item>
/// <attribute name="label">Copy</attribute>
/// <attribute name="action">app.copy</attribute>
/// <attribute name="verb-icon">edit-copy-symbolic</attribute>
/// </item>
/// <item>
/// <attribute name="label">Paste</attribute>
/// <attribute name="action">app.paste</attribute>
/// <attribute name="verb-icon">edit-paste-symbolic</attribute>
/// </item>
/// </section>
/// ]|
/// # CSS nodes
/// GtkPopover has a single css node called popover. It always gets the
/// .background style class and it gets the .menu style class if it is
/// menu-like (e.g. #GtkPopoverMenu or created using gtk_popover_new_from_model().
/// Particular uses of GtkPopover, such as touch selection popups
/// or magnifiers in #GtkEntry or #GtkTextView get style classes
/// like .touch-selection or .magnifier to differentiate from
/// plain popovers.


open class CGTKPopover : CGTKBin {
	/// Creates a new popover to point to @relative_to
	/// - Parameters:
	///	- relativeTo: CGTKWidget (GtkWidget*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(relativeTo: CGTKWidget) {
		self.init(withGObject: gtk_popover_new(relativeTo.WIDGET))!
	}

	/// Creates a #GtkPopover and populates it according to
	/// @model. The popover is pointed to the @relative_to widget.
	/// The created buttons are connected to actions found in the
	/// #GtkApplicationWindow to which the popover belongs - typically
	/// by means of being attached to a widget that is contained within
	/// the #GtkApplicationWindows widget hierarchy.
	/// Actions can also be added using gtk_widget_insert_action_group()
	/// on the menus attach widget or on any of its parent widgets.
	/// - Parameters:
	///	- relativeTo: CGTKWidget (GtkWidget*)
	///	- model: UnsafeMutablePointer<GMenuModel>! (GMenuModel*)
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init(fromModel relativeTo: CGTKWidget, model: UnsafeMutablePointer<GMenuModel>!) {
		self.init(withGObject: gtk_popover_new_from_model(relativeTo.WIDGET, model))!
	}

	open var POPOVER: UnsafeMutablePointer<GtkPopover>! {
		get {
			return GTK_POPOVER(self.GOBJECT)
		}
	}

	/// Establishes a binding between a #GtkPopover and a #GMenuModel.
	/// The contents of @popover are removed and then refilled with menu items
	/// according to @model.  When @model changes, @popover is updated.
	/// Calling this function twice on @popover with different @model will
	/// cause the first binding to be replaced with a binding to the new
	/// model. If @model is %NULL then any previous binding is undone and
	/// all children are removed.
	/// If @action_namespace is non-%NULL then the effect is as if all
	/// actions mentioned in the @model have their names prefixed with the
	/// namespace, plus a dot.  For example, if the action “quit” is
	/// mentioned and @action_namespace is “app” then the effective action
	/// name is “app.quit”.
	/// This function uses #GtkActionable to define the action name and
	/// target values on the created menu items.  If you want to use an
	/// action group other than “app” and “win”, or if you want to use a
	/// #GtkMenuShell outside of a #GtkApplicationWindow, then you will need
	/// to attach your own action group to the widget hierarchy using
	/// gtk_widget_insert_action_group().  As an example, if you created a
	/// group with a “quit” action and inserted it with the name “mygroup”
	/// then you would use the action name “mygroup.quit” in your
	/// #GMenuModel.
	/// - Parameters:
	///	- model: UnsafeMutablePointer<GMenuModel>? (GMenuModel*)
	///	- actionNamespace: String (const gchar*)
	open func bindModel(_ model: UnsafeMutablePointer<GMenuModel>?, actionNamespace: String) -> Swift.Void {
		gtk_popover_bind_model(GTK_POPOVER(self.GOBJECT), model, actionNamespace)
	}

	/// Returns the constraint for placing this popover.
	/// See gtk_popover_set_constrain_to().
	/// - Returns: GtkPopoverConstraint (GtkPopoverConstraint)
	open func getConstrainTo() -> GtkPopoverConstraint {
		return gtk_popover_get_constrain_to(GTK_POPOVER(self.GOBJECT))
	}

	/// Gets the widget that should be set as the default while
	/// the popover is shown.
	/// - Returns: CGTKWidget? (GtkWidget*)
	open func getDefaultWidget<T>() -> T? where T: CGTKWidget {
		return T.init(withGObject: gtk_popover_get_default_widget(GTK_POPOVER(self.GOBJECT)))
	}

	/// Returns whether the popover is modal, see gtk_popover_set_modal to
	/// see the implications of this.
	/// - Returns: Bool (gboolean)
	open func getModal() -> Bool {
		return gtk_popover_get_modal(GTK_POPOVER(self.GOBJECT)) != 0 ? true : false
	}

	/// If a rectangle to point to has been set, this function will
	/// return %TRUE and fill in @rect with such rectangle, otherwise
	/// it will return %FALSE and fill in @rect with the attached
	/// widget coordinates.
	/// - Parameters:
	///	- rect: UnsafeMutablePointer<GdkRectangle>! (GdkRectangle*)
	/// - Returns: Bool (gboolean)
	open func getPointingTo(rect: UnsafeMutablePointer<GdkRectangle>!) -> Bool {
		return gtk_popover_get_pointing_to(GTK_POPOVER(self.GOBJECT), rect) != 0 ? true : false
	}

	/// Returns the preferred position of @popover.
	/// - Returns: GtkPositionType (GtkPositionType)
	open func getPosition() -> GtkPositionType {
		return gtk_popover_get_position(GTK_POPOVER(self.GOBJECT))
	}

	/// Returns the widget @popover is currently attached to
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getRelativeTo<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_popover_get_relative_to(GTK_POPOVER(self.GOBJECT)))!
	}

	/// Returns whether show/hide transitions are enabled on this popover.
	/// - Returns: Bool (gboolean)
	open func getTransitionsEnabled() -> Bool {
		return gtk_popover_get_transitions_enabled(GTK_POPOVER(self.GOBJECT)) != 0 ? true : false
	}

	/// Pops @popover down.This is different than a gtk_widget_hide() call
	/// in that it shows the popover with a transition. If you want to hide
	/// the popover without a transition, use gtk_widget_hide().
	open func popdown() -> Swift.Void {
		gtk_popover_popdown(GTK_POPOVER(self.GOBJECT))
	}

	/// Pops @popover up. This is different than a gtk_widget_show() call
	/// in that it shows the popover with a transition. If you want to show
	/// the popover without a transition, use gtk_widget_show().
	open func popup() -> Swift.Void {
		gtk_popover_popup(GTK_POPOVER(self.GOBJECT))
	}

	/// Sets a constraint for positioning this popover.
	/// Note that not all platforms support placing popovers freely,
	/// and may already impose constraints.
	/// - Parameters:
	///	- constraint: GtkPopoverConstraint (GtkPopoverConstraint)
	open func setConstrainTo(constraint: GtkPopoverConstraint) -> Swift.Void {
		gtk_popover_set_constrain_to(GTK_POPOVER(self.GOBJECT), constraint)
	}

	/// Sets the widget that should be set as default widget while
	/// the popover is shown (see gtk_window_set_default()). #GtkPopover
	/// remembers the previous default widget and reestablishes it
	/// when the popover is dismissed.
	/// - Parameters:
	///	- widget: CGTKWidget (GtkWidget*)
	open func setDefaultWidget(_ widget: CGTKWidget) -> Swift.Void {
		gtk_popover_set_default_widget(GTK_POPOVER(self.GOBJECT), widget.WIDGET)
	}

	/// Sets whether @popover is modal, a modal popover will grab all input
	/// within the toplevel and grab the keyboard focus on it when being
	/// displayed. Clicking outside the popover area or pressing Esc will
	/// dismiss the popover and ungrab input.
	/// - Parameters:
	///	- modal: Bool (gboolean)
	open func setModal(_ modal: Bool) -> Swift.Void {
		gtk_popover_set_modal(GTK_POPOVER(self.GOBJECT), modal ? 1 : 0)
	}

	/// Sets the rectangle that @popover will point to, in the
	/// coordinate space of the widget @popover is attached to,
	/// see gtk_popover_set_relative_to().
	/// - Parameters:
	///	- rect: UnsafePointer<GdkRectangle>! (const GdkRectangle*)
	open func setPointingTo(rect: UnsafePointer<GdkRectangle>!) -> Swift.Void {
		gtk_popover_set_pointing_to(GTK_POPOVER(self.GOBJECT), rect)
	}

	/// Sets the preferred position for @popover to appear. If the @popover
	/// is currently visible, it will be immediately updated.
	/// This preference will be respected where possible, although
	/// on lack of space (eg. if close to the window edges), the
	/// #GtkPopover may choose to appear on the opposite side
	/// - Parameters:
	///	- position: GtkPositionType (GtkPositionType)
	open func setPosition(_ position: GtkPositionType) -> Swift.Void {
		gtk_popover_set_position(GTK_POPOVER(self.GOBJECT), position)
	}

	/// Sets a new widget to be attached to @popover. If @popover is
	/// visible, the position will be updated.
	/// Note: the ownership of popovers is always given to their @relative_to
	/// widget, so if @relative_to is set to %NULL on an attached @popover, it
	/// will be detached from its previous widget, and consequently destroyed
	/// unless extra references are kept.
	/// - Parameters:
	///	- relativeTo: CGTKWidget (GtkWidget*)
	open func setRelativeTo(_ relativeTo: CGTKWidget) -> Swift.Void {
		gtk_popover_set_relative_to(GTK_POPOVER(self.GOBJECT), relativeTo.WIDGET)
	}

	/// Sets whether show/hide transitions are enabled on this popover
	/// - Parameters:
	///	- transitionsEnabled: Bool (gboolean)
	open func setTransitionsEnabled(_ transitionsEnabled: Bool) -> Swift.Void {
		gtk_popover_set_transitions_enabled(GTK_POPOVER(self.GOBJECT), transitionsEnabled ? 1 : 0)
	}

}
