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
        let comp = ImageViewBuilder(systemName: "pin.fill")
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
            .setFontFamily(Const.Font.titilliumWebSemiBold, 14)
            .setNumberOfLines(2)
            .setTextAlignment(.left)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(addressImage.get, .centerY)
                    .leading.equalTo(addressImage.get, .trailing, 12)
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
        addressImage.add(insideTo: self.get)
        addressLabel.add(insideTo: self.get)
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
