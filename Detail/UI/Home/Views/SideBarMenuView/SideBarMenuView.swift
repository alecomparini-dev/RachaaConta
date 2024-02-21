//  Created by Alessandro Comparini on 19/02/24.
//

import Foundation

import CustomComponentsSDK

class SideBarMenuView: ViewBuilder {
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var menuImage: ImageViewBuilder = {
        let img = ImageViewBuilder(systemName: "line.3.horizontal")
            .setTintColor(Theme.shared.currentTheme.primary)
            .setWeight(.bold)
            .setSize(22)
            .setConstraints { build in
                build
                    .setLeading.equalToSuperView(8)
                    .setVerticalAlignmentY.equalToSuperView
            }
        return img
    }()
    
    lazy var arrowOpenImageView: ImageViewBuilder = {
        let img = ImageViewBuilder(systemName: "chevron.forward")
            .setTintColor(Theme.shared.currentTheme.onSurfaceInverse)
            .setSize(12)
            .setWeight(.bold)
            .setContentMode(.center)
            .setConstraints { build in
                build
                    .setTrailing.equalToSuperView(-10)
                    .setVerticalAlignmentY.equalTo(menuImage.get)
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
        menuImage.add(insideTo: self.get)
        arrowOpenImageView.add(insideTo: self.get)
    }
    
    private func configConstraints() {
        menuImage.applyConstraint()
        arrowOpenImageView.applyConstraint()
    }

    private func configBorder() {
        self.setBorder({ build in
            build
                .setCornerRadius(25)
                .setRoundedCorners([.right])
        })
    }
    
    private func configNeumorphism() {
        self.setNeumorphism { build in
            build
//                .setReferenceColor(Theme.shared.currentTheme.primary)
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
                .apply()
        }
    }
    
    
}
