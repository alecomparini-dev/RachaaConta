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
            .setConstraints { build in
                build
                    .setTop.equalToSuperview(16)
                    .setLeading.setTrailing.equalToSuperview(16)
                    .setBottom.equalToSuperview(-24)
            }
        return comp
    }()
    
    
    lazy var filterLabel: LabelBuilder = {
        return LabelBuilder("Filtros:")
            .setColor(Theme.shared.currentTheme.onSurface)
            .setFontFamily(Const.Font.titilliumWebExtraLight, 18)
            .setConstraints { build in
                build
                    .setTop.equalTo(backgroundView.get, .top, 18)
                    .setLeading.equalTo(backgroundView.get, .leading, 24)
            }
    }()
    
    lazy var underLineView: StrokeView = {
        return StrokeView(gradientColor: Theme.shared.currentTheme.tertiaryGradient)
            .setConstraints { build in
                build
                    .setTop.equalTo(filterLabel.get, .bottom, 1)
                    .setLeading.equalTo(filterLabel.get, .leading, -2)
                    .setHeight.equalToConstant(2)
                    .setWidth.equalToConstant(65)
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
            .setConstraints { build in
                build
                    .setTop.equalTo(underLineView.get, .bottom , 20)
                    .setLeading.setTrailing.equalToSuperview(40)
                    .setHeight.equalToConstant(45)
            }
        return comp
    }()
    
    
    
//  MARK: - Private Area
    private func configure() {
        addElements()
        configConstraints()
        self.setTranslatesAutoresizingMaskIntoConstraints(true)
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self.get)
        filterLabel.add(insideTo: self.get)
        underLineView.add(insideTo: self.get)
        filterTextField.add(insideTo: self.get)
    }
    
    private func configConstraints() {
        backgroundView.applyConstraint()
        filterLabel.applyConstraint()
        underLineView.applyConstraint()
        filterTextField.applyConstraint()
    }
    
    
    
}
