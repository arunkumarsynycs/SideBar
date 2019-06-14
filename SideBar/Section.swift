

import UIKit

class SectionInfo {
    var isCollapsed = false
    var items: [String]
    var sectionTitle: String?
    
    init(sectionTitle: String,items: [String]) {
        self.items = items
        self.sectionTitle = sectionTitle
        self.isCollapsed = false
    }
}


