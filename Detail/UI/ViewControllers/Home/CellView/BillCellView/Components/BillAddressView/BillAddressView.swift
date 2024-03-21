//  Created by Alessandro Comparini on 21/02/24.
//

import Foundation

import CustomComponentsSDK
import Handler
import Presenter

class BillAddressView: ViewBuilder {
    
    private let address: AddressPresenterDTO?
    
    init(address: AddressPresenterDTO?) {
        self.address = address
        super.init()
        configure()
    }
    

//  MARK: - LAZY PROPERTIES

    lazy var addressImage: ImageViewBuilder = {
        let comp = ImageViewBuilder(systemName: Const.Images.addressBill)
            .setTintColor(Theme.shared.currentTheme.onSurfaceVariant)
            .setSize(14)
            .setWeight(.black)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview()
                    .leading.equalToSuperview()
            }
        return comp
    }()
        
    lazy var addressLabel: LabelBuilder = {
        let comp = LabelBuilder()
            .setFontFamily(Const.Font.TitilliumWeb.semiBold, 14)
            .setNumberOfLines(2)
            .setTextAlignment(.left)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(addressImage, .centerY)
                    .leading.equalTo(addressImage, .trailing, 12)
                    .trailing.equalToSuperview()
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
        configAddress()
    }
    
    private func addElements() {
        addressImage.add(insideTo: self)
        addressLabel.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        addressImage.applyAutoLayout()
        addressLabel.applyAutoLayout()
    }
    
    private func configAddress() {
        let street = address?.street ?? ""
        let number = address?.number ?? ""
        let city = address?.city ?? ""
        let state = address?.state ?? ""

        let address = "\(street), \(number) - \(city)/\(state.uppercased())"
        
        addressLabel.setText(address)
    }
}
