//
//  Activity.swift
//  edPet
//
//  Created by Natalie Cygan on 5/1/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//

import Foundation
import UIKit
/*import FirebaseStorage
import FirebaseDatabase*/

class Activity: NSObject, NSCoding/*: CustomStringConvertible */{
    
   
    
    //MARK: Properties
    var title: String!
    var days_until_due: Int!
    var completion: Bool!
    var time_estimate: Int!
    var previewImage: UIImage?
    var completionImage: UIImage?
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("activities")
    
    struct PropertyKey {
        static let title = "title"
        static let days_until_due = "days_until_due"
        static let completion = "completion"
        static let time_estimate = "time_estimate"
        static let previewImage = "previewImage"
    }
    
    init?(title: String, days_until_due: Int, completion: Bool, time_estimate: Int, previewImage: UIImage?) {
        self.title = title
        self.days_until_due = days_until_due
        self.completion = completion
        self.time_estimate = time_estimate
        self.previewImage = previewImage
        
        let complet = UIImage(named: "greencheck")
        if(completion){
            completionImage = complet;
        }
        
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: PropertyKey.title)
        aCoder.encode(days_until_due, forKey: PropertyKey.days_until_due)
        aCoder.encode(completion, forKey: PropertyKey.completion)
        aCoder.encode(time_estimate, forKey: PropertyKey.time_estimate)
        aCoder.encode(previewImage, forKey: PropertyKey.previewImage)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let title = aDecoder.decodeObject(forKey: PropertyKey.title)
        let days_until_due = aDecoder.decodeInteger(forKey: PropertyKey.days_until_due)
        let completion = aDecoder.decodeBool(forKey: PropertyKey.completion)
        let time_estimate = aDecoder.decodeInteger(forKey: PropertyKey.time_estimate)
        let previewImage = aDecoder.decodeObject(forKey: PropertyKey.previewImage)
        
        // Must call designated initializer.
        self.init(title: title as! String, days_until_due: days_until_due, completion: completion, time_estimate: time_estimate, previewImage: previewImage as? UIImage)
        
    }
   
}
