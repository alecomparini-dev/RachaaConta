//  Created by Alessandro Comparini on 28/02/24.
//

import Foundation
import CustomComponentsSDK
import UIKit


public protocol BackButtonViewDelegate: AnyObject {
    func backButtonImageTapped()
}

class BackButtonView: ViewBuilder {
    weak var delegate: BackButtonViewDelegate?
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var backButtonImage: ButtonImageBuilder = {
        let imageView = ImageViewBuilder(systemName: "chevron.left")
        let comp = ButtonImageBuilder(imageView)
            .setTintColor(Theme.shared.currentTheme.primary)
            .setImageWeight(.bold)
            .setAutoLayout({ build in
                build
                    .verticalAlignY.equalToSuperview()
                    .horizontalAlignX.equalToSuperview(-5)
            })
            .setActions { build in
                build
                    .setTap { [weak self] _, _ in
                        self?.delegate?.backButtonImageTapped()
                    }
            }
        return comp
    }()

    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
        configBorder()
        configNeumorphism()
    }
    
    private func addElements() {
        backButtonImage.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backButtonImage.applyAutoLayout()
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
