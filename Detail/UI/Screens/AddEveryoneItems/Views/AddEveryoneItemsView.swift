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
        let comp = LabelBuilder("EH NÓIS CARAIO")
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
                    .trailing.equalTo(nameBillLabel.get, .trailing, 2)
                    .width.equalToConstant(65)
                    .height.equalToConstant(2)
            }
        return comp
    }()
    

    lazy var totalAmountBillLabel: LabelBuilder = {
        let comp = LabelBuilder()
            .setColor(Theme.shared.currentTheme.onSurface)
            .setTextAttributed({ build in
                build
                    .setText(text: "652,")
                    .setAttributed(key: .font, value: UIFont(name: Const.Font.titilliumWebRegular, size: 80) ?? UIFont() )
                    .setText(text: "30")
                    .setAttributed(key: .font, value: UIFont(name: Const.Font.titilliumWebExtraLight, size: 30) ?? UIFont() )
                    .setAttributed(key: .baselineOffset, value: 0)
            })
            .setAutoLayout { build in
                build
                    .top.equalTo(nameBillLabel.get, .bottom, 24)
                    .trailing.equalTo(nameBillLabel.get, .trailing)
                    .height.equalToConstant(64)
            }
        return comp
    }()
    
    lazy var symbolCurrencyLabel: LabelBuilder = {
        let comp = LabelBuilder("R$")
            .setColor(Theme.shared.currentTheme.onSurface)
            .setFontFamily(Const.Font.titilliumWebExtraLight, 16)
            .setAutoLayout { build in
                build
                    .top.equalTo(totalAmountBillLabel.get, .top, 2)
                    .trailing.equalTo(totalAmountBillLabel.get, .leading, -6)
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
        totalAmountBillLabel.add(insideTo: self)
        symbolCurrencyLabel.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        backButtonView.applyAutoLayout()
        nameBillLabel.applyAutoLayout()
        nameBillUnderline.applyAutoLayout()
        totalAmountBillLabel.applyAutoLayout()
        symbolCurrencyLabel.applyAutoLayout()
    }
    
    
}
