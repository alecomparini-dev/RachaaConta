//  Created by Alessandro Comparini on 28/02/24.
//

import Foundation
import CustomComponentsSDK

class NeumorphismSideBarView: ViewBuilder {
    
    public override init() {
        super.init()
        configure()
    }
    
        
//  MARK: - PRIVATE AREA
    private func configure() {
        configBorder()
        configNeumorphism()
    }
    
    private func configBorder() {
        self.setBorder({ build in
            build
                .setCornerRadius(25)
                .setRoundedCorners([.right])
        })
    }
    
    private func configNeumorphism() {
        self.setNeumorphism({ build in
            build
                .setReferenceColor(Theme.shared.currentTheme.backgroundColor)
                .setShape(.convex)
                .setLightPosition(.leftTop)
                .setIntensity(to: .light, percent: 30)
                .setIntensity(to: .dark, percent: 100)
                .setBlur(to: .light, percent: 8)
                .setBlur(to: .dark, percent: 10)
                .setDistance(to: .light, percent: 4)
                .setDistance(to: .dark, percent: 10)
                .setShadowColor(to: .dark, color: .black)
        })
        
    }
    
    
}
