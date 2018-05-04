//
//  CGTKApplication.swift
//  test
//
//  Created by Yury Vovk on 03.05.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

import Foundation

@_exported import CGtk

public let GTK_TYPE_APPLICATION: GType = gtk_application_get_type()
public let G_TYPE_APPLICATION: GType = g_application_get_type()

@inline(__always) public func GTK_APPLICATION(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkApplication>! {
    return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_APPLICATION)
}

@inline(__always) public func G_APPLICATION(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GApplication>! {
    return G_TYPE_CHECK_INSTANCE_CAST(ptr, G_TYPE_APPLICATION)
}

open class CGTKApplication {
    
    private static var __current: CGTKApplication? = nil
    private var __gObject: UnsafeMutableRawPointer? = nil
    private var applicationCallback: ((CGTKApplicationWindow) -> Void)? = nil
    public private(set) var applicationWindow: CGTKApplicationWindow! = nil
    
    open class var current: CGTKApplication {
        get {
            return __current!
        }
    }
    
    public var GOBJECT: UnsafeMutablePointer<GObject>! {
        get {
            return G_OBJECT(__gObject)
        }
    }
    
    public var APPLICATION: UnsafeMutablePointer<GtkApplication>! {
        get {
            return GTK_APPLICATION(self.GOBJECT)
        }
    }
    
    public func setGObject(_ object: UnsafeMutableRawPointer?) {
        if __gObject != nil {
            g_object_unref(__gObject)
        }
        
        __gObject = object
        
        if __gObject != nil {
            g_object_ref(__gObject)
        }
    }
    
    public convenience init(withIdentifier applicationId: String, flags: GApplicationFlags = G_APPLICATION_FLAGS_NONE) {
        
        self.init(withGObject: gtk_application_new(applicationId, flags))!
    }
    
    public required init?(withGObject object: UnsafeMutableRawPointer?) {
        guard object != nil else {
            return nil
        }
        
        self.setGObject(object)
    }
    
    deinit {
        if __gObject != nil {
            g_object_unref(__gObject)
            __gObject = nil
        }
    }
    
    open func addAccelerator(_ accelerator: String, forAction actionName: String, parameter: OpaquePointer? = nil) {
        
        gtk_application_add_accelerator(GTK_APPLICATION(self.GOBJECT), accelerator, actionName, parameter)
    }
    
    open func addWindow(_ window: CGTKWindow) {
        gtk_application_add_window(GTK_APPLICATION(self.GOBJECT), window.WINDOW)
    }
    
    open func getAccelsForAction(_ detailedActionName: String) -> UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! {
        return gtk_application_get_accels_for_action(GTK_APPLICATION(self.GOBJECT), detailedActionName)
    }
    
    open func getActionsForAccel(_ accel: String) -> UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! {
        return gtk_application_get_actions_for_accel(GTK_APPLICATION(self.GOBJECT), accel)
    }
    
    open func getActiveWindow() -> CGTKWindow? {
        return CGTKWindow(withGObject:gtk_application_get_active_window(GTK_APPLICATION(self.GOBJECT)))
    }
    
    open func getAppMenu() -> UnsafeMutablePointer<GMenuModel>! {
        return gtk_application_get_app_menu(GTK_APPLICATION(self.GOBJECT))
    }
    
    open func getMenuById(_ menuId: String) -> OpaquePointer! {
        return gtk_application_get_menu_by_id(GTK_APPLICATION(self.GOBJECT), menuId)
    }
    
    open func getMenubar() -> UnsafeMutablePointer<GMenuModel>! {
        return gtk_application_get_menubar(GTK_APPLICATION(self.GOBJECT))
    }
    
    open func getWindowById(_ windowId: guint) -> CGTKWindow? {
        return CGTKWindow(withGObject: gtk_application_get_window_by_id(GTK_APPLICATION(self.GOBJECT), windowId))
    }
    
    open func getWindows() -> UnsafeMutablePointer<GList>! {
        return gtk_application_get_windows(GTK_APPLICATION(self.GOBJECT))
    }
    
    open func inhibit(window: CGTKWindow, flags: GtkApplicationInhibitFlags, reason: String) -> guint {
        return gtk_application_inhibit(GTK_APPLICATION(self.GOBJECT), window.WINDOW, flags, reason)
    }
    
    open func isInhibited(flags: GtkApplicationInhibitFlags) -> Bool {
        return gtk_application_is_inhibited(GTK_APPLICATION(self.GOBJECT), flags) == 0 ? false : true
    }
    
    open func listActionDescriptions() -> UnsafeMutablePointer<UnsafeMutablePointer<gchar>?>! {
        return gtk_application_list_action_descriptions(GTK_APPLICATION(self.GOBJECT))
    }
    
    open func prefersAppMenu() -> Bool {
        return gtk_application_prefers_app_menu(GTK_APPLICATION(self.GOBJECT)) == 0 ? false : true
    }
    
    open func removeAccelerator(forAction actionName: String, parameter: OpaquePointer? = nil) {
        gtk_application_remove_accelerator(GTK_APPLICATION(self.GOBJECT), actionName, parameter)
    }
    
    open func removeWindow(_ window: CGTKWindow) {
        gtk_application_remove_window(GTK_APPLICATION(self.GOBJECT), window.WINDOW)
    }
    
    open func setAccels(_ accels: UnsafePointer<UnsafePointer<gchar>?>!, forAction actionName: String) {
        gtk_application_set_accels_for_action(GTK_APPLICATION(self.GOBJECT), actionName, accels)
    }
    
    open func setAppMenu(_ menu: UnsafeMutablePointer<GMenuModel>!) {
        gtk_application_set_app_menu(GTK_APPLICATION(self.GOBJECT), menu)
    }
    
    open func setMenubar(_ menubar: UnsafeMutablePointer<GMenuModel>!) {
        gtk_application_set_menubar(GTK_APPLICATION(self.GOBJECT), menubar)
    }
    
    open func uninhibit(cookie: guint) {
        gtk_application_uninhibit(GTK_APPLICATION(self.GOBJECT), cookie)
    }
    
    @discardableResult
    public func run(_ body: @escaping (CGTKApplicationWindow) -> Void) -> Int {
        self.applicationCallback = body
        
        CGTKSignalConnector.connect(gpointer: self.GOBJECT, signal: "activate") { [unowned self] (ptr) in
            
            self.activate()
        }
        
        let status = g_application_run(G_APPLICATION(self.GOBJECT), CommandLine.argc, CommandLine.unsafeArgv)
        
        return Int(status)
    }
    
    fileprivate func activate() {
        let window = CGTKApplicationWindow(application: self)
        self.applicationCallback?(window)
        window.showAll()
        
        self.applicationWindow = window
    }
}
