//  Created by Alessandro Comparini on 26/02/24.
//

import UIKit


public class SideBarMenuView: UIView {
    
    private let constantHeight: CGFloat = 190
    var height: NSLayoutConstraint!
    
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
            .setAutoLayout({ build in
                build
                    .pinLeft.equalToSuperview()
                    .trailing.equalToSuperview(-60)
            })
        return comp
    }()
    
    lazy var backButtonView: BackButtonView = {
        let comp = BackButtonView()
            .setAutoLayout { build in
                build
                    .top.equalToSafeArea(8)
                    .leading.equalToSuperview()
                    .size.equalToConstant(50)
            }
        return comp
    }()

    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        backButtonView.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        backButtonView.applyAutoLayout()
    }
    
    
    
}
