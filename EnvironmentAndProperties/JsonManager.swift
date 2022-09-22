//
//  JsonManager.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 21/09/2022.
//

import Foundation

final class JsonManager {
    
    enum Location {
        case documents
        case local
    }
    
    var path: String
    var location: Location
    var fileURL: URL
    
    init(path: String, location: Location) throws {
        self.path = path
        self.location = location
        switch location {
        case .documents:
            self.fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent(path + ".json")
        case .local:
            self.fileURL = try BundleLocator.urlForResource(named: path, extension: "json")
        }
    }
    
    func writeJSON<T: Encodable>(_ data : T) {
        do {
            
            let encoder = JSONEncoder()
            try encoder.encode(data).write(to: fileURL)
            
        } catch let error {
            print(error)
        }
    }
    
    func readJSON<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        do {
            
            let data = try Data(contentsOf: fileURL)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decoded))
            
        } catch let error {
            completion(.failure(error))
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
