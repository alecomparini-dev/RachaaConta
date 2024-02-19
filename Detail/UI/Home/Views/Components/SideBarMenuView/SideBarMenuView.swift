//  Created by Alessandro Comparini on 19/02/24.
//

import Foundation

import CustomComponentsSDK

class SideBarMenuView: ViewBuilder {
    
    override init() {
        super.init()
        configure()
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
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self.get)
    }
    
    private func configConstraints() {
        backgroundView.applyConstraint()
    }
    
    
}
