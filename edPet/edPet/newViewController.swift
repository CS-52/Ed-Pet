//
//  newViewController.swift
//  edPet
//
//  Created by Natalie Cygan on 4/12/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//

import Foundation
import UIKit

class newViewController: UIViewController {
    
    //IBOutlet has already been assigned a value
    @IBOutlet weak var label: UILabel! //IB = interface builder, ! means non-optional
    //non-optional variable can never be null or void
    
    //for constants, use 'let' instead of 'var'
    
    //automatically called when view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label.text = "Page forward label"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
