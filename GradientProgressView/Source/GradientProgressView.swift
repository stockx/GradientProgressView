//
//  GradientProgressView.swift
//  GradientProgressView
//
//  Created by Sklar, Josh on 10/10/16.
//  Copyright © 2016 StockX. All rights reserved.
//

import UIKit

public class GradientProgressView: UIView {
    
    public struct State {
        public var progress: CGFloat
        public var progressColor: UIColor
        public var backgroundColor: UIColor
        public var borderColor: UIColor
    }
    
    public var state: State = State(progress: 0,
                             progressColor: UIColor.blueColor(),
                             backgroundColor: UIColor.whiteColor(),
                             borderColor: UIColor.lightGrayColor()) {
        didSet {
            update()
        }
    }
    
    // MARK: Init
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        update()
    }
    
    required public init?(coder aDecoder: NSCoder) {
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
    
    // MARK: State
    
    func update() {
        self.setNeedsDisplay()
    }
    
    // MARK: View
    
    override public func drawRect(rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        drawProgressBackground(context, inRect: rect)
        if state.progress > 0.0 {
            drawProgress(context, inRect: rect)
        }
        
        layer.borderColor = state.borderColor.CGColor
        layer.cornerRadius = rect.height / 2
    }
    
    // MARK: View Helpers

    private func drawGradient(baseColor color: UIColor, inRect rect: CGRect, context: CGContext) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 1.0]
        let colors = [color.CGColor, color.darkerColor().CGColor]
        
        let gradient = CGGradientCreateWithColors(colorSpace, colors, locations)
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: rect.size.height)
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions(rawValue: 0))
    }

    private func drawProgressBackground(context: CGContext, inRect rect: CGRect) {
        CGContextSaveGState(context)
        
        // Gradient
        drawGradient(baseColor: state.backgroundColor,
                     inRect: rect,
                     context: context)
        
        CGContextRestoreGState(context)
    }
    
    private func drawProgress(context: CGContext, inRect rect: CGRect) {
        CGContextSaveGState(context)

        let rectToDrawIn = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width * state.progress, height: rect.size.height)
        CGContextAddRect(context, rectToDrawIn)
        CGContextClip(context)

        // Gradient
        drawGradient(baseColor: state.progressColor,
                     inRect: rectToDrawIn,
                     context: context)
        
        CGContextRestoreGState(context)
    }
}
