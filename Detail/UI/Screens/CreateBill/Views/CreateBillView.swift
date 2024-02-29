//  Created by Alessandro Comparini on 29/02/24.
//

import UIKit
import CustomComponentsSDK



class CreateBillView: UIView {
    
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
    
    lazy var backButtonView: BackButtonView = {
        let comp = BackButtonView()
            .setConstraints { build in
                build
                    .setTop.equalToSafeArea(16)
                    .setLeading.equalToSuperView
                    .setWidth.equalToConstant(50)
                    .setHeight.equalToConstant(50)
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        backButtonView.add(insideTo: self)
    }
    
    private func configConstraints() {
        backgroundView.applyConstraint()
        backButtonView.applyConstraint()
    }
    
    
}

