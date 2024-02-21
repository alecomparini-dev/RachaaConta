//  Created by Alessandro Comparini on 21/02/24.
//

import Foundation
import CustomComponentsSDK

class LineVerticalView: ViewBuilder {
    
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configGradient()
//        self.setBackgroundColor(Theme.shared.currentTheme.onSurface)
//        self.setBackgroundColor(Theme.shared.currentTheme.backgroundColor)
        configBorder()
//        configShadow()
    }
    
    
    private func configGradient() {
        self.setGradient({ build in
            build
                .setGradientColors(Theme.shared.currentTheme.backgroundColorGradient)
                .setReferenceColor(Theme.shared.currentTheme.backgroundColor, percentageGradient: -60)
                .setAxialGradient(.rightToLeft)
                .apply()
        })
    }
    
    private func configBorder() {
        self.setBorder({ build in
            build.setCornerRadius(2)
        })
    }
    
    private func configShadow() {
        self.setShadow({ build in
            build
                .setOffset(width: 4, height: 4)
                .setColor(.black)
                .setOpacity(1)
                .setRadius(3)
                .apply()
        })
    }
    
}
