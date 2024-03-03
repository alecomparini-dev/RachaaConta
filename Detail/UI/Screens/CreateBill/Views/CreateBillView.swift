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
        return comp
    }()
    
    lazy var nameBillTextField: TextFieldBuilder = {
        let comp = TextFieldBuilder(placeHolder: "* nome da conta")
            .setPadding(4)
            .setFontFamily(Const.Font.titilliumWebExtraLight, 26)
            .setPlaceHolderColor(Theme.shared.currentTheme.onSurfaceVariant.withAlphaComponent(0.6))
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
    
    
    lazy var painelAddress: ViewBuilder = {
        let comp = ViewBuilder()
            .setBackgroundColor(Theme.shared.currentTheme.surfaceContainer)
            .setBorder({ build in
                build
                    .setCornerRadius(8)
            })
            .setAutoLayout { build in
                build
                    .top.equalTo(underline.get, .bottom, 24)
                    .leading.trailing.equalTo(underline.get)
                    .height.equalToConstant(110)
            }
        return comp
    }()
    
    lazy var addressImage: ImageViewBuilder = {
        let comp = ImageViewBuilder(systemName: Const.Images.addressBill)
            .setTintColor(Theme.shared.currentTheme.onSurfaceVariant)
//            .setSize(22)
            .setSize(18)
            .setWeight(.thin)
            .setAutoLayout { build in
                build
                    .top.leading.equalToSuperview(16)
//                    .verticalAlignY.equalTo(painelAddress.get, .centerY)
//                    .leading.equalTo(painelAddress.get, .leading, 16)
            }
        return comp
    }()
    
//    lazy var addressLabel: LabelBuilder = {
//        let comp = LabelBuilder("Avenida Marcos de Freitas Costas, 1228 - Uberlândia/MG")
//            .setFontFamily(Const.Font.titilliumWebExtraLight, 18)
//            .setNumberOfLines(2)
//            .setTextAlignment(.left)
//            .setColor(Theme.shared.currentTheme.onSurface)
//            .setAutoLayout { build in
//                build
//                    .verticalAlignY.equalTo(addressImage.get, .centerY)
//                    .leading.equalTo(addressImage.get, .trailing, 16)
//                    .trailing.equalTo(painelAddress.get, .trailing, -8)
//            }
//        return comp
//    }()
    
    lazy var addressLabel: LabelBuilder = {
        let comp = LabelBuilder("Deseja adicionar o endereço?")
            .setFontFamily(Const.Font.titilliumWebExtraLight, 16)
            .setNumberOfLines(2)
            .setTextAlignment(.left)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(addressImage.get, .centerY)
                    .leading.equalTo(addressImage.get, .trailing, 8)
                    .trailing.equalTo(painelAddress.get, .trailing, -8)
            }
        return comp
    }()
    
    
    lazy var addAddressButton: ButtonBuilder = {
        let comp = ButtonBuilder()
            .setTitle("Sim")
            .setTintColor(Theme.shared.currentTheme.onSurfaceInverse)
            .setFontFamily(Const.Font.titilliumWebRegular, 12)
            .setBorder({ build in
                build
                    .setCornerRadius(4)
            })
            .setNeumorphism { build in
                build
                    .setReferenceColor(Theme.shared.currentTheme.tertiary)
                    .setShape(.convex)
                    .setLightPosition(.leftTop)
                    .setIntensity(to: .light, percent: 30)
                    .setIntensity(to: .dark, percent: 100)
                    .setBlur(to: .light, percent: 5)
                    .setBlur(to: .dark, percent: 10)
                    .setDistance(to: .light, percent: 2)
                    .setDistance(to: .dark, percent: 10)
                    .setShadowColor(to: .dark, color: .black)
                    .apply()
            }
            .setAutoLayout({ build in
                build
                    .bottom.equalToSuperview(-12)
                    .trailing.equalToSuperview(-12)
                    .height.equalToConstant(22)
                    .width.equalToConstant(50)
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
    
    
    
    //TODO: CORRIGIR TINTCOLOR E IMAGECOLOR
    lazy var saveButton: ButtonImageBuilder = {
        let comp = ButtonImageBuilder(ImageViewBuilder(systemName: Const.Images.checkmark))
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
        configAutoLayout()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        backButtonView.add(insideTo: self)
        nameBillTextField.add(insideTo: self)
        underline.add(insideTo: self)
        
        painelAddress.add(insideTo: self)
        addressImage.add(insideTo: painelAddress.get)
        addressLabel.add(insideTo: painelAddress.get)
        addAddressButton.add(insideTo: painelAddress.get)
        
        
        saveButton.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        backButtonView.applyAutoLayout()
        nameBillTextField.applyAutoLayout()
        underline.applyAutoLayout()
        
        painelAddress.applyAutoLayout()
        addressImage.applyAutoLayout()
        addressLabel.applyAutoLayout()
        addAddressButton.applyAutoLayout()
        
        
        saveButton.applyAutoLayout()
    }
        
    
}

