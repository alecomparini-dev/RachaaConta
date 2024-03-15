//  Created by Alessandro Comparini on 22/02/24.
//

import UIKit
import CustomComponentsSDK
import Handler

class ButtonSeeBillView: ViewBuilder {
    
    
    override init() {
        super.init()
        configure()
    }
    

//  MARK: - LAZY PROPERTIES

    lazy var containerButton: ViewBuilder = {
        let comp = ViewBuilder()
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(35)
                    .height.equalToConstant(16)
            }
        return comp
    }()
    
    lazy var seeBillLabel: LabelBuilder = {
        let comp = LabelBuilder("ver conta")
            .setFontFamily(Const.Font.titilliumWebRegular, 12)
            .setColor(Theme.shared.currentTheme.onSurfaceVariant)
            .setAutoLayout { build in
                build
                    .top.equalTo(containerButton, .bottom, 8)
                    .horizontalAlignX.equalTo(containerButton, .centerX, -4)
            }
        return comp
    }()
    
    lazy var hStackContainer: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAlignment(.fill)
            .setAxis(.horizontal)
            .setDistribution(.fillEqually)
            .setSpacing(6)
            .setAutoLayout { build in
                build
                    .pin.equalToSuperview()
            }
        return comp
    }()

    lazy var vStackLeftView: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAlignment(.center)
            .setAxis(.vertical)
            .setDistribution(.fill)
            .setSpacing(0)
        return comp
    }()
    
    lazy var hStackRightView: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAlignment(.center)
            .setAxis(.horizontal)
            .setDistribution(.fillEqually)
            .setSpacing(0)
        return comp
    }()
    

    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        containerButton.add(insideTo: self)
        seeBillLabel.add(insideTo: self)
        hStackContainer.add(insideTo: containerButton)
        vStackLeftView.add(insideTo: hStackContainer)
        hStackRightView.add(insideTo: hStackContainer)
        addDots()
    }
    
    private func configAutoLayout() {
        containerButton.applyAutoLayout()
        seeBillLabel.applyAutoLayout()
        hStackContainer.applyAutoLayout()
    }
    
    private func addDots() {
        let size: CGFloat = 5
        let color: UIColor = Theme.shared.currentTheme.tertiary
        
        let viewDot1 = ViewBuilder()
        let dot1 = DotView(size: size, color)
        dot1.add(insideTo: viewDot1)
        viewDot1.add(insideTo: vStackLeftView)
        
        let viewDot2 = ViewBuilder()
        let dot2 = DotView(size: size, color)
        dot2.add(insideTo: viewDot2)
        viewDot2.add(insideTo: vStackLeftView)
        
        let viewDot3 = ViewBuilder()
        let dot3 = DotView(size: size, color)
        dot3.add(insideTo: viewDot3)
        viewDot3.add(insideTo: hStackRightView)
    }
    
}
