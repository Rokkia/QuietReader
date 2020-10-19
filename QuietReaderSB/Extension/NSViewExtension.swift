//
//  NSViewExtension.swift
//  QuietReader
//
//  Created by Rokkia on 2020/7/31.
//  Copyright © 2020 hzj. All rights reserved.
//

import Cocoa

extension NSView{
    var backgroundColor: NSColor? {

        get {
            if let colorRef = self.layer?.backgroundColor {
                return NSColor(cgColor: colorRef)
            } else {
                return nil
            }
        }

        set {
            DispatchQueue.main.async {
                self.wantsLayer = true
                self.layer?.backgroundColor = newValue?.cgColor
            }
        }
    }
}
