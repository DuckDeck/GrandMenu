
//
//  ContentViewController.swift
//  DemoLayout
//
//  Created by Stan Hu on 11/6/2017.
//  Copyright © 2017 Stan Hu. All rights reserved.
//

import UIKit

class ContentViewController: UITableViewController {

    var canScroll = false;
    var fingerIsTouch = false

    override func viewWillLayoutSubviews() {
        tableView.frame = self.view.bounds
    }
    
 
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        fingerIsTouch = true
    }
    
  override  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
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
