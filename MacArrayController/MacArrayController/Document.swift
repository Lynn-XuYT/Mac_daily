//
//  Document.swift
//  MacArrayController
//
//  Created by Lynn on 2018/8/8.
//  Copyright © 2018年 DP. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    let song1:Song = Song()
    let song2:Song = Song()
    let song3:Song = Song()
    var songs:[Song] = []
    
    override init() {
        super.init()
        songs = [song1, song2,song3]
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
    override func value(forKey key: String) -> Any? {
//        let value = self.value(forKey: key);
        return songs
    }
    
    override func setNilValueForKey(_ key: String) {
        super.setValue("hahaha", forKey: key)
    }
}

