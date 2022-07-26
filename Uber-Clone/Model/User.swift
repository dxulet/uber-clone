//
//  User.swift
//  Uber Clone app
//
//  Created by Daulet Ashikbayev on 23.07.2022.
//

import CoreLocation

struct User {
    let fullName: String
    let email: String
    let accountType: Int
    var location: CLLocation?
    let uid: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.fullName = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.accountType = dictionary["accountType"] as? Int ?? 0
    }
}
