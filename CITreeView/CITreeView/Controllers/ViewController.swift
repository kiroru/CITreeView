//
//  ViewController.swift
//  CITreeView
//
//  Created by Apple on 24.01.2018.
//  Copyright © 2018 Cenk Işık. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var data : [CITreeViewData] = []
    //var treeView:CITreeView!
    var initialized = false
    
    let treeViewCellIdentifier = "TreeViewCellIdentifier"
    let treeViewCellNibName = "CITreeViewCell"

    @IBOutlet weak var sampleTreeView: CITreeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        data = CITreeViewData.getDefaultCITreeViewData()
        sampleTreeView.collapseNoneSelectedRows = false
        sampleTreeView.register(UINib(nibName: treeViewCellNibName, bundle: nil), forCellReuseIdentifier: treeViewCellIdentifier)
    }
    
    @IBAction func reloadBarButtonAction(_ sender: UIBarButtonItem) {
        let expandSample = data[5].children[1].children[2]
        print("expandSample:\(expandSample.name)")
        sampleTreeView.expandRowForNodeItem(expandSample, itemMatcher: {
            guard let lhs = $0 as? CITreeViewData,
                  let rhs = $1 as? CITreeViewData else { return false }
            return lhs === rhs
        })
//        sampleTreeView.expandAllRows()
    }
    @IBAction func collapseAllRowsBarButtonAction(_ sender: UIBarButtonItem) {
        sampleTreeView.collapseAllRows()
        
    }
}

extension ViewController : CITreeViewDelegate {
    func treeViewDidReloadData(_ treeView: CITreeView, changeStat: Bool) {
        if !initialized {
            let expandSample = data[5].children[1].children[2]
            print("expandSample:\(expandSample.name)")
            sampleTreeView.expandRowForNodeItem(expandSample, itemMatcher: {
                guard let lhs = $0 as? CITreeViewData,
                      let rhs = $1 as? CITreeViewData else { return false }
                return lhs === rhs
            })
            initialized = true
        }
    }

    func treeViewNode(_ treeViewNode: CITreeViewNode, willExpandAt indexPath: IndexPath) {
        
    }
    
    func treeViewNode(_ treeViewNode: CITreeViewNode, didExpandAt indexPath: IndexPath) {
        
    }
    
    func treeViewNode(_ treeViewNode: CITreeViewNode, willCollapseAt indexPath: IndexPath) {
        
    }
    
    func treeViewNode(_ treeViewNode: CITreeViewNode, didCollapseAt indexPath: IndexPath) {
        
    }
    
    func treeView(_ treeView: CITreeView, heightForRowAt indexPath: IndexPath, with treeViewNode: CITreeViewNode) -> CGFloat {
        return 60
    }
    
    func treeView(_ treeView: CITreeView, didSelectRowAt treeViewNode: CITreeViewNode, at indexPath: IndexPath) {
        
    }
    
    func treeView(_ treeView: CITreeView, didDeselectRowAt treeViewNode: CITreeViewNode, at indexPath: IndexPath) {
        if let parentNode = treeViewNode.parentNode{
            print(parentNode.item)
        }
    }
}

extension ViewController : CITreeViewDataSource {
    func treeViewAncestors(for treeViewNodeItem: Any) -> [Any] {
        guard let item = treeViewNodeItem as? CITreeViewData else { return [] }
        let ancestors = data.getAncestorsArray(of: item)
        print("ancestors:\(ancestors.map { $0.name })")
        return ancestors
    }

    func treeViewSelectedNodeChildren(for treeViewNodeItem: Any) -> [Any] {
        if let dataObj = treeViewNodeItem as? CITreeViewData {
            return dataObj.children
        }
        return []
    }
    
    func treeViewDataArray() -> [Any] {
        return data
    }
    
    func treeView(_ treeView: CITreeView, cellForRowAt indexPath: IndexPath, with treeViewNode: CITreeViewNode) -> UITableViewCell {
        let cell = treeView.dequeueReusableCell(withIdentifier: treeViewCellIdentifier) as! CITreeViewCell
        let dataObj = treeViewNode.item as! CITreeViewData
        cell.nameLabel.text = dataObj.name
        cell.setupCell(level: treeViewNode.level)
        
        return cell;
    }

}

private extension Array where Element == CITreeViewData {
    func getAncestorsArray(of data: CITreeViewData) -> [CITreeViewData] {
        var searchArray: [CITreeViewData] = []
        for child in self {
            if child.searchRecursive(of: data, with: &searchArray) {
                break
            }
        }
        return searchArray
    }
}

private extension CITreeViewData {
    func searchRecursive(of data: CITreeViewData, with matched: inout [CITreeViewData]) -> Bool {
        if self === data {
            matched.insert(self, at: 0)
            return true
        }
        for child in children {
            if child.searchRecursive(of: data, with: &matched) {
                matched.insert(self, at: 0)
                return true
            }
        }
        return false
    }
}
