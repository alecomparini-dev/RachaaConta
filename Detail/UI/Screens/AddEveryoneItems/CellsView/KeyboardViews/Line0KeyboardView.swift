//  Created by Alessandro Comparini on 05/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler

class Line0KeyboardView: ViewBuilder {
    
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
    
    lazy var viewNo7: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
    lazy var buttonNo7: ButtonDefaultView = {
        let comp = ButtonDefaultView("7")
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    
    lazy var viewNo8: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
    lazy var buttonNo8: ButtonDefaultView = {
        let comp = ButtonDefaultView("8")
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()

    lazy var viewNo9: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
    lazy var buttonNo9: ButtonDefaultView = {
        let comp = ButtonDefaultView("9")
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()

    
    lazy var viewBackspace: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
    lazy var backspace: ButtonImageBuilder = {
        let img = ImageViewBuilder(systemName: "delete.backward")
        let btn = ButtonImageBuilder(img)
            .setImageSize(18)
            .setBorder({ build in
                build
                    .setCornerRadius(8)
            })
            .setBackgroundColor(Theme.shared.currentTheme.surfaceContainerLow.adjustBrightness(-40))
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalTo(buttonNo9.get, multiplier: 1.2)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return btn
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        stackView.add(insideTo: self)
        
        viewNo7.add(insideTo: stackView)
        buttonNo7.add(insideTo: viewNo7)
        
        viewNo8.add(insideTo: stackView)
        buttonNo8.add(insideTo: viewNo8)
        
        viewNo9.add(insideTo: stackView)
        buttonNo9.add(insideTo: viewNo9)
        
        viewBackspace.add(insideTo: stackView)
        backspace.add(insideTo: viewBackspace)
    }
    
    private func configAutoLayout() {
        stackView.applyAutoLayout()
        
        buttonNo7.applyAutoLayout()
        buttonNo8.applyAutoLayout()
        buttonNo9.applyAutoLayout()
        backspace.applyAutoLayout()
    }
    
    
}
