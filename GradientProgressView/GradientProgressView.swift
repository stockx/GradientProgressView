//
//  GradientProgressView.swift
//  GradientProgressView
//
//  Created by Sklar, Josh on 10/10/16.
//  Copyright © 2016 StockX. All rights reserved.
//

import UIKit

class GradientProgressView: UIView {
    
    struct State {
        var progress: CGFloat
        var progressColor: UIColor
        var backgroundColor: UIColor
        var borderColor: UIColor
    }
    
    var state: State = State(progress: 0,
                             progressColor: UIColor.blueColor(),
                             backgroundColor: UIColor.whiteColor(),
                             borderColor: UIColor.lightGrayColor()) {
        didSet {
            update()
        }
    }
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        update()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        update()
    }
    
    private func initialize() {
        // Will trigger a setNeedsDisplay whenever bounds changes (i.e. orientation change)
        contentMode = .Redraw
        
        backgroundColor = UIColor.clearColor()
        layer.borderWidth = 1
        
        clipsToBounds = true
    }
    
    func update() {
        self.setNeedsDisplay()
    }
    
    // MARK: View
    
    override func drawRect(rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        drawProgressBackground(context, inRect: rect)
        
        layer.borderColor = state.borderColor.CGColor
        layer.cornerRadius = rect.height / 2
    }
    
    // MARK: View Helpers
    
    private func drawProgressBackground(context: CGContext, inRect rect: CGRect) {
        CGContextSaveGState(context)
        
        // Gradient
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 1.0]
        let colors = [state.backgroundColor.CGColor, state.backgroundColor.darkerColor().CGColor]
        
        let gradient = CGGradientCreateWithColors(colorSpace, colors, locations)
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: rect.size.height)
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions(rawValue: 0))
        
        CGContextRestoreGState(context)
    }
}
