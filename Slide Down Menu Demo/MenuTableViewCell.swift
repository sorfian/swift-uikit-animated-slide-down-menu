//
//  MenuTableViewCell.swift
//  Slide Down Menu Demo
//
//  Created by Sorfian on 15/04/23.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
