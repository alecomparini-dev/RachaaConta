//  Created by Alessandro Comparini on 22/02/24.
//

import UIKit
import CustomComponentsSDK

class ButtonSeeBillView: ViewBuilder {
    
    
    override init() {
        super.init()
        configure()
    }
    

//  MARK: - LAZY PROPERTIES

    lazy var containerButton: ViewBuilder = {
        let comp = ViewBuilder()
            .setConstraints { build in
                build
                    .setAlignmentCenterXY.equalToSuperView
                    .setWidth.equalToConstant(35)
                    .setHeight.equalToConstant(16)
            }
        return comp
    }()
    
    lazy var seeBillLabel: LabelBuilder = {
        let comp = LabelBuilder("ver conta")
            .setFontFamily("TitilliumWeb-Regular", 12)
            .setColor(Theme.shared.currentTheme.onSurfaceVariant)
            .setConstraints { build in
                build
                    .setTop.equalTo(containerButton.get, .bottom, 8)
                    .setHorizontalAlignmentX.equalTo(containerButton.get, -4)
            }
        return comp
    }()
    
    lazy var hStackContainer: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAlignment(.fill)
            .setAxis(.horizontal)
            .setDistribution(.fillEqually)
            .setSpacing(6)
            .setConstraints { build in
                build
                    .setPin.equalToSuperView
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
        configConstraints()
    }
    
    private func addElements() {
        containerButton.add(insideTo: self.get)
        seeBillLabel.add(insideTo: self.get)
        hStackContainer.add(insideTo: containerButton.get)
        vStackLeftView.add(insideTo: hStackContainer.get)
        hStackRightView.add(insideTo: hStackContainer.get)

        addDots()
    }
    
    private func configConstraints() {
        containerButton.applyConstraint()
        seeBillLabel.applyConstraint()
        hStackContainer.applyConstraint()
    }
    
    private func addDots() {
        let size: CGFloat = 5
        let color: UIColor = Theme.shared.currentTheme.secondary
        
        let viewDot1 = ViewBuilder()
        let dot1 = DotView(size: size, color)
        dot1.add(insideTo: viewDot1.get)
        viewDot1.add(insideTo: vStackLeftView.get)
        
        let viewDot2 = ViewBuilder()
        let dot2 = DotView(size: size, color)
        dot2.add(insideTo: viewDot2.get)
        viewDot2.add(insideTo: vStackLeftView.get)
        
        let viewDot3 = ViewBuilder()
        let dot3 = DotView(size: size, color)
        dot3.add(insideTo: viewDot3.get)
        viewDot3.add(insideTo: hStackRightView.get)

    }
    
    
    
}
