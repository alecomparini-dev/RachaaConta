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
            .setConstraints { build in
                build
                    .setVerticalAlignmentY.equalToSuperview
                    .setLeading.equalToSuperview
            }
        return comp
    }()
        
    lazy var addressLabel: LabelBuilder = {
        let comp = LabelBuilder()
            .setFontFamily(Const.Font.titilliumWebSemiBold, 14)
            .setNumberOfLines(2)
            .setTextAlignment(.left)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setConstraints { build in
                build
                    .setVerticalAlignmentY.equalTo(addressImage.get)
                    .setLeading.equalTo(addressImage.get, .trailing, 12)
                    .setTrailing.equalToSuperview
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
        configAddress()
    }
    
    private func addElements() {
        addressImage.add(insideTo: self.get)
        addressLabel.add(insideTo: self.get)
    }
    
    private func configConstraints() {
        addressImage.applyConstraint()
        addressLabel.applyConstraint()
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
