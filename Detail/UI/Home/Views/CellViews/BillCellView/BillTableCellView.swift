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
                    .setLeading.equalToSuperView(16)
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
                    .setWidth.equalToConstant(7)
                    .setBottom.equalToSuperView(-16)
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
    
    lazy var dateTimeBillView: DateTimeBillView = {
        let comp = DateTimeBillView(day: billPresenterDTO.day, month: billPresenterDTO.month, dayWeek: billPresenterDTO.dayOfWeek, time: billPresenterDTO.time)
            .setConstraints { build in
                build
                    .setTop.equalTo(titleLabel.get, .bottom, -6)
                    .setLeading.equalTo(titleLabel.get, .leading, 8)
                    .setTrailing.equalToSuperView(-80)
            }
        return comp
    }()
    
    
    
    
    lazy var backgroundColorView: ViewBuilder = {
        let comp = ViewBuilder()
            .setGradient({ build in
                build
                    .setReferenceColor(Theme.shared.currentTheme.surfaceContainerLow, percentageGradient: 30)
                    .setAxialGradient(.rightToLeft)
                    .apply()
            })
            .setBorder({ build in
                build
                    .setCornerRadius(10)
            })
            .setConstraints { build in
                build
                    .setTop.equalTo(dateTimeBillView.get, .bottom, 4)
                    .setLeading.equalTo(lineVerticalView.get, .trailing, 16)
                    .setTrailing.equalToSuperView(-16)
                    .setBottom.equalToSuperView(-28)
            }
        return comp
    }()
    
    lazy var buttonSeeBillView: ButtonSeeBillView = {
        let comp = ButtonSeeBillView()
            .setConstraints { build in
                build
                    .setTop.equalToSuperView(4)
                    .setTrailing.equalToSuperView(-8)
                    .setWidth.setHeight.equalToConstant(45)
            }
        return comp
    }()
    
    lazy var amountPaid: AmountPaidView = {
        let comp = AmountPaidView(amount: billPresenterDTO.amountPaid)
            .setConstraints { build in
                build
                    .setTop.equalToSuperView(14)
                    .setLeading.equalToSuperView(16)
                    .setTrailing.equalToSuperView(-50)
                    .setHeight.equalToConstant(50)
            }
        return comp
    }()
    
    lazy var billAddress: BillAddressView = {
        let comp = BillAddressView(address: billPresenterDTO.address)
            .setConstraints { build in
                build
                    .setTop.equalTo(amountPaid.get, .bottom, 16)
                    .setLeading.equalTo(amountPaid.get, .leading)
                    .setTrailing.equalToSuperView(-85)
                    .setHeight.equalToConstant(50)

            }
        return comp
    }()

    
    lazy var personBillView: PersonBillView = {
        let comp = PersonBillView(count: billPresenterDTO.countPerson)
            .setConstraints { build in
                build
                    .setVerticalAlignmentY.equalTo(billAddress.get)
                    .setLeading.equalTo(billAddress.get, .trailing, 12)
                    .setTrailing.equalToSuperView
                    .setHeight.equalTo(amountPaid.get)
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
        dateTimeBillView.add(insideTo: self.contentView)

        backgroundColorView.add(insideTo: self.contentView)
        buttonSeeBillView.add(insideTo: backgroundColorView.get)
        billAddress.add(insideTo: backgroundColorView.get)
        amountPaid.add(insideTo: backgroundColorView.get)
        personBillView.add(insideTo: backgroundColorView.get)

    }
    
    private func configConstraints() {
        dotView.applyConstraint()
        lineVerticalView.applyConstraint()
        titleLabel.applyConstraint()
        dateTimeBillView.applyConstraint()
        buttonSeeBillView.applyConstraint()
        backgroundColorView.applyConstraint()
        billAddress.applyConstraint()
        amountPaid.applyConstraint()
        personBillView.applyConstraint()
    }
    
    
}
