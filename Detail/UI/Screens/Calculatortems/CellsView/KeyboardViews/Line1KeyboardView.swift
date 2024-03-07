//  Created by Alessandro Comparini on 05/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler

class Line1KeyboardView: ViewBuilder {
    
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
    
    lazy var stackNo4_1: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAxis(.vertical)
            .setDistribution(.fillEqually)
        return comp
    }()

    lazy var stackNo5_2: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAxis(.vertical)
            .setDistribution(.fillEqually)
        return comp
    }()

    lazy var stackNo6_3: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAxis(.vertical)
            .setDistribution(.fillEqually)
        return comp
    }()
    
    lazy var viewNo4: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()

    lazy var buttonNo4: DefaultButton = {
        let comp = DefaultButton(text: "4")
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    lazy var viewNo5: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()

    lazy var buttonNo5: DefaultButton = {
        let comp = DefaultButton(text: "5")
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    lazy var viewNo6: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
    lazy var buttonNo6: DefaultButton = {
        let comp = DefaultButton(text: "6")
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    lazy var viewNo1: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()

    lazy var buttonNo1: DefaultButton = {
        let comp = DefaultButton(text: "1")
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    lazy var viewNo2: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
    lazy var buttonNo2: DefaultButton = {
        let comp = DefaultButton(text: "2")
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    lazy var viewNo3: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()

    lazy var buttonNo3: DefaultButton = {
        let comp = DefaultButton(text: "3")
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    lazy var viewMultiply: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
//    lazy var buttonMultiply: DefaultButton = {
//        let img = ImageViewBuilder(systemName: "xmark")
//        let comp = DefaultButton(color: Theme.shared.currentTheme.primary, cornerRadius: (Const.Default.sizeButtonKeyboard.width*0.8)/2, img)
//            .setAutoLayout { build in
//                build
//                    .horizontalAlignX.equalToSuperview()
//                    .verticalAlignY.equalToSuperview(-2)
//                    .size.equalToConstant(Const.Default.sizeButtonKeyboard.width*0.8)
//            }
//        comp.button.setTintColor(Theme.shared.currentTheme.onPrimary)
//        comp.button.setImageWeight(.black)
//        return comp
//    }()
    
    
    lazy var buttonMultiply: PrimaryButton = {
        let img = ImageViewBuilder(systemName: "xmark")
        let size = Const.Default.sizeButtonKeyboard.width*0.8
        let comp = PrimaryButton(cornerRadius: size/2, image: img)
            .setAutoLayout { build in
                build
                    .horizontalAlignX.equalToSuperview()
                    .verticalAlignY.equalToSuperview(-2)
                    .size.equalToConstant(size)
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
        addButtons1And4()
        addButtons2And5()
        addButtons3And6()
        addButtonMultiply()
    }
    
    private func addStacks() {
        stackView.add(insideTo: self)
        stackNo4_1.add(insideTo: stackView)
        stackNo5_2.add(insideTo: stackView)
        stackNo6_3.add(insideTo: stackView)
    }
    
    private func addButtons1And4() {
        viewNo4.add(insideTo: stackNo4_1)
        viewNo1.add(insideTo: stackNo4_1)
        buttonNo4.add(insideTo: viewNo4)
        buttonNo1.add(insideTo: viewNo1)
    }
    
    private func addButtons2And5() {
        viewNo5.add(insideTo: stackNo5_2)
        viewNo2.add(insideTo: stackNo5_2)
        buttonNo5.add(insideTo: viewNo5)
        buttonNo2.add(insideTo: viewNo2)
    }
        
    private func addButtons3And6() {
        viewNo6.add(insideTo: stackNo6_3)
        viewNo3.add(insideTo: stackNo6_3)
        buttonNo6.add(insideTo: viewNo6)
        buttonNo3.add(insideTo: viewNo3)
    }
    
    private func addButtonMultiply() {
        viewMultiply.add(insideTo: stackView)
        buttonMultiply.add(insideTo: viewMultiply)
    }
    
    private func configAutoLayout() {
        stackView.applyAutoLayout()
        buttonNo1.applyAutoLayout()
        buttonNo2.applyAutoLayout()
        buttonNo3.applyAutoLayout()
        buttonNo4.applyAutoLayout()
        buttonNo5.applyAutoLayout()
        buttonNo6.applyAutoLayout()
        buttonMultiply.applyAutoLayout()
    }
    

    
}
