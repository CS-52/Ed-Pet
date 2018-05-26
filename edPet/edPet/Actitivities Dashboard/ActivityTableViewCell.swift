//
//  ActivityTableViewCell.swift
//  edPet
//
//  Created by Natalie Cygan on 4/19/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var previewImage: UIImageView?
    @IBOutlet weak var completionImage: UIImageView?
    
    @IBOutlet weak var days_until_due: UILabel!
    @IBOutlet weak var time: UILabel!
   // @IBOutlet weak var progress: KDCircularProgress!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
