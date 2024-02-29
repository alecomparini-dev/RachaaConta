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
        backgroundView.add(insideTo: self)
    }
    
    private func configConstraints() {
        backgroundView.applyConstraint()
    }
    
}
