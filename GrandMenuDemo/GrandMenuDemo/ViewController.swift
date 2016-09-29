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
        tbMenu = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        tbMenu?.dataSource = self
        tbMenu?.delegate = self
        tbMenu?.tableFooterView = UIView()
        view.addSubview(tbMenu!)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = arrMenu[(indexPath as NSIndexPath).row]
        return cell!
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch((indexPath as NSIndexPath).row){
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
        return [UIColor.red,UIColor.black,UIColor.blue,UIColor.brown,UIColor.orange,UIColor.purple,UIColor.gray,UIColor.lightGray,UIColor.lightText,UIColor.darkGray,UIColor.darkText,UIColor.cyan,UIColor.yellow,UIColor.magenta,UIColor.clear]
    }
}
