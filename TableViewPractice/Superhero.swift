//
//  Superhero.swift
//  TableViewPractice
//
//  Created by Richie Gurgul on 1/15/16.
//  Copyright © 2016 Richie Gurgul. All rights reserved.
//

import Foundation
import UIKit

class Superhero
{
    var name: String
    var alias: String
    var power: Int
    var image: UIImage
    
    init()
    {
        name = "Unknown"
        alias = "Unknown"
        power = 0
        image = UIImage(named: "default")!
    }
    
    init(Name: String, Alias: String)
    {
        name = Name
        alias = Alias
        power = 0
        image = UIImage(named: "default")!
    }
    
    init(Name: String, Alias: String, Power: Int, Image: String)
    {
        name = Name
        alias = Alias
        power = Power
        image = UIImage(named: Image)!
    }
}