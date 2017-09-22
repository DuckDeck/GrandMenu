//
//  GrandBaseTable.swift
//  DemoLayout
//
//  Created by Stan Hu on 11/6/2017.
//  Copyright © 2017 Stan Hu. All rights reserved.
//

import UIKit

class GrandBaseTable: UITableView,UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
