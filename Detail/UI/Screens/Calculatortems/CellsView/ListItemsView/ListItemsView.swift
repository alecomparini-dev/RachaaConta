//  Created by Alessandro Comparini on 14/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler

protocol ListItemsViewDelegate: AnyObject {
    func removeItemButtonTapped()
}

class ListItemsView: ViewBuilder {
    static let identifier = String(describing: ListItemsView.self)
    weak var delegate: ListItemsViewDelegate?
    
    private var nameItem: String = " "
    private var quantity: String = " "
    private var unitValue: String = " "
    private var totalValue: String = " "
    
    private let fontSizes: (quantity: CGFloat, multiply: CGFloat, unitValue: CGFloat, totalValue: CGFloat) = (14,12,14,17)
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - SETUP CELL
    func setup(nameItem: String, quantity: String, unitValue: String, totalValue: String) {
        self.nameItem = nameItem
        self.quantity = quantity
        self.unitValue = unitValue
        self.totalValue = totalValue
    }
    
    
//  MARK: - LAZY PROPERTIES

    private lazy var stackDisplay: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setSpacing(0)
            .setAlignment(.fill)
            .setDistribution(.fillProportionally)
            .setAxis(.horizontal)
            .setAutoLayout { build in
                build
                    .top.bottom.equalToSuperview()
                    .trailing.equalToSuperview(-12)
            }
        return comp
    }()
    
    private lazy var totalValueLabel: LabelBuilder = {
        let comp = LabelBuilder(totalValue)
            .setFontFamily(Const.Font.titilliumWebBold, fontSizes.totalValue)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout({ build in
                build
                    .width.equalToConstant(58)
            })
        return comp
    }()

    private lazy var unitValueLabel: LabelBuilder = {
        let comp = LabelBuilder("\(unitValue)  = ")
            .setFontFamily(Const.Font.titilliumWebExtraLight, fontSizes.unitValue)
            .setColor(Theme.shared.currentTheme.onSurface.adjustBrightness(-30))
        return comp
    }()

    
    private lazy var multiplayLabel: LabelBuilder = {
        let comp = LabelBuilder(" x ")
            .setFontFamily(Const.Font.titilliumWebLight, fontSizes.multiply)
            .setColor(Theme.shared.currentTheme.onSurface)
        return comp
    }()
    
    private lazy var quantityLabel: LabelBuilder = {
        let comp = LabelBuilder(quantity)
            .setTextAlignment(.center)
            .setFontFamily(Const.Font.titilliumWebExtraLight, fontSizes.quantity)
            .setColor(Theme.shared.currentTheme.onSurface.adjustBrightness(-30))
        return comp
    }()

    
    private lazy var removeItemButton: ButtonImageBuilder = {
        let img = ImageViewBuilder(systemName: Const.Images.xmark)
        let comp = ButtonImageBuilder(img)
            .setImageColor(Theme.shared.currentTheme.onSurfaceVariant.withAlphaComponent(0.7))
            .setImageSize(10)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview()
                    .leading.equalToSuperview(4)
//                    .height.equalToSuperview()
                    .width.equalToConstant(32)
            }
        return comp
    }()
    
    private lazy var nameItemLabel: LabelBuilder = {
        let comp = LabelBuilder(nameItem)
            .setTextAlignment(.left)
            .setFontFamily(Const.Font.titilliumWebSemiBold, 12)
            .setColor(Theme.shared.currentTheme.onSurfaceVariant)
            .setNumberOfLines(1)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(removeItemButton, .centerY)
                    .leading.equalTo(removeItemButton, .trailing)
                    .trailing.equalTo(stackDisplay, .leading, -4)
            }
        return comp
    }()
    

    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        stackDisplay.add(insideTo: self)
        quantityLabel.add(insideTo: stackDisplay)
        multiplayLabel.add(insideTo: stackDisplay)
        unitValueLabel.add(insideTo: stackDisplay)
        totalValueLabel.add(insideTo: stackDisplay)
        removeItemButton.add(insideTo: self)
        nameItemLabel.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        stackDisplay.applyAutoLayout()
        totalValueLabel.applyAutoLayout()
        removeItemButton.applyAutoLayout()
        nameItemLabel.applyAutoLayout()
    }
    

}
