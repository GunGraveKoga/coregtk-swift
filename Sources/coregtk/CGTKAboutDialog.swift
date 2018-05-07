/*
 * CGTKAboutDialog.swift
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

public let GTK_TYPE_ABOUT_DIALOG: GType = gtk_about_dialog_get_type()

@inline(__always) public func GTK_ABOUT_DIALOG(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkAboutDialog>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_ABOUT_DIALOG)
}

/// The GtkAboutDialog offers a simple way to display information about
/// a program like its logo, name, copyright, website and license. It is
/// also possible to give credits to the authors, documenters, translators
/// and artists who have worked on the program. An about dialog is typically
/// opened when the user selects the `About` option from the `Help` menu.
/// All parts of the dialog are optional.
/// About dialogs often contain links and email addresses. GtkAboutDialog
/// displays these as clickable links. By default, it calls gtk_show_uri_on_window()
/// when a user clicks one. The behaviour can be overridden with the
/// #GtkAboutDialog::activate-link signal.
/// To specify a person with an email address, use a string like
/// "Edgar Allan Poe <edgar\@poe.com>". To specify a website with a title,
/// use a string like "GTK+ team http://www.gtk.org".
/// To make constructing a GtkAboutDialog as convenient as possible, you can
/// use the function gtk_show_about_dialog() which constructs and shows a dialog
/// and keeps it around so that it can be shown again.
/// Note that GTK+ sets a default title of `_("About %s")` on the dialog
/// window (where \%s is replaced by the name of the application, but in
/// order to ensure proper translation of the title, applications should
/// set the title property explicitly when constructing a GtkAboutDialog,
/// as shown in the following example:
/// |[<!-- language="C" -->
/// GdkPixbuf *example_logo = gdk_pixbuf_new_from_file ("./logo.png", NULL);
/// gtk_show_about_dialog (NULL,
/// "program-name", "ExampleCode",
/// "logo", example_logo,
/// "title", _("About ExampleCode"),
/// NULL);
/// ]|
/// It is also possible to show a #GtkAboutDialog like any other #GtkDialog,
/// e.g. using gtk_dialog_run(). In this case, you might need to know that
/// the “Close” button returns the #GTK_RESPONSE_CANCEL response id.


open class CGTKAboutDialog : CGTKDialog {
	/// Creates a new #GtkAboutDialog.
	/// - Returns: CGTKWidget (GtkWidget*)
	public convenience init() {
		self.init(withGObject: gtk_about_dialog_new())!
	}

	open var ABOUTDIALOG: UnsafeMutablePointer<GtkAboutDialog>! {
		get {
			return GTK_ABOUT_DIALOG(self.GOBJECT)
		}
	}

	/// Creates a new section in the Credits page.
	/// - Parameters:
	///	- sectionName: String (const gchar*)
	///	- people: UnsafeMutablePointer<UnsafePointer<gchar>?>! (gchar**)
	open func addCreditSection(sectionName: String, people: UnsafeMutablePointer<UnsafePointer<gchar>?>!) -> Swift.Void {
		gtk_about_dialog_add_credit_section(GTK_ABOUT_DIALOG(self.GOBJECT), sectionName, people)
	}

	/// Returns the string which are displayed in the artists tab
	/// of the secondary credits dialog.
	/// - Returns: UnsafePointer<UnsafePointer<gchar>?>! (gchar**)
	open func getArtists() -> UnsafePointer<UnsafePointer<gchar>?>! {
		return gtk_about_dialog_get_artists(GTK_ABOUT_DIALOG(self.GOBJECT))
	}

	/// Returns the string which are displayed in the authors tab
	/// of the secondary credits dialog.
	/// - Returns: UnsafePointer<UnsafePointer<gchar>?>! (gchar**)
	open func getAuthors() -> UnsafePointer<UnsafePointer<gchar>?>! {
		return gtk_about_dialog_get_authors(GTK_ABOUT_DIALOG(self.GOBJECT))
	}

	/// Returns the comments string.
	/// - Returns: String? (const gchar*)
	open func getComments() -> String? {
		return String(utf8String: gtk_about_dialog_get_comments(GTK_ABOUT_DIALOG(self.GOBJECT)))
	}

	/// Returns the copyright string.
	/// - Returns: String? (const gchar*)
	open func getCopyright() -> String? {
		return String(utf8String: gtk_about_dialog_get_copyright(GTK_ABOUT_DIALOG(self.GOBJECT)))
	}

	/// Returns the string which are displayed in the documenters
	/// tab of the secondary credits dialog.
	/// - Returns: UnsafePointer<UnsafePointer<gchar>?>! (gchar**)
	open func getDocumenters() -> UnsafePointer<UnsafePointer<gchar>?>! {
		return gtk_about_dialog_get_documenters(GTK_ABOUT_DIALOG(self.GOBJECT))
	}

	/// Returns the license information.
	/// - Returns: String? (const gchar*)
	open func getLicense() -> String? {
		return String(utf8String: gtk_about_dialog_get_license(GTK_ABOUT_DIALOG(self.GOBJECT)))
	}

	/// Retrieves the license set using gtk_about_dialog_set_license_type()
	/// - Returns: GtkLicense (GtkLicense)
	open func getLicenseType() -> GtkLicense {
		return gtk_about_dialog_get_license_type(GTK_ABOUT_DIALOG(self.GOBJECT))
	}

	/// Returns the pixbuf displayed as logo in the about dialog.
	/// - Returns: OpaquePointer (GdkPixbuf*)
	open func getLogo() -> OpaquePointer {
		return gtk_about_dialog_get_logo(GTK_ABOUT_DIALOG(self.GOBJECT))
	}

	/// Returns the icon name displayed as logo in the about dialog.
	/// - Returns: String? (const gchar*)
	open func getLogoIconName() -> String? {
		return String(utf8String: gtk_about_dialog_get_logo_icon_name(GTK_ABOUT_DIALOG(self.GOBJECT)))
	}

	/// Returns the program name displayed in the about dialog.
	/// - Returns: String? (const gchar*)
	open func getProgramName() -> String? {
		return String(utf8String: gtk_about_dialog_get_program_name(GTK_ABOUT_DIALOG(self.GOBJECT)))
	}

	/// Returns the translator credits string which is displayed
	/// in the translators tab of the secondary credits dialog.
	/// - Returns: String? (const gchar*)
	open func getTranslatorCredits() -> String? {
		return String(utf8String: gtk_about_dialog_get_translator_credits(GTK_ABOUT_DIALOG(self.GOBJECT)))
	}

	/// Returns the version string.
	/// - Returns: String? (const gchar*)
	open func getVersion() -> String? {
		return String(utf8String: gtk_about_dialog_get_version(GTK_ABOUT_DIALOG(self.GOBJECT)))
	}

	/// Returns the website URL.
	/// - Returns: String? (const gchar*)
	open func getWebsite() -> String? {
		return String(utf8String: gtk_about_dialog_get_website(GTK_ABOUT_DIALOG(self.GOBJECT)))
	}

	/// Returns the label used for the website link.
	/// - Returns: String? (const gchar*)
	open func getWebsiteLabel() -> String? {
		return String(utf8String: gtk_about_dialog_get_website_label(GTK_ABOUT_DIALOG(self.GOBJECT)))
	}

	/// Returns whether the license text in @about is
	/// automatically wrapped.
	/// - Returns: Bool (gboolean)
	open func getWrapLicense() -> Bool {
		return gtk_about_dialog_get_wrap_license(GTK_ABOUT_DIALOG(self.GOBJECT)) != 0 ? true : false
	}

	/// Sets the strings which are displayed in the artists tab
	/// of the secondary credits dialog.
	/// - Parameters:
	///	- artists: UnsafeMutablePointer<UnsafePointer<gchar>?>! (gchar**)
	open func setArtists(_ artists: UnsafeMutablePointer<UnsafePointer<gchar>?>!) -> Swift.Void {
		gtk_about_dialog_set_artists(GTK_ABOUT_DIALOG(self.GOBJECT), artists)
	}

	/// Sets the strings which are displayed in the authors tab
	/// of the secondary credits dialog.
	/// - Parameters:
	///	- authors: UnsafeMutablePointer<UnsafePointer<gchar>?>! (gchar**)
	open func setAuthors(_ authors: UnsafeMutablePointer<UnsafePointer<gchar>?>!) -> Swift.Void {
		gtk_about_dialog_set_authors(GTK_ABOUT_DIALOG(self.GOBJECT), authors)
	}

	/// Sets the comments string to display in the about dialog.
	/// This should be a short string of one or two lines.
	/// - Parameters:
	///	- comments: String (const gchar*)
	open func setComments(_ comments: String) -> Swift.Void {
		gtk_about_dialog_set_comments(GTK_ABOUT_DIALOG(self.GOBJECT), comments)
	}

	/// Sets the copyright string to display in the about dialog.
	/// This should be a short string of one or two lines.
	/// - Parameters:
	///	- copyright: String (const gchar*)
	open func setCopyright(_ copyright: String) -> Swift.Void {
		gtk_about_dialog_set_copyright(GTK_ABOUT_DIALOG(self.GOBJECT), copyright)
	}

	/// Sets the strings which are displayed in the documenters tab
	/// of the secondary credits dialog.
	/// - Parameters:
	///	- documenters: UnsafeMutablePointer<UnsafePointer<gchar>?>! (gchar**)
	open func setDocumenters(_ documenters: UnsafeMutablePointer<UnsafePointer<gchar>?>!) -> Swift.Void {
		gtk_about_dialog_set_documenters(GTK_ABOUT_DIALOG(self.GOBJECT), documenters)
	}

	/// Sets the license information to be displayed in the secondary
	/// license dialog. If @license is %NULL, the license button is
	/// hidden.
	/// - Parameters:
	///	- license: String (const gchar*)
	open func setLicense(_ license: String) -> Swift.Void {
		gtk_about_dialog_set_license(GTK_ABOUT_DIALOG(self.GOBJECT), license)
	}

	/// Sets the license of the application showing the @about dialog from a
	/// list of known licenses.
	/// This function overrides the license set using
	/// gtk_about_dialog_set_license().
	/// - Parameters:
	///	- licenseType: GtkLicense (GtkLicense)
	open func setLicenseType(_ licenseType: GtkLicense) -> Swift.Void {
		gtk_about_dialog_set_license_type(GTK_ABOUT_DIALOG(self.GOBJECT), licenseType)
	}

	/// Sets the pixbuf to be displayed as logo in the about dialog.
	/// If it is %NULL, the default window icon set with
	/// gtk_window_set_default_icon() will be used.
	/// - Parameters:
	///	- logo: OpaquePointer? (GdkPixbuf*)
	open func setLogo(_ logo: OpaquePointer?) -> Swift.Void {
		gtk_about_dialog_set_logo(GTK_ABOUT_DIALOG(self.GOBJECT), logo)
	}

	/// Sets the pixbuf to be displayed as logo in the about dialog.
	/// If it is %NULL, the default window icon set with
	/// gtk_window_set_default_icon() will be used.
	/// - Parameters:
	///	- iconName: String (const gchar*)
	open func setLogoIconName(_ iconName: String) -> Swift.Void {
		gtk_about_dialog_set_logo_icon_name(GTK_ABOUT_DIALOG(self.GOBJECT), iconName)
	}

	/// Sets the name to display in the about dialog.
	/// If this is not set, it defaults to g_get_application_name().
	/// - Parameters:
	///	- name: String (const gchar*)
	open func setProgramName(_ name: String) -> Swift.Void {
		gtk_about_dialog_set_program_name(GTK_ABOUT_DIALOG(self.GOBJECT), name)
	}

	/// Sets the translator credits string which is displayed in
	/// the translators tab of the secondary credits dialog.
	/// The intended use for this string is to display the translator
	/// of the language which is currently used in the user interface.
	/// Using gettext(), a simple way to achieve that is to mark the
	/// string for translation:
	/// |[<!-- language="C" -->
	/// GtkWidget *about = gtk_about_dialog_new ();
	/// gtk_about_dialog_set_translator_credits (GTK_ABOUT_DIALOG (about),
	/// _("translator-credits"));
	/// ]|
	/// It is a good idea to use the customary msgid “translator-credits” for this
	/// purpose, since translators will already know the purpose of that msgid, and
	/// since #GtkAboutDialog will detect if “translator-credits” is untranslated
	/// and hide the tab.
	/// - Parameters:
	///	- translatorCredits: String (const gchar*)
	open func setTranslatorCredits(_ translatorCredits: String) -> Swift.Void {
		gtk_about_dialog_set_translator_credits(GTK_ABOUT_DIALOG(self.GOBJECT), translatorCredits)
	}

	/// Sets the version string to display in the about dialog.
	/// - Parameters:
	///	- version: String (const gchar*)
	open func setVersion(_ version: String) -> Swift.Void {
		gtk_about_dialog_set_version(GTK_ABOUT_DIALOG(self.GOBJECT), version)
	}

	/// Sets the URL to use for the website link.
	/// - Parameters:
	///	- website: String (const gchar*)
	open func setWebsite(_ website: String) -> Swift.Void {
		gtk_about_dialog_set_website(GTK_ABOUT_DIALOG(self.GOBJECT), website)
	}

	/// Sets the label to be used for the website link.
	/// - Parameters:
	///	- websiteLabel: String (const gchar*)
	open func setWebsiteLabel(_ websiteLabel: String) -> Swift.Void {
		gtk_about_dialog_set_website_label(GTK_ABOUT_DIALOG(self.GOBJECT), websiteLabel)
	}

	/// Sets whether the license text in @about is
	/// automatically wrapped.
	/// - Parameters:
	///	- wrapLicense: Bool (gboolean)
	open func setWrapLicense(_ wrapLicense: Bool) -> Swift.Void {
		gtk_about_dialog_set_wrap_license(GTK_ABOUT_DIALOG(self.GOBJECT), wrapLicense ? 1 : 0)
	}

}
