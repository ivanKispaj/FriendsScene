//
//  ModelForView.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation

struct ModelForView: Hashable {
    static func == (lhs: ModelForView, rhs: ModelForView) -> Bool {
        return lhs.header == rhs.header && lhs.rows == rhs.rows
    }
    
    let header: String
    var rows: [ModelForParse]
}
