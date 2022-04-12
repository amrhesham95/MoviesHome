//
//  RealmStorage.swift
//  YourNews
//
//  Created by Amr Hesham on 26/04/2021.
//

import Foundation
import RealmSwift

public class RealmStorage {
  
  private let realm: Realm = {
    guard let realm = try? Realm() else {
      fatalError("Unable to launch realm!")
    }
    return realm
  }()
  
  public init() { }
}

extension RealmStorage {
    
  func getObject<T>(_ type: T.Type, key: String) throws -> T? where T: Object {
    return realm.object(ofType: type, forPrimaryKey: key)
  }
  
  public func allObjects<T>(ofType type: T.Type, matching predicate: NSPredicate? = nil/*, sorted: Sorted??*/) -> [T] where T: Object {
    var objects = realm.objects(type)
    if let predicate = predicate {
      objects = objects.filter(predicate)
    }
    
    return objects.compactMap { $0 }
  }
      
  public func update<T>(object: T) throws where T: Object {
    try realm.write {
      realm.add(object, update: .modified)
    }
  }
  
  func checkObjectIsExistInDB<T>(_ type: T.Type, key: String) throws -> Bool {
    guard let model = type as? Object.Type else { return false }
    if realm.object(ofType: model, forPrimaryKey: key) != nil { return true }
    return false
  }
  
  public func deleteObject<T>(_ object: T, key: String) where T: Object {
    do {
      try realm.write {
        realm.delete(realm.objects(T.self).filter("url=%@", key))
      }
    } catch let error {
      print("error ...... is   \(print(error.localizedDescription))")
    }
  }
  
  func checkObjectIsExistInDB<T>(_ type: T.Type, with objectID: String) -> Bool where T: Object {
    if realm.object(ofType: type, forPrimaryKey: objectID) != nil { return true }
    return false
  }
  
  
  public func perform(_ closure: @escaping () -> Void) {
    do {
      try realm.write {
        closure()
      }
    } catch {
      print("error ...... is   \(print(error.localizedDescription))")
    }
  }
  
  public func reset() throws {
    try realm.write {
      realm.deleteAll()
    }
  }
  
}

public enum RealmError: Error {
  case eitherRealmIsNilOrNotRealmSpecificModel
}

extension RealmError: LocalizedError {
  public var errorDescription: String? {
    switch self {
    case .eitherRealmIsNilOrNotRealmSpecificModel:
      return "eitherRealmIsNilOrNotRealmSpecificModel"
    }
  }
}

extension RealmStorage: StorageManagerProtocol {
    func getAllObjects<T>(ofType type: T.Type, matching predicate: NSPredicate?) -> [T]  {
        guard let type = type as? Object.Type else { return [] }
        return  allObjects(ofType: type, matching: predicate) as? [T]  ?? []
    }
    
    public func updateObject<T>(_ object: T) throws {
        if let object = object as? Object {
            try update(object: object)
        }
    }
}
