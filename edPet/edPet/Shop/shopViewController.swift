//
//  loginViewController.swift
//  edPet
//
//  Created by Natalie Cygan on 4/17/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//

import UIKit
import FirebaseAuth
var curr_indx = 0;
var num_items = 12;
var shop_images = ["shop_image1", "shop_image2", "shop_image3", "shop_image4",  "shop_image5", "shop_image6", "shop_image7", "shop_image8",
    "shop_image9", "shop_image10", "shop_image11",
    "shop_image12"]

var shop_prices = [100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650]

class shopViewController: UIViewController {
    @IBOutlet weak var shop_image: UIImageView!
    @IBOutlet weak var shop_price: UILabel!
    
    @IBOutlet weak var coinLabel: UILabel!
    var userAccessories: [String] = []
    
    var numberOfCoins: Int? = 0 {
        didSet {
            coinLabel.text = String(numberOfCoins!)
            let userID = Auth.auth().currentUser!.uid
            Singleton.updateValue(userID, numberOfCoins!)
            //update in database
            //Singleton.sharedInstance.coins = numberOfCoins
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        coinLabel.text = String(Singleton.sharedInstance.coins!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfCoins = Singleton.sharedInstance.coins
        coinLabel.text = String(Singleton.sharedInstance.coins!)
        curr_indx = 0
        shop_image.image = UIImage(named:shop_images[curr_indx])
        shop_price.text = String(shop_prices[curr_indx])
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buyItem(_ sender: Any) {
    
        userAccessories = Singleton.sharedInstance.accessories
        let userID = Auth.auth().currentUser!.uid

        if userAccessories.contains(shop_images[curr_indx]) {
            showToast(message: "You already purchased this item.")
        } else {
            Singleton.addAccessory(userID, shop_images[curr_indx])
            numberOfCoins = numberOfCoins! - shop_prices[curr_indx]
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
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    @IBAction func toggleRight(_ sender: Any) {
        if (curr_indx < num_items - 1){
            curr_indx = curr_indx + 1;
            shop_image.image = UIImage(named:shop_images[curr_indx])
            shop_price.text = String(shop_prices[curr_indx])
        }
    }
    @IBAction func toggleLeft(_ sender: Any) {
        if (curr_indx >= 1){
            curr_indx = curr_indx - 1;
            shop_image.image = UIImage(named:shop_images[curr_indx])
            shop_price.text = String(shop_prices[curr_indx])
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
