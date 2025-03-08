//
//  GradientBorderBgView.swift
//  MyTelkomsel
//
//  Created by Clara Anggraini on 11/8/23.
//  Copyright © 2023 PT. PHINCON. All rights reserved.
//

import Foundation
import UIKit

class GradientBorderBgView: UIView {
        var gradientColors: [UIColor] = [.systemGreen, .systemMint] {
            didSet {
                setNeedsLayout()
            }
        }

        override func layoutSubviews() {
            super.layoutSubviews()

            let gradient = UIImage.gradientImage(bounds: bounds, colors: gradientColors)
            layer.borderColor = UIColor(patternImage: gradient).cgColor
        }
}
