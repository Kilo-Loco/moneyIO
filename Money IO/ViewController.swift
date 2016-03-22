//
//  ViewController.swift
//  Money IO
//
//  Created by Kyle Lee on 3/11/16.
//  Copyright © 2016 Kilo Loco. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var balanceLbl: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    var flows = [Flow]()
    var balance: Double = 0.00
    var APP: AppDelegate!
    var CONTEXT: NSManagedObjectContext!
    
    func updateBalance() {
        //self.balanceLbl.text = String(self.balance)
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        self.balanceLbl.text = formatter.stringFromNumber(self.balance)
    }
    
    func fetchAndSetResult() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Flow")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.flows = results as! [Flow]
            self.flows = self.flows.reverse()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func saveContext() {
        do {
            try self.CONTEXT.save()
            print("flow was added to and saved")
        } catch {
            print("flow save error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.APP = UIApplication.sharedApplication().delegate as! AppDelegate
        self.CONTEXT = APP.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Flow")
        
        do {
            let results = try self.CONTEXT.executeFetchRequest(fetchRequest)
            
            guard let fetchedResults = results.last as? Flow else {
                self.balance = 0.0
                return
            }
            self.balance = Double(fetchedResults.balance!)
            
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        self.updateBalance()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.fetchAndSetResult()
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCellWithIdentifier("FlowCell") as? FlowCell {
            let flowRow = flows[indexPath.row]
            cell.configureCell(flowRow)
            return cell
        } else {
            return FlowCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flows.count
    }
    
    @IBAction func addBtn (sender: UIButton) {
        if self.textfield.text != "" {
            self.balance += Double(self.textfield.text!)!
            self.updateBalance()
            
            
            let entity = NSEntityDescription.entityForName("Flow", inManagedObjectContext: self.CONTEXT)!
            let flow = Flow(entity: entity, insertIntoManagedObjectContext: self.CONTEXT)
            
            print(flow.balance)
            
            flow.balance = self.balance
            flow.cashFlow = Double(self.textfield.text!)!
            flow.date = NSDate()
            flow.posNum = true
            
            print(flow.balance)
            
            self.CONTEXT.insertObject(flow)
            
            self.saveContext()
            
            self.textfield.text = ""
            self.fetchAndSetResult()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func subBtn (sender: UIButton) {
        if self.textfield.text != "" {
            self.balance -= Double(self.textfield.text!)!
            self.updateBalance()
            
            let entity = NSEntityDescription.entityForName("Flow", inManagedObjectContext: self.CONTEXT)!
            let flow = Flow(entity: entity, insertIntoManagedObjectContext: self.CONTEXT)
            
            print(flow.balance)
            
            flow.balance = self.balance
            flow.cashFlow = Double(self.textfield.text!)!
            flow.date = NSDate()
            flow.posNum = false
            
            print(flow.balance)
            
            self.CONTEXT.insertObject(flow)
            
            self.saveContext()
            
            self.textfield.text = ""
            self.fetchAndSetResult()
            self.tableView.reloadData()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}

