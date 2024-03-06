//  Created by Alessandro Comparini on 05/03/24.
//

import UIKit
import Handler
import CustomComponentsSDK

class ButtonDefaultView: ViewBuilder {
    
    private let radius: CGFloat
    
    private let colorButton: UIColor
    private var image: ImageViewBuilder = ImageViewBuilder()
    private var text: String = ""
    
    init(color: UIColor = Theme.shared.currentTheme.surfaceContainer, cornerRadius: CGFloat = 6 , _ image: ImageViewBuilder) {
        self.colorButton = color
        self.image = image
        self.radius = cornerRadius
        super.init()
        configure()
    }

    init(color: UIColor = Theme.shared.currentTheme.surfaceContainer, cornerRadius: CGFloat = 6 , _ text: String) {
        self.colorButton = color
        self.text = text
        self.radius = cornerRadius
        super.init()
        configure()
    }
        

//  MARK: - LAZY Area
    
    lazy var outlineView: ViewBuilder = {
        let view = ViewBuilder()
            .setBorder({ build in
                build
                    .setCornerRadius(radius)
            })
            .setNeumorphism { build in
                build
                    .setReferenceColor(colorButton)
                    .setShape(.concave)
                    .setLightPosition(.leftTop)
                    .setIntensity(to: .light, percent: 80)
                    .setIntensity(to: .dark, percent: 100)
                    .setBlur(to: .light, percent: 3)
                    .setBlur(to: .dark, percent: 5)
                    .setDistance(to: .light, percent: 3)
                    .setDistance(to: .dark, percent: 10)
                    .apply()
            }
            .setAutoLayout { build in
                build
                    .pin.equalToSuperview()
            }
        return view
    }()
    
    lazy var button: ButtonImageBuilder = {
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

