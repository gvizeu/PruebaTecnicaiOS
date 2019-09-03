//
//  StringExtension.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Vizeu on 03/09/2019.
//

import Foundation

extension String {
    public var localize: String{
        return NSLocalizedString(self, comment: self)
    }
}
