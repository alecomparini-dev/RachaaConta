//  Created by Alessandro Comparini on 15/02/24.
//


import UIKit
import CustomComponentsSDK


class BackgroundView: ViewBuilder {
    
    override init() {
        super.init(frame: .zero)
        configure()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        self.setGradient { build in
            build
                .setGradientColors(Theme.shared.currentTheme.backgroundColorGradient)
                .setAxialGradient(.leftTopToRightBottom)
                .apply()
        }

    }
}

