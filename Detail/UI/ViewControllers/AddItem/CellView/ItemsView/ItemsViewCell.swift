//  Created by Alessandro Comparini on 15/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler

class ItemsViewCell: ViewBuilder {
    
    private let nameItem: String
    
    init(_ nameItem: String) {
        self.nameItem = nameItem
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY AREA
    
    lazy var nameItemLabel: LabelBuilder = {
        let comp = LabelBuilder(nameItem)
            .setFontFamily(Const.Font.titilliumWebLight, 16)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview()
                    .leading.equalToSuperview(16)
            }
        return comp
    }()
    

//  MARK: - PRIVATE AREA
    private func configure() {
        addElement()
        configConstraints()
    }
    
    private func addElement() {
        nameItemLabel.add(insideTo: self)
    }
    
    private func configConstraints() {
        nameItemLabel.applyAutoLayout()
    }
    
    
}
