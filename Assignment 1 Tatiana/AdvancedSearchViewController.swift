//
//  AdvancedSearchViewController.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 27/04/23.
//

import UIKit

class AdvancedSearchViewController: UIViewController {

   
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func printDateBnt(_ sender: UIButton)
    {
        print(datePicker.date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
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
