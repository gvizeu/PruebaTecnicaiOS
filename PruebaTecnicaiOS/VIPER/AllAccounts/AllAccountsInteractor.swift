//
//  AllAccountsInteractor.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol AllAccountsInteractorOutputProtocol: class
{
    func dataRecived(model: DataAccounts)
}

protocol AllAccountsInteractorInputProtocol: class
{
    var presenter: AllAccountsInteractorOutputProtocol? { get set }
    func getAllAccountsDataAction(profile: String, success: @escaping(String?) -> Void, failure: @escaping(NSError) -> Void)
}

class AllAccountsInteractor: NSObject ,  AllAccountsInteractorInputProtocol{
    
    var presenter: AllAccountsInteractorOutputProtocol?
    
    
    internal func getAllAccountsDataAction(profile: String, success: @escaping(String?) -> Void, failure: @escaping(NSError) -> Void) {
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

}
