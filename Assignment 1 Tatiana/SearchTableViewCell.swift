//
//  SearchTableViewCell.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 18/04/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameTextField: UILabel!
    
    @IBOutlet weak var addressTextField: UILabel!
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
