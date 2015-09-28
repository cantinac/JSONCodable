//
//  User.swift
//  Demo
//
//  Created by Matthew Cheok on 18/7/15.
//  Copyright © 2015 matthewcheok. All rights reserved.
//

import Foundation
import JSONCodable

struct User {
    let id: Int
    let name: String
    var email: String?
    var company: Company?
    var friends: [User] = []
    var website: NSURL?
}

extension User: JSONCodable {
    init?(JSONDictionary fromJSONDictionary: [String : AnyObject]) {
        do {
            id = try fromJSONDictionary.decode("id")
            name = try fromJSONDictionary.decode("full_name")
            email = try fromJSONDictionary.decode("email")
            company = try fromJSONDictionary.decode("company")
            friends = try fromJSONDictionary.decode("friends")
            website = try fromJSONDictionary.decode("website.url", transformer: JSONTransformers.StringToNSURL)
        }
        catch {
            print(error)
            return nil
        }
    }
    
    func toJSON() throws -> AnyObject {
        var result = [String: AnyObject]()
        try result.encode(id, key: "id")
        try result.encode(name, key: "full_name")
        try result.encode(email, key: "email")
        try result.encode(company, key: "company")
        try result.encode(friends, key: "friends")
        try result.encode(website, key: "website", transformer: JSONTransformers.StringToNSURL)
        return result
    }
}
