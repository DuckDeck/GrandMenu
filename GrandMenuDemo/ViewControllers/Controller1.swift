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
    }
    override func viewWillLayoutSubviews() {
        tb?.frame = self.view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentity = "vc1"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentity)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentity)
        }
        cell?.textLabel?.text = arrData![(indexPath as NSIndexPath).row]
        return cell!
    }
    

}
