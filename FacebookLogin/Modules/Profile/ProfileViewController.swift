//
//  MainViewController.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 03/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ProfileViewModel()
    private let dataSource = ProfileDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Configuration
    
    private func setupTableView() {
        dataSource.delegate = self
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
//        viewModel.delegate = self
        viewModel.loadProfile { [weak self] user in
            self?.dataSource.refresh(with: user)
        }
    }
    
}

extension ProfileViewController: ProfileDataSourceDelegate {
    func didSelect(_ cell: ProfileCellType) {
        switch cell {
        case .logout:
            SessionManager.shared.logout()
        default:
            break
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
