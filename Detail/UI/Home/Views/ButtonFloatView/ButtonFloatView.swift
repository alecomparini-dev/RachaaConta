//  Created by Alessandro Comparini on 19/02/24.
//

import Foundation

import CustomComponentsSDK

class ButtonFloatView: ButtonImageBuilder {
    
    override init() {
        super.init()
        configure()
    }
    

//  MARK: - LAZY PROPERTIES
    lazy var image: ImageViewBuilder = {
        let img = ImageViewBuilder(systemName: "plus")
            .setTintColor(Theme.shared.currentTheme.onSurface)
//            .setTintColor(Theme.shared.currentTheme.primary)
            .setWeight(.black)
//            .setSize(20)
            .setConstraints { build in
                build
                    .setAlignmentCenterXY.equalToSuperView(-1)
//                    .setAlignmentCenterXY.equalToSuperView
            }
        return img
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
        configBorder()
        configNeumorphism()
    }
    
    private func addElements() {
        image.add(insideTo: self.get)
    }
    
    private func configConstraints() {
        image.applyConstraint()
    }

    private func configBorder() {
        self.setBorder({ build in
            build
                .setCornerRadius(14)
        })
    }
    
    private func configNeumorphism() {
        self.setNeumorphism { build in
            build
                .setReferenceColor(Theme.shared.currentTheme.surfaceContainerLow.adjustBrightness(-10))
                .setShape(.concave)
                .setLightPosition(.leftTop)
                .setIntensity(to: .light, percent: 100)
                .setIntensity(to: .dark, percent: 100)
                .setBlur(to: .light, percent: 4)
                .setBlur(to: .dark, percent: 8)
                .setDistance(to: .light,percent: 8)
                .setDistance(to: .dark,percent: 10)
                .setShadowColor(to: .dark, color: .black)
            
            
//                //BOTÃO CLICADO
//                .setReferenceColor(Theme.shared.currentTheme.surfaceContainerLow.adjustBrightness(-20))
//                .setShape(.flat)
//                .setIntensity(percent: 30)
//                .setBlur(percent: 8)
//                .setDistance(percent: 4)
//                .setShadowColor( Theme.shared.currentTheme.tertiary)
                .apply()
        }
    }
    
    
}
