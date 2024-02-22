//  Created by Alessandro Comparini on 21/02/24.
//

import Foundation
import CustomComponentsSDK

class FilterBillView: ViewBuilder {
    
    private let frame: CGRect
    
    override init(frame: CGRect) {
        self.frame = frame
        super.init(frame: frame)
        self.initialization()
    }
    
    private func initialization() {
        addElements()
        configConstraints()
        self.setTranslatesAutoresizingMaskIntoConstraints(true)
    }
    
    lazy var backgroundView: ViewBuilder = {
        let comp = ViewBuilder()
            .setBorder({ build in
                build
                    .setCornerRadius(20)
            })
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
                    .setTop.equalToSuperView(16)
                    .setLeading.setTrailing.equalToSuperView(20)
                    .setBottom.equalToSuperView(-24)
            }
        return comp
    }()
    
    
    lazy var filterLabel: LabelBuilder = {
        return LabelBuilder("Filtros:")
            .setColor(Theme.shared.currentTheme.onSurface)
            .setFontFamily("TitilliumWeb-ExtraLight", 18)
            .setConstraints { build in
                build
                    .setTop.equalTo(backgroundView.get, .top, 16)
                    .setLeading.equalTo(backgroundView.get, .leading, 24)
            }
    }()
    
    lazy var underLineView: StrokeView = {
        return StrokeView()
            .setConstraints { build in
                build
                    .setTop.equalTo(filterLabel.get, .bottom)
                    .setLeading.equalTo(filterLabel.get, .leading, -2)
                    .setHeight.equalToConstant(2)
                    .setWidth.equalToConstant(45)
            }
    }()
    
    lazy var filterTextField: TextFieldBuilder = {
        return TextFieldBuilder(placeHolder: "Digite aqui...")
            .setPadding(15, .left)
            .setPadding(50, .right)
            .setPlaceHolderColor(Theme.shared.currentTheme.onSurfaceVariant.withAlphaComponent(0.5))
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setTextColor(Theme.shared.currentTheme.onSurface)
            .setBorder { build in
                build
                    .setCornerRadius(10)
                    .setWidth(1)
            }
            .setConstraints { build in
                build
                    .setTop.equalTo(underLineView.get, .bottom , 16)
                    .setLeading.setTrailing.equalToSuperView(56)
                    .setHeight.equalToConstant(45)
            }
    }()
    
    
    
//  MARK: - Private Area
    
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
