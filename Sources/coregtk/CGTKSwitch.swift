/*
 * CGTKSwitch.swift
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

public let GTK_TYPE_SWITCH: GType = gtk_switch_get_type()

@inline(__always) public func GTK_SWITCH(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkSwitch>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_SWITCH)
}

/// #GtkSwitch is a widget that has two states: on or off. The user can control
/// which state should be active by clicking the empty area, or by dragging the
/// handle.
/// GtkSwitch can also handle situations where the underlying state changes with
/// a delay. See #GtkSwitch::state-set for details.
/// # CSS nodes
/// |[<!-- language="plain" -->
/// switch
/// ╰── slider
/// ]|
/// GtkSwitch has two css nodes, the main node with the name switch and a subnode
/// named slider. Neither of them is using any style classes.


open class CGTKSwitch : CGTKWidget, CGTKActionable, CGTKActivatable {
	/// Creates a new #GtkSwitch widget.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_switch_new())!
	}

	open var SWITCH: UnsafeMutablePointer<GtkSwitch>! {
		get {
			return GTK_SWITCH(self.GOBJECT)
		}
	}

	/// Gets whether the #GtkSwitch is in its “on” or “off” state.
	/// - Returns: Bool (gboolean)
	open func getActive() -> Bool {
		return gtk_switch_get_active(GTK_SWITCH(self.GOBJECT)) != 0 ? true : false
	}

	/// Gets the underlying state of the #GtkSwitch.
	/// - Returns: Bool (gboolean)
	open func getState() -> Bool {
		return gtk_switch_get_state(GTK_SWITCH(self.GOBJECT)) != 0 ? true : false
	}

	/// Changes the state of @sw to the desired one.
	/// - Parameters:
	///	- isActive: Bool (gboolean)
	open func setActive(isActive: Bool) -> Swift.Void {
		gtk_switch_set_active(GTK_SWITCH(self.GOBJECT), isActive ? 1 : 0)
	}

	/// Sets the underlying state of the #GtkSwitch.
	/// Normally, this is the same as #GtkSwitch:active, unless the switch
	/// is set up for delayed state changes. This function is typically
	/// called from a #GtkSwitch::state-set signal handler.
	/// See #GtkSwitch::state-set for details.
	/// - Parameters:
	///	- state: Bool (gboolean)
	open func setState(_ state: Bool) -> Swift.Void {
		gtk_switch_set_state(GTK_SWITCH(self.GOBJECT), state ? 1 : 0)
	}

	/// Gets the action name for @actionable.
	/// See gtk_actionable_set_action_name() for more information.
	/// - Returns: String? (const gchar*)
	open func getActionName() -> String? {
		return String(utf8String: gtk_actionable_get_action_name(GTK_ACTIONABLE(self.GOBJECT)))
	}

	/// Gets the current target value of @actionable.
	/// See gtk_actionable_set_action_target_value() for more information.
	/// - Returns: OpaquePointer (GVariant*)
	open func getActionTargetValue() -> OpaquePointer {
		return gtk_actionable_get_action_target_value(GTK_ACTIONABLE(self.GOBJECT))
	}

	/// Specifies the name of the action with which this widget should be
	/// associated.  If @action_name is %NULL then the widget will be
	/// unassociated from any previous action.
	/// Usually this function is used when the widget is located (or will be
	/// located) within the hierarchy of a #GtkApplicationWindow.
	/// Names are of the form “win.save” or “app.quit” for actions on the
	/// containing #GtkApplicationWindow or its associated #GtkApplication,
	/// respectively.  This is the same form used for actions in the #GMenu
	/// associated with the window.
	/// - Parameters:
	///	- actionName: String (const gchar*)
	open func setActionName(_ actionName: String) -> Swift.Void {
		gtk_actionable_set_action_name(GTK_ACTIONABLE(self.GOBJECT), actionName)
	}

	/// Sets the target value of an actionable widget.
	/// If @target_value is %NULL then the target value is unset.
	/// The target value has two purposes.  First, it is used as the
	/// parameter to activation of the action associated with the
	/// #GtkActionable widget. Second, it is used to determine if the widget
	/// should be rendered as “active” — the widget is active if the state
	/// is equal to the given target.
	/// Consider the example of associating a set of buttons with a #GAction
	/// with string state in a typical “radio button” situation.  Each button
	/// will be associated with the same action, but with a different target
	/// value for that action.  Clicking on a particular button will activate
	/// the action with the target of that button, which will typically cause
	/// the action’s state to change to that value.  Since the action’s state
	/// is now equal to the target value of the button, the button will now
	/// be rendered as active (and the other buttons, with different targets,
	/// rendered inactive).
	/// - Parameters:
	///	- targetValue: OpaquePointer! (GVariant*)
	open func setActionTargetValue(_ targetValue: OpaquePointer!) -> Swift.Void {
		gtk_actionable_set_action_target_value(GTK_ACTIONABLE(self.GOBJECT), targetValue)
	}

	/// Sets the action-name and associated string target value of an
	/// actionable widget.
	/// @detailed_action_name is a string in the format accepted by
	/// g_action_parse_detailed_name().
	/// (Note that prior to version 3.22.25,
	/// this function is only usable for actions with a simple "s" target, and
	/// @detailed_action_name must be of the form `"action::target"` where
	/// `action` is the action name and `target` is the string to use
	/// as the target.)
	/// - Parameters:
	///	- detailedActionName: String (const gchar*)
	open func setDetailedActionName(_ detailedActionName: String) -> Swift.Void {
		gtk_actionable_set_detailed_action_name(GTK_ACTIONABLE(self.GOBJECT), detailedActionName)
	}

	/// This is a utility function for #GtkActivatable implementors.
	/// When implementing #GtkActivatable you must call this when
	/// handling changes of the #GtkActivatable:related-action, and
	/// you must also use this to break references in #GObject->dispose().
	/// This function adds a reference to the currently set related
	/// action for you, it also makes sure the #GtkActivatable->update()
	/// method is called when the related #GtkAction properties change
	/// and registers to the action’s proxy list.
	/// > Be careful to call this before setting the local
	/// > copy of the #GtkAction property, since this function uses
	/// > gtk_activatable_get_related_action() to retrieve the
	/// > previous action.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func doSetRelatedAction(_ action: UnsafeMutablePointer<GtkAction>!) -> Swift.Void {
		gtk_activatable_do_set_related_action(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

	/// Gets the related #GtkAction for @activatable.
	/// - Returns: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func getRelatedAction() -> UnsafeMutablePointer<GtkAction>! {
		return gtk_activatable_get_related_action(GTK_ACTIVATABLE(self.GOBJECT))
	}

	/// Gets whether this activatable should reset its layout
	/// and appearance when setting the related action or when
	/// the action changes appearance.
	/// - Returns: Bool (gboolean)
	open func getUseActionAppearance() -> Bool {
		return gtk_activatable_get_use_action_appearance(GTK_ACTIVATABLE(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the related action on the @activatable object.
	/// > #GtkActivatable implementors need to handle the #GtkActivatable:related-action
	/// > property and call gtk_activatable_do_set_related_action() when it changes.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>! (GtkAction*)
	open func setRelatedAction(_ action: UnsafeMutablePointer<GtkAction>!) -> Swift.Void {
		gtk_activatable_set_related_action(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

	/// Sets whether this activatable should reset its layout and appearance
	/// when setting the related action or when the action changes appearance
	/// > #GtkActivatable implementors need to handle the
	/// > #GtkActivatable:use-action-appearance property and call
	/// > gtk_activatable_sync_action_properties() to update @activatable
	/// > if needed.
	/// - Parameters:
	///	- useAppearance: Bool (gboolean)
	open func setUseActionAppearance(useAppearance: Bool) -> Swift.Void {
		gtk_activatable_set_use_action_appearance(GTK_ACTIVATABLE(self.GOBJECT), useAppearance ? 1 : 0)
	}

	/// This is called to update the activatable completely, this is called
	/// internally when the #GtkActivatable:related-action property is set
	/// or unset and by the implementing class when
	/// #GtkActivatable:use-action-appearance changes.
	/// - Parameters:
	///	- action: UnsafeMutablePointer<GtkAction>? (GtkAction*)
	open func syncActionProperties(action: UnsafeMutablePointer<GtkAction>?) -> Swift.Void {
		gtk_activatable_sync_action_properties(GTK_ACTIVATABLE(self.GOBJECT), action)
	}

}
