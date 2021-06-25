//
//  Entitiy.swift
//  MVVMPractice
//
//  Created by kakao on 2021/06/25.
//

import Foundation

struct UtcTimeModel: Decodable {
    let id: String
    let currentDateTime: String
    let isDayLightSavingsTime: Bool
    let dayOfTheWeek: String
    let timeZoneName: String
    let currentFileTime: Int
    let ordinalDate: String
    let serviceResponse: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case currentDateTime
        case isDayLightSavingsTime
        case dayOfTheWeek
        case timeZoneName
        case currentFileTime
        case ordinalDate
        case serviceResponse
    }
}
