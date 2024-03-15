//  Created by Alessandro Comparini on 21/02/24.
//

import UIKit
import CustomComponentsSDK

class DotView: ViewBuilder {
    
    private let size: CGFloat
    private let color: UIColor
    
    init(size: CGFloat, _ color: UIColor = Theme.shared.currentTheme.primary) {
        self.size = size
        self.color = color
        super.init()
        configure()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configFrame()
        configBorder()
        configNeumorphism()
    }
    
    private func configFrame() {
        self.get.layer.frame = CGRect(origin: .zero, size: CGSize(width: size, height: size))
    }
    
    private func configBorder() {
        self.setBorder({ build in
            build
                .setCornerRadius(size * 0.5)
        })
    }
    
    private func configNeumorphism() {
        self.setNeumorphism { build in
            build
                .setReferenceColor(color)
                .setLightPosition(.leftTop)
                .setShape(.convex)
                .setIntensity(to: .light, percent: 70)
                .setIntensity(to: .dark, percent: 100)
                .setBlur(to: .light, percent: 2)
                .setBlur(to: .dark, percent: 5)
                .setDistance(to: .light, percent: 2)
                .setDistance(to: .dark, percent: 8)
                .setShadowColor(to: .dark, hexColor: "#000000")
                .apply()
        }
    }
    
    
}
