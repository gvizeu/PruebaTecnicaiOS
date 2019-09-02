//
//  DataAccounts.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 29/06/2019.
//  Copyright © 2019. All rights reserved.
//

import Foundation

struct DataAccounts: Decodable {
    var returnCode : String
    var accounts : [Account]
    var failedAccountTypes : String
    private enum CodingKeys: String, CodingKey {
        case returnCode = "returnCode"
        case accounts = "accounts"
        case failedAccountTypes = "failedAccountTypes"
    }
}
