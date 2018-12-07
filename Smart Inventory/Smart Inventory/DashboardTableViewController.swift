//
//  DashboardTableViewController.swift
//  Smart Inventory
//
//  Created by Shruthi  Patlolla on 11/18/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class DashboardTableViewController: UITableViewController {

    
    var images = ["iphone8", "laptop", "iphone8"]
    var titles = ["Iphone 8", "HP Laptop", "Iphone X"]
    var descriptions = ["Refurbished Iphone 8, 64 GB", "HP Notebook , i3 Processor, 8 GB RAM, 256 GB", "New Iphone X, 256 GB"]
    var quantities = ["Quantity : 4", "Qauntity : 1", "Quantity : 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.backgroundColor = UIColor(patternImage: UIImage(named: "appbg.jpg")!)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dashboardCell", for: indexPath)

        let title = tableView.viewWithTag(100) as! UILabel!
        let desc = tableView.viewWithTag(200) as! UILabel!
        let image = tableView.viewWithTag(300) as! UIImageView!
        let quantity = tableView.viewWithTag(400) as! UILabel!

        
        image?.image = UIImage(named: images[indexPath.row])
        title?.text = titles[indexPath.row]
        desc?.text = descriptions[indexPath.row]
        quantity?.text = quantities[indexPath.row]
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
