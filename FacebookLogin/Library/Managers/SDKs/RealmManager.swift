//
//  RealmManager.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 04/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import RealmSwift
import Realm

class RealmManager {
    
    static let shared: RealmManager = RealmManager()
    
    static func start() {
        shared.configureRealmDatabase()
    }
    
    var databaseSchemaVersion: UInt64 {
        set {
            UserDefaults.standard.set(newValue, forKey: "databaseSchemaVersion")
        }
        get {
            return UInt64(UserDefaults.standard.integer(forKey: "databaseSchemaVersion"))
        }
    }
    
    // MARK: - Realm configuration and migration
    
    func configureRealmDatabase() {
        let config = Realm.Configuration(
            schemaVersion: databaseSchemaVersion,
            migrationBlock: { migration, oldSchemaVersion in
                print("Successfully migrated Realm database from \(oldSchemaVersion) to \(self.databaseSchemaVersion)")
        })
        Realm.Configuration.defaultConfiguration = config
        print("Realm database location: \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
    }
    
    func clearDatabase() {
        let realm = try? Realm()
        try? realm?.write {
            realm?.deleteAll()
        }
    }
}
