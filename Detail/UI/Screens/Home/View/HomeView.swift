//  Created by Alessandro Comparini on 15/02/24.
//

import UIKit
import CustomComponentsSDK


protocol HomeViewDelegate: AnyObject {
    func createBillButtonFloatTapped()
}


class HomeView: UIView {
    weak var delegate: HomeViewDelegate?

    private let constantHeight: CGFloat = 190
    var height: NSLayoutConstraint!
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var backgroundView: BackgroundView = {
        let comp = BackgroundView()
            .setConstraints { build in
                build
                    .setPin.equalToSuperView
            }
        return comp
    }()
    
    lazy var topBlur: BlurBuilder = {
        let comp = BlurBuilder(style: .dark)
            .setHidden(false)
            .setAlpha(0.8)
        return comp
    }()

    lazy var topViewAnimation: TopViewAnimationHeightWithScrollBuilder = {
        let comp = TopViewAnimationHeightWithScrollBuilder(height: (ini: 0, end: 130))
//        let comp = TopViewAnimationHeightWithScrollBuilder(height: (ini: 130, end: 0))
            .setView(topBlur)
//            .setAnimation(.decreasing)
            .setConstraints { build in
                build
                    .setPinTop.equalToSuperView
            }
        return comp
    }()
    
    lazy var clock: ClockNeumorphismBuilder = {
        let clock = ClockNeumorphismBuilder()
            .setColor(hexColor: Theme.shared.currentTheme.backgroundColor.adjustBrightness(20).toHexString)
            .setColonsStyle({ build in
                build
                    .setRadius(5)
                    .setColor(hexColor: Theme.shared.currentTheme.primary.toHexString)
                    .setShadowColor(hexColor: "#000000")
            })
            .setConstraints { build in
                build
                    .setTop.equalToSafeArea(16)
                    .setTrailing.equalToSafeArea(-24)
                    .setWidth.equalToConstant(110)
                    .setHeight.equalToConstant(35)
            }
        return clock
    }()
    
    lazy var sideBarMenuView: SideBarMenuView = {
        let view = SideBarMenuView()
            .setConstraints { build in
                build
                    .setVerticalAlignmentY.equalTo(clock.getClock.get)
                    .setLeading.equalToSuperView
                    .setWidth.equalToConstant(58)
                    .setHeight.equalToConstant(50)
            }
        return view
    }()
    
    lazy var createBillButtonFloat: ButtonFloatView = {
        let view = ButtonFloatView()
            .setConstraints { build in
                build
                    .setTrailing.setBottom.equalToSafeArea(16)
                    .setWidth.setHeight.equalToConstant(55)
            }
            .setActions { build in
                build
                    .setTap { [weak self] _, _ in
                        guard let self else {return}
                        delegate?.createBillButtonFloatTapped()
                    }
            }
        return view
    }()
    
    lazy var listBillTableView: TableViewBuilder = {
        let comp = TableViewBuilder()
            .setBackgroundColor(.clear)
            .setShowsScroll(false, .both)
            .setSeparatorStyle(.none)
            .setPadding(top: 65, left: 0, bottom: 100, right: 0)
            .setRegisterCell(BillTableCellView.self)
            .setTableHeaderView(ViewBuilder(frame: CGRect(origin: .zero, size: CGSize(width: 1 , height: constantHeight))))
            .setConstraints { build in
                build
                    .setPin.equalToSuperView
            }
        return comp
    }()
    
    lazy var filterBillView: FilterBillView = {
        let comp = FilterBillView(frame: CGRect(origin: .zero, size: CGSize(width: listBillTableView.get.layer.frame.width , height: constantHeight)))
        return comp
    }()
    
    lazy var bottomBlur: BlurBuilder = {
        let comp = BlurBuilder(style: .dark)
            .setHidden(true)
            .setConstraints { build in
                build
                    .setTop.equalTo(createBillButtonFloat.get, .top, -8)
                    .setPinBottom.equalToSuperView
            }
        return comp
    }()
    
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        listBillTableView.add(insideTo: self)
        topBlur.add(insideTo: self)
        topViewAnimation.add(insideTo: self)
        clock.add(insideTo: self)
        sideBarMenuView.add(insideTo: self)
        bottomBlur.add(insideTo: self)
        createBillButtonFloat.add(insideTo: self)
    }
    
    private func configConstraints() {
        backgroundView.applyConstraint()
        listBillTableView.applyConstraint()
        clock.applyConstraint()
        sideBarMenuView.applyConstraint()
        createBillButtonFloat.applyConstraint()
        bottomBlur.applyConstraint()
        
        
        topViewAnimation.applyConstraint()
        
    }
    
    public func configFilterBillView() {
        listBillTableView.setTableHeaderView(filterBillView)
    }
    
}
