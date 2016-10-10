//
//  UIColor+Manipulation.swift
//  GradientProgressView
//
//  Created by Sklar, Josh on 10/10/16.
//  Copyright © 2016 StockX. All rights reserved.
//

import UIKit

extension UIColor {
    
    /**
     Returns a darker version of the receiver.
     */
    func darkerColor() -> UIColor? {
        if self == UIColor.whiteColor() {
            return UIColor(white: 0.9, alpha: 1.0)
        }
        
        var hue: CGFloat = 0,
        saturation: CGFloat = 0,
        brightness: CGFloat = 0,
        alpha: CGFloat = 0,
        white: CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue,
                           saturation: saturation,
                           brightness: brightness * 0.9,
                           alpha: alpha)
        }
        else if getWhite(&white, alpha: &alpha) {
            return UIColor(white: max(white * 0.9, 0.0), alpha: alpha)
        }
        else {
            return nil
        }
    }
}
