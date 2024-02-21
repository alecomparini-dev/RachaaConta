//  Created by Alessandro Comparini on 20/02/24.
//

import UIKit
import CustomComponentsSDK
import Presenter

class BillTableCellView: UITableViewCell {
    static let identifier = String(describing: BillTableCellView.self)
    
    private var billPresenterDTO: BillPresenterDTO!
    
    func setupCell(_ billPresenterDTO: BillPresenterDTO) {
        self.billPresenterDTO = billPresenterDTO
        configure()
    }
    
//  MARK: - LAZY PROPERTIES
    
    lazy var dotView: DotView = {
        let size: CGFloat = 14
        let comp = DotView(size: size)
            .setConstraints { build in
                build
                    .setTop.equalToSuperView(16)
                    .setLeading.equalToSuperView(32)
                    .setSize.equalToConstant(size)
            }
        return comp
    }()
    
    lazy var lineVerticalView: LineVerticalView = {
        let comp = LineVerticalView()
            .setConstraints { build in
                build
                    .setTop.equalTo(dotView.get, .bottom, 10)
                    .setHorizontalAlignmentX.equalTo(dotView.get, 1)
                    .setBottom.equalToSuperView(-8)
                    .setWidth.equalToConstant(7)
            }
        return comp
    }()
    
    
    lazy var titleLabel: LabelBuilder = {
        let comp = LabelBuilder(billPresenterDTO.title ?? "")
            .setFontFamily("TitilliumWeb-SemiBold", 18)
            .setShadow({ build in
                build
                    .setRadius(4)
                    .setColor(hexColor: "#000000")
                    .setOffset(width: 4, height: 4)
            })
            .setNumberOfLines(1)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setConstraints { build in
                build
                    .setVerticalAlignmentY.equalTo(dotView.get)
                    .setLeading.equalTo(dotView.get, .trailing, 12)
                    .setTrailing.equalToSuperView(-16)
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configStyleCell()
        addElements()
        configConstraints()
    }
    
    private func configStyleCell() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    private func addElements() {
        dotView.add(insideTo: self.contentView)
        lineVerticalView.add(insideTo: self.contentView)
        titleLabel.add(insideTo: self.contentView)
    }
    
    private func configConstraints() {
        dotView.applyConstraint()
        lineVerticalView.applyConstraint()
        titleLabel.applyConstraint()
    }
    
    
}
