//
//  ViewController.swift
//  Money IO
//
//  Created by Kyle Lee on 3/11/16.
//  Copyright © 2016 Kilo Loco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var balanceLbl: UILabel!
    @IBOutlet weak var textfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCellWithIdentifier("FlowCell") as? FlowCell {
            return cell
        } else {
            return FlowCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    @IBAction func addBtn (sender: UIButton) {
        
    }
    
    @IBAction func subBtn (sender: UIButton) {
        
    }
    
    

}

