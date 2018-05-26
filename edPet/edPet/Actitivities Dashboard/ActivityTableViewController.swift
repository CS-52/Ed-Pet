//
//  ActivityTableViewController.swift
//  edPet
//
//  Created by Natalie Cygan on 4/19/18.
//  Copyright © 2018 Stephen Dirk M. Weyns. All rights reserved.
//

import UIKit
import os.log

class ActivityTableViewController: UITableViewController {
    
    //MARK: Properies
    var activities = [Activity]();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleActivities()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    private func loadSampleActivities() {
        //let activity_complete = UIImage(named:"check_complete")
        
        guard let activity1 = Activity(title: "Sample Activity here", days_until_due: 5, completion: false, time_estimate: 10) else {
                fatalError("can't make activity 1")
        }
        
        guard let activity2 = Activity(title: "Our Solar System", days_until_due: 8, completion: false, time_estimate: 15) else {
                fatalError("can't make activity 2")
        }

        
        activities += [activity1, activity2]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
        cell.time.text = String(activity.time_estimate)
        cell.days_until_due.text = "Due in " + String(activity.days_until_due) + " days"

        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
