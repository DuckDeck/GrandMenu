//
//  GrandMenuItem.swift
//  GrandMenuDemo
//
//  Created by Tyrant on 1/15/16.
//  Copyright © 2016 Qfq. All rights reserved.
//

import UIKit
protocol GraneMenuItemDelegate{
    func GraneMenuItemSelected(item:GrandMenuItem)
}
class GrandMenuItem: UIView {
    var selected:Bool = false{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var title:String?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var fontSize:Float = 15{
        didSet{
            setNeedsDisplay()
        }
    }
    var selectedFontSize:Float = 17{
        didSet{
            setNeedsDisplay()
        }
    }
    var color:UIColor = UIColor.blackColor(){
        didSet{
            setNeedsDisplay()
        }
    }
    var selectedColor:UIColor = UIColor.redColor(){
        didSet{
            setNeedsDisplay()
        }
    }
    
    var delegate:GraneMenuItemDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = UIColor.clearColor()
    }
    
    convenience init(){
        self.init(frame:CGRect(x: 0, y: 0, width: 0, height: 0))
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        let titleX = (CGRectGetWidth(frame) - titleSize().width) * 0.5
        let titleY = (CGRectGetHeight(frame) - titleSize().height) * 0.5
        let titleRect = CGRect(x: titleX, y: titleY, width: titleSize().width, height: titleSize().height)
        let attributes = [NSFontAttributeName:titleFont(),NSForegroundColorAttributeName:titleColor()]
        if let currentTitle = title{
            (currentTitle as NSString).drawInRect(titleRect, withAttributes: attributes)
        }
    }
    
    func titleSize()->CGSize{
        let attribures = [NSFontAttributeName:titleFont()]
        var size = (title! as NSString).boundingRectWithSize(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attribures, context: nil).size
        size.width = ceil(size.width)
        size.height = ceil(size.height)
        return size
    }
    func titleFont()->UIFont{
        if selected{
            return UIFont.boldSystemFontOfSize(CGFloat(selectedFontSize))
        }
        else{
            return UIFont.boldSystemFontOfSize(CGFloat(fontSize))
        }
    }
    func titleColor()->UIColor{
        if selected{
            return selectedColor
        }
        else
        {
            return color
        }
    }
    
    static func getTitleWidth(title:String,fontSize: Float)->Float{
        let attributes = [NSFontAttributeName:UIFont.systemFontOfSize(CGFloat(fontSize))]
        var size = (title as NSString).boundingRectWithSize(CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil).size
        size.width = ceil(size.width) + CGFloat(20)
        return Float(size.width)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        selected = true
        delegate?.GraneMenuItemSelected(self)
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if object == nil
        {
            return false
        }
        if let newItem = object! as? GrandMenuItem{
            if newItem.title! == title!{
                return true
            }
        }
        return false
    }
}
