//  Created by Alessandro Comparini on 14/03/24.
//

import UIKit

import CustomComponentsSDK
import Presenter
import Handler

protocol ListItemsViewDelegate: AnyObject {
    func removeItemButtonTapped()
}

class ListItemsView: ViewBuilder {
    static let identifier = String(describing: ListItemsView.self)
    weak var delegate: ListItemsViewDelegate?
    
    private let fontSizes: (quantity: CGFloat, multiply: CGFloat, unitValue: CGFloat, totalValue: CGFloat) = (14,12,14,15)
    
    private let billItemPresenterDTO: BillItemPresenterDTO
    
    init(billItemPresenterDTO: BillItemPresenterDTO) {
        self.billItemPresenterDTO = billItemPresenterDTO
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES

    private lazy var totalValueLabel: LabelBuilder = {
        let comp = LabelBuilder(billItemPresenterDTO.totalValue)
            .setTextAlignment(.right)
            .setFontFamily(Const.Font.titilliumWebBold, fontSizes.totalValue)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview()
                    .trailing.equalToSuperview(-16)
//                    .width.equalToConstant(56)
            }
        return comp
    }()

    private lazy var unitValueLabel: LabelBuilder = {
        let comp = LabelBuilder()
            .setTextAlignment(.right)
            .setText("\(billItemPresenterDTO.unitValue ?? "")  =")
            .setFontFamily(Const.Font.titilliumWebExtraLight, fontSizes.unitValue)
            .setColor(Theme.shared.currentTheme.onSurface.adjustBrightness(-30))
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(totalValueLabel, .centerY)
                    .trailing.equalTo(totalValueLabel, .leading, -6)
            }
        return comp
    }()

    
    private lazy var multiplayLabel: LabelBuilder = {
        let comp = LabelBuilder("x")
            .setFontFamily(Const.Font.titilliumWebLight, fontSizes.multiply)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(unitValueLabel, .centerY)
                    .trailing.equalTo(unitValueLabel, .leading, -6)
            }
        return comp
    }()
    
    private lazy var quantityLabel: LabelBuilder = {
        let comp = LabelBuilder()
            .setTextAlignment(.right)
            .setText(billItemPresenterDTO.quantity)
            .setFontFamily(Const.Font.titilliumWebExtraLight, fontSizes.quantity)
            .setColor(Theme.shared.currentTheme.onSurface.adjustBrightness(-30))
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(multiplayLabel, .centerY)
                    .trailing.equalTo(multiplayLabel, .leading, -6)
            }
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
                    .width.equalToConstant(32)
            }
        return comp
    }()
    
    private lazy var nameItemLabel: LabelBuilder = {
        let comp = LabelBuilder(billItemPresenterDTO.descriptionItem)
            .setTextAlignment(.left)
            .setFontFamily(Const.Font.titilliumWebLight, 14)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setNumberOfLines(1)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(removeItemButton, .centerY)
                    .leading.equalTo(removeItemButton, .trailing)
                    .trailing.equalTo(quantityLabel, .leading, -6)
            }
        return comp
    }()
    
    

    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        quantityLabel.add(insideTo: self)
        multiplayLabel.add(insideTo: self)
        unitValueLabel.add(insideTo: self)
        totalValueLabel.add(insideTo: self)
        removeItemButton.add(insideTo: self)
        nameItemLabel.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        quantityLabel.applyAutoLayout()
        multiplayLabel.applyAutoLayout()
        unitValueLabel.applyAutoLayout()
        totalValueLabel.applyAutoLayout()
        removeItemButton.applyAutoLayout()
        nameItemLabel.applyAutoLayout()
    }
    

}
