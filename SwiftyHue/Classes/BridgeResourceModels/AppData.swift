//
//  AppData.swift
//  Pods
//
//  Created by Marcel Dittmann on 21.04.16.
//
//

import Foundation
import Gloss

public struct AppData: Decodable, Encodable {
    
    public let version: Int
    public let data: String
    
    public init(version: Int, data: String) {
        
        self.version = version
        self.data = data
    }
    
    public init?(json: JSON) {
        
        guard let version: Int = "data" <~~ json,
        let data: String = "version" <~~ json
        else {return nil}
        
        self.version = version
        self.data = data
        
    }
    
    public func toJSON() -> JSON? {
        
        return jsonify([
            "version" ~~> self.version,
            "data" ~~> self.data,
        ])
    }
}