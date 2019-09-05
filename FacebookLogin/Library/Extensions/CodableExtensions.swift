//
//  CodableExtensions.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 03/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import Foundation

extension Encodable {
  func encode(with encoder: JSONEncoder = JSONEncoder()) throws -> Data {
    return try encoder.encode(self)
  }
}

extension Decodable {
  static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data?) throws -> Self {
    guard let data = data else {
      throw CodableError.invalidData
    }
    
    return try decoder.decode(Self.self, from: data)
  }
  
  static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data?) throws -> [Self] {
    guard let data = data else {
      throw CodableError.invalidData
    }
    
    return try decoder.decode([Self].self, from: data)
  }
}

enum CodableError: Error {
  case invalidData
}
