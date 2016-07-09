//
//  GrandMenuTable.swift
//  GrandMenuDemo
//
//  Created by Tyrant on 1/15/16.
//  Copyright © 2016 Qfq. All rights reserved.
//

import UIKit

public class GrandMenuTable: UIView,UITableViewDataSource,UITableViewDelegate {
   public  var tb:UITableView?
   private var arrViewControllers:[UIViewController]?
   private var arrViews:[UIView]?
   public var scrollToIndex:((index:Int)->Void)?
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
  public  convenience init(frame:CGRect,arrViewControllers:[UIViewController]){
        self.init(frame:frame)
        self.arrViewControllers = arrViewControllers
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
    
    public convenience init(frame:CGRect,arrViews:[UIView]){
        self.init(frame:frame)
        self.arrViews = arrViews
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
    

    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrViews != nil && arrViewControllers != nil {
            assert(true, "You can not set the ViewControllers and VIews")
        }
        if arrViewControllers != nil{
            return arrViewControllers!.count
        }
        else if arrViews != nil{
            return arrViews!.count
        }
        return 0
    }
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("GrandCell")
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "GrandCell")
            cell?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            cell?.selectionStyle = .None
            cell?.contentView.backgroundColor = UIColor.clearColor()
        }
        if arrViewControllers != nil{
            let v = arrViewControllers![indexPath.row]
            v.view.frame = cell!.bounds
            cell?.contentView.addSubview(v.view)
        }
        else if arrViews != nil{
            let v = arrViews![indexPath.row]
            cell?.contentView.addSubview(v)
        }
        return cell!
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.frame.size.width
    }
    
    public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.y / self.frame.size.width
        if let sc = scrollToIndex{
            sc(index: Int(index))
        }
    }
    
   public  func selectIndex(index:Int){
    weak var weakSelf = self
    UIView.animateWithDuration(0.3) { () -> Void in
        weakSelf?.tb?.scrollToRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0), atScrollPosition: .None, animated: true)
    }
}

}
