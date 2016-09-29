//
//  ViewDemoViewController.swift
//  GrandMenuDemo
//
//  Created by HuStan on 4/4/16.
//  Copyright © 2016 Qfq. All rights reserved.
//

import UIKit

class ViewDemoViewController: UIViewController {
    var grandMenu:GrandMenu?
    var grandMenuTable:GrandMenuTable?

    let colors = UIColor.allColors()

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIBarButtonItem(title: "换色", style: .plain, target: self, action: #selector(ViewDemoViewController.changeColor))
        navigationItem.rightBarButtonItem = btn
        let btn2 = UIBarButtonItem(title: "字大小", style: .plain, target: self, action: #selector(ViewDemoViewController.changeFont))
        navigationItem.rightBarButtonItems?.append(btn2)
        grandMenu = GrandMenu(frame:CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 40) , titles:  ["First","Second","Third","Fouth","Fifth"])
        grandMenu?.backgroundColor = UIColor.white
        grandMenu?.selectMenu = scrollCallback
        grandMenu?.itemColor = UIColor.green
        grandMenu?.itemFont = 14
        grandMenu?.itemSelectedFont = 18
        grandMenu?.sliderBarHeight = 5
        grandMenu?.sliderBarLeftRightOffset = 15
        grandMenu?.itemSelectedFont = 16
        view.addSubview(grandMenu!)
        //  grandMenu?.addBottomLine(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.6), height: 5)
        grandMenu?.addBottomLine(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.6), size: CGSize(width: 200, height: 1))
        
        let v1 = TableView(frame: CGRect.zero)
        let v2 = TableView(frame: CGRect.zero)
        let v3 = TableView(frame: CGRect.zero)
        let v4 = TableView(frame: CGRect.zero)
        let v5 = TableView(frame: CGRect.zero)
        
        grandMenuTable = GrandMenuTable(frame: CGRect(x: 0, y: grandMenu!.frame.maxY, width: UIScreen.main.bounds.size.width, height: view.frame.size.height - 104), arrViews: [v1,v2,v3,v4,v5])
        
        grandMenuTable?.scrollToIndex = scrollToIndex
        view.addSubview(grandMenuTable!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollToIndex(_ index:Int){
        grandMenu?.selectSlideBarItemAtIndex(index)
    }
    
    
    func scrollCallback(_ item:GrandMenuItem, index:Int){
        grandMenuTable?.selectIndex(index)
    }
    
    func changeColor(){
        let index = Int(arc4random()) % colors.count
        grandMenu?.itemSeletedColor = colors[index]
        grandMenu?.sliderColor = colors[index]
        let index2 = Int(arc4random()) % colors.count
        grandMenu?.itemColor = colors[index2]
    }
    func changeFont(){
        if let font = grandMenu?.itemFont
        {
            grandMenu?.itemFont = font + 0.5
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class TableView: UIView ,UITableViewDataSource{
    var tb:UITableView?
    var arrData:[String]?

    override init(frame: CGRect) {
        super.init(frame: frame)
        tb = UITableView()
        tb?.dataSource = self
        arrData = [String]()
        for _ in 0...40
        {
            arrData?.append("View1")
        }
        addSubview(tb!)

    }
    
    override func layoutSubviews() {
        self.frame = self.superview!.bounds
        tb?.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
  

    
}


