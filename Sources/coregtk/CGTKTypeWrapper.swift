//
//  CGTKTypeWrapper.swift
//  test
//
//  Created by Юрий Вовк on 28.04.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

import Foundation
@_exported import CGtk

open class CGTKTypeWrapper {
    private var _ptrValue: UnsafeMutableRawPointer? = nil
    private var _gintValue: gint = 0
    
    public var gintValue: gint {
        get {
            return _gintValue
        }
    }
    
    public func asGValuePtr() -> UnsafeMutablePointer<GValue> {
        return _ptrValue!.assumingMemoryBound(to: GValue.self)
    }
}
