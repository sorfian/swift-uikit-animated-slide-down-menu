//
//  NewsTableViewCell.swift
//  Slide Down Menu Demo
//
//  Created by Sorfian on 15/04/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var postImageView:UIImageView! {
        didSet {
            postImageView.layer.cornerRadius = 20
            postImageView.clipsToBounds = true
        }
    }
    @IBOutlet var postTitle:UILabel!
    @IBOutlet var postAuthor:UILabel!
    @IBOutlet var authorImageView:UIImageView! {
        didSet {
            authorImageView.layer.cornerRadius = 10
            authorImageView.clipsToBounds = true
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
