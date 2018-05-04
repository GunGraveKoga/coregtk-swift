//
//  CGTKBase.swift
//  test
//
//  Created by Юрий Вовк on 26.04.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

import Foundation

@_exported import CGtk

open class CGTKBase {
    private var __gObject: UnsafeMutableRawPointer? = nil
    
    public var GOBJECT: UnsafeMutablePointer<GObject>! {
        get {
            return G_OBJECT(__gObject)
        }
    }
    
    public var WIDGET: UnsafeMutablePointer<GtkWidget>! {
        get {
            return GTK_WIDGET(self.GOBJECT)
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
    
    public required init?(withGObject object: UnsafeMutableRawPointer?) {
        guard object != nil else {
            return nil
        }
        
        self.setGObject(object)
    }
    
    public required convenience init?(withGtkWidget widget: UnsafeMutablePointer<GtkWidget>?) {
        self.init(withGObject: widget)
    }
    
    deinit {
        if __gObject != nil {
            g_object_unref(__gObject)
            __gObject = nil
        }
    }
}
