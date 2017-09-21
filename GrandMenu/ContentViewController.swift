
//
//  ContentViewController.swift
//  DemoLayout
//
//  Created by Stan Hu on 11/6/2017.
//  Copyright © 2017 Stan Hu. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var canScroll = false;
    var tableView = UITableView()
    var fingerIsTouch = false
    var arrData:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView = UITableView()
       tableView.dataSource = self
        tableView.delegate = self
        arrData = [String]()
        for _ in 0...40
        {
            arrData?.append("Controller1")
        }
        view.addSubview(tableView)
    }
    override func viewWillLayoutSubviews() {
       tableView.frame = self.view.bounds
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


    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        fingerIsTouch = true
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        fingerIsTouch = false
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !canScroll{
            scrollView.contentOffset = CGPoint()
        }
        if scrollView.contentOffset.y <= 0{
            canScroll = false
            scrollView.contentOffset = CGPoint()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "leaveTop"), object: nil)
        }
        tableView.showsVerticalScrollIndicator = canScroll
    }

}




