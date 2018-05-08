
import Foundation
import CoreGTK

enum MultiDialog {
    static func presentOpenDialog() -> String? {
        let dialog = CGTKFileChooserDialog(withTitle: "Open File", parent: nil, action: GTK_FILE_CHOOSER_ACTION_OPEN, [("_Cancel", GTK_RESPONSE_CANCEL), ("_Open", GTK_RESPONSE_ACCEPT)])
        
        defer {
            dialog.destroy()
        }
        
        let result = dialog.run()
        
        guard result == GTK_RESPONSE_ACCEPT.rawValue else {
            return nil
        }
        
        return dialog.getFilename()
    }
    
    static func presentSaveDialog() -> String? {
        let dialog = CGTKFileChooserDialog(withTitle: "Save File", parent: nil, action: GTK_FILE_CHOOSER_ACTION_SAVE, [("_Cancel", GTK_RESPONSE_CANCEL), ("_Save", GTK_RESPONSE_ACCEPT)])
        
        defer {
            dialog.destroy()
        }
        
        dialog.setDoOverwriteConfirmation(true)
        dialog.setCurrentName("Untitled document")
        
        let result = dialog.run()
        
        guard result == GTK_RESPONSE_ACCEPT.rawValue else {
            return nil
        }
        
        return dialog.getFilename()
    }
}
