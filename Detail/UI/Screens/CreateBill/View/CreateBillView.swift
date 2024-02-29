//  Created by Alessandro Comparini on 23/02/24.
//

import UIKit
import CustomComponentsSDK

protocol CreateBillViewDelegate: AnyObject {
    func lightMapButton()
}

class CreateBillView: UIView {
    weak var delegate: CreateBillViewDelegate?
    
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
    
    lazy var backButtonView: BackButtonView = {
        let comp = BackButtonView()
            .setConstraints { build in
                build
                    .setTop.equalToSafeArea(16)
                    .setLeading.equalToSuperView
                    .setWidth.equalToConstant(50)
                    .setHeight.equalToConstant(50)
            }
        return comp
    }()

    lazy var lightMapView: ViewBuilder = {
        let comp = ViewBuilder()
            .setBorder({ build in
                build
                    .setCornerRadius(15)
            })
            .setNeumorphism { build in
                build
                    .setReferenceColor(Theme.shared.currentTheme.backgroundColor)
                    .setShape(.concave)
                    .setLightPosition(.leftTop)
                    .setIntensity(to: .light, percent: 30)
                    .setIntensity(to: .dark, percent: 100)
                    .setBlur(to: .light, percent: 8)
                    .setBlur(to: .dark, percent: 10)
                    .setDistance(to: .light, percent: 4)
                    .setDistance(to: .dark, percent: 10)
                    .setShadowColor(to: .dark, color: .black)
                    .apply()
            }
            .setConstraints { build in
                build
                    .setVerticalAlignmentY.equalTo(backButtonView.get, -2)
                    .setTrailing.equalToSafeArea(-24)
                    .setSize.equalToConstant(30)
            }
        return comp
    }()

    lazy var lightMapButton: ButtonImageBuilder = {
        let comp = ButtonImageBuilder()
            .setImageButton(ImageViewBuilder(systemName: "sun.max"))
            .setImageSize(12)
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setConstraints { build in
                build
                    .setAlignmentCenterXY.equalToSuperView(1)
            }
            .setActions { build in
                build
                    .setTap { [weak self] _, _ in
                        self?.delegate?.lightMapButton()
                    }
            }
        return comp
    }()
    
   
    lazy var containerSearchBlurView: BlurBuilder = {
        let comp = BlurBuilder(style: .dark)
            .setOpacity(0.8)
            .setBorder({ build in
                build
                    .setCornerRadius(12)
            })
            .setConstraints { build in
                build
                    .setTop.equalTo(backButtonView.get, .bottom, 8)
                    .setLeading.setTrailing.equalToSuperView(24)
                    .setHeight.equalToConstant(60)
            }
        return comp
    }()
    
    lazy var containerShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setBorder({ build in
                build
                    .setRoundedCorners([.bottom])
            })
            .setShadow({ build in
                build
                    .setRadius(8)
                    .setColor(.black)
                    .setOffset(width: 0, height: 0)
                    .apply()
            })
            .setConstraints { build in
                build
                    .setTop.equalTo(containerSearchBlurView.get, .bottom)
                    .setLeading.equalTo(containerSearchBlurView.get, .leading, 16)
                    .setTrailing.equalTo(containerSearchBlurView.get, .trailing, 6)
                    .setHeight.equalToConstant(24)
            }
        return comp
    }()
    
    lazy var mapView: MapBuilder = {
        let comp = MapBuilder()
            .setOverrideUserInterfaceStyle(.dark)
            .setConstraints { build in
                build
                    .setPin.equalToSuperView
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
        mapView.add(insideTo: self)
        backButtonView.add(insideTo: self)
        lightMapView.add(insideTo: self)
        lightMapButton.add(insideTo: lightMapView.get)
        containerSearchBlurView.add(insideTo: self)
        containerShadow.add(insideTo: self)
    }
    
    private func configConstraints() {
        backgroundView.applyConstraint()
        backButtonView.applyConstraint()
        lightMapView.applyConstraint()
        lightMapButton.applyConstraint()
        containerSearchBlurView.applyConstraint()
        containerShadow.applyConstraint()
        DispatchQueue.main.async { [weak self] in
            self?.mapView.applyConstraint()
        }
        
    }
    
}
