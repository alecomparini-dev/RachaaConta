//  Created by Alessandro Comparini on 15/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler

class SectionViewCell: ViewBuilder {
    
    private let title: String
    
    init(_ title: String) {
        self.title = title
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY AREA
    lazy var titleLabel: LabelBuilder = {
        let comp = LabelBuilder(title)
            .setFontFamily(Const.Font.titilliumWebSemiBold, 16)
//            .setColor(Theme.shared.currentTheme.onSurface)
            .setColor(Theme.shared.currentTheme.onSurfaceInverse)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview()
                    .leading.equalToSuperview(16)
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    
    private func configure() {
        addElement()
        configConstraints()
        configBorder()
        configBackgroundColor()
    }
    
    private func addElement() {
        titleLabel.add(insideTo: self)
    }
    
    private func configConstraints() {
        titleLabel.applyAutoLayout()
    }
    
    private func configBorder() {
        self
            .setBorder { build in
                build
                    .setCornerRadius(18)
                    .setRoundedCorners([.top])
            }
    }
    
    private func configBackgroundColor() {
        
        self.setNeumorphism { build in
            build
                .setReferenceColor(Theme.shared.currentTheme.secondary)
//                .setReferenceColor(Theme.shared.currentTheme.primary)
                .setShape(.convex)
                .setLightPosition(.leftTop)
                .setIntensity(to: .light, percent: 20)
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
