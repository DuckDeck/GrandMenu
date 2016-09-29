//
//  ViewControllerDemoViewController.swift
//  GrandMenuDemo
//
//  Created by HuStan on 4/4/16.
//  Copyright © 2016 Qfq. All rights reserved.
//

import UIKit

class ViewControllerDemoViewController: UIViewController {
    var grandMenu:GrandMenu?
    var grandMenuTable:GrandMenuTable?
    var arrControllers:[UIViewController]?
    let colors = UIColor.allColors()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "GrandMenuDemo"
        let btn = UIBarButtonItem(title: "换色", style: .plain, target: self, action: #selector(ViewControllerDemoViewController.changeColor))
        navigationItem.rightBarButtonItem = btn
        let btn2 = UIBarButtonItem(title: "字大小", style: .plain, target: self, action: #selector(ViewControllerDemoViewController.changeFont))
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
        arrControllers = [UIViewController]()
        let vc1 = Controller1()
        let vc2 = Controller2()
        let vc3 = Controller3()
        let vc4 = Controller4()
        let vc5 = Controller5()
        arrControllers?.append(vc1)
        arrControllers?.append(vc2)
        arrControllers?.append(vc3)
        arrControllers?.append(vc4)
        arrControllers?.append(vc5)
        grandMenuTable = GrandMenuTable(frame: CGRect(x: 0, y: grandMenu!.frame.maxY, width: UIScreen.main.bounds.size.width, height: view.frame.size.height - 104), arrViewControllers: arrControllers!)
        grandMenuTable?.scrollToIndex = scrollToIndex
        view.addSubview(grandMenuTable!)
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

}
