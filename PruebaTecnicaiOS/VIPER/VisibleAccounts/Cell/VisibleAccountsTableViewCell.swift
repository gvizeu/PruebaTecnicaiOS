//
//  VisibleAccountsTableViewCell.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 30/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class VisibleAccountsTableViewCell: UITableViewCell {

    @IBOutlet weak var accountNameTitle: UILabel!
    @IBOutlet weak var ibanTitle: UILabel!
    @IBOutlet weak var balanceTitle: UILabel!

    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var ibanLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpCellTitles()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUpCellTitles() {

        self.accountNameTitle.text = "account_name".localize
        self.ibanTitle.text = "iban".localize
        self.balanceTitle.text = "balance".localize
    }

    func configureCell(accountName: String?, iban: String?, balance: Int?) {
        if accountName == "" || accountName == nil {
            self.accountNameLabel.text =  "no_account_name".localize
        } else {
            self.accountNameLabel.text = accountName
        }

        if iban == "" || iban == nil {
            self.ibanLabel.text =  "no_iban".localize
        } else {
            self.ibanLabel.text = iban

        }

        let euroNumber = Double(balance ?? 0)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: euroNumber / 100))
        self.balanceLabel.text = "\(formattedNumber!) €"
    }
    static func reuseIdentified() -> String {
        return ViewCells.visibleAccountsTableViewCell.rawValue
    }

}
