//
//  ViewController.swift
//  MacOutlineView
//
//  Created by Lynn on 2018/8/9.
//  Copyright © 2018年 DP. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var treeController: NSTreeController!
    @IBOutlet weak var outlineView: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func addData(){
        let root = [
            "name":"Library",
//            "isLeaf":false
            ] as [String : Any]
        
        let dict: NSMutableDictionary = NSMutableDictionary(dictionary: root)
        dict.setObject([PlayList(),PlayList()], forKey: "children" as NSCopying)
        
        treeController.addObject(dict)
    }

}

