//
//  MainDataSource.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 03/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import UIKit

enum ProfileCellType: String {
    case image
    case greeting
    case email
    case id
    case logout
}

protocol ProfileDataSourceDelegate: class {
    func didSelect(_ cell: ProfileCellType)
    func reloadData()
}

class ProfileDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var user: User?
    var content: [ProfileCellType] = []
    weak var delegate: ProfileDataSourceDelegate?
    
    func refresh(with user: User?) {
        guard let user = user else { return }
        self.user = user
        
        if user.image != nil {
            content.append(.image)
        }
        
        content.append(.greeting)
        content.append(.id)
        
        if user.email != nil {
            content.append(.email)
        }
        
        content.append(.logout)
    }
    
    // MARK: - Quantity
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    // MARK: - Cell Configuration
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: content[indexPath.row].rawValue, for: indexPath)
        
        if let cell = cell as? ImageTableViewCell {
            cell.coverImageView.load(from: user?.image)
        } else if let cell = cell as? GreetingTableViewCell {
            cell.nameLabel.text = user?.name
        } else if let cell = cell as? InfoTableViewCell {
            switch content[indexPath.row] {
            case .id:
                cell.infoLabel.text = user?.id
            case .email:
                cell.infoLabel.text = user?.email
            default:
                break
            }
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(content[indexPath.row])
    }
    
    // MARK: - Dimensions
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch content[indexPath.row] {
        case .image:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
}
