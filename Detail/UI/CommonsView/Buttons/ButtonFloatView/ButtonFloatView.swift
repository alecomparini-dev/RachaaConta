//  Created by Alessandro Comparini on 19/02/24.
//

import Foundation

import CustomComponentsSDK

class ButtonFloatView: ButtonImageBuilder {
    
    private let plusGradientColor = [Theme.shared.currentTheme.tertiary, Theme.shared.currentTheme.primary.adjustBrightness(-20)]
    
    override init() {
        super.init()
        configure()
    }
    

//  MARK: - LAZY PROPERTIES
    
    lazy var vStroke: ViewBuilder = {
        let comp = ViewBuilder()
            .setGradient({ build in
                build
                    .setGradientColors(plusGradientColor)
                    .setAxialGradient(.leftTopToRightBottom)
                    .apply()
            })
            .setBorder({ build in
                build.setCornerRadius(2)
            })
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .height.equalToConstant(24)
                    .width.equalToConstant(4)
            }
        return comp
    }()
    
    lazy var hStroke: ViewBuilder = {
        let comp = ViewBuilder()
            .setGradient({ build in
                build
                    .setGradientColors(plusGradientColor)
                    .setAxialGradient(.leftTopToRightBottom)
                    .apply()
            })
            .setBorder({ build in
                build.setCornerRadius(2)
            })
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .height.equalToConstant(4)
                    .width.equalToConstant(24)
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
        configBorder()
        configNeumorphism()
    }
    
    private func addElements() {
        hStroke.add(insideTo: self)
        vStroke.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        vStroke.applyAutoLayout()
        hStroke.applyAutoLayout()
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
                .setReferenceColor(Theme.shared.currentTheme.primary)
                .setLightPosition(.leftTop)
                .setShape(.convex)

                .setIntensity(to: .light, percent: 20)
                .setIntensity(to: .dark, percent: 100)
                .setBlur(to: .light, percent: 40)
                .setBlur(to: .dark, percent: 8)
                .setDistance(to: .light, percent: 2)
                .setDistance(to: .dark, percent: 10)
                .setShadowColor(to: .light, hexColor: "#FFFFFF")
                .setShadowColor(to: .dark, hexColor: "#000000")
            
            
//                //BOTÃO CLICADO
//                .setReferenceColor(Theme.shared.currentTheme.primary)
//                .setLightPosition(.rightBottom)
//                .setShape(.flat)
//                .setIntensity(percent: 80)
//                .setBlur(percent: 8)
//                .setDistance(percent: 4)
//                .setShadowColor( Theme.shared.currentTheme.tertiary)
        }
    }
    
    
}
