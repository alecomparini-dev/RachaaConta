//  Created by Alessandro Comparini on 19/02/24.
//

import Foundation

import CustomComponentsSDK

class ButtonSideBarMenuView: NeumorphismSideBarView {
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    
    lazy var stackView: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAxis(.vertical)
            .setAlignment(.fill)
            .setSpacing(3)
            .setDistribution(.fillEqually)
            .setConstraints { build in
                build
                    .setLeading.equalToSuperView(8)
                    .setVerticalAlignmentY.equalToSuperView
                    .setWidth.equalToConstant(22)
                    .setHeight.equalToConstant(12)
            }
        return comp
    }()
    
    lazy var menuImage: ImageViewBuilder = {
        let img = ImageViewBuilder(systemName: "line.3.horizontal")
            .setTintColor(Theme.shared.currentTheme.primary)
            .setWeight(.bold)
            .setSize(22)
            .setConstraints { build in
                build
                    .setVerticalAlignmentY.equalToSuperView
                    .setLeading.equalToSuperView(8)
            }
        return img
    }()
    
    
    lazy var arrowOpenImageView: ImageViewBuilder = {
        let img = ImageViewBuilder(systemName: "chevron.forward")
            .setTintColor(Theme.shared.currentTheme.onSurfaceInverse)
            .setSize(12)
            .setWeight(.bold)
            .setContentMode(.center)
            .setConstraints { build in
                build
                    .setTrailing.equalToSuperView(-10)
                    .setVerticalAlignmentY.equalTo(stackView.get)
            }
        return img
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        stackView.add(insideTo: self.get)
        createUnderline().add(insideTo: stackView.get)
        createUnderline().add(insideTo: stackView.get)
        createUnderline().add(insideTo: stackView.get)
        arrowOpenImageView.add(insideTo: self.get)
    }
    
    private func configConstraints() {
        stackView.applyConstraint()
        arrowOpenImageView.applyConstraint()
    }

    private func createUnderline() -> StrokeView {
        return StrokeView(gradientColor: [Theme.shared.currentTheme.primary,Theme.shared.currentTheme.primary])
    }
    
}
