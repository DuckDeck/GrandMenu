
//
//  ContentViewController.swift
//  DemoLayout
//
//  Created by Stan Hu on 11/6/2017.
//  Copyright © 2017 Stan Hu. All rights reserved.
//

import UIKit

open class GrandContentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    open var canScroll = false;
    open var tableView = UITableView()
    open var fingerIsTouch = false
    
    override open func viewDidLoad() {
        super.viewDidLoad()
       tableView = UITableView()
       tableView.dataSource = self
       tableView.delegate = self
        view.addSubview(tableView)
    }
    override open func viewWillLayoutSubviews() {
       tableView.frame = self.view.bounds
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        fingerIsTouch = true
    }

    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        fingerIsTouch = false
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
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




