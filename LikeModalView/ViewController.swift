//
//  ViewController.swift
//  LikeModalView
//
//  Created by Mika Yamamoto on 2015/07/13.
//  Copyright (c) 2015年 PGMY. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var tableView:UITableView?
    var modalView:BaseModalView?

    @IBOutlet weak var showButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.frame)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view.addSubview(tableView!)
        
        self.view.bringSubviewToFront(showButton)
        
        modalView = BaseModalView(frame: self.view.frame)
        self.view.addSubview(modalView!)
        self.view.bringSubviewToFront(modalView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func show(sender: UIButton) {
        
        println("表示・・・・")
        UIView.animateWithDuration(0.1, animations: {() -> Void in
            self.modalView!.center = CGPointMake(self.view.frame.width/2, self.view.frame.height / 2 )
            self.modalView!.alpha = 1.0
        } )
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
}



class BaseModalView :UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let hideBtn = UIButton(frame: CGRectMake(frame.origin.x, frame.origin.y, frame.width, frame.height - 300))
        hideBtn.addTarget(self, action: "hide:", forControlEvents: UIControlEvents.TouchUpInside)
        hideBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        hideBtn.setTitle("hide view", forState: UIControlState.Normal)
        self.addSubview(hideBtn)
        println("\(frame.origin.x)|\(frame.origin.y)|\(frame.size.width)|\(frame.size.height))")
        
        let mainView = MainModalView(frame: CGRectMake(frame.origin.x, frame.height - 300, frame.width, 300))

        self.addSubview(mainView)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func hide(sender:UIButton){
        UIView.animateWithDuration(0.1, animations: {() -> Void in
            self.center = CGPointMake(self.center.x, self.frame.height * 3/2 )
            self.alpha = 0.0
        })
    }


    
}

class MainModalView :UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.redColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}