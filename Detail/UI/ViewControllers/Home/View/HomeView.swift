//  Created by Alessandro Comparini on 15/02/24.
//

import UIKit
import CustomComponentsSDK
import Handler


protocol HomeViewDelegate: AnyObject {
    func createBillButtonFloatTapped()
}


class HomeView: UIView {
    weak var delegate: HomeViewDelegate?

    private let constantHeight: CGFloat = 190

    
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
            .setAutoLayout({ build in
                build
                    .pin.equalToSuperview()
            })
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
            .setView(topBlur)
            .setAnimationDirection(.topToBottom)
            .setAutoLayout({ build in
                build
                    .pinTop.equalToSuperview()
            })
        return comp
    }()
    
    lazy var openSideBarMenuButtonView: OpenSideBarMenuButtonView = {
        let view = OpenSideBarMenuButtonView()
            .setAutoLayout { build in
                build
                    .top.equalToSafeArea(8)
                    .leading.equalToSuperview()
                    .width.equalToConstant(58)
                    .height.equalToConstant(50)
            }
        return view
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
            .setAutoLayout({ build in
                build
                    .verticalAlignY.equalTo(openSideBarMenuButtonView, .centerY)
                    .trailing.equalToSafeArea(-24)
                    .width.equalToConstant(110)
                    .height.equalToConstant(35)
            })
        return clock
    }()
    
    lazy var createBillButtonFloat: ButtonFloatView = {
        let view = ButtonFloatView()
            .setAutoLayout({ build in
                build
                    .trailing.equalToSafeArea(-18)
                    .bottom.equalToSafeArea(-16)
                    .size.equalToConstant(55)
            })
            .setActions { build in
                build
                    .setTap { [weak self] _, _ in
                        guard let self else {return}
                        delegate?.createBillButtonFloatTapped()
                    }
            }
        return view
    }()
    
    
    lazy var containerFilterBill: ViewBuilder = {
        let comp = ViewBuilder(frame: CGRect(origin: .zero, size: CGSize(width: safeAreaLayoutGuide.layoutFrame.width , height: constantHeight)))
        comp.get.translatesAutoresizingMaskIntoConstraints = true
        return comp
    }()

    lazy var filterBillView: FilterBillView = {
        let comp = FilterBillView()
        return comp
    }()

    lazy var filterStack: StackViewBuilder = {
        let stack = StackViewBuilder()
            .setAutoLayout { build in
                build.pin.equalTo(containerFilterBill)
            }
        return stack
    }()
    
    lazy var listBillTableView: TableViewBuilder = {
        let comp = TableViewBuilder()
            .setBackgroundColor(.clear)
            .setShowsScroll(false, .both)
            .setSeparatorStyle(.none)
            .setPadding(top: 65, left: 0, bottom: 100, right: 0)
            .setRegisterCell(BillTableCellView.self)
            .setTableHeaderView(containerFilterBill)
            .setAutoLayout { build in
                build
                    .pin.equalToSafeArea()
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        listBillTableView.add(insideTo: self)
        topBlur.add(insideTo: self)
        topViewAnimation.add(insideTo: self)
        clock.add(insideTo: self)
        openSideBarMenuButtonView.add(insideTo: self)
        createBillButtonFloat.add(insideTo: self)
        
        filterStack.add(insideTo: containerFilterBill)
        filterBillView.add(insideTo: filterStack)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        listBillTableView.applyAutoLayout()
        clock.applyAutoLayout()
        openSideBarMenuButtonView.applyAutoLayout()
        createBillButtonFloat.applyAutoLayout()
        topViewAnimation.applyAutoLayout()
        filterStack.applyAutoLayout()
    }
    

}
