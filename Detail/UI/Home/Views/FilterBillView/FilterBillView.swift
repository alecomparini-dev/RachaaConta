//  Created by Alessandro Comparini on 21/02/24.
//

import UIKit
import CustomComponentsSDK

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
            .setPadding(15)
//            .setPadding(50, .right)
            .setPlaceHolderColor(Theme.shared.currentTheme.onSurfaceVariant.withAlphaComponent(0.8))
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setTextColor(Theme.shared.currentTheme.onSurface)
            .setBorder { build in
                build
                    .setCornerRadius(8)
            }
            .setConstraints { build in
                build
                    .setTop.equalTo(underLineView.get, .bottom , 20)
                    .setLeading.setTrailing.equalToSuperView(40)
                    .setHeight.equalToConstant(45)
            }
        comp.get.font = UIFont(name: "TitilliumWeb-Light", size: 16)
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
