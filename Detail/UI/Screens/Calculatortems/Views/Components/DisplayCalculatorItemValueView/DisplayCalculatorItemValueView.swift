//  Created by Alessandro Comparini on 06/03/24.
//

import UIKit

import Handler
import CustomComponentsSDK

class DisplayCalculatorItemValueView: ViewBuilder {
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var totalValueLabel: LabelBuilder = {
//        let comp = LabelBuilder(" = 397,50")
        let comp = LabelBuilder(" = total")
            .setFontFamily(Const.Font.titilliumWebBold, 26)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout({ build in
                build
                    .bottom.equalToSuperview()
                    .trailing.equalToSuperview(-8)
            })
        return comp
    }()

    lazy var unitValueLabel: LabelBuilder = {
//        let comp = LabelBuilder("515,90")
        let comp = LabelBuilder("vlr unitário")
            .setFontFamily(Const.Font.titilliumWebLight, 22)
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
            .setFontFamily(Const.Font.titilliumWebBold, 18)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout({ build in
                build
                    .verticalAlignY.equalTo(unitValueLabel, .centerY)
                    .trailing.equalTo(unitValueLabel, .leading )
            })
        return comp
    }()
    
    lazy var quantityLabel: LabelBuilder = {
//        let comp = LabelBuilder("25")
        let comp = LabelBuilder("qtd")
            .setFontFamily(Const.Font.titilliumWebLight, 22)
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
        totalValueLabel.add(insideTo: self )
        unitValueLabel.add(insideTo: self )
        multiplayLabel.add(insideTo: self )
        quantityLabel.add(insideTo: self )
    }
    
    private func configAutoLayout() {
        totalValueLabel.applyAutoLayout()
        unitValueLabel.applyAutoLayout()
        multiplayLabel.applyAutoLayout()
        quantityLabel.applyAutoLayout()
    }

    
}
