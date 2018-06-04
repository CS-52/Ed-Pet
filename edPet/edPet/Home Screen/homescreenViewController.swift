//
//  loginViewController.swift
//  edPet
//
//  Created by Natalie Cygan on 4/17/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//

import UIKit
import FirebaseAuth
class homescreenViewController: UIViewController {
    var userAccessories: [String] = []
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var hatImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        coinLabel.text = String(Singleton.sharedInstance.coins!)
        userAccessories = Singleton.sharedInstance.accessories
        if(userAccessories.count > 0) {
            hatImage.image = UIImage(named: userAccessories[0])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myUnwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        //
    }
    
    
}

