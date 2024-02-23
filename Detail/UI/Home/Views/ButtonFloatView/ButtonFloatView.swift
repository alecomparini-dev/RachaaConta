//  Created by Alessandro Comparini on 19/02/24.
//

import Foundation

import CustomComponentsSDK

class ButtonFloatView: ButtonImageBuilder {
    
    private let gradientColor = [Theme.shared.currentTheme.primary.adjustBrightness(-30), Theme.shared.currentTheme.primary]
    
    override init() {
        super.init()
        configure()
    }
    

//  MARK: - LAZY PROPERTIES
    lazy var image: ImageViewBuilder = {
//        let img = ImageViewBuilder(systemName: "plus")
        let img = ImageViewBuilder(systemName: "")
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setWeight(.black)
            .setConstraints { build in
                build
                    .setAlignmentCenterXY.equalToSuperView(-1)
            }
        return img
    }()
    
    lazy var vStroke: StrokeView = {
        let comp = StrokeView(gradientColor: gradientColor)
            .setConstraints { build in
                build
                    .setAlignmentCenterXY.equalToSuperView(-1)
                    .setHeight.equalToConstant(20)
                    .setWidth.equalToConstant(3)
            }
        return comp
    }()
    
    lazy var hStroke: StrokeView = {
        let comp = StrokeView(gradientColor: gradientColor)
            .setConstraints { build in
                build
                    .setAlignmentCenterXY.equalToSuperView(-1)
                    .setHeight.equalToConstant(3)
                    .setWidth.equalToConstant(20)
            }
        return comp
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
        hStroke.add(insideTo: self.get)
        vStroke.add(insideTo: self.get)
    }
    
    private func configConstraints() {
        image.applyConstraint()
        vStroke.applyConstraint()
        hStroke.applyConstraint()
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
