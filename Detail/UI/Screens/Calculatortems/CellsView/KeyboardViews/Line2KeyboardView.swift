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
    
    lazy var buttonNo0: DefaultButton = {
        let comp = DefaultButton(text: "0")
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
    
    lazy var buttonSaveItem: PrimaryButton = {
        let comp = PrimaryButton(text: "OK")
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview()
                    .trailing.equalToSuperview(-18)
                    .width.equalTo(viewComma, multiplier: 1.35)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        addStacks()
        addButtonComma()
        addButonNo0()
        addButtonSaveItem()
    }
    
    private func addStacks() {
        stackView.add(insideTo: self)
        stackLeft.add(insideTo: stackView)
        stackRight.add(insideTo: stackView)
    }
    
    private func addButtonComma() {
        viewComma.add(insideTo: stackLeft)
        buttonComma.add(insideTo: viewComma)
    }

    private func addButonNo0() {
        viewNo0.add(insideTo: stackLeft)
        buttonNo0.add(insideTo: viewNo0)
    }
    
    private func addButtonSaveItem() {
        viewSaveItem.add(insideTo: stackRight)
        buttonSaveItem.add(insideTo: viewSaveItem)
    }
    
    private func configAutoLayout() {
        stackView.applyAutoLayout()
        buttonNo0.applyAutoLayout()
        buttonComma.applyAutoLayout()
        buttonSaveItem.applyAutoLayout()
    }
    
    
}
