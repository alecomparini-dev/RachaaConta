//  Created by Alessandro Comparini on 26/02/24.
//

import UIKit

import CustomComponentsSDK

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
    
    lazy var backButtonView: ViewBuilder = {
        let comp = ViewBuilder()
            .setBorder({ build in
                build
                    .setCornerRadius(6)
            })
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
    public func applyGradient() {
        gradient?.apply()
        
        NeumorphismBuilder(backButtonView.get)
            .setReferenceColor(Theme.shared.currentTheme.surfaceContainer)
            .setShape(.concave)
            .setLightPosition(.leftTop)
            .setIntensity(to: .light, percent: 80)
            .setIntensity(to: .dark, percent: 80)
            .setBlur(to: .light, percent: 5)
            .setBlur(to: .dark, percent: 15)
            .setDistance(to: .light, percent: 4)
            .setDistance(to: .dark, percent: 10)
            .apply()

    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
        configGradient()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        backButtonView.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        backButtonView.applyAutoLayout()
    }
    
    private func configGradient() {
        gradient = GradientBuilder(backgroundView.get)
            .setConicGradient(CGPoint(x: 0.8, y: 0.8))
            .setGradientColors([
                Theme.shared.currentTheme.surfaceContainerHigh,
                Theme.shared.currentTheme.surfaceContainer,
                Theme.shared.currentTheme.surfaceContainerLow.adjustBrightness(20),
                Theme.shared.currentTheme.surfaceContainer,
                Theme.shared.currentTheme.surfaceContainerHigh,
            ])

                
            .setGradientColors([
                Theme.shared.currentTheme.surfaceContainerHigh,
                Theme.shared.currentTheme.surfaceContainerLow,
                Theme.shared.currentTheme.surfaceContainerLow.adjustBrightness(30),
                Theme.shared.currentTheme.surfaceContainer,
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(20),
                Theme.shared.currentTheme.surfaceContainerHigh,
            ])

        
            .setGradientColors([
                Theme.shared.currentTheme.surfaceContainer, //red
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(-15), //yellow
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(-30), //blue
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(-10), //black
                Theme.shared.currentTheme.surfaceContainer, //green
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(15), //white
                Theme.shared.currentTheme.surfaceContainer, //red
            ])

        
//            .setGradientColors([ .red, .yellow, .blue, .black, .green, .white, .red  ])
    }
    
    
}
