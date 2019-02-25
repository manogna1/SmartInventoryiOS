//
//  PostAnnouncementVC.swift
//  Smart Inventory
//
//  Created by vamshi raj on 2/24/19.
//  Copyright © 2019 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class PostAnnouncementVC: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var productNameTF: UITextField!
    @IBOutlet weak var requiredTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func displayAlert(msg: String){
        let  alert  =  UIAlertController(title:  "Announcement",  message: msg,  preferredStyle:  .alert)
        alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  { _ in
            self.performSegue(withIdentifier: "post", sender: nil)
        }))
        self.present(alert,  animated:  true,  completion:  nil)    }
    
    
    func displayError(msg: String) {
        let alert = UIAlertController(title: "Failed", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

    @IBAction func postAnnouncementBtn(_ sender: Any) {
        if let title = titleTF.text, let productName = productNameTF.text, let required = Int(requiredTF.text!)
        {
            if descriptionTF.text.isEmpty {
                descriptionTF.text = "N/A"
            }
            
            Announcements.announce.saveAnouncements(title: title, productName: productName, required: required, claimed: 0, unclaimed: required, desc: descriptionTF.text)
            self.displayAlert(msg: "Posted!!")
        } else {
            self.displayError(msg: "Enter All required fields")
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
