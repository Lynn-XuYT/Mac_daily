//
//  Song.swift
//  MacArrayController
//
//  Created by Lynn on 2018/8/8.
//  Copyright © 2018年 DP. All rights reserved.
//

import Cocoa

class Song: NSObject {

    var name: String? = "A NEW SONG"
    //var singer: String? = "SINGER"
    var bpm: Int = 100
    
    override init() {
        super.init()
        name = "NEW SONG"
        bpm = 200
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "name" {
            name = value as? String;
        }else if key == "bpm" {
            bpm = value as! Int
        }
    }
    
    override func value(forKey key: String) -> Any? {
        if key == "name" {
            return name
        }else if key == "bpm" {
            return bpm;
        }
        return nil;
    }
    
}
