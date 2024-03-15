//  Created by Alessandro Comparini on 06/03/24.
//

import UIKit

import Handler
import CustomComponentsSDK

class DisplayCalculatorItemValueView: ViewBuilder {

    private let fontSizes: (quantity: CGFloat, multiply: CGFloat, unitValue: CGFloat, totalValue: CGFloat)
    
    init(fontSizes: (quantity: CGFloat, multiply: CGFloat, unitValue: CGFloat, totalValue: CGFloat)? = nil) {
        self.fontSizes = fontSizes ?? (quantity: 22, multiply: 18, unitValue: 22, totalValue: 26)
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var totalValueLabel: LabelBuilder = {
        let comp = LabelBuilder(" = 397,50")
//        let comp = LabelBuilder(" = total")
            .setTextAlignment(.right)
            .setFontFamily(Const.Font.titilliumWebBold, fontSizes.totalValue)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout({ build in
                build
                    .verticalAlignY.equalToSuperview()
                    .trailing.equalToSuperview(-8)
            })
        return comp
    }()

    lazy var unitValueLabel: LabelBuilder = {
        let comp = LabelBuilder("515,90")
//        let comp = LabelBuilder("vlr unitário")
            .setTextAlignment(.right)
            .setFontFamily(Const.Font.titilliumWebLight, fontSizes.unitValue)
            .setColor(Theme.shared.currentTheme.onSurface.adjustBrightness(-20))
            .setAutoLayout({ build in
                build
                    .verticalAlignY.equalTo(totalValueLabel, .centerY)
                    .trailing.equalTo(totalValueLabel, .leading)
            })
        return comp
    }()

    
    lazy var multiplayLabel: LabelBuilder = {
        let comp = LabelBuilder(" x ")
            .setFontFamily(Const.Font.titilliumWebBold, fontSizes.multiply)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout({ build in
                build
                    .verticalAlignY.equalTo(unitValueLabel, .centerY)
                    .trailing.equalTo(unitValueLabel, .leading )
            })
        return comp
    }()
    
    lazy var quantityLabel: LabelBuilder = {
        let comp = LabelBuilder("25")
            .setTextAlignment(.right)
//        let comp = LabelBuilder("qtd")
            .setFontFamily(Const.Font.titilliumWebLight, fontSizes.quantity)
            .setColor(Theme.shared.currentTheme.onSurface.adjustBrightness(-20))
            .setAutoLayout({ build in
                build
                    .verticalAlignY.equalTo(multiplayLabel, .centerY)
                    .trailing.equalTo(multiplayLabel, .leading, -2)
            })
        return comp
    }()



//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        quantityLabel.add(insideTo: self )
        multiplayLabel.add(insideTo: self )
        unitValueLabel.add(insideTo: self )
        totalValueLabel.add(insideTo: self )
    }
    
    private func configAutoLayout() {
        totalValueLabel.applyAutoLayout()
        unitValueLabel.applyAutoLayout()
        multiplayLabel.applyAutoLayout()
        quantityLabel.applyAutoLayout()
    }

    
}
