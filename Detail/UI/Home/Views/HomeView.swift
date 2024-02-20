//  Created by Alessandro Comparini on 15/02/24.
//

import UIKit
import CustomComponentsSDK


class HomeView: UIView {

    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var backgroundView: BackgroundView = {
        let comp = BackgroundView()
            .setConstraints { build in
                build
                    .setPin.equalToSuperView
            }
        return comp
    }()
    
    lazy var clock: ClockNeumorphismBuilder = {
        let clock = ClockNeumorphismBuilder()
            .setColor(hexColor: Theme.shared.currentTheme.backgroundColor.adjustBrightness(20).toHexString)
            .setColonsStyle({ build in
                build
                    .setRadius(5)
                    .setColor(hexColor: Theme.shared.currentTheme.primary.toHexString)
                    .setShadowColor(hexColor: "#000000")
            })
            .setConstraints { build in
                build
                    .setTop.equalToSafeArea(16)
                    .setTrailing.equalToSafeArea(-24)
                    .setWidth.equalToConstant(110)
                    .setHeight.equalToConstant(35)
            }
        return clock
    }()
    
    lazy var sideBarMenuView: SideBarMenuView = {
        let view = SideBarMenuView()
            .setConstraints { build in
                build
                    .setVerticalAlignmentY.equalTo(clock.getClock.get)
                    .setLeading.equalToSuperView
                    .setWidth.equalToConstant(58)
                    .setHeight.equalToConstant(50)
            }
        return view
    }()
    
    lazy var buttonFloat: ButtonFloatView = {
        let view = ButtonFloatView()
            .setConstraints { build in
                build
                    .setTrailing.equalToSuperView(-24)
                    .setBottom.equalToSuperView(-56)
                    .setWidth.setHeight.equalToConstant(60)
            }
        return view
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        clock.add(insideTo: self)
        sideBarMenuView.add(insideTo: self)
        buttonFloat.add(insideTo: self)
    }
    
    private func configConstraints() {
        backgroundView.applyConstraint()
        clock.applyConstraint()
        sideBarMenuView.applyConstraint()
        buttonFloat.applyConstraint()
    }
    
    
}
