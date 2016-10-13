//
//  PhotoCell.swift
//  TumblerFeed
//
//  Created by Neha Samant on 10/12/16.
//  Copyright © 2016 Neha Samant. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var feedPhotoView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        feedPhotoView.layer.cornerRadius = 20
        feedPhotoView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProfileImageWithUrl(profileImageUrl: String) {
        
    }

    func setUserName(username: String) {
        
    }
    
    func setFeedImage(feedImageUrl: String) {
        
    }

}
