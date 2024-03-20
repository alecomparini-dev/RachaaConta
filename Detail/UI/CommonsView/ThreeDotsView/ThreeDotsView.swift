//  Created by Alessandro Comparini on 19/03/24.
//

import UIKit

import CustomComponentsSDK


class ThreeDotsView: ViewBuilder {
    
    override init() {
        super.init()
        configure()
    }
    

//  MARK: - LAZY PROPERTIES
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
        hStackContainer.add(insideTo: self)
        vStackLeftView.add(insideTo: hStackContainer)
        hStackRightView.add(insideTo: hStackContainer)
        addDots()
    }
    
    private func configAutoLayout() {
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
