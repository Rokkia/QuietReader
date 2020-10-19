//
//  MainWindowController.swift
//  QuietReaderSB
//
//  Created by Rokkia on 2020/8/3.
//  Copyright © 2020 hzj. All rights reserved.
//

import Cocoa

enum MainState {
    case bookshelf, shop
}

class MainWindowController: BaseWindowController {
    
    @IBOutlet weak var bookshelfButton: NSButton!
    
    @IBOutlet weak var shopButton: NSButton!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    @IBAction func handleShopClick(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNOTIMAINSTATE), object: nil, userInfo: [kNOTIMAINISTATEKEY: MainState.shop])
    }
    @IBAction func handleBookShelfClick(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNOTIMAINSTATE), object: nil, userInfo: [kNOTIMAINISTATEKEY: MainState.bookshelf])
    }
}
