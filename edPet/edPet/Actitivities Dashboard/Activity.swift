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

class Activity: NSObject/*: CustomStringConvertible */{
    
    
    var title: String!
    var days_until_due: Int!
    var completion: Bool!
    var time_estimate: Int!
    
    init?(title: String, days_until_due: Int, completion: Bool, time_estimate: Int) {
        self.title = title
        self.days_until_due = days_until_due
        self.completion = completion
        self.time_estimate = time_estimate
    }
    
    /*//firebase init
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        /self.id = id
        
        if let title = dictionary["title"] as? String {
            self.title = title
        }
        
        if let due_date = dictionary["due_date"] as? Date {
            self.due_date = due_date
        }
        
        
        self.reference = API.studentsReference.child(self.key)
        self.profileImageReference = API.studentImagesReference.child(self.key)
    }*/

}
