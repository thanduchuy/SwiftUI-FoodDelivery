//
//  Bottles.swift
//  FoodDelivery
//
//  Created by than.duc.huy on 04/05/2021.
//

import Foundation

struct Bottles: Identifiable, Hashable {
    var id: Int
    var image: String
    var name: String
    var description: String
    var totalPrice: Int
    var volume: Int
    var rate: Int
    var color: String
}
