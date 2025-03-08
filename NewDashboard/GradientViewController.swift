//
//  GradientViewController.swift
//  NewDashboard
//
//  Created by Phincon on 06/02/25.
//

import UIKit

class GradientViewController: UIViewController {

    @IBOutlet weak var gradientViews: GradientBorderBgView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gradientViews.layer.cornerRadius = 12
//        gradientViews.linet
//        gradientViews.gradientColors = [UIColor.orange.cgColor, UIColor.red.cgColor]
//        gradientViews.gradientLocations = [0.0, 0.5, 1.0]
//        gradientViews.layer.borderWidth = 5
        
    }
    
   
}


