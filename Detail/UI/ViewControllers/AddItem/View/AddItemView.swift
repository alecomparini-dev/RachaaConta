//  Created by Alessandro Comparini on 07/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler

protocol AddItemViewDelegate: AnyObject {
    func saveItemButtonTapped()
}


class AddItemView: UIView {
    weak var delegate: AddItemViewDelegate?
    
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
            .setFontFamily(Const.Font.titilliumWebExtraLight, 14)
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
                    .width.equalToConstant(50)
                    .height.equalToConstant(2)
            }
        return comp
    }()
    
    lazy var nameItemTextField: TextFieldBuilder = {
        let comp = TextFieldBuilder(placeHolder: "Descrição do Item 1")
            .setClearButton({ build in
                build
                    .setSizeButton(CGSize(width: 18, height: 18))
                    .setPosition(.left)
                    .apply()
            })
            .setFontFamily(Const.Font.titilliumWebExtraLight, 26)
            .setPlaceHolderColor(Theme.shared.currentTheme.onSurfaceVariant.withAlphaComponent(0.6))
            .setTextColor(Theme.shared.currentTheme.onSurface)
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setAutoCorrectionType(.no)
            .setAutoCapitalization(.words)
            .setKeyboard({ build in
                build
                    .setKeyboardType(.default)
            })
            .setTextAlignment(.right)
            .setAdjustsFontSizeToFitWidth(minimumFontSize: 16)
            .setAutoLayout({ build in
                build
                    .top.equalTo(backButtonView, .bottom, -4)
                    .leading.trailing.equalToSafeArea(24)
                    .height.equalToConstant(50)
            })
        return comp
    }()
       
    lazy var underline: StrokeView = {
        let comp = StrokeView(gradientColor: Theme.shared.currentTheme.secondaryGradient)
            .setAutoLayout({ build in
                build
                    .top.equalTo(nameItemTextField, .bottom, 2)
                    .leading.trailing.equalTo(nameItemTextField)
                    .height.equalToConstant(2)
            })
        return comp
    }()
    
    lazy var displayCalculator: DisplayCalculatorItemValueView = {
        let comp = DisplayCalculatorItemValueView(fontSizes: (quantity: 16, multiply: 14, unitValue: 16, totalValue: 18))
            .setAlpha(0.7)
            .setAutoLayout { build in
                build
                    .top.equalTo(underline, .bottom, 6)
                    .trailing.equalTo(underline, .trailing, 4)
                    .height.equalToConstant(25)
            }
        return comp
    }()
    
    lazy var searchItensList: ListBuilder = {
        let comp = ListBuilder(style: .plain)
            .setBorder({ build in
                build
                    .setCornerRadius(16)
            })
            .setRowHeight(50)
            .setSectionHeaderHeight(42)
            .setShowsScroll(false, .vertical)
            .setSeparatorStyle(.singleLine)
            .setPadding(top: 0, left: 0, bottom: 16, right: 0)
            .setAutoLayout { build in
                build
                    .top.equalTo(displayCalculator, .bottom, 12)
                    .leading.trailing.equalToSafeArea(16)
                    .bottom.equalTo(saveItemButton, .top, -12)
            }
        return comp
    }()
    
    lazy var saveItemButton: PrimaryButton = {
        let comp = PrimaryButton(text: "Salvar Item")
            .setAutoLayout({ build in
                build
                    .trailing.equalToSafeArea(-24)
                    .height.equalToConstant(45)
                    .width.equalToConstant(130)
                    .bottom.equalTo(keyboardLayoutGuide, .top, -16)
            })
        comp.button.setActions { build in
            build
                .setTap { [weak self] _, _ in
                    guard let self else {return}
                    delegate?.saveItemButtonTapped()
                }
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
        nameItemTextField.add(insideTo: self)
        underline.add(insideTo: self)
        displayCalculator.add(insideTo: self)
        searchItensList.add(insideTo: self)
        saveItemButton.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        backButtonView.applyAutoLayout()
        nameBillLabel.applyAutoLayout()
        nameBillUnderline.applyAutoLayout()
        nameItemTextField.applyAutoLayout()
        underline.applyAutoLayout()
        displayCalculator.applyAutoLayout()
        searchItensList.applyAutoLayout()
        saveItemButton.applyAutoLayout()
    }
    

}
