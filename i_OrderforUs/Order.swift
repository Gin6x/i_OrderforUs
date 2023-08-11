//
//  Order.swift
//  i_OrderforUs
//
//  Created by Gin on 10/8/2023.
//

import Foundation

struct Order {
    var menuImage: URL
    var shopName: String
    var orderItems: [OrderItem]
    var totalPrice: Decimal{
        return orderItems.reduce(0) { $0 + $1.price }
    }
}

struct OrderItem {
    var customerName: String
    var item: String
    var price: Decimal
    var email: String
}
