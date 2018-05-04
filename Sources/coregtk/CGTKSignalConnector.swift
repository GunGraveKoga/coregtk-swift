//
//  CGTKSignalConnector.swift
//  test
//
//  Created by Yury Vovk on 27.04.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

import Foundation
@_exported import CGtk

public enum CGTKSignalConnector {
    
    public static func connect(gpointer: UnsafeMutableRawPointer, signal: String, body: @escaping (UnsafeMutableRawPointer!) -> Swift.Void) {
        
        swift_g_signal_connect(gpointer, signal, body)
    }
}
