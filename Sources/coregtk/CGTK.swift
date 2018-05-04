//
//  CGTKApplication.swift
//  test
//
//  Created by Yury Vovk on 27.04.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

import Foundation

@_exported import CGtk

@inline(__always) func G_TYPE_MAKE_FUNDAMENTAL(_ x: UInt) -> GType {
    return x << G_TYPE_FUNDAMENTAL_SHIFT
}

public let G_TYPE_INVALID: GType = G_TYPE_MAKE_FUNDAMENTAL(0)
public let G_TYPE_NONE: GType = G_TYPE_MAKE_FUNDAMENTAL(1)
public let G_TYPE_INTERFACE: GType = G_TYPE_MAKE_FUNDAMENTAL(2)
public let G_TYPE_CHAR: GType = G_TYPE_MAKE_FUNDAMENTAL(3)
public let G_TYPE_UCHAR: GType = G_TYPE_MAKE_FUNDAMENTAL(4)
public let G_TYPE_BOOLEAN: GType = G_TYPE_MAKE_FUNDAMENTAL(5)
public let G_TYPE_INT: GType = G_TYPE_MAKE_FUNDAMENTAL(6)
public let G_TYPE_UINT: GType = G_TYPE_MAKE_FUNDAMENTAL(7)
public let G_TYPE_LONG: GType = G_TYPE_MAKE_FUNDAMENTAL(8)
public let G_TYPE_ULONG: GType = G_TYPE_MAKE_FUNDAMENTAL(9)
public let G_TYPE_INT64: GType = G_TYPE_MAKE_FUNDAMENTAL(10)
public let G_TYPE_UINT64: GType = G_TYPE_MAKE_FUNDAMENTAL(11)
public let G_TYPE_ENUM: GType = G_TYPE_MAKE_FUNDAMENTAL(12)
public let G_TYPE_FLAGS: GType = G_TYPE_MAKE_FUNDAMENTAL(13)
public let G_TYPE_FLOAT: GType = G_TYPE_MAKE_FUNDAMENTAL(14)
public let G_TYPE_DOUBLE: GType = G_TYPE_MAKE_FUNDAMENTAL(15)
public let G_TYPE_STRING: GType = G_TYPE_MAKE_FUNDAMENTAL(16)
public let G_TYPE_POINTER: GType = G_TYPE_MAKE_FUNDAMENTAL(17)
public let G_TYPE_BOXED: GType = G_TYPE_MAKE_FUNDAMENTAL(18)
public let G_TYPE_PARAM: GType = G_TYPE_MAKE_FUNDAMENTAL(19)
public let G_TYPE_OBJECT: GType = G_TYPE_MAKE_FUNDAMENTAL(20)
public let G_TYPE_VARIANT: GType = G_TYPE_MAKE_FUNDAMENTAL(21)
public let G_TYPE_FUNDAMENTAL_MAX: GType = G_TYPE_MAKE_FUNDAMENTAL(255)

@inline(__always) public func G_TYPE_IS_FUNDAMENTAL(_ type: GType) -> Bool {
    return type <= G_TYPE_FUNDAMENTAL_MAX
}

@inline(__always) public func G_TYPE_IS_DERIVED(_ type: GType) -> Bool {
    return type > G_TYPE_FUNDAMENTAL_MAX
}

@inline(__always) public func G_TYPE_IS_INTERFACE(_ type: GType) -> Bool {
    return g_type_fundamental(type) == G_TYPE_INTERFACE
}

@inline(__always) public func G_TYPE_IS_CLASSED(_ type: GType) -> Bool {
    return g_type_test_flags(type, G_TYPE_FLAG_CLASSED.rawValue) != 0
}

@inline(__always) public func G_TYPE_IS_INSTANTIATABLE(_ type: GType) -> Bool {
    return g_type_test_flags(type, G_TYPE_FLAG_INSTANTIATABLE.rawValue) != 0
}

@inline(__always) public func G_TYPE_IS_DERIVABLE(_ type: GType) -> Bool {
    return g_type_test_flags(type, G_TYPE_FLAG_DERIVABLE.rawValue) != 0
}

@inline(__always) public func G_TYPE_IS_DEEP_DERIVABLE(_ type: GType) -> Bool {
    return g_type_test_flags(type, G_TYPE_FLAG_DEEP_DERIVABLE.rawValue) != 0
}

@inline(__always) public func G_TYPE_IS_ABSTRACT(_ type: GType) -> Bool {
    return g_type_test_flags(type, G_TYPE_FLAG_ABSTRACT.rawValue) != 0
}

@inline(__always) public func G_TYPE_IS_VALUE_ABSTRACT(_ type: GType) -> Bool {
    return g_type_test_flags(type, G_TYPE_FLAG_VALUE_ABSTRACT.rawValue) != 0
}

@inline(__always) public func G_TYPE_IS_VALUE_TYPE(_ type: GType) -> Bool {
    return g_type_check_is_value_type(type) != 0
}

@inline(__always) public func G_TYPE_HAS_VALUE_TABLE(_ type: GType) -> Bool {
    return g_type_value_table_peek(type) != nil
}

@inline(__always) public func G_TYPE_CHECK_INSTANCE(_ ptr: UnsafeMutableRawPointer!) -> Bool {
    return g_type_check_instance(ptr.assumingMemoryBound(to: GTypeInstance.self)) != 0
}

@inline(__always) public func G_TYPE_CHECK_INSTANCE_TYPE(_ ptr: UnsafeMutableRawPointer!, _ type: GType) -> Bool {
    return g_type_check_instance_is_a(ptr.assumingMemoryBound(to: GTypeInstance.self), type) != 0
}

@inline(__always) public func G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE(_ ptr: UnsafeMutableRawPointer!, _ type: GType) -> Bool {
    return g_type_check_instance_is_fundamentally_a(ptr.assumingMemoryBound(to: GTypeInstance.self), type) != 0
}

@inline(__always) public func G_TYPE_INSTANCE_GET_CLASS<T>(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<T>! {
    let instance = ptr.assumingMemoryBound(to: GTypeInstance.self)
    return instance.pointee.g_class.withMemoryRebound(to: T.self, capacity: 1) {
        return $0
    }
}

@inline(__always) public func G_TYPE_CHECK_INSTANCE_CAST<T>(_ ptr: UnsafeMutableRawPointer!, _ g_type: GType) -> UnsafeMutablePointer<T>! {
    let type = g_type_check_instance_cast(ptr.assumingMemoryBound(to: GTypeInstance.self), g_type)
    return type!.withMemoryRebound(to: T.self, capacity: 1) {
        return $0
    }
}

@inline(__always) public func G_TYPE_CHECK_INSTANCE_CAST(_ ptr: UnsafeMutableRawPointer!, _ g_type: GType) -> OpaquePointer! {
    let type = g_type_check_instance_cast(ptr.assumingMemoryBound(to: GTypeInstance.self), g_type)
    return OpaquePointer(type!)
}

@inline(__always) public func G_TYPE_INSTANCE_GET_INTERFACE<T>(_ ptr: UnsafeMutableRawPointer!, _ g_type: GType) -> UnsafeMutablePointer<T>! {
    let result = g_type_interface_peek(ptr.assumingMemoryBound(to: GTypeInstance.self).pointee.g_class, g_type)
    return result!.assumingMemoryBound(to: T.self)
}

@inline(__always) public func G_TYPE_CHECK_CLASS_CAST<T>(_ ptr: UnsafeMutableRawPointer!, _ g_type: GType) -> UnsafeMutablePointer<T>! {
    let result = g_type_check_class_cast(ptr.assumingMemoryBound(to: GTypeClass.self), g_type)
    return result!.withMemoryRebound(to: T.self, capacity: 1) {
        return $0
    }
}

@inline(__always) public func G_TYPE_CHECK_CLASS_TYPE(_ ptr: UnsafeMutableRawPointer!, _ g_type: GType) -> Bool {
    return g_type_check_class_is_a(ptr.assumingMemoryBound(to: GTypeClass.self), g_type) != 0
}

@inline(__always) public func G_TYPE_CHECK_VALUE(_ ptr: UnsafeMutableRawPointer!) -> Bool {
    return g_type_check_value(ptr.assumingMemoryBound(to: GValue.self)) != 0
}

@inline(__always) public func G_TYPE_CHECK_VALUE_TYPE(_ ptr: UnsafeMutableRawPointer, _ g_type: GType) -> Bool {
    return g_type_check_value_holds(ptr.assumingMemoryBound(to: GValue.self), g_type) != 0
}

@inline(__always) public func G_TYPE_FROM_INSTANCE(_ ptr: UnsafeMutableRawPointer!) -> GType {
    return G_TYPE_FROM_CLASS(ptr.assumingMemoryBound(to: GTypeInstance.self).pointee.g_class)
}

@inline(__always) public func G_TYPE_FROM_CLASS(_ ptr: UnsafeMutableRawPointer!) -> GType {
    return ptr.assumingMemoryBound(to: GTypeClass.self).pointee.g_type
}

@inline(__always) public func G_TYPE_FROM_INTERFACE(_ ptr: UnsafeMutableRawPointer!) -> GType {
    return ptr.assumingMemoryBound(to: GTypeInterface.self).pointee.g_type
}

@inline(__always) public func G_TYPE_INSTANCE_GET_PRIVATE<T>(_ ptr: UnsafeMutableRawPointer!, _ g_type: GType) -> UnsafeMutablePointer<T>! {
    let result = g_type_instance_get_private(ptr.assumingMemoryBound(to: GTypeInstance.self), g_type)
    return result!.assumingMemoryBound(to: T.self)
}

@inline(__always) public func G_TYPE_CLASS_GET_PRIVATE<T>(_ ptr: UnsafeMutableRawPointer!, _ g_type: GType) -> UnsafeMutablePointer<T>! {
    let result = g_type_class_get_private(ptr.assumingMemoryBound(to: GTypeClass.self), g_type)
    return result!.assumingMemoryBound(to: T.self)
}

@inline(__always) public func G_TYPE_IS_OBJECT(_ type: GType) -> Bool {
    return g_type_fundamental(type) == G_TYPE_OBJECT
}

@inline(__always) public func G_OBJECT(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GObject>! {
    return G_TYPE_CHECK_INSTANCE_CAST(ptr, G_TYPE_OBJECT)
}

@inline(__always) public func G_OBJECT_CLASS(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GObjectClass>! {
    return G_TYPE_CHECK_CLASS_CAST(ptr, G_TYPE_OBJECT)
}

@inline(__always) public func G_IS_OBJECT_CLASS(_ ptr: UnsafeMutableRawPointer!) -> Bool {
    return G_TYPE_CHECK_CLASS_TYPE(ptr, G_TYPE_OBJECT)
}

@inline(__always) public func G_OBJECT_GET_CLASS(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GObjectClass>! {
    return G_TYPE_INSTANCE_GET_CLASS(ptr)
}

@inline(__always) public func G_IS_OBJECT(_ ptr: UnsafeMutableRawPointer!) -> Bool {
    return G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE(ptr, G_TYPE_OBJECT)
}

@inline(__always) public func G_OBJECT_TYPE(_ ptr: UnsafeMutableRawPointer!) -> GType {
    return G_TYPE_FROM_INSTANCE(ptr)
}

@inline(__always) public func G_OBJECT_TYPE_NAME(_ ptr: UnsafeMutableRawPointer!) -> String? {
    guard let name = g_type_name(G_OBJECT_TYPE(ptr)) else {
        return nil
    }
    
    return String(cString: name)
}

@inline(__always) public func G_OBJECT_CLASS_TYPE(_ ptr: UnsafeMutableRawPointer!) -> GType {
    return G_TYPE_FROM_CLASS(ptr)
}

@inline(__always) public func G_OBJECT_CLASS_NAME(_ ptr: UnsafeMutableRawPointer!) -> String? {
    guard let name = g_type_name(G_OBJECT_CLASS_TYPE(ptr)) else {
        return nil
    }
    
    return String(cString:name)
}

@inline(__always) public func G_VALUE_HOLDS_OBJECT(_ ptr: UnsafeMutableRawPointer!) -> Bool {
    return G_TYPE_CHECK_VALUE_TYPE(ptr, G_TYPE_OBJECT)
}

public let G_TYPE_INITIALLY_UNOWNED: GType = g_initially_unowned_get_type()

@inline(__always) public func G_INITIALLY_UNOWNED(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GInitiallyUnowned>! {
    return G_TYPE_CHECK_INSTANCE_CAST(ptr, G_TYPE_INITIALLY_UNOWNED)
}

@inline(__always) public func G_INITIALLY_UNOWNED_CLASS(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GInitiallyUnownedClass>! {
    return G_TYPE_CHECK_CLASS_CAST(ptr, G_TYPE_INITIALLY_UNOWNED)
}

@inline(__always) public func G_IS_INITIALLY_UNOWNED(_ ptr: UnsafeMutableRawPointer!) -> Bool {
    return G_TYPE_CHECK_INSTANCE_TYPE(ptr, G_TYPE_INITIALLY_UNOWNED)
}

@inline(__always) public func G_IS_INITIALLY_UNOWNED_CLASS(_ ptr: UnsafeMutableRawPointer!) -> Bool {
    return G_TYPE_CHECK_CLASS_TYPE(ptr, G_TYPE_INITIALLY_UNOWNED)
}

@inline(__always) public func G_INITIALLY_UNOWNED_GET_CLASS(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GInitiallyUnownedClass>! {
    return G_TYPE_INSTANCE_GET_CLASS(ptr)
}

public let GTK_TYPE_WIDGET: GType = gtk_widget_get_type()
public let GTK_TYPE_REQUISITION: GType = gtk_requisition_get_type()

@inline(__always) public func GTK_WIDGET(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkWidget>! {
    return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_WIDGET)
}

@inline(__always) public func GTK_WIDGET_CLASS(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkWidgetClass>! {
    return G_TYPE_CHECK_CLASS_CAST(ptr, GTK_TYPE_WIDGET)
}

@inline(__always) public func GTK_IS_WIDGET(_ ptr: UnsafeMutableRawPointer!) -> Bool {
    return G_TYPE_CHECK_INSTANCE_TYPE(ptr, GTK_TYPE_WIDGET)
}

@inline(__always) public func GTK_IS_WIDGET_CLASS(_ ptr: UnsafeMutableRawPointer!) -> Bool {
    return G_TYPE_CHECK_CLASS_TYPE(ptr, GTK_TYPE_WIDGET)
}

@inline(__always) public func GTK_WIDGET_GET_CLASS(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkWidgetClass>! {
    return G_TYPE_INSTANCE_GET_CLASS(ptr)
}

public enum CGTK {
    public static func initialize() {
        var _argc = CommandLine.argc
        var _argv = CommandLine.unsafeArgv
        let argc = UnsafeMutablePointer(&_argc)
        let argv = UnsafeMutableRawPointer(&_argv)
        
        gtk_init(argc, argv.assumingMemoryBound(to:UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>?.self))
    }
    
    public static func main() {
        gtk_main()
    }
    
    public static func mainQuit() {
        gtk_main_quit()
    }
}
