/*
 * CGTKMenuShell.swift
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

public let GTK_TYPE_MENU_SHELL: GType = gtk_menu_shell_get_type()

@inline(__always) public func GTK_MENU_SHELL(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkMenuShell>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_MENU_SHELL)
}

/// A #GtkMenuShell is the abstract base class used to derive the
/// #GtkMenu and #GtkMenuBar subclasses.
/// A #GtkMenuShell is a container of #GtkMenuItem objects arranged
/// in a list which can be navigated, selected, and activated by the
/// user to perform application functions. A #GtkMenuItem can have a
/// submenu associated with it, allowing for nested hierarchical menus.
/// # Terminology
/// A menu item can be “selected”, this means that it is displayed
/// in the prelight state, and if it has a submenu, that submenu
/// will be popped up.
/// A menu is “active” when it is visible onscreen and the user
/// is selecting from it. A menubar is not active until the user
/// clicks on one of its menuitems. When a menu is active,
/// passing the mouse over a submenu will pop it up.
/// There is also is a concept of the current menu and a current
/// menu item. The current menu item is the selected menu item
/// that is furthest down in the hierarchy. (Every active menu shell
/// does not necessarily contain a selected menu item, but if
/// it does, then the parent menu shell must also contain
/// a selected menu item.) The current menu is the menu that
/// contains the current menu item. It will always have a GTK
/// grab and receive all key presses.


open class CGTKMenuShell : CGTKContainer {
	open var MENUSHELL: UnsafeMutablePointer<GtkMenuShell>! {
		get {
			return GTK_MENU_SHELL(self.GOBJECT)
		}
	}

	/// Activates the menu item within the menu shell.
	/// - Parameters:
	///	- menuItem: CGTKWidget (GtkWidget*)
	///	- forceDeactivate: Bool (gboolean)
	open func activateItem(menuItem: CGTKWidget, forceDeactivate: Bool) -> Swift.Void {
		gtk_menu_shell_activate_item(GTK_MENU_SHELL(self.GOBJECT), menuItem.WIDGET, forceDeactivate ? 1 : 0)
	}

	/// Adds a new #GtkMenuItem to the end of the menu shell's
	/// item list.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func append(child: CGTKWidget) -> Swift.Void {
		gtk_menu_shell_append(GTK_MENU_SHELL(self.GOBJECT), child.WIDGET)
	}

	/// Establishes a binding between a #GtkMenuShell and a #GMenuModel.
	/// The contents of @shell are removed and then refilled with menu items
	/// according to @model.  When @model changes, @shell is updated.
	/// Calling this function twice on @shell with different @model will
	/// cause the first binding to be replaced with a binding to the new
	/// model. If @model is %NULL then any previous binding is undone and
	/// all children are removed.
	/// @with_separators determines if toplevel items (eg: sections) have
	/// separators inserted between them.  This is typically desired for
	/// menus but doesn’t make sense for menubars.
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
	/// For most cases you are probably better off using
	/// gtk_menu_new_from_model() or gtk_menu_bar_new_from_model() or just
	/// directly passing the #GMenuModel to gtk_application_set_app_menu() or
	/// gtk_application_set_menubar().
	/// - Parameters:
	///	- model: UnsafeMutablePointer<GMenuModel>? (GMenuModel*)
	///	- actionNamespace: String (const gchar*)
	///	- withSeparators: Bool (gboolean)
	open func bindModel(_ model: UnsafeMutablePointer<GMenuModel>?, actionNamespace: String, withSeparators: Bool) -> Swift.Void {
		gtk_menu_shell_bind_model(GTK_MENU_SHELL(self.GOBJECT), model, actionNamespace, withSeparators ? 1 : 0)
	}

	/// Cancels the selection within the menu shell.
	open func cancel() -> Swift.Void {
		gtk_menu_shell_cancel(GTK_MENU_SHELL(self.GOBJECT))
	}

	/// Deactivates the menu shell.
	/// Typically this results in the menu shell being erased
	/// from the screen.
	open func deactivate() -> Swift.Void {
		gtk_menu_shell_deactivate(GTK_MENU_SHELL(self.GOBJECT))
	}

	/// Deselects the currently selected item from the menu shell,
	/// if any.
	open func deselect() -> Swift.Void {
		gtk_menu_shell_deselect(GTK_MENU_SHELL(self.GOBJECT))
	}

	/// Gets the parent menu shell.
	/// The parent menu shell of a submenu is the #GtkMenu or #GtkMenuBar
	/// from which it was opened up.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getParentShell<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_menu_shell_get_parent_shell(GTK_MENU_SHELL(self.GOBJECT)))!
	}

	/// Gets the currently selected item.
	/// - Returns: CGTKWidget (GtkWidget*)
	open func getSelectedItem<T>() -> T where T: CGTKWidget {
		return T.init(withGObject: gtk_menu_shell_get_selected_item(GTK_MENU_SHELL(self.GOBJECT)))!
	}

	/// Returns %TRUE if the menu shell will take the keyboard focus on popup.
	/// - Returns: Bool (gboolean)
	open func getTakeFocus() -> Bool {
		return gtk_menu_shell_get_take_focus(GTK_MENU_SHELL(self.GOBJECT)) != 0 ? true : false
	}

	/// Adds a new #GtkMenuItem to the menu shell’s item list
	/// at the position indicated by @position.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	///	- position: gint (gint)
	open func insert(child: CGTKWidget, position: gint) -> Swift.Void {
		gtk_menu_shell_insert(GTK_MENU_SHELL(self.GOBJECT), child.WIDGET, position)
	}

	/// Adds a new #GtkMenuItem to the beginning of the menu shell's
	/// item list.
	/// - Parameters:
	///	- child: CGTKWidget (GtkWidget*)
	open func prepend(child: CGTKWidget) -> Swift.Void {
		gtk_menu_shell_prepend(GTK_MENU_SHELL(self.GOBJECT), child.WIDGET)
	}

	/// Select the first visible or selectable child of the menu shell;
	/// don’t select tearoff items unless the only item is a tearoff
	/// item.
	/// - Parameters:
	///	- searchSensitive: Bool (gboolean)
	open func selectFirst(searchSensitive: Bool) -> Swift.Void {
		gtk_menu_shell_select_first(GTK_MENU_SHELL(self.GOBJECT), searchSensitive ? 1 : 0)
	}

	/// Selects the menu item from the menu shell.
	/// - Parameters:
	///	- menuItem: CGTKWidget (GtkWidget*)
	open func selectItem(menuItem: CGTKWidget) -> Swift.Void {
		gtk_menu_shell_select_item(GTK_MENU_SHELL(self.GOBJECT), menuItem.WIDGET)
	}

	/// If @take_focus is %TRUE (the default) the menu shell will take
	/// the keyboard focus so that it will receive all keyboard events
	/// which is needed to enable keyboard navigation in menus.
	/// Setting @take_focus to %FALSE is useful only for special applications
	/// like virtual keyboard implementations which should not take keyboard
	/// focus.
	/// The @take_focus state of a menu or menu bar is automatically
	/// propagated to submenus whenever a submenu is popped up, so you
	/// don’t have to worry about recursively setting it for your entire
	/// menu hierarchy. Only when programmatically picking a submenu and
	/// popping it up manually, the @take_focus property of the submenu
	/// needs to be set explicitly.
	/// Note that setting it to %FALSE has side-effects:
	/// If the focus is in some other app, it keeps the focus and keynav in
	/// the menu doesn’t work. Consequently, keynav on the menu will only
	/// work if the focus is on some toplevel owned by the onscreen keyboard.
	/// To avoid confusing the user, menus with @take_focus set to %FALSE
	/// should not display mnemonics or accelerators, since it cannot be
	/// guaranteed that they will work.
	/// See also gdk_keyboard_grab()
	/// - Parameters:
	///	- takeFocus: Bool (gboolean)
	open func setTakeFocus(_ takeFocus: Bool) -> Swift.Void {
		gtk_menu_shell_set_take_focus(GTK_MENU_SHELL(self.GOBJECT), takeFocus ? 1 : 0)
	}

}
