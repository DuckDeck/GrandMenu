//
//  Controller2.swift
//  Demo
//
//  Created by Tyrant on 1/14/16.
//
//

import UIKit

class Controller2: UIViewController,UITableViewDataSource {
    var tb:UITableView?
    var arrData:[String]?
    
    override func loadView() {
        super.loadView()
        print("Controller2 load view")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tb = UITableView()
        tb?.dataSource = self
        arrData = [String]()
        print("Controller2 start view did load")
        let delayTime =  DispatchTime.now() + .seconds(3)
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            for _ in 0...40
            {
                self.arrData?.append("Controller2")
            }
            self.tb?.reloadData()
             print("Controller2 start load data")
            
        })
        
      
        view.addSubview(tb!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         print("Controller2 view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Controller2 view did appear")
    }
    
    override func viewWillLayoutSubviews() {
        tb?.frame = self.view.bounds
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
