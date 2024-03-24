//  Created by Alessandro Comparini on 26/02/24.
//

import UIKit

import CustomComponentsSDK
import Handler


protocol SideBarMenuViewDelegate: AnyObject {
    func closeMenuRightViewTapped()
}

public class SideBarMenuView: UIView {
    weak var delegate: SideBarMenuViewDelegate?
   
    private var gradient: GradientBuilder?
    
    private var traceTop: StrokeView!
    private var traceMiddle: StrokeView!
    private var traceBottom: StrokeView!
    private var traceUnderS: StrokeView!
    private var traceUnderB: StrokeView!
    private var traceConfigurations: StrokeView!
    
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
                    .leading.equalToSuperview(32)
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

    lazy var profileName: LabelBuilder = {
        let comp = LabelBuilder("Alessandro")
            .setFontFamily(Const.Font.Poppins.regular, 30)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .top.equalTo(closeMenuButtonView, .top, -4)
                    .leading.equalTo(closeMenuButtonView, .trailing, 22)
                    .trailing.equalTo(backgroundView, .trailing, -16)
                
            }
        return comp
    }()
    
    lazy var logoutLabel: LabelBuilder = {
        let comp = LabelBuilder("Sair")
            .setFontFamily(Const.Font.Poppins.medium, 15)
            .setColor(Theme.shared.currentTheme.onSurfaceVariant)
            .setAutoLayout { build in
                build
                    .bottom.equalTo(closeMenuButtonView, .bottom, 6)
                    .leading.equalTo(profileName, .leading, 1)
            }
        return comp
    }()
    
    lazy var splitLabel: LabelBuilder = {
        let comp = LabelBuilder("Split")
            .setFontFamily(Const.Font.Poppins.medium, 48)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .top.equalTo(logoutLabel, .bottom, 40)
                    .leading.equalTo(closeMenuButtonView, .leading, 2)
            }
        return comp
    }()
    
    lazy var billLabel: LabelBuilder = {
        let comp = LabelBuilder("bill")
            .setFontFamily(Const.Font.Poppins.medium, 52)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .top.equalTo(splitLabel, .bottom, 4)
                    .leading.equalTo(closeMenuButtonView, .leading, 27)
            }
        return comp
    }()
    
    lazy var boxProfile: BoxShadowInsetBuilder = {
        let radius: CGFloat = 24
        let comp = BoxShadowInsetBuilder(cornerRadius: radius)
            .setShadowOffset(top: 6, left: 6, right: 6, bottom: 6)
            .setBackgroundColor(Theme.shared.currentTheme.surfaceContainerHigh)
            .setBorder({ build in
                build
                    .setCornerRadius(radius)
            })
            .setLightShadow(opacity: 0.4)
            .setAutoLayout { build in
                build
                    .top.equalTo(billLabel, .bottom, 100)
                    .leading.equalTo(closeMenuButtonView, .leading)
                    .width.equalToConstant(150)
                    .height.equalToConstant(144)
            }
        return comp
    }()
    
    lazy var profilePicture: ProfilePictureBuilder = {
        let size: CGFloat = 100
        let comp = ProfilePictureBuilder(size: size)
            .setPlaceHolderImage(ImageViewBuilder(systemName: "person.fill.badge.plus"))
            .setSizePlaceHolderImage(56)
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setCornerRadius(8)
            .setShadow({ build in
                build
                    .setRadius(10)
                    .setOpacity(0.8)
                    .setOffset(width: 14, height: 14)
                    .setColor(Theme.shared.currentTheme.surfaceContainerLow)
            })
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview(2)
                    .size.equalToConstant(size)
            }
        return comp
    }()
    
    lazy var configurationsLabel: LabelBuilder = {
        let comp = LabelBuilder("Configurações")
            .setFontFamily(Const.Font.Poppins.medium, 16)
            .setColor(Theme.shared.currentTheme.onSurfaceVariant)
            .setAutoLayout { build in
                build
                    .top.equalTo(boxProfile, .bottom, 12)
                    .leading.equalTo(boxProfile, .leading, 4)
            }
        return comp
    }()
    
    
    private var apply = false
    
//  MARK: - PUBLIC AREA
    
    public func applyStyles() {
        if apply {return}
        gradient?.apply()
        configTrace()
        apply = true
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
        profileName.add(insideTo: self)
        logoutLabel.add(insideTo: self)
        splitLabel.add(insideTo: self)
        billLabel.add(insideTo: self)
        boxProfile.add(insideTo: self)
        profilePicture.add(insideTo: boxProfile)
        configurationsLabel.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        closeMenuButtonView.applyAutoLayout()
        closeMenuRightView.applyAutoLayout()
        profileName.applyAutoLayout()
        logoutLabel.applyAutoLayout()
        splitLabel.applyAutoLayout()
        billLabel.applyAutoLayout()
        boxProfile.applyAutoLayout()
        profilePicture.applyAutoLayout()
        configurationsLabel.applyAutoLayout()
    }
        
    private func configTrace() {
        configTraceTop()
        configTraceMiddle()
        configTraceBottom()
        configTraceUnderS()
        configTraceUnderB()
        configTraceConfigurations()
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
        traceTop.applyShadow()
    }
    
    private func configTraceMiddle() {
        traceMiddle = StrokeView(gradientColor: Theme.shared.currentTheme.secondaryGradient, cornerRadius: 0)
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview(20)
                    .trailing.equalTo(backgroundView, .trailing)
                    .width.equalToConstant(2)
                    .height.equalToConstant(25)
            }
        traceMiddle.add(insideTo: self)
        traceMiddle.applyAutoLayout()
        traceMiddle.applyShadow()
    }
    
    private func configTraceBottom() {
        traceBottom = StrokeView(gradientColor: Theme.shared.currentTheme.tertiaryGradient, cornerRadius: 0)
            .setAutoLayout { build in
                build
                    .bottom.equalToSafeArea(-16)
                    .trailing.equalTo(backgroundView, .trailing)
                    .width.equalToConstant(2)
                    .height.equalToConstant(25)
            }
        traceBottom.add(insideTo: self)
        traceBottom.applyAutoLayout()
        DispatchQueue.main.async { [weak self] in
            self?.traceBottom.applyShadow()
        }
    }
    
    private func configTraceUnderS() {
        traceUnderS = StrokeView(gradientColor: Theme.shared.currentTheme.primaryGradient, cornerRadius: 0)
            .setAutoLayout { build in
                build
                    .top.equalTo(splitLabel, .bottom, -10)
                    .leading.equalTo(splitLabel, .leading)
                    .width.equalToConstant(26)
                    .height.equalToConstant(2)
            }
        traceUnderS.add(insideTo: self)
        traceUnderS.applyAutoLayout()
        
        DispatchQueue.main.async { [weak self] in
            self?.traceUnderS.applyShadow()
        }
    }
    
    private func configTraceUnderB() {
        traceUnderB = StrokeView(gradientColor: Theme.shared.currentTheme.secondaryGradient, cornerRadius: 0)
            .setAutoLayout { build in
                build
                    .top.equalTo(billLabel, .bottom, -10)
                    .leading.equalTo(billLabel, .leading)
                    .width.equalToConstant(32)
                    .height.equalToConstant(2)
            }
        traceUnderB.add(insideTo: self)
        traceUnderB.applyAutoLayout()
        DispatchQueue.main.async { [weak self] in
            self?.traceUnderB.applyShadow()
        }
    }
        
    private func configTraceConfigurations() {
        traceConfigurations = StrokeView(gradientColor: Theme.shared.currentTheme.tertiaryGradient, cornerRadius: 0)
            .setAutoLayout { build in
                build
                    .top.equalTo(configurationsLabel, .bottom, 2)
                    .leading.equalTo(configurationsLabel, .leading)
                    .width.equalToConstant(32)
                    .height.equalToConstant(2)
            }
        traceConfigurations.add(insideTo: self)
        traceConfigurations.applyAutoLayout()
        DispatchQueue.main.async { [weak self] in
            self?.traceConfigurations.applyShadow()
        }
    }
    
    private func configGradient() {
        gradient = GradientBuilder(backgroundView.get)
            .setConicGradient(CGPoint(x: 0.8, y: 0.85))
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
