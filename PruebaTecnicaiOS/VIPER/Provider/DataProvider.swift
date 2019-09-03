//
//  DataProvider.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 30/06/2019.
//  Copyright © 2019. All rights reserved.
//

import Foundation
protocol DataProviderProtocol: class {
    func getAccountsDataAction(profile: String, success: @escaping(DataAccounts?) -> Void, failure: @escaping(NSError) -> Void)
}

class DataProvider: DataProviderProtocol {

    var presenter: AllAccountsInteractorOutputProtocol?

    internal func getAccountsDataAction(profile: String, success: @escaping(DataAccounts?) -> Void, failure: @escaping(NSError) -> Void) {

        // read data from json file
        if let url = Bundle.main.url(forResource: profile, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(DataAccounts.self, from: data)

                if jsonData.returnCode == "OK"{
                    success(jsonData)
                } else {
                    print(NSLocalizedString("unexpected_error", comment: "unexpected_error"))
                }

            } catch {
                print("error:\(error)")
            }
        }

    }
}
