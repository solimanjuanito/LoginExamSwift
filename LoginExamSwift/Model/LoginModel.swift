//
//  LoginModel.swift
//  CodingExam
//
//  Created by Yuan Soliman on 2/26/25.
// Sample Model for Login

import Foundation
// MARK: - LoginModel
struct LoginModel: Codable {
    let returnCode: Int?
    let data: String?
    let errors: [String]?

    enum CodingKeys: String, CodingKey {
        case returnCode = "returnCode"
        case data = "data"
        case errors = "errors"
    }
}
