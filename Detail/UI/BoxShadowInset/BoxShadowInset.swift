//  Created by Alessandro Comparini on 13/03/24.
//

import UIKit
import CustomComponentsSDK

class BoxShadowInsetBuilder: ViewBuilder {
    
    private var shadowOffset: (top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) = (6, 6, 6, 6)
    
    private var lightShadow: (color: UIColor, opacity: Float) = (.white, 0.4)
    private var darkShadow: (color: UIColor, opacity: Float) = (.black, 1)
    private let cornerRadius: CGFloat
    
    public init(cornerRadius: CGFloat? = nil) {
        self.cornerRadius = cornerRadius ?? 0
        super.init()
        configure()
    }
    
        
//  MARK: - SET PROPERTIES
    
    @discardableResult
    func setShadowOffset(top: CGFloat?, left: CGFloat?, right: CGFloat?, bottom: CGFloat?) -> Self {
        self.shadowOffset = (top ?? 0, left ?? 0, right ?? 0, bottom ?? 0)
        return self
    }

    @discardableResult
    func setLightShadow(_ color: UIColor = .white, opacity: Float = 0.4) -> Self {
        lightShadow = (color, opacity)
        return self
    }
    
    @discardableResult
    func setDarkShadow(_ color: UIColor = .black, opacity: Float = 1) -> Self {
        darkShadow = (color, opacity)
        return self
    }


//  MARK: - LAZY AREA
    lazy var topShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setAutoLayout { build in
                build
                    .pinTop.equalToSuperview()
                    .height.equalToConstant(shadowOffset.top)
            }
        return comp
    }()
    
    lazy var leftShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setAutoLayout { build in
                build
                    .pinLeft.equalToSuperview()
                    .width.equalToConstant(shadowOffset.left)
            }
        return comp
    }()
    
    lazy var rightShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setAutoLayout { build in
                build
                    .pinRight.equalToSuperview()
                    .width.equalToConstant(shadowOffset.right)
            }
        return comp
    }()
    
    lazy var bottomShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setAutoLayout { build in
                build
                    .pinBottom.equalToSuperview()
                    .height.equalToConstant(shadowOffset.bottom)
            }
        return comp
    }()
    
    
//  MARK: - APPLY
    public func apply() {
        addElements()
        applyAutoLayouts()
        setShadows()
        applyStyles()
    }
    
    private func applyStyles() {
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            topShadow.applyShadow()
            leftShadow.applyShadow()
            rightShadow.applyShadow()
            bottomShadow.applyShadow()
        }
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        self.get.layer.masksToBounds = false
    }
    
    private func addElements() {
        topShadow.add(insideTo: self)
        leftShadow.add(insideTo: self)
        rightShadow.add(insideTo: self)
        bottomShadow.add(insideTo: self)
    }
    
    private func applyAutoLayouts() {
        topShadow.applyAutoLayout()
        leftShadow.applyAutoLayout()
        rightShadow.applyAutoLayout()
        bottomShadow.applyAutoLayout()
    }
    
    private func setShadows() {
        setTopShadow()
        setLeftShadow()
        setRightShadow()
        setBottomShadow()
    }
    
    private func setTopShadow() {
        topShadow.setShadow({ build in
                build
                    .setRadius(8)
                    .setColor(darkShadow.color)
                    .setOpacity(darkShadow.opacity)
                    .setOffset(width: 0, height: 0)
            })
    }
    
    private func setLeftShadow() {
        leftShadow.setShadow({ build in
            build
                .setRadius(8)
                .setColor(darkShadow.color)
                .setOpacity(darkShadow.opacity)
                .setOffset(width: 0, height: 0)
        })
    }
    
    private func setRightShadow() {
        rightShadow.setShadow({ build in
            build
                .setRadius(8)
                .setColor(lightShadow.color)
                .setOpacity(lightShadow.opacity)
                .setOffset(width: 6, height: 0)
        })
    }
    
    private func setBottomShadow() {
        bottomShadow.setShadow({ build in
            build
                .setRadius(8)
                .setColor(lightShadow.color)
                .setOpacity(lightShadow.opacity)
                .setOffset(width: 0, height: 6)
        })
    }
    
    
    
}
