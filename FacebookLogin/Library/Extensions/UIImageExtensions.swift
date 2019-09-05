//
//  UIImageExtensions.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 03/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(from urlString: String?) {
        backgroundColor = UIColor(white: 0, alpha: 0.2)
        
        guard let urlString = urlString,
            let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
            }.resume()
    }
    
}
