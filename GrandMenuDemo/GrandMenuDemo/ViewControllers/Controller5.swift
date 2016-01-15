
//
//  Controller5.swift
//  Demo
//
//  Created by Tyrant on 1/14/16.
//
//

import UIKit

class Controller5: UIViewController,UITableViewDataSource {
    var tb:UITableView?
    var arrData:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tb = UITableView()
        tb?.dataSource = self
        arrData = [String]()
        for _ in 0...40
        {
            arrData?.append("Controller5")
        }
        view.addSubview(tb!)
    }
    override func viewWillLayoutSubviews() {
        tb?.frame = self.view.bounds
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
}
