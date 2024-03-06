//  Created by Alessandro Comparini on 05/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler

class Line2KeyboardView: ViewBuilder {
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var stackView: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAxis(.horizontal)
            .setDistribution(.fillEqually)
            .setAutoLayout { build in
                build.pin.equalToSuperview()
            }
        return comp
    }()
    
    lazy var stackLeft: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAxis(.horizontal)
            .setDistribution(.fillEqually)
        return comp
    }()

    lazy var stackRight: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAxis(.horizontal)
            .setDistribution(.fillEqually)
        return comp
    }()

    lazy var viewNo0: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
    lazy var buttonNo0: ButtonDefaultView = {
        let comp = ButtonDefaultView("0")
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    lazy var viewComma: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
    lazy var buttonComma: ButtonBuilder = {
        let comp = ButtonBuilder(",")
            .setFontFamily(Const.Font.titilliumWebBold, 28)
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .horizontalAlignX.equalToSuperview()
                    .verticalAlignY.equalToSuperview(-6)
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    
    lazy var viewSaveItem: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()

    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        stackView.add(insideTo: self)
        stackLeft.add(insideTo: stackView)
        stackRight.add(insideTo: stackView)
        
        viewComma.add(insideTo: stackLeft)
        buttonComma.add(insideTo: viewComma)
        
        viewNo0.add(insideTo: stackLeft)
        buttonNo0.add(insideTo: viewNo0)
        
        viewSaveItem.add(insideTo: stackRight)

    }
    
    private func configAutoLayout() {
        stackView.applyAutoLayout()
        
        buttonNo0.applyAutoLayout()
        buttonComma.applyAutoLayout()
    }
    
    
}
