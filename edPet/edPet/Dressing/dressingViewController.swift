//
//  dressingViewController.swift
//  edPet
//
//  Created by Hannah Leou on 6/4/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//
import UIKit
import FirebaseAuth

class dressingViewController:
    
UIViewController {
    @IBOutlet weak var headwear_image: UIImageView!
    @IBOutlet weak var eyewear_image: UIImageView!
    @IBOutlet weak var neckwear_image: UIImageView!
    @IBOutlet weak var dressing_image: UIImageView!
    var userAccessories: [String] = []
    var curr_indx = 0
    var num_items = 0
    
    var shop_image_types = ["head", "head", "eye", "eye", "head", "neck",
                            "head", "head", "head", "neck", "head", "head"]
    
    
    override func viewWillAppear(_ animated: Bool) {
        userAccessories = Singleton.sharedInstance.accessories
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        num_items = userAccessories.count
        curr_indx = 0;
        if (num_items > 0) {
            dressing_image.image = UIImage(named: userAccessories[0])
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
            dressing_image.image = UIImage(named:userAccessories[curr_indx])
        }
    }
    @IBAction func toggleLeft(_ sender: Any) {
        if (curr_indx >= 1){
            curr_indx = curr_indx - 1;
            dressing_image.image = UIImage(named:userAccessories[curr_indx])
        }
    }
    
    @IBAction func selectPiece(_ sender: Any) {
        let accessory = userAccessories[curr_indx]
        let index = Int(String(accessory.last!))! - 1
        let accesory_type = shop_image_types[index]
        if(accesory_type == "head") {headwear_image.image = UIImage(named: accessory)}
        if(accesory_type == "eye") {eyewear_image.image = UIImage(named: accessory)}
        if(accesory_type == "neck") {neckwear_image.image = UIImage(named: accessory)}
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        captureScreenshot()
    }
    
    
    func captureScreenshot(){
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        // Creates UIImage of same size as view
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        // THIS IS TO SAVE SCREENSHOT TO PHOTOS
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myUnwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        //
    }
    
    
}
