//
//  GreetingTableViewCell.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 03/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import UIKit

class GreetingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupGreeting()
    }
    
    private func setupGreeting() {
        greetingLabel.text = TimeManager.timeOfDay(for: Date()).message
    }
}
