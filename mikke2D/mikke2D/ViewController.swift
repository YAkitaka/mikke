//
//  ViewController.swift
//  mikke2D
//
//  Created by 山下　耀崇 on 2018/10/17.
//  Copyright © 2018年 山下　耀崇. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
   
    //var mc = mouse()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let resizableview = ResizableView(from: NSRect(x: 50, y: 100, width: 100, height: 50))
        self.view.addSubview(resizableview)
        */
 
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var Xtext: NSTextFieldCell!
    @IBOutlet weak var Ytext: NSTextFieldCell!
    
    //クリックして離した場所のmouseの座標
    override func mouseUp(with event: NSEvent){
        let clickPos = CGPoint(x: event.locationInWindow.x, y: event.locationInWindow.y)
        Xtext.stringValue = "X座標 -> \(clickPos.x) "
        Ytext.stringValue = "Y座標 -> \(clickPos.y) "
    }
    
    //マウスの座標移動
    func moveMouse(dx: CGFloat, dy: CGFloat) {
        var location = NSEvent.mouseLocation
        for screen in NSScreen.screens {
            if screen.frame.contains(location) {
                location = CGPoint(x: location.x, y: NSHeight(screen.frame) - location.y)
                location = CGPoint(x: location.x - dx, y: location.y + dy)
                CGDisplayMoveCursorToPoint(0, location)
                break
            }
        }
    }
    
   
}

