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
        backgroundColor = UIColor.clearColor()
        layer.borderWidth = 1
    }
    
    func update() {
        self.setNeedsDisplay()
    }
    
    // MARK: View
    
    override func drawRect(rect: CGRect) {
        layer.borderColor = state.borderColor.CGColor
        layer.cornerRadius = rect.height / 2
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        
    }
}
