//
//  Company.swift
//  Go Mini V3
//
//  Created by Cameron Byers on 7/6/16.
//  Copyright © 2016 Go Mini. All rights reserved.
//

import Foundation

class Company {
    
    var password: String!
    var title: String!
    var twelve: String!
    var sixteen: String!
    var twenty: String!
    
    init (pass: String, name: String, xFRate: String, yFRate: String, zFRate: String) {
        password = pass
        title = name
        twelve = xFRate
        sixteen = yFRate
        twenty = zFRate
    }
    
}