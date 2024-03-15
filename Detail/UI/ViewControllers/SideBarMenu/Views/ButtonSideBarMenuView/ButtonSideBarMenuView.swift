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
            .setAutoLayout { build in
                build
                    .leading.equalToSuperview(8)
                    .verticalAlignY.equalToSuperview()
                    .width.equalToConstant(22)
                    .height.equalToConstant(12)
            }
        return comp
    }()
    
    lazy var arrowOpenImageView: ImageViewBuilder = {
        let img = ImageViewBuilder(systemName: "chevron.forward")
            .setTintColor(Theme.shared.currentTheme.onSurfaceInverse)
            .setSize(12)
            .setWeight(.bold)
            .setContentMode(.center)
            .setAutoLayout { build in
                build
                    .trailing.equalToSuperview(-10)
                    .verticalAlignY.equalTo(stackView, .centerY)
            }
        return img
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        stackView.add(insideTo: self)
        createUnderline().add(insideTo: stackView)
        createUnderline().add(insideTo: stackView)
        createUnderline().add(insideTo: stackView)
        arrowOpenImageView.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        stackView.applyAutoLayout()
        arrowOpenImageView.applyAutoLayout()
    }

    private func createUnderline() -> StrokeView {
        return StrokeView(gradientColor: [Theme.shared.currentTheme.primary,Theme.shared.currentTheme.primary])
    }
    
}
