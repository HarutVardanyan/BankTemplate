//
//  PrepareForAutoLayout.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/26/24.
//

import UIKit

public func prepareForAutoLayout<T: UIView>(_ view: T) -> T {
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
    
}
