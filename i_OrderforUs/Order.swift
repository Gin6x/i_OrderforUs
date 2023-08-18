//
//  Order.swift
//  i_OrderforUs
//
//  Created by Gin on 10/8/2023.
//

import Foundation

struct Order: Codable {
    var orderDate = Date()
    var menuImage: URL?
    var shopName: String
    var currency: String
    var orderItems: [OrderItem]
    var totalPrice: Decimal{
        return orderItems.reduce(0) { $0 + $1.price }
    }
    
    init(menuImage: URL?, shopName: String, currency: String, orderItems: [OrderItem]) {
        self.menuImage = menuImage
        self.shopName = shopName
        self.currency = currency
        self.orderItems = orderItems
    }
}

struct OrderItem: Codable {
    var customerName: String
    var item: String
    var currency: String
    var price: Decimal
    var email: String
}
