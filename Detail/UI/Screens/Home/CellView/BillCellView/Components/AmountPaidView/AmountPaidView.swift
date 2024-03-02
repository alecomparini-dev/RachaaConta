//  Created by Alessandro Comparini on 21/02/24.
//

import Foundation

import CustomComponentsSDK
import Handler

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
            .setSize(14)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview()
                    .leading.equalToSuperview()
            }
        return comp
    }()
    
    lazy var stackView: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAlignment(.leading)
            .setAxis(.vertical)
            .setDistribution(.fillEqually)
            .setSpacing(0)
            .setAutoLayout { build in
                build
                    .pinRight.equalToSuperview()
                    .leading.equalTo(amountImage.get, .trailing, 10)
            }
        return comp
    }()
    
    lazy var amountTitleLabel: LabelBuilder = {
        let comp = LabelBuilder("Valor Pago")
            .setTextAlignment(.natural)
            .setFontFamily(Const.Font.titilliumWebLight, 16)
            .setColor(Theme.shared.currentTheme.onSurface)
        return comp
    }()
    
    lazy var amountLabel: LabelBuilder = {
        let comp = LabelBuilder(amount)
            .setTextAlignment(.natural)
            .setFontFamily(Const.Font.titilliumWebSemiBold, 18)
            .setColor(Theme.shared.currentTheme.onSurface)
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        amountImage.add(insideTo: self.get)
        stackView.add(insideTo: self.get)
        amountTitleLabel.add(insideTo: stackView.get)
        amountLabel.add(insideTo: stackView.get)
    }
    
    private func configAutoLayout() {
        amountImage.applyAutoLayout()
        stackView.applyAutoLayout()
    }
    
}
