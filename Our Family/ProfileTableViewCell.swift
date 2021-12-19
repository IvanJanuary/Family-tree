//
//  ProfileTableViewCell.swift
//  Our Family
//
//  Created by Ivan on 19.12.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var titleViewCell: UILabel!
    @IBOutlet weak var localViewCell: UILabel!
    @IBOutlet weak var textViewCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
