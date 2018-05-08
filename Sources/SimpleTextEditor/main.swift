
import Foundation
import CoreGTK

CGTK.initialize()

let editor = SimpleTextEditor()

if editor == nil {
    exit(1)
}

editor!.show()

CGTK.main()
