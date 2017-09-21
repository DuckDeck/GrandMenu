//
//  TBViewController.swift
//  GrandMenuDemo
//
//  Created by Stan Hu on 21/9/2017.
//  Copyright © 2017 Qfq. All rights reserved.
//

import UIKit

class TBViewController: GrandContentViewController {

    var arrData:[String]?
    
    override func viewDidLoad() {
       super.viewDidLoad()
        arrData = [String]()
        for i in 0...40
        {
            arrData?.append("Controller\(i)")
        }
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = self.view.bounds
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData!.count
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentity = "vc1"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentity)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentity)
        }
        cell?.textLabel?.text = arrData![(indexPath as NSIndexPath).row]
        return cell!
    }
    
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        fingerIsTouch = true
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        fingerIsTouch = false
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
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
