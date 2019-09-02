//
//  VisibleAccountsInteractor.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol VisibleAccountsInteractorOutputProtocol: class
{
    func dataRecived(model: DataAccounts)
}

protocol VisibleAccountsInteractorInputProtocol: class
{
    var presenter: VisibleAccountsInteractorOutputProtocol? { get set }
    
    func getVisibleAccountsDataAction(profile: String, success: @escaping(String?) -> Void, failure: @escaping(NSError) -> Void)

}

class VisibleAccountsInteractor: VisibleAccountsInteractorInputProtocol {
    internal func getVisibleAccountsDataAction(profile: String, success: @escaping (String?) -> Void, failure: @escaping (NSError) -> Void) {
        //request data to provider
        let provider = DataProvider()
        provider.getAccountsDataAction(profile: "accounts", success: { model in
            guard let model = model
                else { return }
            //return data to presenter
            self.presenter?.dataRecived(model: model)
            success("Data recived ✅")
            
        }, failure: {_ in
            print(Error.self)
        })
    }
    
    var presenter: VisibleAccountsInteractorOutputProtocol?


}
