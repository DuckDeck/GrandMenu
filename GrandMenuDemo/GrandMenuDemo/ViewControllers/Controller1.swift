//
//  Controller1.swift
//  Demo
//
//  Created by Tyrant on 1/14/16.
//
//

import UIKit

class Controller1: UIViewController,UITableViewDataSource {
    var tb:UITableView?
    var arrData:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tb = UITableView()
        tb?.dataSource = self
        arrData = [String]()
        for _ in 0...40
        {
            arrData?.append("Controller1")
        }
        view.addSubview(tb!)
        view.addObserver(self, forKeyPath: "frame", options: [NSKeyValueObservingOptions.New,NSKeyValueObservingOptions.Old], context: nil)
    }
    override func viewWillLayoutSubviews() {
        tb?.frame = self.view.bounds
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        print("keyPath:\(keyPath!)")
        print(change)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentity = "vc1"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentity)
        if cell == nil{
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentity)
        }
        cell?.textLabel?.text = arrData![indexPath.row]
        return cell!
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        view.removeObserver(self, forKeyPath: "frame")
    }
}
