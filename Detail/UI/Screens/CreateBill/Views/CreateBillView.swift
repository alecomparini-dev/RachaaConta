//  Created by Alessandro Comparini on 29/02/24.
//

import UIKit

import CustomComponentsSDK
import Handler

class CreateBillView: UIView {
    
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
            .setConstraints { build in
                build
                    .setTop.equalToSafeArea(16)
                    .setLeading.equalToSuperview
                    .setWidth.equalToConstant(50)
                    .setHeight.equalToConstant(50)
            }
        return comp
    }()
    
    lazy var nameBillTextField: TextFieldBuilder = {
        let comp = TextFieldBuilder(placeHolder: "* nome da conta")
            .setPadding(4)
            .setFontFamily(Const.Font.titilliumWebExtraLight, 26)
            .setPlaceHolderColor(Theme.shared.currentTheme.onSurfaceVariant.withAlphaComponent(0.4))
            .setTextColor(Theme.shared.currentTheme.onSurface)
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setAutoCorrectionType(.no)
            .setAutoCapitalization(.allCharacters)
            .setKeyboard({ build in
                build
                    .setKeyboardType(.default)
            })
            .setTextAlignment(.right)
            .setAdjustsFontSizeToFitWidth(minimumFontSize: 16)
            .setAutoLayout({ build in
                build
                    .top.equalTo(backButtonView.get, .bottom, 56)
                    .leading.trailing.equalToSafeArea(24)
                    .height.equalToConstant(50)
            })
            .setConstraints { build in
                build
                    .setTop.equalTo(backButtonView.get, .bottom, 56)
                    .setLeading.equalToSafeArea(24)
                    .setTrailing.equalToSafeArea(-24)
                    .setHeight.equalToConstant(50)
            }
        return comp
    }()
    
    lazy var underline: StrokeView = {
        let comp = StrokeView(gradientColor: Theme.shared.currentTheme.secondaryGradient)
            .setAutoLayout({ build in
                build
                    .top.equalTo(nameBillTextField.get, .bottom)
                    .leading.trailing.equalTo(nameBillTextField.get)
                    .height.equalToConstant(2)
            })
        return comp
    }()
    
    //TODO: CORRIGIR TINTCOLOR E IMAGECOLOR
    lazy var saveButton: ButtonImageBuilder = {
//        let comp = ButtonImageBuilder(ImageViewBuilder(systemName: "mappin.and.ellipse"))
        let comp = ButtonImageBuilder(ImageViewBuilder(systemName: "pin.fill"))
            .setTitle("Salvar")
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setImageSize(12)
            .setImageWeight(.thin)
            .setImagePadding(10)
            .setFontFamily(Const.Font.titilliumWebExtraLight, 18)
            .setBorder({ build in
                build
                    .setCornerRadius(8)
            })
            .setNeumorphism { build in
                build
                    .setReferenceColor(Theme.shared.currentTheme.surfaceContainerLow)
                    .setShape(.concave)
//                    .setShape(.convex)
                    .setLightPosition(.leftTop)
                    .setIntensity(percent: 100)
                    .setBlur(to: .light, percent: 3)
                    .setBlur(to: .dark, percent: 10)
                    .setDistance(to: .light, percent: 5)
                    .setDistance(to: .dark, percent: 10)
                    .setShadowColor(to: .dark, color: .black)
                    .apply()
            }
            .setAutoLayout({ build in
                build
                    .trailing.equalToSafeArea(-24)
                    .height.equalToConstant(45)
                    .width.equalToConstant(130)
                    .bottom.equalTo(keyboardLayoutGuide, .top, -24)
            })
            .setActions { build in
                build
                    .setTap { [weak self] component, tapGesture in
                        guard let self else {return}
                        nameBillTextField.setHideKeyboard()
                    }
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
        backButtonView.add(insideTo: self)
        nameBillTextField.add(insideTo: self)
        underline.add(insideTo: self)
        saveButton.add(insideTo: self)
    }
    
    private func configConstraints() {
        backgroundView.applyAutoLayout()
        backButtonView.applyAutoLayout()
        nameBillTextField.applyAutoLayout()
        underline.applyAutoLayout()
        saveButton.applyAutoLayout()

        
    }
        
    
}

