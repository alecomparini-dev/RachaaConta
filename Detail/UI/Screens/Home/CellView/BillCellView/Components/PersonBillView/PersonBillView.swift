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
            .setConstraints { build in
                build
                    .setPinLeft.equalToSuperview(2)
                    .setWidth.equalToConstant(2)
            }
        return comp
    }()
    
    lazy var container: ViewBuilder = {
        let comp = ViewBuilder()
            .setConstraints { build in
                build
                    .setAlignmentCenterXY.equalToSuperview
            }
        return comp
    }()
    
    lazy var stackView: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setAlignment(.center)
            .setAxis(.horizontal)
            .setDistribution(.fill)
            .setSpacing(4)
            .setConstraints { build in
                build
                    .setLeading.equalToSuperview(4)
                    .setTop.setTrailing.setBottom.equalToSuperview
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
        configConstraints()
    }
    
    private func addElements() {
        strokeVertical.add(insideTo: self.get)
        container.add(insideTo: self.get)
        stackView.add(insideTo: container.get)
        personLabel.add(insideTo: stackView.get)
        personImage.add(insideTo: stackView.get)
    }
    
    private func configConstraints() {
        strokeVertical.applyConstraint()
        container.applyConstraint()
        stackView.applyConstraint()
    }
    
}
