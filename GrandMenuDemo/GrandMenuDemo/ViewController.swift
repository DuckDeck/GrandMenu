//
//  ViewController.swift
//  GrandMenuDemo
//
//  Created by Tyrant on 1/15/16.
//  Copyright © 2016 Qfq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var grandMenu:GrandMenu?
    var grandMenuTable:GrandMenuTable?
    var arrControllers:[UIViewController]?
    let colors = UIColor.allColors()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "GrandMenuDemo"
        let btn = UIBarButtonItem(title: "换色", style: .Plain, target: self, action: "changeColor")
        navigationItem.rightBarButtonItem = btn
        let btn2 = UIBarButtonItem(title: "字大小", style: .Plain, target: self, action: "changeFont")
        navigationItem.rightBarButtonItems?.append(btn2)
        grandMenu = GrandMenu(frame:CGRect(x: 0, y: 64, width: UIScreen.mainScreen().bounds.size.width, height: 40) , titles:  ["First","Second","Third","Fouth","Fifth"])
        grandMenu?.backgroundColor = UIColor.whiteColor()
        grandMenu?.selectMenu = scrollCallback
        grandMenu?.itemColor = UIColor.greenColor()
        grandMenu?.itemFont = 14
        grandMenu?.itemSelectedFont = 18
        grandMenu?.sliderBarHeight = 5
        grandMenu?.sliderBarLeftRightOffset = 15
        grandMenu?.itemSelectedFont = 16
        view.addSubview(grandMenu!)
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
        grandMenuTable = GrandMenuTable(frame: CGRect(x: 0, y: 104, width: UIScreen.mainScreen().bounds.size.width, height: view.frame.size.height - 104), arrContent: arrControllers!)
        grandMenuTable?.scrollToIndex = scrollToIndex
        view.addSubview(grandMenuTable!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollToIndex(index:Int){
        grandMenu?.selectSlideBarItemAtIndex(index)
    }
    
    
    func scrollCallback(item:GrandMenuItem, index:Int){
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

extension UIColor {
    static func allColors()->[UIColor]{
        return [UIColor.redColor(),UIColor.blackColor(),UIColor.blueColor(),UIColor.brownColor(),UIColor.orangeColor(),UIColor.purpleColor(),UIColor.grayColor(),UIColor.lightGrayColor(),UIColor.lightTextColor(),UIColor.darkGrayColor(),UIColor.darkTextColor(),UIColor.cyanColor(),UIColor.yellowColor(),UIColor.magentaColor(),UIColor.clearColor()]
    }
}
