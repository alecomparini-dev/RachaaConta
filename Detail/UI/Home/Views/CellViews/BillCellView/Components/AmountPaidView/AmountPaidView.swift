//  Created by Alessandro Comparini on 21/02/24.
//

import Foundation

import CustomComponentsSDK

class AmountPaidView: ViewBuilder {
    
    private let amount: String?
    
    init(amount: String?) {
        self.amount = amount
        super.init()
        configure()
    }
    

//  MARK: - LAZY PROPERTIES

    lazy var amountImage: ImageViewBuilder = {
        let comp = ImageViewBuilder(systemName: "checkmark.diamond.fill")
            .setTintColor(Theme.shared.currentTheme.onSurfaceVariant)
            .setWeight(.bold)
            .setConstraints { build in
                build
                    .setVerticalAlignmentY.equalToSuperView
                    .setLeading.equalToSuperView
            }
        return comp
    }()
    
    lazy var stackView: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAlignment(.leading)
            .setAxis(.vertical)
            .setDistribution(.fillEqually)
            .setSpacing(0)
            .setConstraints { build in
                build
                    .setPinRight.equalToSuperView
                    .setLeading.equalTo(amountImage.get, .trailing, 10)
            }
        return comp
    }()
    
    lazy var amountTitleLabel: LabelBuilder = {
        let comp = LabelBuilder("Valor Pago")
            .setTextAlignment(.natural)
            .setFontFamily("TitilliumWeb-Light", 14)
            .setColor(Theme.shared.currentTheme.onSurface)
        return comp
    }()
    
    lazy var amountLabel: LabelBuilder = {
        let comp = LabelBuilder(amount)
            .setTextAlignment(.natural)
            .setFontFamily("TitilliumWeb-SemiBold", 14)
            .setColor(Theme.shared.currentTheme.onSurface)
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        amountImage.add(insideTo: self.get)
        stackView.add(insideTo: self.get)
        amountTitleLabel.add(insideTo: stackView.get)
        amountLabel.add(insideTo: stackView.get)
    }
    
    private func configConstraints() {
        amountImage.applyConstraint()
        stackView.applyConstraint()
    }
    
}
