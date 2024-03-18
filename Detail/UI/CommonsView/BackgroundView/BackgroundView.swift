//  Created by Alessandro Comparini on 15/02/24.
//


import UIKit
import CustomComponentsSDK


class BackgroundView: ViewBuilder {
    
    private var gradient: GradientBuilder?
    
    override init() {
        super.init(frame: .zero)
        configure()
    }
    
    public func applyGradient() {
        gradient?.apply()
        gradient = nil
    }
    
//  MARK: - PRIVATE AREA
    private func configure() {
        gradient = GradientBuilder(self.get)
            .setGradientColors(Theme.shared.currentTheme.backgroundColorGradient)
            .setAxialGradient(.leftTopToRightBottom)
    }
}

