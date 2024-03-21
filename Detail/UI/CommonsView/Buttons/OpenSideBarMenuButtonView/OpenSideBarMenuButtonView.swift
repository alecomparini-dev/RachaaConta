//  Created by Alessandro Comparini on 19/02/24.
//

import Foundation

import CustomComponentsSDK

protocol OpenSideBarMenuButtonViewDelegate: AnyObject {
    func openSideBarMenuButtonTapped()
}

class OpenSideBarMenuButtonView: ViewBuilder {
    weak var delegate: OpenSideBarMenuButtonViewDelegate?
    
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
    
    lazy var stroke1: StrokeView = {
        let comp = createUnderline()
        return comp
    }()
    
    lazy var stroke2: StrokeView = {
        let comp = createUnderline()
        return comp
    }()
    
    lazy var stroke3: StrokeView = {
        let comp = createUnderline()
        return comp
    }()
    
    
//  MARK: - PUBLIC AREA
    public func configStyles() {
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            stroke1.applyShadow()
            stroke2.applyShadow()
            stroke3.applyShadow()
            applyNeumorphism()
        }
        
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
        configTap()
        configBorder()
        configNeumorphism()
    }
    
    private func addElements() {
        stackView.add(insideTo: self)
        stroke1.add(insideTo: stackView)
        stroke2.add(insideTo: stackView)
        stroke3.add(insideTo: stackView)
        arrowOpenImageView.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        stackView.applyAutoLayout()
        arrowOpenImageView.applyAutoLayout()
    }

    private func createUnderline() -> StrokeView {
        let stroke = StrokeView(gradientColor: [Theme.shared.currentTheme.primary,Theme.shared.currentTheme.primary])
        
        return stroke
    }
    
    private func configTap() {
        self
            .setActions { build in
                build.setTap { [weak self] _, _ in
                    self?.delegate?.openSideBarMenuButtonTapped()
                }
            }
    }
    
    private func configBorder() {
        self.setBorder({ build in
            build
                .setCornerRadius(25)
                .setRoundedCorners([.right])
        })
    }
    
    private func configNeumorphism() {
        SideBarButtonNeumorphism(self).configNeumorphism()
    }
}
