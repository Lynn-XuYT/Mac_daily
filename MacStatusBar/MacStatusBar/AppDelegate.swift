//
//  AppDelegate.swift
//  MacStatusBar
//
//  Created by Lynn on 2018/8/9.
//  Copyright © 2018年 DP. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = NSMenu();
    
    let popver = NSPopover()
    var eventMonitor: EventMonitor?
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        if let button = statusItem.button {
            let img = NSImage(named: NSImage.Name(rawValue: "console"))
            button.image = img
            // 1. 添加点击事件
            button.action = #selector(onclick(sender:))
        }
        
        // 下拉菜单
//        menu.addItem(withTitle: "add", action: #selector(add(sender:)), keyEquivalent: "A")
//        menu.addItem(NSMenuItem.separator())
//        menu.addItem(withTitle: "del", action: #selector(del(sender:)), keyEquivalent: "d")
//        statusItem.menu = menu
        
        popver.contentViewController = PopverViewController.loadFromNib()
        
        eventMonitor = EventMonitor(mask: [.leftMouseUp, .rightMouseUp], handler: { (event)->() in
            if self.popver.isShown {
                self.closePopverView(sender: event!)
            }
        })
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    // show popverView
    func showPopverView(sender: AnyObject) {
        if let button = statusItem.button {
            popver.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
            eventMonitor?.start()
        }
    }
    // close popverView
    func closePopverView(sender: AnyObject) {
        popver.performClose(sender)
        eventMonitor?.stop()
    }
    
    @objc func onclick(sender: AnyObject) {
        print("onclick")
        if popver.isShown {
            popver.performClose(sender)
        }
        else
        {
            showPopverView(sender: sender)
        }
    }
    
    @objc func add(sender: AnyObject) {
        print("add")
    }
    
    @objc func del(sender: AnyObject) {
        print("del")
    }
}

