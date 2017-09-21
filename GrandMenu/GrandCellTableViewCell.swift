//
//  menuCellTableViewCell.swift
//  DemoLayout
//
//  Created by Stan Hu on 11/6/2017.
//  Copyright © 2017 Stan Hu. All rights reserved.
//

import UIKit

class GrandCellTableViewCell: UITableViewCell {

    var  pageContentView:GrandPageContentView?
    var vcs = [UIViewController]()
    var cellCanScroll = false{
        didSet{
            for vc in vcs{
                if let v = vc as? GrandContentViewController{
                    v.canScroll = cellCanScroll
                    v.tableView.contentOffset = CGPoint()
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
