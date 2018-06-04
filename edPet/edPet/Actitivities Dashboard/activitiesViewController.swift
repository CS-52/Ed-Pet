//
//  loginViewController.swift
//  edPet
//
//  Created by Natalie Cygan on 4/17/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//

import UIKit
import os.log


class activitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Properies
    var activities = [Activity]();
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedActivities = loadActivities() {
            activities += savedActivities
        } else {
            loadSampleActivities()
        }
        
        loadSampleActivities()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myUnwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        //
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 151;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ActivityTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ActivityTableViewCell else {
            fatalError("This table view cell is not of type ActivityTableViewCell")
        }
        
        //fetch next activity for the data source layout
        let activity = activities[indexPath.row]
        
        cell.activityTitle.text = activity.title
        if(activity.completion == true){
            cell.completionImage?.image = UIImage(named: "check")
        }
        cell.time.text = String(activity.time_estimate) + " min"
        //cell.previewImage?.image = activity.previewImage
        
        return cell
    }
    
    private func loadSampleActivities() {
        //let activity_complete = UIImage(named:"check_complete")
        let alamo = UIImage(named: "alamo")
        let photosyn = UIImage(named: "sugarcane")
        let solar = UIImage(named: "solar")
        let scuba = UIImage(named: "scuba")
        
        guard let activity1 = Activity(title: "History of the Alamo", days_until_due: 5, completion: false, time_estimate: 10, previewImage: alamo) else {
            fatalError("can't make activity 1")
        }
        
        guard let activity2 = Activity(title: "Our Solar System", days_until_due: 8, completion: false, time_estimate: 15, previewImage: solar) else {
            fatalError("can't make activity 2")
        }
        
        guard let activity3 = Activity(title: "Underwater Exploration", days_until_due: 8, completion: false, time_estimate: 15, previewImage: scuba) else {
            fatalError("can't make activity")
        }
        
        guard let activity4 = Activity(title: "Photosynthesis", days_until_due: 5, completion: false, time_estimate: 10, previewImage: photosyn) else {
            fatalError("can't make activity 1")
        }
        
        
        activities += [activity1, activity2, activity3]

    }
    
    private func saveActivities() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(activities, toFile: Activity.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Successful save!", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadActivities() -> [Activity]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Activity.ArchiveURL.path) as? [Activity]
    }
    
    
}
