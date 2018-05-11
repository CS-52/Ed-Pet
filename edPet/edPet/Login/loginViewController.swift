//
//  loginViewController.swift
//  edPet
//
//  Created by Natalie Cygan on 4/17/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//

import UIKit
import FirebaseAuth

class loginViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtUsername.layer.borderWidth = 1
        txtUsername.layer.borderColor = UIColor.white.cgColor
        txtUsername.layer.cornerRadius = 20;
        txtUsername.clipsToBounds = true;
        
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.borderColor = UIColor.white.cgColor
        txtPassword.layer.cornerRadius = 20;
        txtPassword.clipsToBounds = true;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SignUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: txtUsername.text!, password: txtPassword.text!) { (authResult, error) in
            // ...
        }
    }
    @IBAction func LoginPressed(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: txtUsername.text!, password: txtPassword.text!) { (user, error) in
            // ...
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


