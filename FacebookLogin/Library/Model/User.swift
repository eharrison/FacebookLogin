//
//  User.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 03/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import Realm
import RealmSwift

class User: Object {
    @objc dynamic public var id: String = ""
    @objc dynamic public var name: String = ""
    @objc dynamic public var email: String? = nil
    @objc dynamic public var image: String? = nil

    // MARK: - Realm
    
    override public static func primaryKey() -> String? {
        return "id"
    }
    
    init(id: String, name: String, email: String? = nil, image: String? = nil) {
        super.init()
        
        self.id = id
        self.name = name
        self.email = email
        self.image = image
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    func save() {
        let realm = try? Realm()
        try? realm?.write {
            realm?.add(self, update: .all)
        }
    }
    
    func delete() {
        let realm = try? Realm()
        try? realm?.write {
            realm?.delete(self)
        }
    }
    
    static func firstObject() -> User? {
        let realm = try? Realm()
        return realm?.objects(User.self).first
    }
}
