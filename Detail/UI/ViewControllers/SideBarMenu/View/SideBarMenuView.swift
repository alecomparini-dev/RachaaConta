//  Created by Alessandro Comparini on 26/02/24.
//

import UIKit

import CustomComponentsSDK

protocol SideBarMenuViewDelegate: AnyObject {
    func closeMenuRightViewTapped()
}

public class SideBarMenuView: UIView {
    weak var delegate: SideBarMenuViewDelegate?
   
    private var gradient: GradientBuilder?
    
    private var traceTop: StrokeView!
    private var traceMiddle: StrokeView!
    private var traceBottom: StrokeView!
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var backgroundView: ViewBuilder = {
        let comp = ViewBuilder()
            .setAutoLayout({ build in
                build
                    .pinLeft.equalToSuperview()
                    .trailing.equalToSuperview(-60)
            })
        return comp
    }()
    
    lazy var closeMenuButtonView: CloseSideBarMenuButtonView = {
        let comp = CloseSideBarMenuButtonView()
            .setAutoLayout { build in
                build
                    .top.equalToSafeArea(16)
                    .leading.equalToSuperview(40)
                    .width.equalToConstant(40)
                    .height.equalToConstant(56)
            }
        return comp
    }()
    
    lazy var closeMenuRightView: ViewBuilder = {
        let comp = ViewBuilder()
            .setBackgroundColor(.black.withAlphaComponent(0.01))
            .setAutoLayout { build in
                build
                    .pinRight.equalToSuperview()
                    .leading.equalTo(backgroundView, .trailing)
            }
            .setActions { build in
                build
                    .setTap { [weak self] _,_ in
                        guard let self else {return}
                        delegate?.closeMenuRightViewTapped()
                    }
            }
        return comp
    }()
    
    

//  MARK: - PUBLIC AREA
    public func applyStyles() {
        gradient?.apply()
        closeMenuButtonView.applyStyles()
        configTrace()
    }
    
            
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
        configGradient()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        closeMenuButtonView.add(insideTo: self)
        closeMenuRightView.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        closeMenuButtonView.applyAutoLayout()
        closeMenuRightView.applyAutoLayout()
    }
        
    private func configTrace() {
        configTraceTop()
        configTraceMiddle()
        configTraceBottom()
    }
    
    private func configTraceTop() {
        traceTop = StrokeView(gradientColor: Theme.shared.currentTheme.primaryGradient, cornerRadius: 0)
            .setAutoLayout { build in
                build
                    .top.equalTo(closeMenuButtonView, .bottom, 110)
                    .trailing.equalTo(backgroundView, .trailing)
                    .width.equalToConstant(2)
                    .height.equalToConstant(25)
            }
        traceTop.add(insideTo: self)
        traceTop.applyAutoLayout()
    }
    private func configTraceMiddle() {
        traceMiddle = StrokeView(gradientColor: Theme.shared.currentTheme.tertiaryGradient, cornerRadius: 0)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview(20)
                    .trailing.equalTo(backgroundView, .trailing)
                    .width.equalToConstant(2)
                    .height.equalToConstant(25)
            }
        traceMiddle.add(insideTo: self)
        traceMiddle.applyAutoLayout()
    }
    
    private func configTraceBottom() {
        traceBottom = StrokeView(gradientColor: Theme.shared.currentTheme.secondaryGradient, cornerRadius: 0)
            .setAutoLayout { build in
                build
                    .bottom.equalToSafeArea(-16)
                    .trailing.equalTo(backgroundView, .trailing)
                    .width.equalToConstant(2)
                    .height.equalToConstant(25)
            }
        traceBottom.add(insideTo: self)
        traceBottom.applyAutoLayout()
    }
    private func configGradient() {
        gradient = GradientBuilder(backgroundView.get)
            .setConicGradient(CGPoint(x: 0.8, y: 0.75))
            .setGradientColors([
                Theme.shared.currentTheme.surfaceContainer,
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(-20),
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(-35),
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(-20),
                Theme.shared.currentTheme.surfaceContainer,
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(30),
                Theme.shared.currentTheme.surfaceContainer.adjustBrightness(10),
                Theme.shared.currentTheme.surfaceContainer,
            ])
        
    }
    
    
}
