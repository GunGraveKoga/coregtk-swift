
import Foundation
import coregtk

enum MultiDialog {
    static func presentOpenDialog(_ parent: CGTKWindow) -> String? {
        let dialog = CGTKFileChooserDialog(withTitle: "Open File", parent: parent, action: GTK_FILE_CHOOSER_ACTION_OPEN, [("_Cancel", GTK_RESPONSE_CANCEL.rawValue), ("_Open", GTK_RESPONSE_ACCEPT.rawValue)])
        
        defer {
            dialog.destroy()
        }
        
        let result = dialog.run()
        
        guard result == GTK_RESPONSE_ACCEPT.rawValue else {
            return nil
        }
        
        return dialog.getFilename()
    }
    
    static func presentSaveDialog(_ parent: CGTKWindow) -> String? {
        let dialog = CGTKFileChooserDialog(withTitle: "Save File", parent: parent, action: GTK_FILE_CHOOSER_ACTION_SAVE, [("_Cancel", GTK_RESPONSE_CANCEL.rawValue), ("_Save", GTK_RESPONSE_ACCEPT.rawValue)])
        
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
