//
//  GrandMenuTable.swift
//  GrandMenuDemo
//
//  Created by Tyrant on 1/15/16.
//  Copyright © 2016 Qfq. All rights reserved.
//

import UIKit

class GrandMenuTable: UIView,UITableViewDataSource,UITableViewDelegate {
    var tb:UITableView?
    var arrData:[UIViewController]?
    var scrollToIndex:((index:Int)->Void)?
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(frame:CGRect,arrContent:[UIViewController]){
        self.init(frame:frame)
        arrData = arrContent
        tb = UITableView()
        tb?.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        tb?.frame = self.bounds
        tb?.bounces = false
        tb?.scrollsToTop = true
        tb?.pagingEnabled = true
        tb?.separatorStyle = .None
        tb?.showsVerticalScrollIndicator = false
        tb?.delegate = self
        tb?.dataSource = self
        addSubview(tb!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData!.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            cell?.selectionStyle = .None
            cell?.contentView.backgroundColor = UIColor.clearColor()
        }
        let v = arrData![indexPath.row]
        v.view.frame = cell!.bounds
        cell?.contentView.addSubview(v.view)
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.frame.size.width
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.y / self.frame.size.width
        if let sc = scrollToIndex{
            sc(index: Int(index))
        }
    }
    
    func selectIndex(index:Int){
        UIView.animateWithDuration(0.3) { () -> Void in
            self.tb?.scrollToRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0), atScrollPosition: .None, animated: false)
        }
    }

}
