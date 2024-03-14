//  Created by Alessandro Comparini on 13/03/24.
//

import UIKit
import CustomComponentsSDK

class BoxShadowInsetBuilder: ViewBuilder {
    
    private var shadowOffset: (top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) = (top: 6, left: 6, right: 6, bottom: 6)
    
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


//  MARK: - LAZY AREA
    lazy var topShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setShadow({ build in
                build
                    .setRadius(8)
                    .setColor(.black)
                    .setOpacity(1)
                    .setOffset(width: 0, height: 0)
                    .applyLayer()
            })
            .setAutoLayout { build in
                build
                    .pinTop.equalToSuperview()
                    .height.equalToConstant(shadowOffset.top)
            }
        return comp
    }()
    
    lazy var leftShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setShadow({ build in
                build
                    .setRadius(8)
                    .setColor(.black)
                    .setOpacity(1)
                    .setOffset(width: 0, height: 0)
                    .applyLayer()
            })
            .setAutoLayout { build in
                build
                    .pinLeft.equalToSuperview()
                    .width.equalToConstant(shadowOffset.left)
            }
        return comp
    }()
    
    lazy var rightShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setShadow({ build in
                build
                    .setRadius(12)
                    .setColor(.white)
                    .setOpacity(0.4)
                    .setOffset(width: 4, height: 0)
                    .applyLayer()
            })
            .setAutoLayout { build in
                build
                    .pinRight.equalToSuperview()
                    .width.equalToConstant(shadowOffset.right)
            }
        return comp
    }()
    
    lazy var bottomShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setShadow({ build in
                build
                    .setRadius(12)
                    .setColor(.white)
                    .setOpacity(0.4)
                    .setOffset(width: 4, height: 0)
                    .applyLayer()
            })
            .setAutoLayout { build in
                build
                    .pinBottom.equalToSuperview()
                    .height.equalToConstant(shadowOffset.bottom)
            }
        return comp
    }()
    
    
//  MARK: - APPLY
    public func apply() {
        topShadow.applyAutoLayout()
        leftShadow.applyAutoLayout()
        rightShadow.applyAutoLayout()
        bottomShadow.applyAutoLayout()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        self.get.layer.masksToBounds = false
        addElements()
    }
    
    private func addElements() {
        topShadow.add(insideTo: self)
        leftShadow.add(insideTo: self)
        rightShadow.add(insideTo: self)
        bottomShadow.add(insideTo: self)
    }
    
    
    
}
