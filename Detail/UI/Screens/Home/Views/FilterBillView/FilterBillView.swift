//  Created by Alessandro Comparini on 21/02/24.
//

import UIKit

import CustomComponentsSDK
import Handler

class FilterBillView: ViewBuilder {
    
    private let frame: CGRect
    
    override init(frame: CGRect) {
        self.frame = frame
        super.init(frame: frame)
        self.configure()
    }
    

//  MARK: - LAZY PROPERTIES
    
    lazy var backgroundView: ViewBuilder = {
        let comp = ViewBuilder()
            .setGradient({ build in
                build
                    .setReferenceColor(Theme.shared.currentTheme.surfaceContainer, percentageGradient: -20)
                    .setAxialGradient(.leftToRight)
                    .apply()
            })
            .setBorder({ build in
                build
                    .setCornerRadius(20)
            })
            .setAutoLayout { build in
                build
                    .top.leading.trailing.equalToSuperview(16)
                    .bottom.equalToSuperview(-24)
            }
        return comp
    }()
    
    
    lazy var filterLabel: LabelBuilder = {
        return LabelBuilder("Filtros:")
            .setColor(Theme.shared.currentTheme.onSurface)
            .setFontFamily(Const.Font.titilliumWebExtraLight, 18)
            .setAutoLayout { build in
                build
                    .top.equalTo(backgroundView, .top , 18)
                    .leading.equalTo(backgroundView, .leading, 24)
            }
    }()
    
    lazy var underLineView: StrokeView = {
        return StrokeView(gradientColor: Theme.shared.currentTheme.tertiaryGradient)
            .setAutoLayout { build in
                build
                    .top.equalTo(filterLabel, .bottom,  1)
                    .leading.equalTo(filterLabel, .leading , -2)
                    .width.equalToConstant(65)
                    .height.equalToConstant(2)
            }
    }()
    
    lazy var filterTextField: TextFieldBuilder = {
        let comp = TextFieldBuilder(placeHolder: "Pesquisar...")
            .setFontFamily(Const.Font.titilliumWebLight, 16)
            .setPadding(15)
            .setPlaceHolderColor(Theme.shared.currentTheme.onSurfaceVariant.withAlphaComponent(0.8))
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setTextColor(Theme.shared.currentTheme.onSurface)
            .setKeyboard({ build in
                build
                    .setKeyboardType(.default)
            })
            .setBorder { build in
                build
                    .setCornerRadius(8)
            }
            .setClearButton()
            .setAutoLayout({ build in
                build
                    .top.equalTo(underLineView, .bottom, 20)
                    .leading.trailing.equalToSuperview(40)
                    .height.equalToConstant(45)
            })
        return comp
    }()
    
    
    
//  MARK: - Private Area
    private func configure() {
        addElements()
        configAutoLayout()
        self.setTranslatesAutoresizingMaskIntoConstraints(true)
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        filterLabel.add(insideTo: self)
        underLineView.add(insideTo: self)
        filterTextField.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        filterLabel.applyAutoLayout()
        underLineView.applyAutoLayout()
        filterTextField.applyAutoLayout()
    }
    
    
    
}
