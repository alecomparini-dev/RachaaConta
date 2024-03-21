//  Created by Alessandro Comparini on 04/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler


class CalculatorItemsView: UIView {

    static let listItemsID = "listItemsID"
    static let keyboardID = "keyboardID"
    
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
                    .top.equalToSafeArea(8)
                    .leading.equalToSuperview()
                    .size.equalToConstant(50)
            })
        return comp
    }()
    
    lazy var nameBillLabel: LabelBuilder = {
        let comp = LabelBuilder("EH NÓIS CARAIO")
            .setFontFamily(Const.Font.TitilliumWeb.extraLight, 14)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setOpacity(0.7)
            .setAutoLayout { build in
                build
                    .top.equalToSafeArea()
                    .trailing.equalToSafeArea(-16)
            }
        return comp
    }()
    
    lazy var nameBillUnderline: StrokeView = {
       let comp = StrokeView()
            .setOpacity(0.5)
            .setAutoLayout { build in
                build
                    .top.equalTo(nameBillLabel, .bottom, 4)
                    .trailing.equalTo(nameBillLabel, .trailing, 2)
                    .width.equalToConstant(65)
                    .height.equalToConstant(2)
            }
        return comp
    }()
    
    lazy var symbolCurrencyLabel: LabelBuilder = {
        let comp = LabelBuilder("R$")
            .setColor(Theme.shared.currentTheme.onSurface)
            .setFontFamily(Const.Font.TitilliumWeb.extraLight, 16)
            .setAutoLayout { build in
                build
                    .top.equalTo(totalAmountBillLabel, .top, 6)
                    .trailing.equalTo(totalAmountBillLabel, .leading, -4)
            }
        return comp
    }()
    
    lazy var totalAmountBillLabel: LabelBuilder = {
        let comp = LabelBuilder()
            .setColor(Theme.shared.currentTheme.onSurface)
            .setTextAttributed({ build in
                build
                    .setText(text: "7699,")
                    .setAttributed(key: .font, value: UIFont(name: Const.Font.TitilliumWeb.regular, size: 75) ?? UIFont() )
                    .setText(text: "59")
                    .setAttributed(key: .font, value: UIFont(name: Const.Font.TitilliumWeb.extraLight, size: 30) ?? UIFont() )
                    .setAttributed(key: .baselineOffset, value: 0)
            })
            .setAutoLayout { build in
                build
                    .top.equalTo(nameBillUnderline, .bottom, 16)
                    .trailing.equalTo(nameBillLabel, .trailing)
                    .height.equalToConstant(76)
            }
        return comp
    }()
    
    lazy var boxInsetListItems: BoxShadowInsetBuilder = {
        let comp = BoxShadowInsetBuilder()
            .setLightShadow(opacity: 0.2)
            .setBorder({ build in
                build
                    .setCornerRadius(16)
            })
            .setGradient({ build in
                build
                    .setReferenceColor(Theme.shared.currentTheme.surfaceContainer, percentageGradient: -20)
                    .setAxialGradient(.leftBottomToRightTop)
                    .apply()
            })
            .setAutoLayout { build in
                build
                    .top.equalTo(totalAmountBillLabel, .bottom, 12)
                    .leading.trailing.equalToSafeArea(8)
                    .bottom.equalTo(displayCalculator, .top, -16)
            }
        comp.apply()
        return comp
    }()

    lazy var listItems: ListBuilder = {
        let comp = ListBuilder()
            .setID(CalculatorItemsView.listItemsID)
            .setSectionHeaderHeight(0)
            .setSectionFooterHeight(0)
            .setRowHeight(45)
            .setSeparatorStyle(.none)
            .setShowsScroll(false, .vertical)
            .setPadding(top: 0, left: 0, bottom: 30, right: 0)
            .setAutoLayout { build in
                build
                    .top.equalToSuperview(16)
                    .bottom.equalToSuperview(-12)
                    .leading.trailing.equalToSuperview()
            }
        return comp
    }()
    
    lazy var displayCalculator: DisplayCalculatorItemValueView = {
        let comp = DisplayCalculatorItemValueView()
            .setAutoLayout { build in
                build
                    .bottom.equalTo(underlineItem, .top, -4)
                    .leading.trailing.equalTo(underlineItem)
                    .height.equalToConstant(35)
            }
        return comp
    }()
    
    lazy var underlineItem: StrokeView = {
        let comp = StrokeView(gradientColor: Theme.shared.currentTheme.secondaryGradient)
            .setAutoLayout { build in
                build
                    .bottom.equalTo(keyboardList, .top, -16)
                    .leading.trailing.equalToSafeArea(8)
                    .height.equalToConstant(1)
            }
        return comp
    }()
    
    lazy var keyboardList: ListBuilder = {
        let comp = ListBuilder()
            .setID(CalculatorItemsView.keyboardID)
            .setRowHeight(58)
            .setCustomRowHeight(forSection: 0, forRow: 1, 116)
            .setSectionHeaderHeight(0)
            .setSectionFooterHeight(0)
            .setShowsScroll(false, .both)
            .setIsScrollEnabled(false)
            .setPadding(top: 0, left: 0, bottom: -50, right: -200)
            .setAutoLayout { build in
                build
                    .leading.equalToSafeArea(24)
                    .trailing.equalToSafeArea(-16)
                    .bottom.equalToSafeArea()
                    .height.equalToConstant(232)
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
        boxInsetListItems.add(insideTo: self)
        listItems.add(insideTo: boxInsetListItems)
        displayCalculator.add(insideTo: self)
        underlineItem.add(insideTo: self)
        keyboardList.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        backButtonView.applyAutoLayout()
        nameBillLabel.applyAutoLayout()
        nameBillUnderline.applyAutoLayout()
        totalAmountBillLabel.applyAutoLayout()
        symbolCurrencyLabel.applyAutoLayout()
        boxInsetListItems.applyAutoLayout()
        listItems.applyAutoLayout()
        displayCalculator.applyAutoLayout()
        keyboardList.applyAutoLayout()
        underlineItem.applyAutoLayout()
    }
        
}
