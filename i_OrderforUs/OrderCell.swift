//
//  OrderCell.swift
//  i_OrderforUs
//
//  Created by Gin on 2/6/2023.
//

import UIKit

class OrderCell: UITableViewCell {
    
    let menuView = UIView()
    let menuTextField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configmenuView()
        configmenuTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configmenuView () {
        
    }
    
    func configmenuTextField() {
        
    }
    
}
