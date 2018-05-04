//
//  CGTKBaseBuilder.swift
//  test
//
//  Created by Yury Vovk on 03.05.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

import Foundation

@_exported import CGtk

public typealias CGTKSignalHandler = (UnsafeMutableRawPointer!) -> Swift.Void

fileprivate let connector:GtkBuilderConnectFunc = {builder, object, signal_name, handler_name, connect_object, flags, user_data in
    
    let signalName = String(utf8String: signal_name!)!
    let handlerName = String(utf8String: handler_name!)!
    
    print("Signal name = \(signalName)")
    print("Handler name = \(handlerName)")
    
    let dict = user_data!.assumingMemoryBound(to: [String: CGTKSignalHandler].self).pointee
    
    if let signalHandler = dict[handlerName] {
        CGTKSignalConnector.connect(gpointer: object!, signal: signalName, body: signalHandler)
    } else {
        print("Unknown handler \(handlerName)")
    }
}

public enum CGTKBaseBuilder {
    public static func getWidget<T>(withName name: String, fromBuilder builder: CGTKBuilder) -> T? where T: CGTKWidget {
        
        let objPtr = builder.getObject(name: name)
        
        guard GTK_IS_WIDGET(objPtr) else {
            return nil
        }
        
        return T.init(withGObject:objPtr)
    }
    
    public static func connectSignals(_ signalsDictionary: inout [String: CGTKSignalHandler], withBuilder builder: CGTKBuilder) {
        
        let rawDict = UnsafeMutableRawPointer(&signalsDictionary)
        
        builder.connectSignalsFull(function: connector, userData: rawDict)
    }
}
