//
//  ViewController.swift
//  GrandMenuDemo
//
//  Created by Tyrant on 1/15/16.
//  Copyright © 2016 Qfq. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tbMenu:UITableView?
    var arrMenu:[String] = ["使用ViewController","使用View"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "GrandMenuDemo"
        tbMenu = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
        tbMenu?.dataSource = self
        tbMenu?.delegate = self
        tbMenu?.tableFooterView = UIView()
        view.addSubview(tbMenu!)

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = arrMenu[indexPath.row]
        return cell!
    }
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(indexPath.row){
        case 0:
            navigationController?.pushViewController(ViewControllerDemoViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(ViewDemoViewController(), animated: true)
            
        default:break
            
        }
    }


}

extension UIColor {
    static func allColors()->[UIColor]{
        return [UIColor.redColor(),UIColor.blackColor(),UIColor.blueColor(),UIColor.brownColor(),UIColor.orangeColor(),UIColor.purpleColor(),UIColor.grayColor(),UIColor.lightGrayColor(),UIColor.lightTextColor(),UIColor.darkGrayColor(),UIColor.darkTextColor(),UIColor.cyanColor(),UIColor.yellowColor(),UIColor.magentaColor(),UIColor.clearColor()]
    }
}
