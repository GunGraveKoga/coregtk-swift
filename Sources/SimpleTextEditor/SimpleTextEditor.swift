

import Foundation
import coregtk

final class SimpleTextEditor {
    private var textView: CGTKTextView!
    private var window: CGTKWindow!
    
    public var text: String? {
        get {
            var start = GtkTextIter(), end = GtkTextIter()
            let buffer = textView.getBuffer()
            
            gtk_text_buffer_get_bounds(buffer, &start, &end)
            if let gText = gtk_text_buffer_get_text(buffer, &start, &end, 0) {
                let text = String(utf8String: gText)
                
                defer {
                    g_free(gText)
                }
                
                return text
            }
            
            return nil
        }
        
        set {
            let buffer = textView.getBuffer()
            
            gtk_text_buffer_set_text(buffer, newValue, Int32(newValue?.lengthOfBytes(using: .utf8) ?? 0))
        }
    }
    
    public init?() {
        let builder = CGTKBuilder()
        
        if builder.addFromFile(filename: "gui.glade") == 0 {
            return nil
        }
        
        var signalsDict: [String: CGTKSignalHandler] = [
            "winMain_Destroy": {[unowned self] widget in
                self.winMain_Destroy()
            },
            "btnNew_Clicked": {[unowned self] widget in
                self.btnNew_Clicked()
            },
            "btnOpen_Clicked": {[unowned self] widget in
                self.btnOpen_Clicked()
            },
            "btnSave_Clicked": {[unowned self] widget in
                self.btnSave_Clicked()
            }
        ]
        
        CGTKBaseBuilder.connectSignals(&signalsDict, withBuilder: builder)
        
        guard let _window: CGTKWindow = CGTKBaseBuilder.getWidget(withName: "winMain", fromBuilder: builder) else {
            return nil
        }
        
        self.window = _window
        
        guard let _textView: CGTKTextView = CGTKBaseBuilder.getWidget(withName: "txtView", fromBuilder: builder) else {
            return nil
        }
        
        self.textView = _textView
    }
    
    fileprivate func winMain_Destroy() {
        CGTK.mainQuit()
    }
    
    fileprivate func btnSave_Clicked() {
        if let fileName = MultiDialog.presentSaveDialog(self.window) {
            do {
                try self.text?.write(toFile: fileName, atomically: true, encoding: .utf8)
            } catch let error {
                print("Error saving: \(error)")
            }
        }
    }
    
    fileprivate func btnOpen_Clicked() {
        self.text = MultiDialog.presentOpenDialog(self.window)
    }
    
    fileprivate func btnNew_Clicked() {
        self.text = ""
    }
    
    public func show() {
        self.window.showAll()
    }
}
