//
//  Company.swift
//  Demo
//
//  Created by Matthew Cheok on 18/7/15.
//  Copyright © 2015 matthewcheok. All rights reserved.
//

import Foundation
import JSONCodable

struct Company {
    let name: String
    var address: String?
}

extension Company: JSONCodable {
    init?(JSONDictionary fromJSONDictionary: [String : AnyObject]) {
        do {
            name = try fromJSONDictionary.decode("name")
            address = try fromJSONDictionary.decode("address")
        }
        catch {
            print(error)            
            return nil
        }
    }
    
    func toJSON() throws -> AnyObject {
        var result = [String: AnyObject]()
        try result.encode(name, key: "name")
        try result.encode(address, key: "address")
        return result
    }
}