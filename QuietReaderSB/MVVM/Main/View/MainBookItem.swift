//
//  MainBookItem.swift
//  QuietReaderSB
//
//  Created by Rokkia on 2020/8/4.
//  Copyright © 2020 hzj. All rights reserved.
//

import Cocoa

class MainBookItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.backgroundColor = NSColor.gray
    }
    
}
