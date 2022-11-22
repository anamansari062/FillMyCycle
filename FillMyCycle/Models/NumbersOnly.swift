//
//  NumbersOnly.swift
//  FillMyCycle
//
//  Created by Anam Ansari on 22/11/22.
//

import Foundation

//Makes sure that the value entered is a number
class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
