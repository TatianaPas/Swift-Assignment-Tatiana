//
//  SiteTableViewCell.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 17/04/23.
//

import UIKit

class SiteTableViewCell: UITableViewCell {

      
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var addressTextField: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    
   // @IBOutlet weak var descriptionTextField: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
