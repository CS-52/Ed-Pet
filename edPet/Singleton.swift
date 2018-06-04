//
//  Singleton.swift
//  edPet
//
//  Created by Stephen Dirk M. Weyns on 26/5/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//
import Foundation
import FirebaseDatabase
import FirebaseAuth

class Singleton {
    var shop_image_types = ["hat", "hat", "glasses", "glasses", "hat", "scarf",
                            "hat", "hat", "hat", "scarf", "hat", "hat"]
    
    static let sharedInstance = Singleton()
    var coins: Int?
    var accessories: [String]
    var outfit: [String]
    
    static let databaseReference: DatabaseReference = Database.database().reference()
    
    
    private init() {
        coins = 0
        accessories = []
        outfit = ["N/A", "N/A", "N/A"]
    }
    
    class func addToOutfit(item_name:String, catergory:String) {
        if (catergory == "hat") {sharedInstance.outfit[0] = item_name}
        if (catergory == "eyewear") {sharedInstance.outfit[1] = item_name}
        if (catergory == "neckwear") {sharedInstance.outfit[2] = item_name}
    }
    
    class func getCoins(_ key: String, completed: ((Int?) -> Void)?) {
        databaseReference.child(key).child("coins").observeSingleEvent(of: .value, with: { snapshot in
            let numCoins: Int! = snapshot.value as? Int
            sharedInstance.coins = numCoins
            completed?(numCoins)
        })
    }
    
    class func addAccessory(_ key: String, _ item_name: String) {
        sharedInstance.accessories.append(item_name)
        databaseReference.child(key).child("accessories").childByAutoId().setValue(item_name)
       
    }
    
    class func getAccessories(_ key: String, completed: (([String]) -> Void)?) {
        databaseReference.child(key).child("accessories").observeSingleEvent(of: .value, with: {
            snapshot in
            //var accessories: [String] = []
            let accessoriesDictionary = snapshot.value as? Dictionary<String, String>
            if accessoriesDictionary != nil {
                for accessory in accessoriesDictionary!.values {
                    sharedInstance.accessories.append(accessory)
                }
                //self.accessories = accessories
            }
            completed?(sharedInstance.accessories)
        })
    }
    
    class func updateValue(_ key: String, _ value: Int) {
        sharedInstance.coins = value
 databaseReference.child(key).child("coins").setValue(value)
            }

}
