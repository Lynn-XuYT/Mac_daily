//
//  PlayList.swift
//  MacOutlineView
//
//  Created by Lynn on 2018/8/9.
//  Copyright © 2018年 DP. All rights reserved.
//

import Cocoa

class PlayList: NSObject {

    @objc dynamic var name: String = "New Playlist"
    @objc dynamic var creator: String = "User"
//    @objc dynamic var isLeaf: Bool = true
    func isLeaf() -> Bool {
        return true
    }
    
    override func value(forUndefinedKey key: String) -> Any? {
        print("hahahh")
        return nil
    }
}
