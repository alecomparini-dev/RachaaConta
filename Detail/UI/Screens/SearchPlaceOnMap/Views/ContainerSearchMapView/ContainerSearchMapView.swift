//  Created by Alessandro Comparini on 29/02/24.
//

import Foundation
import CustomComponentsSDK



class ContainerSearchMapView: ViewBuilder {
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var containerSearchBlurView: BlurBuilder = {
        let comp = BlurBuilder(style: .dark)
            .setOpacity(0.8)
            .setBorder({ build in
                build
                    .setCornerRadius(12)
            })
            .setConstraints { build in
                build
                    .setPin.equalToSuperView
            }
        return comp
    }()
    
    lazy var containerShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setBorder({ build in
                build
                    .setRoundedCorners([.bottom])
            })
            .setShadow({ build in
                build
                    .setRadius(8)
                    .setColor(.black)
                    .setOffset(width: 0, height: 0)
                    .apply()
            })
            .setConstraints { build in
                build
                    .setTop.equalTo(containerSearchBlurView.get, .bottom)
                    .setLeading.equalTo(containerSearchBlurView.get, .leading, 16)
                    .setTrailing.equalTo(containerSearchBlurView.get, .trailing, 6)
                    .setHeight.equalToConstant(24)
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configBackgroundColor()
        addElements()
        configConstraints()
    }
    
    private func configBackgroundColor() {
        self.setBackgroundColor(.clear)
    }
    
    private func addElements() {
        containerSearchBlurView.add(insideTo: self.get)
        containerShadow.add(insideTo: self.get)
    }
    
    private func configConstraints() {
        containerSearchBlurView.applyConstraint()
        containerShadow.applyConstraint()
    }


    
//    private func configNeumorphism() {
//        self.setNeumorphism { build in
//            build
//                .setReferenceColor(Theme.shared.currentTheme.backgroundColor)
//                .setShape(.concave)
//                .setLightPosition(.leftTop)
//                .setIntensity(to: .light, percent: 30)
//                .setIntensity(to: .dark, percent: 100)
//                .setBlur(to: .light, percent: 8)
//                .setBlur(to: .dark, percent: 10)
//                .setDistance(to: .light, percent: 4)
//                .setDistance(to: .dark, percent: 10)
//                .setShadowColor(to: .dark, color: .black)
//                .apply()
//        }
//    }
//
    
}
