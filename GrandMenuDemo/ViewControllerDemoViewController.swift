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
        let height1 = UIApplication.shared.statusBarFrame.height
        let height2 = navigationController?.navigationBar.frame.size.height
        grandMenu = GrandMenu(frame:CGRect(x: 0, y: height1 + (height2 ?? 0), width: UIScreen.main.bounds.size.width, height: 40) , titles:  ["First","Second","Third","FouthFouthFouth","Fifth","1","2","Thir333333d","Fo44uth","7"])
        grandMenu?.backgroundColor = UIColor.white
        grandMenu?.selectMenu = {[weak self](item:GrandMenuItem, index:Int) in
              self?.grandMenuTable?.contentViewCurrentIndex = index
        }
        grandMenu?.itemColor = UIColor.green
        grandMenu?.itemFont = 14
        grandMenu?.itemSelectedFont = 18
        grandMenu?.sliderBarHeight = 5
        grandMenu?.averageManu = false
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
        let vc6 = Controller1()
        let vc7 = Controller2()
        let vc8 = Controller3()
        let vc9 = Controller4()
        let vc10 = Controller5()
        arrControllers?.append(vc6)
        arrControllers?.append(vc7)
        arrControllers?.append(vc8)
        arrControllers?.append(vc9)
        arrControllers?.append(vc10)
        grandMenuTable = GrandMenuTable(frame: CGRect(x: 0, y: grandMenu!.frame.maxY, width: UIScreen.main.bounds.size.width, height: view.frame.size.height - 104), childViewControllers: arrControllers!, parentViewController: self)
        grandMenuTable?.scrollToIndex = {[weak self](index:Int)in
            self?.grandMenu?.selectSlideBarItemAtIndex(index)
        }
        view.addSubview(grandMenuTable!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    @objc func changeColor(){
        let index = Int(arc4random()) % colors.count
        grandMenu?.itemSeletedColor = colors[index]
        grandMenu?.sliderColor = colors[index]
        let index2 = Int(arc4random()) % colors.count
        grandMenu?.itemColor = colors[index2]
    }
    @objc func changeFont(){
        if let font = grandMenu?.itemFont
        {
            grandMenu?.itemFont = font + 0.5
        }
    }

    deinit {
        print("ViewControllerDemoViewController deinit")
    }
    
}
