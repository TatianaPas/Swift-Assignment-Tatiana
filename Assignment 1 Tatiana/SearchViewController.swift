//
//  SearchViewController.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 18/04/23.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
 
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var promoImage: UIImageView!
    var filteredArray = [Site]()
    
    
    @IBAction func dateChanged(_ sender: UIDatePicker)
    {
        let selectedDate = sender.date
        let dateString = selectedDate.description(with: NSLocale.current)
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSearch", for: indexPath) as! SearchTableViewCell
        
        
         cell.nameTextField?.text = filteredArray[indexPath.row].name
         cell.addressTextField?.text = filteredArray[indexPath.row].saveDate
         cell.imageViewCell?.image = filteredArray[indexPath.row].image
         

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filteredArray = []
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        filteredArray = savedSites.filter({(savedSites)-> Bool in
            return savedSites.name.lowercased().range(of: searchText.lowercased()) != nil ||
            savedSites.address.lowercased().range(of: searchText.lowercased()) != nil ||
            savedSites.siteDescription.lowercased().range(of: searchText.lowercased()) != nil
        })
        if !filteredArray.isEmpty
        {
            promoImage.isHidden = true
        } else
        {
            promoImage.isHidden = false
        }
        
        self.tableView.reloadData()
        
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
