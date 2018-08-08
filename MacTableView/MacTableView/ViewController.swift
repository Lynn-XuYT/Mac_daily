//
//  ViewController.swift
//  MacTableView
//
//  Created by Lynn on 2018/8/8.
//  Copyright © 2018年 DP. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource, NSTextFieldDelegate {

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    var array = ["banana", "apple", "cherry", "watermelon", "orange"]
    
    var index = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    @IBAction func addRow(_ sender: Any?) {
        let text = textField.stringValue
        if text.count == 0 {
            return
        }
        array.append(text)
        textField.stringValue = ""
        tableView.reloadData()
    }
    
    @IBAction func delRow(_ sender: Any) {
        if index != -1 {
            array.remove(at: index)
            tableView.reloadData()
            index = -1
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return array[row]
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let row = tableView.selectedRow
        index = row
    }
    
    override func controlTextDidEndEditing(_ obj: Notification) {
        addRow(nil)
    }
    
    
}

