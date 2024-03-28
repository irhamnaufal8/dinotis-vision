//
//  Int+toRupiah.swift
//  dinotis-vision
//
//  Created by Irham Naufal on 28/03/24.
//

import Foundation

extension Int {
    var toRupiah: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "id_ID")
        numberFormatter.currencySymbol = "Rp"
        numberFormatter.maximumFractionDigits = 0
        
        let number = NSNumber(value: self)
        return numberFormatter.string(from: number) ?? "Rp0"
    }
}
