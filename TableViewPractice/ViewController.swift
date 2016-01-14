//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Richie Gurgul on 1/13/16.
//  Copyright © 2016 Richie Gurgul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var myTableView: UITableView!
    
    let myArray = ["Batman", "Superman", "Aquaman", "Iron Man", "The Flash", "Spiderman"]
    let otherArray = ["Bruce Wayne", "Clark Kent", "Arthur Curry", "Tony Stark", "Barry Allen", "Peter Parker"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath)
        myCell.textLabel!.text = myArray[indexPath.row]
        myCell.detailTextLabel!.text = otherArray[indexPath.row]
        return myCell
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myArray.count
    }
    
}

