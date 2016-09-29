//
//  GrandMenuTable.swift
//  GrandMenuDemo
//
//  Created by Tyrant on 1/15/16.
//  Copyright © 2016 Qfq. All rights reserved.
//

import UIKit

open class GrandMenuTable: UIView,UITableViewDataSource,UITableViewDelegate {
   open  var tb:UITableView?
   fileprivate var arrViewControllers:[UIViewController]?
   fileprivate var arrViews:[UIView]?
   open var scrollToIndex:((_ index:Int)->Void)?
    fileprivate override init(frame: CGRect) {
        super.init(frame: frame)
    }
  public  convenience init(frame:CGRect,arrViewControllers:[UIViewController]){
        self.init(frame:frame)
        self.arrViewControllers = arrViewControllers
        tb = UITableView()
        tb?.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        tb?.frame = self.bounds
        tb?.bounces = false
        tb?.scrollsToTop = true
        tb?.isPagingEnabled = true
        tb?.separatorStyle = .none
        tb?.showsVerticalScrollIndicator = false
        tb?.delegate = self
        tb?.dataSource = self
        addSubview(tb!)
    }
    
    public convenience init(frame:CGRect,arrViews:[UIView]){
        self.init(frame:frame)
        self.arrViews = arrViews
        tb = UITableView()
        tb?.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        tb?.frame = self.bounds
        tb?.bounces = false
        tb?.scrollsToTop = true
        tb?.isPagingEnabled = true
        tb?.separatorStyle = .none
        tb?.showsVerticalScrollIndicator = false
        tb?.delegate = self
        tb?.dataSource = self
        addSubview(tb!)
    }
    

    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "GrandCell")
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "GrandCell")
            cell?.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
            cell?.selectionStyle = .none
            cell?.contentView.backgroundColor = UIColor.clear
        }
        if arrViewControllers != nil{
            let v = arrViewControllers![(indexPath as NSIndexPath).row]
            v.view.frame = cell!.bounds
            cell?.contentView.addSubview(v.view)
        }
        else if arrViews != nil{
            let v = arrViews![(indexPath as NSIndexPath).row]
            cell?.contentView.addSubview(v)
        }
        return cell!
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.frame.size.width
    }
    
    open func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.y / self.frame.size.width
        if let sc = scrollToIndex{
            sc(Int(index))
        }
    }
    
   open  func selectIndex(_ index:Int){
    weak var weakSelf = self
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
        weakSelf?.tb?.scrollToRow(at: IndexPath(row: index, section: 0), at: .none, animated: true)
    }) 
}

}
