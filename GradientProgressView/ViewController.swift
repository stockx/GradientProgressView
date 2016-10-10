//
//  ViewController.swift
//  GradientProgressView
//
//  Created by Sklar, Josh on 10/10/16.
//  Copyright © 2016 StockX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: GradientProgressView!
    @IBOutlet weak var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var state = progressView.state
        state.progress = CGFloat(progressSlider.value)
        progressView.state = state
    }
    
    @IBAction func didTapColorButton(sender: UIButton) {
        var state = progressView.state
        state.progressColor = sender.backgroundColor!
        progressView.state = state
    }
    
    @IBAction func progressSliderChanged(sender: UISlider) {
        var state = progressView.state
        state.progress = CGFloat(sender.value)
        progressView.state = state
    }
}

