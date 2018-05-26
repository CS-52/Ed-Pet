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
    
    var loginSuccessful = false
    
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
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: txtUsername.text!, password: txtPassword.text!) { (user, error) in
            if (error == nil) {
                self.performSegue(withIdentifier: "homeScreenSegue", sender: nil)
                
            } else {
                self.showToast(message: "Make sure you use the right login info.")
            }
        }
       
    }
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if let ident = identifier {
            if ident == "homeScreenSegue" {
                if loginSuccessful != true {
                    return false
                }
            }
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myUnwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        //
    }
    
    
}


