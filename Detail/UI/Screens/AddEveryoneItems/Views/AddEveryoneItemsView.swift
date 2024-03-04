//  Created by Alessandro Comparini on 04/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler

class AddEveryoneItemsView: UIView {
    
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
                    .pin.equalToSuperview()
            })
        return comp
    }()
    
    lazy var backButtonView: BackButtonView = {
        let comp = BackButtonView()
            .setAutoLayout({ build in
                build
                    .top.equalToSafeArea(16)
                    .leading.equalToSuperview()
                    .size.equalToConstant(50)
            })
        return comp
    }()
    
    lazy var nameBillLabel: LabelBuilder = {
        let comp = LabelBuilder("NOME DA CONTA")
            .setFontFamily(Const.Font.titilliumWebExtraLight, 18)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(backButtonView.get, .centerY)
                    .trailing.equalToSafeArea(-16)
            }
        return comp
    }()
    
    lazy var nameBillUnderline: StrokeView = {
       let comp = StrokeView()
            .setAutoLayout { build in
                build
                    .top.equalTo(nameBillLabel.get, .bottom, 4)
                    .trailing.equalTo(nameBillLabel.get, .trailing, 4)
                    .width.equalToConstant(65)
                    .height.equalToConstant(2)
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
        nameBillLabel.add(insideTo: self)
        nameBillUnderline.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        backButtonView.applyAutoLayout()
        nameBillLabel.applyAutoLayout()
        nameBillUnderline.applyAutoLayout()
    }
    
    
}
