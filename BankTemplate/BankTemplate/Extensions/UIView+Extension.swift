//
//  UIView+Extension.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/26/24.
//

import UIKit

public extension UIView {
    
    func addSubviews(_ views: [UIView], prepareForAutoLayout needToPrepare: Bool = true) {
        views.forEach{ addSubview(needToPrepare ? prepareForAutoLayout ($0) : $0) }
    }
}
