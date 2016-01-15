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
    @IBOutlet weak var myEditButton: UIBarButtonItem!
    
    var superheroes = ["Batman", "Superman", "Aquaman", "Iron Man", "The Flash", "Spiderman"]
    var realNames = ["Bruce Wayne", "Clark Kent", "Arthur Curry", "Tony Stark", "Barry Allen", "Peter Parker"]
    
    var heroes = [Superhero]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myEditButton.tag = 0
    }
    
    @IBAction func editSuperheroes(sender: UIBarButtonItem)
    {
        if sender.tag == 0
        {
            myTableView.editing = true
            myEditButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            myEditButton.tag = 0
        }
    }
    
    @IBAction func addSuperhero(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add a New Superhero", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler
        {   (heroField) -> Void in
            heroField.placeholder = "Add Superhero's Name"
        }
        myAlert.addTextFieldWithConfigurationHandler
        {   (nameField) -> Void in
            nameField.placeholder = "Add Superhero's Alias"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "Confirm", style: .Default)
        {   (action) -> Void in
            let heroTF = myAlert.textFields![0]
            let nameTF = myAlert.textFields![1]
            
            self.superheroes.append(heroTF.text!)
            self.realNames.append(nameTF.text!)
            
            self.myTableView.reloadData()
        }
        
        myAlert.addAction(cancelAction)
        myAlert.addAction(confirmAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath)
        myCell.textLabel!.text = superheroes[indexPath.row]
        myCell.detailTextLabel!.text = realNames[indexPath.row]
        return myCell
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheroes.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superheroes.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        superheroes.insert(superheroes.removeAtIndex(sourceIndexPath.row), atIndex: destinationIndexPath.row)
        realNames.insert(realNames.removeAtIndex(sourceIndexPath.row), atIndex: destinationIndexPath.row)
    }
    
}







