//
//  Model.swift
//  LectureProject_1
//
//  Created by Rustem Manafov on 28.06.22.
//

import Foundation

struct CountryModel: Codable{
    let name: String
    let flag: String
    let cities: [CityModel]
}

struct CityModel: Codable{
    let name: String
    let image: String
    let text: String
}


struct LoginModel: Codable{
    let email: String
    let password: String
}

struct RegisterModel: Codable{
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let gender: String
}

struct User: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let gender: String
}
