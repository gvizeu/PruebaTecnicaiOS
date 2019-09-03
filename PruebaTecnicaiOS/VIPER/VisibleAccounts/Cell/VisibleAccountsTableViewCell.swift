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

        self.accountNameTitle.text = NSLocalizedString("account_name", comment: "account_name")
        self.ibanTitle.text = NSLocalizedString("iban", comment: "iban")
        self.balanceTitle.text = NSLocalizedString("balance", comment: "balance")
    }

    func configureCell(accountName: String?, iban: String?, balance: Int?) {
        if accountName == "" || accountName == nil {
            self.accountNameLabel.text =  NSLocalizedString("no_account_name", comment: "no_account_name")
        } else {
            self.accountNameLabel.text = accountName
        }

        if iban == "" || iban == nil {
            self.ibanLabel.text =  NSLocalizedString("no_iban", comment: "no_iban")
        } else {
            self.ibanLabel.text = iban

        }

        let euroNumber = Double(balance ?? 0)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: euroNumber / 100))
        self.balanceLabel.text = "\(formattedNumber!) €"
    }

}
