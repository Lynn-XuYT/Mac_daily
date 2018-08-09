//
//  EventMonitor.swift
//  MacStatusBar
//
//  Created by Lynn on 2018/8/9.
//  Copyright © 2018年 DP. All rights reserved.
//

import Cocoa

class EventMonitor{
    private var monitor: AnyObject?
    private var mask: NSEvent.EventTypeMask
    private var handler: (NSEvent?) ->()
    init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) ->()) {
        self.mask = mask;
        self.handler = handler;
    }
    
    deinit {
        stop();
    }
    
    func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler) as AnyObject
    }
    
    func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
