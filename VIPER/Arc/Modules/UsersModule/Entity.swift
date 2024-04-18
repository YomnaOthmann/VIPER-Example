//
//  Entity.swift
//  VIPER
//
//  Created by Mac on 18/04/2024.
//

import Foundation

struct User: Codable{
    let name: String
    let email: String
    let address: Address
    let phone: String
}

struct Address: Codable{
    let street: String
    let city: String
}
