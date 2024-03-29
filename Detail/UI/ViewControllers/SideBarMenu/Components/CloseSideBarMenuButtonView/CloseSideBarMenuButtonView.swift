//  Created by Alessandro Comparini on 19/03/24.
//

import Foundation

import CustomComponentsSDK


protocol CloseSideBarMenuButtonViewDelegate: AnyObject {
    func closeSideBarMenuButtonTapped()
}

class CloseSideBarMenuButtonView: ViewBuilder {
    weak var delegate: CloseSideBarMenuButtonViewDelegate?
        
    private let sizeDots: CGFloat = 5
   
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
    
    lazy var dot1: ViewBuilder = {
        let comp = createDots()
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview()
                    .leading.equalToSuperview(11)
                    .size.equalToConstant(sizeDots)
            }
        return comp
    }()
    
    lazy var dot2: ViewBuilder = {
        let comp = createDots()
            .setAutoLayout { build in
                build
                    .top.equalToSuperview(17)
                    .trailing.equalToSuperview(-13)
                    .size.equalToConstant(sizeDots)
            }
        return comp
    }()

    lazy var dot3: ViewBuilder = {
        let comp = createDots()
            .setAutoLayout { build in
                build
                    .bottom.equalToSuperview(-16)
                    .leading.equalTo(dot2, .leading)
                    .size.equalToConstant(sizeDots)
            }
        return comp
    }()


    
//  MARK: - PUBLIC AREA
    func applyStyles() {
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
        dot1.add(insideTo: self)
        dot2.add(insideTo: self)
        dot3.add(insideTo: self)

    }
    
    private func configAutoLayout() {
        containerButton.applyAutoLayout()
        dot1.applyAutoLayout()
        dot2.applyAutoLayout()
        dot3.applyAutoLayout()
    }

    private func createDots() -> ViewBuilder {
        return ViewBuilder()
            .setBackgroundColor(Theme.shared.currentTheme.surfaceContainerHighest.adjustBrightness(80))
            .setBorder { build in
                build
                    .setCornerRadius(sizeDots/2)
            }
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
