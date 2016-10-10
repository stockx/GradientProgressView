//
//  ViewController.swift
//  GradientProgressView
//
//  Created by Sklar, Josh on 10/10/16.
//  Copyright © 2016 StockX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pv: GradientProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pv = GradientProgressView(frame: CGRectZero)
        pv.state = GradientProgressView.State(progress: 0.4, progressColor: UIColor.blueColor(), backgroundColor: UIColor.greenColor(), borderColor: UIColor.grayColor())
        pv.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pv)
        
        let views = ["pv": pv]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[pv]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[pv(50)]", options: [], metrics: nil, views: views))
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

