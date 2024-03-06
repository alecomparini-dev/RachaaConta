//  Created by Alessandro Comparini on 22/02/24.
//

import Foundation

import CustomComponentsSDK
import Handler

class PersonBillView: ViewBuilder {
    
    private let count: String?
    
    init(count: String?) {
        self.count = count
        super.init()
        configure()
    }
    

//  MARK: - LAZY PROPERTIES
    
    lazy var strokeVertical: StrokeView = {
        let comp = StrokeView(gradientColor: [Theme.shared.currentTheme.surfaceContainer, Theme.shared.currentTheme.surfaceContainerHigh], cornerRadius: 2)
            .setAutoLayout { build in
                build
                    .pinLeft.equalToSuperview(2)
                    .width.equalToConstant(2)
            }
        return comp
    }()
    
    lazy var container: ViewBuilder = {
        let comp = ViewBuilder()
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
            }
        return comp
    }()
    
    lazy var stackView: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAlignment(.center)
            .setAxis(.horizontal)
            .setDistribution(.fill)
            .setSpacing(4)
            .setAutoLayout { build in
                build
                    .leading.equalToSuperview(4)
                    .pinRight.equalToSuperview()
            }
        return comp
    }()
    
    lazy var personLabel: LabelBuilder = {
        let comp = LabelBuilder(count)
            .setTextAlignment(.center)
            .setFontFamily(Const.Font.titilliumWebRegular, 24)
            .setColor(Theme.shared.currentTheme.onSurface)
        return comp
    }()
    
    lazy var personImage: ImageViewBuilder = {
        let comp = ImageViewBuilder(systemName: "person.fill")
            .setContentMode(.center)
            .setTintColor(Theme.shared.currentTheme.onSurfaceVariant)
            .setWeight(.bold)
            .setSize(20)
        return comp
    }()
    
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        strokeVertical.add(insideTo: self)
        container.add(insideTo: self)
        stackView.add(insideTo: container)
        personLabel.add(insideTo: stackView)
        personImage.add(insideTo: stackView)
    }
    
    private func configAutoLayout() {
        strokeVertical.applyAutoLayout()
        container.applyAutoLayout()
        stackView.applyAutoLayout()
    }
    
}
