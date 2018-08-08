//
//  ViewController.swift
//  MacCollection
//
//  Created by Lynn on 2018/8/8.
//  Copyright © 2018年 DP. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {

    let reuse = "MCCollectionLabelItem";
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: reuse), for: indexPath);
        return item;
    }
}

// NSCollectionView的布局方法
extension ViewController: NSCollectionViewDelegateFlowLayout {
    // 返回Item的size
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize.init(width: 180, height: 40)
    }
}

