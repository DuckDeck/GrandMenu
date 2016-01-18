//
//  GrandMenu.swift
//  GrandMenuDemo
//
//  Created by Tyrant on 1/15/16.
//  Copyright © 2016 Qfq. All rights reserved.
//

import UIKit

class GrandMenu: UIView,GraneMenuItemDelegate {
    var arrItemsTitle:[String]?{
        didSet{
            setupItems()
        }
    }
    var sliderBarLeftRightOffset = 15{
        didSet{
            setupItems()
        }
    }
    var sliderBarHeight = 2{
        didSet{
            setupItems()
        }
    }
    var sliderColor = UIColor.redColor(){
        didSet{
            vSlider?.backgroundColor = sliderColor
        }
    }
    
    var  averageManu:Bool = false{  //当Menu过多时,设置无效
        didSet{
            if arrItemsTitle!.count <= 5{
                setupItems()
            }
        }
    }
    var defaultSelectedIndex:Int = 0{
        didSet{
            if defaultSelectedIndex < arrItemsTitle!.count{
                setupItems()
            }
        }
    }
    
    var itemColor:UIColor = UIColor.blackColor(){
        didSet{
            for item in arrItems!{
                item.color = itemColor
            }
        }
    }
    
    var itemSeletedColor:UIColor = UIColor.redColor(){
        didSet{
            for item in arrItems!{
                item.selectedColor = itemSeletedColor
            }
        }
    }
    
    var itemFont:Float?{
        didSet{
            if itemFont == nil{
                return
            }
            for item in arrItems!{
                item.fontSize = itemFont!
            }
        }
    }
    
    var itemSelectedFont:Float?{
        didSet{
            if itemSelectedFont == nil{
                return
            }
            for item in arrItems!{
                item.selectedFontSize = itemSelectedFont!
            }
        }
    }
    
    
    var selectMenu:((item:GrandMenuItem, index:Int)->())?
    
    private var selectedItemIndex:Int = 0
    private var scrollView:UIScrollView?
    private var arrItems:[GrandMenuItem]?
    private var vSlider:UIView?
    private var selectedItem:GrandMenuItem?{
        willSet{
            selectedItem?.selected = false  //这个警告可以无视
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private override init(frame: CGRect) {
        super.init(frame: frame)
        arrItems = [GrandMenuItem]()
        scrollView = UIScrollView(frame: self.bounds)
        scrollView!.backgroundColor = UIColor.clearColor()
        scrollView!.showsHorizontalScrollIndicator = false
        scrollView!.showsVerticalScrollIndicator = false
        scrollView!.bounces = false
        addSubview(scrollView!)
        vSlider = UIView()
        vSlider?.backgroundColor = sliderColor
        scrollView!.addSubview(vSlider!)
    }
    convenience init(frame: CGRect,titles:[String]){
        self.init(frame:frame)
        if let window = UIApplication.sharedApplication().keyWindow
        {
            if var viewController = window.rootViewController{
                while viewController.presentedViewController != nil{
                    viewController = viewController.presentedViewController!
                }
                while viewController.isKindOfClass(UINavigationController.self) && (viewController as! UINavigationController).topViewController != nil{
                    viewController = (viewController as! UINavigationController).topViewController!
                }
                viewController.automaticallyAdjustsScrollViewInsets = false
            }
        }
        arrItemsTitle = titles
    }
    func setupItems(){
        for view in scrollView!.subviews{
            if view is GrandMenuItem{
                view.removeFromSuperview()
            }
        }
        arrItems?.removeAll(keepCapacity: true)
        var x:Float = 0
        for  title in arrItemsTitle! {
            let item = GrandMenuItem()
            item.selectedColor = itemSeletedColor
            item.color = itemColor
            if let f = itemFont{
                item.fontSize = f
            }
            if let sf = itemSelectedFont{
                item.selectedFontSize = sf
            }
            item.delegate = self
            var itemWidth = GrandMenuItem.getTitleWidth(title,fontSize: item.fontSize)
            if averageManu{
                itemWidth = Float(UIScreen.mainScreen().bounds.width / CGFloat(arrItemsTitle!.count))
            }
            item.frame = CGRect(x: CGFloat(x), y: CGFloat(0), width: CGFloat(itemWidth), height: CGRectGetHeight(scrollView!.frame))
            item.title = title
            arrItems!.append(item)
            scrollView?.addSubview(item)
            x = Float(CGRectGetMaxX(item.frame))
        }
        scrollView?.contentSize = CGSize(width: CGFloat(x), height: CGRectGetHeight(scrollView!.frame))
        let defaultItem = arrItems![defaultSelectedIndex]
        selectedItemIndex = defaultSelectedIndex
        defaultItem.selected = true
        selectedItem = defaultItem
        vSlider?.frame = CGRect(x: defaultItem.frame.origin.x + CGFloat(sliderBarLeftRightOffset), y: frame.size.height - CGFloat(sliderBarHeight), width: defaultItem.frame.size.width - CGFloat(sliderBarLeftRightOffset * 2), height: CGFloat(sliderBarHeight))
    }
    
    
    func scrollToVisibleItem(item:GrandMenuItem){
        let selectedItemIndex = arrItems!.find({(s:GrandMenuItem) ->Bool in return s.title! == self.selectedItem!.title!}).1
        let visibleItemIndex = arrItems!.find({(s:GrandMenuItem) ->Bool in return s.title! == item.title!}).1
        if selectedItemIndex == visibleItemIndex{
            return
        }
        var offset = scrollView!.contentOffset
        if CGRectGetMidX(item.frame) > offset.x && CGRectGetMaxX(item.frame) < (offset.x + CGRectGetWidth(scrollView!.frame)){
            return
        }
        if selectedItemIndex < visibleItemIndex{
            if CGRectGetMaxX(selectedItem!.frame) < offset.x{
                offset.x = CGRectGetMinX(item.frame)
            }
            else{
                offset.x = CGRectGetMaxX(item.frame) - CGRectGetWidth(scrollView!.frame)
            }
        }
        else{
            if CGRectGetMinX(selectedItem!.frame) > offset.x + CGRectGetWidth(scrollView!.frame){
                offset.x = CGRectGetMaxX(item.frame) - CGRectGetWidth(scrollView!.frame)
            }
            else{
                offset.x = CGRectGetMinX(item.frame)
            }
        }
        scrollView?.contentOffset = offset
    }
    
    func addAnimationWithSelectedItem(item:GrandMenuItem)
    {
        let dx = CGRectGetMidX(item.frame) - CGRectGetMidX(selectedItem!.frame)
        //        let positionAnimation = CABasicAnimation()
        //        positionAnimation.keyPath = "position.x"
        //        positionAnimation.fromValue = vSlider?.layer.position.x
        //        positionAnimation.toValue = vSlider!.layer.position.x + dx
        
        //        let boundsAnimation = CABasicAnimation()
        //        boundsAnimation.keyPath = "bounds.size.width"
        //        boundsAnimation.fromValue = CGRectGetWidth(vSlider!.layer.bounds)
        //        boundsAnimation.toValue = CGRectGetWidth(item.frame)
        //这个是不必要的动画
        
        //        let animationGroup = CAAnimationGroup()
        //        animationGroup.animations = [positionAnimation]
        //        animationGroup.duration = 0.2
        //        vSlider?.layer.addAnimation(animationGroup, forKey: "basic")
        //
        //        vSlider?.layer.position = CGPoint(x: vSlider!.layer.position.x + dx, y: vSlider!.layer.position.y)
        //        var rect = vSlider!.layer.bounds
        //        rect.size.width = CGRectGetWidth(item.frame) - CGFloat(sliderBarLeftRightOffset * 2)
        //        vSlider?.layer.bounds = rect
        //这个动画有个小Bug,目前不知道怎么修正,它会先把滑块移动到目的地再消失,再执行动画,所以只好用下面的方法了,这种情况有30%的可能性发生
        //不用这种动画试试
        UIView.animateWithDuration(0.2) { () -> Void in
            self.vSlider?.frame = CGRect(x: self.vSlider!.frame.origin.x + dx, y: self.vSlider!.frame.origin.y, width: self.vSlider!.frame.size.width, height: self.vSlider!.frame.size.height)
        }
    }
    
    func adjustScrollOffset(){
        let x = selectedItem!.frame.origin.x
        //        if x < selectedItem!.frame.size.width * 2 || x > scrollView!.contentSize.width - 2 * selectedItem!.frame.size.width {
        //            return
        //        }
        if x < selectedItem!.frame.size.width * 2 {
            scrollView?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        else if  x > scrollView!.contentSize.width - 4 * selectedItem!.frame.size.width{
            scrollView?.setContentOffset(CGPoint(x: scrollView!.contentSize.width - scrollView!.frame.width, y: 0), animated: true)
        }
        else{
            scrollView?.setContentOffset(CGPoint(x: x - selectedItem!.frame.size.width * 2, y: 0), animated: true)
        }
    }
    
    func GraneMenuItemSelected(item: GrandMenuItem) {
        if item == selectedItem!{
            return
        }
        addAnimationWithSelectedItem(item)
        selectedItem = item
        //调整到合适的位置
        adjustScrollOffset()
        
        if let call = selectMenu{
            let item = arrItems!.find({(s:GrandMenuItem) ->Bool in return s.selected == item.selected })
            call(item: item.0!, index: item.1)
        }
        
    }
    
    func selectSlideBarItemAtIndex(index:Int){
        let item = arrItems![index]
        if item == selectedItem!{
            return
        }
        item.selected = true
        scrollToVisibleItem(item)
        addAnimationWithSelectedItem(item)
        selectedItem = item
    }
    
}

extension Array{
    func find(method:(Element)->Bool)->(Element?,Int){
        var index = 0
        for item in self{
            if method(item){
                return (item,index)
            }
            index++
        }
        return (nil,-1)
    }
    
    mutating func remove(method:(Element)->Bool)->(Element?,Bool){
        let result = find(method)
        if result.1 >= 0{
            return (self.removeAtIndex(result.1),true)
        }
        return (nil,false)
    }
    
    func compareFirstObject(arrTarget:Array, method:(Element,Element)->Bool)->Bool{
        if self.count == 0 || arrTarget.count == 0
        {
            return false
        }
        let firstItem = self.first!
        let targetFirstItem = arrTarget.first!
        if method(firstItem,targetFirstItem)
        {
            return true
        }
        return false
    }
    
    func compareLastObject(arrTarget:Array, method:(Element,Element)->Bool)->Bool{
        if self.count == 0 || arrTarget.count == 0
        {
            return false
        }
        let firstItem = self.last!
        let targetFirstItem = arrTarget.last!
        if method(firstItem,targetFirstItem)
        {
            return true
        }
        return false
    }
    
    mutating func exchangeObjectAdIndex(IndexA:Int,atIndexB:Int)
    {
        if IndexA >= self.count || IndexA < 0{
            return
        }
        if atIndexB >= self.count || atIndexB < 0{
            return
        }
        let objA = self[IndexA]
        let objB = self[atIndexB]
        self.replaceObject(objA, atIndex: atIndexB)
        self.replaceObject(objB, atIndex: IndexA)
    }
    
    mutating func replaceObject(obj:Element,atIndex:Int){
        if atIndex >= self.count || atIndex < 0{
            return
        }
        self.removeAtIndex(atIndex)
        self.insert(obj, atIndex: atIndex)
    }
    
    mutating func merge(newArray:Array){
        for obj in newArray
        {
            self.append(obj)
        }
    }
}
