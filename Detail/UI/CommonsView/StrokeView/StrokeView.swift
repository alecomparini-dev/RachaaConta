//  Created by Alessandro Comparini on 22/02/24.
//

import UIKit
import CustomComponentsSDK

class StrokeView: ViewBuilder {
    
    private let gradientColor: [UIColor]
    private var cornerRadius: CGFloat
    
    init(gradientColor: [UIColor] = Theme.shared.currentTheme.primaryGradient, cornerRadius: CGFloat = 2, frame: CGRect = .zero) {
        self.gradientColor = gradientColor
        self.cornerRadius = cornerRadius
        super.init(frame: frame)
        configure()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        self.setGradient({ build in
            build
                .setGradientColors(gradientColor)
                .setAxialGradient(.leftTopToRightBottom)
                .apply()
        })
        .setBorder({ build in
            build.setCornerRadius(cornerRadius)
        })
        .setShadow({ build in
            build
                .setOffset(width: 3, height: 3)
                .setColor(.black)
                .setOpacity(1)
                .setRadius(3)
        })
        
    }
    
    
}
