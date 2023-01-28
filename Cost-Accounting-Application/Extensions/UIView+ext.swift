//
//  UIView+ext.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit

extension UIView {
    func addTopBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth ]
        separator.frame = CGRect(x: 0,
                                 y: 0,
                                 width: frame.width,
                                 height: height)
        addSubview(separator)
    }
}
