//  Created by Alessandro Comparini on 15/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler

class SectionViewCell: ViewBuilder {
    
    private let title: String
    private let color: UIColor
    private let fontColor: UIColor
    
    init(title: String, color: UIColor = Theme.shared.currentTheme.backgroundColor, fontColor: UIColor = Theme.shared.currentTheme.onSurface) {
        self.title = title
        self.color = color
        self.fontColor = fontColor
        super.init()
        configure()
    }
    
    
    
//  MARK: - LAZY AREA
    lazy var titleLabel: LabelBuilder = {
        let comp = LabelBuilder(title)
            .setFontFamily(Const.Font.titilliumWebSemiBold, 18)
            .setColor(fontColor)
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
        configNeumorphism()
    }
    
    private func addElement() {
        titleLabel.add(insideTo: self)
    }
    
    private func configConstraints() {
        titleLabel.applyAutoLayout()
    }
    
    private func configBorder() {
        self.setBorder { build in
            build
                .setCornerRadius(18)
                .setRoundedCorners([.top])
        }
    }
    
    private func configNeumorphism() {
        self.setNeumorphism { build in
            build
                .setReferenceColor(color)
                .setShape(.convex)
                .setLightPosition(.leftTop)
                .setIntensity(to: .light, percent: 30)
                .setIntensity(to: .dark, percent: 100)
                .setBlur(to: .light, percent: 3)
                .setBlur(to: .dark, percent: 10)
                .setDistance(to: .light, percent: 2)
                .setDistance(to: .dark, percent: 10)
                .setShadowColor(to: .dark, color: .black)
        }
    }
    
}
