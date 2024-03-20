//  Created by Alessandro Comparini on 07/03/24.
//

import UIKit

import Handler
import CustomComponentsSDK

class PrimaryButton: DefaultButton {
    
    private let fontFamily: (family: String, size: CGFloat)
    
    init(text: String = "",
         fontFamily: (family: String, size: CGFloat) = (family: Const.Font.titilliumWebSemiBold, size: 18),
         cornerRadius: CGFloat = 8 ,
         image: ImageViewBuilder = ImageViewBuilder(),
         ligthPosition: K.Neumorphism.LightPosition = .leftTop,
         shape: K.Neumorphism.Shape = .convex) {
        self.fontFamily = fontFamily
        super.init(text: text, cornerRadius: cornerRadius, image: image, neumorphismStyles: (color: Theme.shared.currentTheme.primary, ligthPosition: ligthPosition , shape: shape))
        configure()
    }

    
//  MARK: - PRIVATE AREA
    private func configure() {
        configTitleColor()
        configWeight()
        configFontFamily()
        configNeumorphism()
    }
    
    private func configTitleColor() {
        button.setTintColor(Theme.shared.currentTheme.onPrimary)
        button.setTitleColor(Theme.shared.currentTheme.onPrimary)
    }
    
    private func configWeight() {
        button.setTitleWeight(.black)
        button.setImageWeight(.black)
    }
    
    private func configFontFamily() {
        button.setFontFamily(fontFamily.family, fontFamily.size)
    }
    
    private func configNeumorphism() {
        style.get.removeNeumorphism()
        style.setNeumorphism { build in
            build
                .setReferenceColor(Theme.shared.currentTheme.primary)
                .setShape(.convex)
                .setLightPosition(.leftTop)
                .setIntensity(to: .light, percent: 25)
                .setIntensity(to: .dark, percent: 100)
                .setBlur(to: .light, percent: 4)
                .setBlur(to: .dark, percent: 10)
                .setDistance(to: .light, percent: 4)
                .setDistance(to: .dark, percent: 10)
                .setShadowColor(to: .dark, color: .black)
        }
    }
    
}
