//  Created by Alessandro Comparini on 07/03/24.
//
import UIKit
import Handler
import CustomComponentsSDK

class DefaultButton: ViewBuilder {
    
    private let text: String
    private let radius: CGFloat
    private let image: ImageViewBuilder
    private let neumorphism: (color: UIColor, ligthPosition: K.Neumorphism.LightPosition, shape: K.Neumorphism.Shape)
    
    init(text: String = "",
         cornerRadius: CGFloat = 6 ,
         image: ImageViewBuilder = ImageViewBuilder(),
         neumorphism: (color: UIColor, ligthPosition: K.Neumorphism.LightPosition, shape: K.Neumorphism.Shape) = (color: Theme.shared.currentTheme.surfaceContainer, ligthPosition: .leftTop, shape: .concave) ) {
        self.text = text
        self.radius = cornerRadius
        self.image = image
        self.neumorphism = neumorphism
        super.init()
        configure()
    }

    
    
//  MARK: - GET PROPERTIES
    var style: ViewBuilder { outlineView }
    
    var button: ButtonImageBuilder { _button }
    

//  MARK: - LAZY Area
    
    private lazy var outlineView: ViewBuilder = {
        let view = ViewBuilder()
            .setBorder({ build in
                build
                    .setCornerRadius(radius)
            })
            .setNeumorphism { build in
                build
                    .setReferenceColor(neumorphism.color)
                    .setShape(neumorphism.shape)
                    .setLightPosition(neumorphism.ligthPosition)
                    .setIntensity(to: .light, percent: 80)
                    .setIntensity(to: .dark, percent: 100)
                    .setBlur(to: .light, percent: 3)
                    .setBlur(to: .dark, percent: 5)
                    .setDistance(to: .light, percent: 3)
                    .setDistance(to: .dark, percent: 12)
                    .apply()
            }
            .setAutoLayout { build in
                build
                    .pin.equalToSuperview()
            }
        return view
    }()
    
    private lazy var _button: ButtonImageBuilder = {
        var btn = ButtonImageBuilder(image)
            .setFontFamily(Const.Font.titilliumWebRegular, 18)
            .setImagePadding(0)
            .setTitle(text)
            .setTitleColor(Theme.shared.currentTheme.onSurface)
            .setTintColor(Theme.shared.currentTheme.onSurface.adjustBrightness(-20))
            .setTitleAlignment(.center)
            .setTitleSize(16)
            .setImageSize(12)
            .setTitleWeight(.regular)
            .setAutoLayout { build in
                build
                    .pin.equalToSuperview()
            }
        return btn
    }()
    
    
//  MARK: - PRIVATE Area
    
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        outlineView.add(insideTo: self)
        button.add(insideTo: self.outlineView)
    }
    
    private func configConstraints() {
        outlineView.applyAutoLayout()
        button.applyAutoLayout()
    }
    
}

