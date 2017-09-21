//
//  ViewDemoViewController.swift
//  GrandMenuDemo
//
//  Created by HuStan on 4/4/16.
//  Copyright © 2016 Qfq. All rights reserved.
//

import UIKit

class ViewDemoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,GrandPageContentViewDelagate {
  
    let tb:GrandBaseTable =  {
        let tb = GrandBaseTable(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        return tb
    }()
    let menu:GrandMenu = {
        let m = GrandMenu(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64), titles: ["全部","游戏","汽车","电影","京东"])
        m.backgroundColor = UIColor.lightGray
        return m
    }()
    var contentCell:GrandCellTableViewCell?
    
    var canScroll = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewDemoViewController.changeScrollStatus), name: NSNotification.Name(rawValue: "leaveTop"), object: nil)
        view.backgroundColor = UIColor.white
        initView()
    }
    
    func initView()  {
        canScroll = true
        tb.dataSource = self
        tb.delegate = self
        view.addSubview(tb)
        tb.backgroundColor = UIColor.white
        menu.selectMenu = {[weak self](item,index )in
            self?.contentCell?.pageContentView?.contentViewCurrentIndex = index
        }
    }
    
    
    
    func changeScrollStatus()  {
        canScroll = true
        contentCell?.cellCanScroll = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        }
        return view.bounds.size.height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return menu
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell1")
            }
            cell?.textLabel?.text = "123"
            return cell!
        }
        else{
            contentCell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? GrandCellTableViewCell
            if contentCell == nil {
                contentCell = GrandCellTableViewCell(style: .default, reuseIdentifier: "cell2")
                let titles = ["全部","游戏","汽车","电影","京东"]
                var vcs = [ScollViewController]()
                for t in titles{
                    let vc = ScollViewController()
                    vc.title = t
                    vcs.append(vc)
                }
                contentCell?.vcs = vcs
                contentCell?.pageContentView = GrandPageContentView(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height - 64), childViewControllers: vcs, parentViewController: self, delegate: self)
                contentCell?.contentView.addSubview(contentCell!.pageContentView!)
            }
            return contentCell!
        }
    }
    
    func contentViewDidEndDecelerating(_ contentView: GrandPageContentView!, start startIndex: Int, end endIndex: Int) {
        
        menu.selectSlideBarItemAtIndex(endIndex)
        tb.isScrollEnabled = true
    }
    
    func contentViewDidScroll(_ contentView: GrandPageContentView!, start startIndex: Int, end endIndex: Int, progress: CGFloat) {
        tb.isScrollEnabled = false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         print("big scroll + \(scrollView.contentOffset.y)")
        let bottomCellOffset = tb.rect(forSection: 1).origin.y - 64
        if scrollView.contentOffset.y >= bottomCellOffset {
            scrollView.contentOffset = CGPoint(x: 0, y: bottomCellOffset)
            if canScroll {
                canScroll = false
                contentCell?.cellCanScroll = true
            }
        }
        else{
            if !canScroll{
                scrollView.contentOffset = CGPoint(x: 0, y: bottomCellOffset)
            }
        }
        tb.showsVerticalScrollIndicator = canScroll
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


