//  Created by Alessandro Comparini on 20/02/24.
//

import UIKit
import CustomComponentsSDK
import Handler
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
            .setAutoLayout { build in
                build
                    .top.leading.equalToSuperview(16)
                    .size.equalToConstant(size)
            }
        return comp
    }()
    
    lazy var lineVerticalView: LineVerticalView = {
        let comp = LineVerticalView()
            .setAutoLayout { build in
                build
                    .top.equalTo(dotView, .bottom, 10)
                    .horizontalAlignX.equalTo(dotView, .centerX, 1)
                    .width.equalToConstant(7)
                    .bottom.equalToSuperview(-16)
            }
        return comp
    }()
    
    lazy var titleLabel: LabelBuilder = {
        let comp = LabelBuilder(billPresenterDTO.title ?? "")
            .setFontFamily(Const.Font.TitilliumWeb.semiBold, 18)
            .setShadow({ build in
                build
                    .setRadius(4)
                    .setColor(hexColor: "#000000")
                    .setOffset(width: 4, height: 4)
            })
            .setNumberOfLines(1)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(dotView, .centerY)
                    .leading.equalTo(dotView, .trailing, 12)
                    .trailing.equalToSuperview(-16)
            }
        return comp
    }()
    
    lazy var dateTimeBillView: DateTimeBillView = {
        let comp = DateTimeBillView(day: billPresenterDTO.day, month: billPresenterDTO.month, dayWeek: billPresenterDTO.dayOfWeek, time: billPresenterDTO.time)
            .setAutoLayout { build in
                build
                    .top.equalTo(titleLabel, .bottom, -6)
                    .leading.equalTo(titleLabel, .leading, 8)
                    .trailing.equalToSuperview(-80)
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
            .setAutoLayout { build in
                build
                    .top.equalTo(dateTimeBillView, .bottom, 4)
                    .leading.equalTo(lineVerticalView, .trailing, 16)
                    .trailing.equalToSuperview(-16)
                    .bottom.equalToSuperview(-28)
            }
        return comp
    }()
    
    lazy var buttonSeeBillView: ButtonSeeBillView = {
        let comp = ButtonSeeBillView()
            .setAutoLayout { build in
                build
                    .top.equalToSuperview(4)
                    .trailing.equalToSuperview(-8)
                    .size.equalToConstant(45)
            }
        return comp
    }()
    
    lazy var amountPaid: AmountPaidView = {
        let comp = AmountPaidView(amount: billPresenterDTO.amountPaid)
            .setAutoLayout { build in
                build
                    .top.equalToSuperview(14)
                    .leading.equalToSuperview(16)
                    .trailing.equalToSuperview(-50)
                    .height.equalToConstant(50)
            }
        return comp
    }()
    
    lazy var billAddress: BillAddressView = {
        let comp = BillAddressView(address: billPresenterDTO.address)
            .setAutoLayout { build in
                build
                    .top.equalTo(amountPaid, .bottom, 16)
                    .leading.equalTo(amountPaid, .leading)
                    .trailing.equalToSuperview(-85)
                    .height.equalToConstant(50)
            }
        return comp
    }()
    
    lazy var personBillView: PersonBillView = {
        let comp = PersonBillView(count: billPresenterDTO.countPerson)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(billAddress, .centerY)
                    .leading.equalTo(billAddress, .trailing, 12)
                    .trailing.equalToSuperview()
                    .height.equalTo(amountPaid)
            }
        return comp
    }()
    
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
        configStyles()
    }
    
    private func configStyles() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        dotView.applyNeumorphism()
    }
    
    private func addElements() {
        dotView.add(insideTo: self.contentView)
        lineVerticalView.add(insideTo: self.contentView)
        titleLabel.add(insideTo: self.contentView)
        dateTimeBillView.add(insideTo: self.contentView)
        backgroundColorView.add(insideTo: self.contentView)
        buttonSeeBillView.add(insideTo: backgroundColorView)
        billAddress.add(insideTo: backgroundColorView)
        amountPaid.add(insideTo: backgroundColorView)
        personBillView.add(insideTo: backgroundColorView)
    }
    
    private func configAutoLayout() {
        dotView.applyAutoLayout()
        lineVerticalView.applyAutoLayout()
        titleLabel.applyAutoLayout()
        dateTimeBillView.applyAutoLayout()
        buttonSeeBillView.applyAutoLayout()
        backgroundColorView.applyAutoLayout()
        billAddress.applyAutoLayout()
        amountPaid.applyAutoLayout()
        personBillView.applyAutoLayout()
    }
    
    
}
