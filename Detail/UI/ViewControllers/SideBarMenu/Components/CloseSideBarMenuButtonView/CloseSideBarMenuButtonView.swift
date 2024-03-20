//  Created by Alessandro Comparini on 19/03/24.
//

import Foundation

import CustomComponentsSDK


protocol CloseSideBarMenuButtonViewDelegate: AnyObject {
    func closeSideBarMenuButtonTapped()
}

class CloseSideBarMenuButtonView: ViewBuilder {
    weak var delegate: CloseSideBarMenuButtonViewDelegate?
    
    private var gradient: GradientBuilder?
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var containerButton: ViewBuilder = {
        let comp = ViewBuilder()
            .setBackgroundColor(Theme.shared.currentTheme.surfaceContainerHighest)
            .setBorder({ build in
                build
                    .setCornerRadius(6)
            })
            .setShadow({ build in
                build
                    .setColor(Theme.shared.currentTheme.surfaceContainerLowest)
                    .setOpacity(1)
                    .setRadius(5)
                    .setOffset(width: 6, height: 6)
            })
            .setAutoLayout { build in
                build.pin.equalToSuperview()
            }
        return comp
    }()

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
    
    
//  MARK: - PUBLIC AREA
    func applyShadowBackButton() {
        containerButton.applyShadow()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
        configTap()
    }
    
    private func addElements() {
        containerButton.add(insideTo: self)
        stackView.add(insideTo: containerButton)
    }
    
    private func configAutoLayout() {
        containerButton.applyAutoLayout()
        stackView.applyAutoLayout()
    }
    
    private func configTap() {
        self
            .setActions { build in
                build.setTap { [weak self] _, _ in
                    self?.delegate?.closeSideBarMenuButtonTapped()
                }
            }
    }
    
}
