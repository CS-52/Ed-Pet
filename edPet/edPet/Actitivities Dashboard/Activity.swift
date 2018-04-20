//
//  Activity.swift
//  edPet
//
//  Created by Natalie Cygan on 4/17/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//

import UIKit

import Foundation

class Activity {
    var name: String
    var due_date: Date
}

//Initialize
init?(name: String, due_date: Date?) {
    
    if name.isEmpty {
        return nil
    }
    self.name = name
    self.due_date = due_date
    
}
