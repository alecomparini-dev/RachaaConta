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
    
    
    lazy var sideBarView: SideBarView = {
        let comp = SideBarView()
            .setShadow({ build in
                build
                    .setOffset(width: 0, height: -5)
                    .setColor(Theme.shared.currentTheme.surfaceContainerLowest)
                    .setRadius(3)
                    .apply()
            })
            .setConstraints { build in
                build
                    .setPinRight.equalToSuperView
                    .setWidth.equalToConstant(75)
            }
        return comp
    }()
    
    lazy var clock: ClockNeumorphismBuilder = {
        let clock = ClockNeumorphismBuilder()
            .setEnabledDay(false)
            .setConstraints { build in
                build
                    .setTop.equalToSafeArea(24)
                    .setTrailing.equalTo(sideBarView.get, .leading, -16 )
                    .setWidth.equalToConstant(110)
                    .setHeight.equalToConstant(40)
            }
        return clock
    }()
    
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        sideBarView.add(insideTo: self)
        clock.add(insideTo: self)
    }
    
    private func configConstraints() {
        backgroundView.applyConstraint()
        sideBarView.applyConstraint()
        clock.applyConstraint()
    }
    
    
}
