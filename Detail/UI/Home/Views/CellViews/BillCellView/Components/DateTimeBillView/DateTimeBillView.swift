//  Created by Alessandro Comparini on 22/02/24.
//

import UIKit
import CustomComponentsSDK

class DateTimeBillView: ViewBuilder {
    
    private let day: String
    private let month: String
    private let dayWeek: String
    private let time: String
    
    public init(day: String?, month: String?, dayWeek: String?, time: String? ) {
        self.day = day ?? ""
        self.month = month ?? ""
        self.dayWeek = dayWeek ?? ""
        self.time = time ?? ""
        super.init()
        configure()
    }
    

//  MARK: - LAZY PROPERTIES

    lazy var dateTimeLabel: LabelBuilder = {
        let comp = LabelBuilder()
            .setColor(Theme.shared.currentTheme.onSurface)
            .setNumberOfLines(1)
            .setTextAlignment(.left)
            .setTextAttributed({ build in
                build
                    .setText(text: "\(day) / " )
                    .setAttributed(key: .font, value: UIFont(name: "TitilliumWeb-Bold", size: 18) ?? UIFont())
                    .setAttributed(key: .foregroundColor, value: Theme.shared.currentTheme.onSurfaceVariant)
                    .setText(text: "\(month)" )
                    .setAttributed(key: .font, value: UIFont(name: "TitilliumWeb-Bold", size: 17) ?? UIFont())
                    .setText(text: "  \(dayWeek) \(time)")
                    .setAttributed(key: .font, value: UIFont(name: "TitilliumWeb-ExtraLight", size: 16) ?? UIFont())
            })
            .setConstraints { build in
                build
                    .setPin.equalToSuperView(2)
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        dateTimeLabel.add(insideTo: self.get)
    }
    
    private func configConstraints() {
        dateTimeLabel.applyConstraint()
    }
    
}

    
