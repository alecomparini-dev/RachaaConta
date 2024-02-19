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
            .setConstraints { build in
                build
                    .setTop.setTrailing.equalToSafeArea(24)
                    .setWidth.equalToConstant(100)
                    .setHeight.equalToConstant(35)
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
        clock.add(insideTo: self)
    }
    
    private func configConstraints() {
        backgroundView.applyConstraint()
        clock.applyConstraint()
    }
    
    
}
