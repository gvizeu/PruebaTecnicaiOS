//
//  Account.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 29/06/2019.
//  Copyright © 2019. All rights reserved.
//

import Foundation

struct Account: Decodable {
    var accountBalanceInCents: Int?
    var accountCurrency: String?
    var accountId: Int?
    var accountName: String?
    var accountNumber: MetadataType?
    var accountType: String?
    var alias: String?
    var isVisible: Bool?
    var iban: String?
    var linkedAccountId: Int?
    var productName: String?
    var productType: Int?
    var savingsTargetReached: Int?
    var targetAmountInCents: Int?

    init(accountBalanceInCents: Int,
         accountCurrency: String,
         accountId: Int,
         accountName: String,
         accountNumber: MetadataType,
         accountType: String,
         alias: String,
         isVisible: Bool,
         iban: String,
         linkedAccountId: Int?,
         productName: String?,
         productType: Int?,
         savingsTargetReached: Int?,
         targetAmountInCents: Int?) {
        self.accountBalanceInCents = accountBalanceInCents
        self.accountCurrency = accountCurrency
        self.accountId = accountId
        self.accountName = accountName
        self.accountNumber = accountNumber
        self.accountType = accountType
        self.alias = alias
        self.isVisible = isVisible
        self.iban = iban
        self.linkedAccountId = linkedAccountId
        self.productName = productName
        self.savingsTargetReached = savingsTargetReached
        self.targetAmountInCents = targetAmountInCents
    }

    private enum CodingKeys: String, CodingKey {
        case accountBalanceInCents
        case accountCurrency
        case accountId
        case accountName
        case accountNumber
        case accountType
        case alias
        case isVisible
        case iban
        case linkedAccountId
        case productName
    }

}
enum MetadataType: Codable {
    case int(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self = try .int(container.decode(Int.self))
        } catch DecodingError.typeMismatch {
            do {
                self = try .string(container.decode(String.self))
            } catch DecodingError.typeMismatch {
                let errorText = "Encoded payload not of an expected type"
                throw DecodingError.typeMismatch(MetadataType.self,
                                                DecodingError.Context(codingPath: decoder.codingPath,
                                                                      debugDescription: errorText))
            }
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let int):
            try container.encode(int)
        case .string(let string):
            try container.encode(string)
        }
    }
}
