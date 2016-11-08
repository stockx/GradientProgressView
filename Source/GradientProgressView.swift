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
                             progressColor: .blue,
                             backgroundColor: .white,
                             borderColor: .lightGray) {
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
    
    fileprivate func initialize() {
        // Will trigger a setNeedsDisplay whenever bounds changes (i.e. orientation change)
        contentMode = .redraw
        
        backgroundColor = .clear
        layer.borderWidth = 1
        
        clipsToBounds = true
    }
    
    // MARK: State
    
    func update() {
        self.setNeedsDisplay()
    }
    
    // MARK: View
    
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        drawProgressBackground(context, inRect: rect)
        if state.progress > 0.0 {
            drawProgress(context, inRect: rect)
        }
        
        layer.borderColor = state.borderColor.cgColor
        layer.cornerRadius = rect.height / 2
    }
    
    // MARK: View Helpers

    fileprivate func drawGradient(baseColor color: UIColor, inRect rect: CGRect, context: CGContext) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 1.0]
        let colors = [color.cgColor, color.darkerColor().cgColor]
        
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: rect.size.height)
        context.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
    }

    fileprivate func drawProgressBackground(_ context: CGContext, inRect rect: CGRect) {
        context.saveGState()
        
        // Gradient
        drawGradient(baseColor: state.backgroundColor,
                     inRect: rect,
                     context: context)
        
        context.restoreGState()
    }
    
    fileprivate func drawProgress(_ context: CGContext, inRect rect: CGRect) {
        context.saveGState()

        let rectToDrawIn = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width * state.progress, height: rect.size.height)
        context.addRect(rectToDrawIn)
        context.clip()

        // Gradient
        drawGradient(baseColor: state.progressColor,
                     inRect: rectToDrawIn,
                     context: context)
        
        context.restoreGState()
    }
}
