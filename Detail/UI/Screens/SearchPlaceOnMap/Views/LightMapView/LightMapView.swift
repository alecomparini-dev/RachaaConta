//  Created by Alessandro Comparini on 29/02/24.
//

import Foundation
import CustomComponentsSDK


protocol LightMapViewDelegate: AnyObject {
    func lightMapButton()
}

class LightMapView: ViewBuilder {
    weak var delegate: LightMapViewDelegate?
    
    override init() {
        super.init(frame: .zero)
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var lightMapButton: ButtonImageBuilder = {
        let comp = ButtonImageBuilder()
            .setImageButton(ImageViewBuilder(systemName: "sun.max"))
            .setImageSize(12)
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setConstraints { build in
                build
                    .setAlignmentCenterXY.equalToSuperView(1)
            }
            .setActions { build in
                build
                    .setTap { [weak self] _, _ in
                        self?.delegate?.lightMapButton()
                    }
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
        lightMapButton.add(insideTo: self.get)
    }
    
    private func configConstraints() {
        lightMapButton.applyConstraint()
    }

    private func configBorder() {
        self.setBorder({ build in
            build
                .setCornerRadius(15)
        })
    }
    
    private func configNeumorphism() {
        self.setNeumorphism { build in
            build
                .setReferenceColor(Theme.shared.currentTheme.backgroundColor)
                .setShape(.concave)
                .setLightPosition(.leftTop)
                .setIntensity(to: .light, percent: 30)
                .setIntensity(to: .dark, percent: 100)
                .setBlur(to: .light, percent: 8)
                .setBlur(to: .dark, percent: 10)
                .setDistance(to: .light, percent: 4)
                .setDistance(to: .dark, percent: 10)
                .setShadowColor(to: .dark, color: .black)
                .apply()
        }
    }
    
}
