//  Created by Alessandro Comparini on 26/02/24.
//

import UIKit

import CustomComponentsSDK

protocol SideBarMenuViewDelegate: AnyObject {
    func closeMenuButtonTapped()
}

public class SideBarMenuView: UIView {
    
    private var gradient: GradientBuilder?
    
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var backgroundView: ViewBuilder = {
        let comp = ViewBuilder()
            .setAutoLayout({ build in
                build
                    .pinLeft.equalToSuperview()
                    .trailing.equalToSuperview(-50)
            })
        return comp
    }()
    
    lazy var closeMenuButton: ViewBuilder = {
        let comp = ViewBuilder()
            .setBorder({ build in
                build
                    .setCornerRadius(6)
            })
            .setBackgroundColor(Theme.shared.currentTheme.surfaceContainerHighest)
            .setAutoLayout { build in
                build
                    .top.equalToSafeArea(16)
                    .leading.equalToSuperview(40)
                    .width.equalToConstant(40)
                    .height.equalToConstant(56)
            }
        return comp
    }()

    
//  MARK: - PUBLIC AREA
    public func applyStyles() {
        gradient?.apply()
        applyShadowBackButton()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
        configGradient()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        closeMenuButton.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        closeMenuButton.applyAutoLayout()
    }
    
    private func applyShadowBackButton() {
        closeMenuButton.setShadow({ build in
            build
                .setColor(Theme.shared.currentTheme.surfaceContainerLowest)
                .setOpacity(1)
                .setRadius(5)
                .setOffset(width: 6, height: 6)
                .apply()
        })
    }
    
    private func configGradient() {
        gradient = GradientBuilder(backgroundView.get)
            .setConicGradient(CGPoint(x: 0.8, y: 0.8))
//            .setGradientColors([
//                Theme.shared.currentTheme.surfaceContainerHigh,
//                Theme.shared.currentTheme.surfaceContainer,
//                Theme.shared.currentTheme.surfaceContainerLow.adjustBrightness(20),
//                Theme.shared.currentTheme.surfaceContainer,
//                Theme.shared.currentTheme.surfaceContainerHigh,
//            ])
//
//                
//            .setGradientColors([
//                Theme.shared.currentTheme.surfaceContainerHigh,
//                Theme.shared.currentTheme.surfaceContainerLow,
//                Theme.shared.currentTheme.surfaceContainerLow.adjustBrightness(30),
//                Theme.shared.currentTheme.surfaceContainer,
//                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(20),
//                Theme.shared.currentTheme.surfaceContainerHigh,
//            ])
//
//        
            .setGradientColors([
                Theme.shared.currentTheme.surfaceContainer,
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(-20),
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(-35),
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(-20),
                Theme.shared.currentTheme.surfaceContainer,
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(30),
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(10),
                Theme.shared.currentTheme.surfaceContainer,
            ])
        
    }
    
    
}
