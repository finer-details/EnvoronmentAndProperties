//
//  JsonManager.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 21/09/2022.
//

import Foundation

//Fully Generic JSON Manager that will accept any type of data.

final class JsonManager {
    
    enum FileDirectory {
        case documents
        case local
    }
    
    
    static var bundle: Bundle {
        Bundle(for: Self.self)
    }
    
    func writeJSON<T: Encodable>(path: String, location: FileDirectory, _ data : T) {
        do {
            
            var fileURL: URL!
            
            switch location {
            case .documents:
                fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    .appendingPathComponent(path + ".json")
            case .local:
                fileURL = try BundleLocator.urlForResource(named: path, extension: "json")
            }
            
//            guard let fileURL = BundleLocator.bundle.url(forResource: path, withExtension: "json") else {
//                throw BundleLocator.Error.notFound
//            }
            
            let encoder = JSONEncoder()
            try encoder.encode(data).write(to: fileURL)
        } catch let error {
            print(error)
        }
    }
    func readJSON<T: Decodable>(path: String, location: FileDirectory, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            
            var fileURL: URL!
            
            switch location {
            case .documents:
                fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    .appendingPathComponent(path + ".json")
            case .local:
                fileURL = try BundleLocator.urlForResource(named: path, extension: "json")
            }
            
            
            let data = try Data(contentsOf: fileURL)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decoded))
            
        }
        catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
    }
}



final class BundleLocator {
    
    enum Error: Swift.Error {
        case notFound
    }
    
    static var bundle: Bundle {
        Bundle(for: Self.self)
    }
    
    static func urlForResource(named name: String, extension fileExtension: String) throws -> URL {
        guard let url = bundle.url(forResource: name, withExtension: fileExtension) else {
            throw Error.notFound
        }
        return url
    }
}





// *** USE:***

//let manager = JSONManager()
//manager.writeJSON(path: <#T##String#>, <#T##data: Encodable##Encodable#>)
//manager.readJSON(path: <#T##String#>, completion: <#T##(Result<Decodable, Error>) -> Void#>)

// path = name of json file. i.e. file.json
// data: Encodable = the array data, can use .map  or any other data
