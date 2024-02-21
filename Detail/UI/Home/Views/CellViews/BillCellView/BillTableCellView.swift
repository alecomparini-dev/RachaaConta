//  Created by Alessandro Comparini on 20/02/24.
//

import UIKit
import CustomComponentsSDK

class BillTableCellView: UITableViewCell {
    static let identifier = String(describing: BillTableCellView.self)
    
    func setupCell() {
        configure()
    }
    
//  MARK: - LAZY PROPERTIES
    
    lazy var label: LabelBuilder = {
        let comp = LabelBuilder("teste caraio")
            .setConstraints { build in
                build
                    .setPin.equalToSuperView
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        label.add(insideTo: self.contentView)
    }
    
    private func configConstraints() {
        label.applyConstraint()
    }
    
    
}
