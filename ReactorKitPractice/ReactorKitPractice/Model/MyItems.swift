//
//  MyItems.swift
//  ReactorKitPractice
//
//  Created by 이명진 on 11/27/24.
//

import Foundation

struct MyItem: Hashable {
    let id = UUID()
    let value: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
