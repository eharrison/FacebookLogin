//
//  ImageTableViewCell.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 03/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        coverImageView.layer.masksToBounds = true
        coverImageView.layer.cornerRadius = coverImageView.frame.size.width/2
    }
}
