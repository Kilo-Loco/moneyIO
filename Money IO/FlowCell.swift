//
//  FlowCell.swift
//  Money IO
//
//  Created by Kyle Lee on 3/13/16.
//  Copyright © 2016 Kilo Loco. All rights reserved.
//

import UIKit

class FlowCell: UITableViewCell {

    @IBOutlet weak var financeLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(flow: Flow) {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        self.financeLbl.text = formatter.stringFromNumber(flow.cashFlow!)
        self.timestampLbl.text = NSDateFormatter.localizedStringFromDate(flow.date!, dateStyle: .ShortStyle, timeStyle: .ShortStyle)
    }
}
