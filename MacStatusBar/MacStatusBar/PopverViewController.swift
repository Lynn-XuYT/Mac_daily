//
//  PopverViewController.swift
//  MacStatusBar
//
//  Created by Lynn on 2018/8/9.
//  Copyright © 2018年 DP. All rights reserved.
//

import Cocoa

class PopverViewController: NSViewController {

    class func loadFromNib()->PopverViewController {
        let sb = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        return sb.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "PopverViewController")) as! PopverViewController
    } 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
