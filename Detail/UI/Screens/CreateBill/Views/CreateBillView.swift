//  Created by Alessandro Comparini on 23/02/24.
//

import UIKit
import CustomComponentsSDK



class CreateBillView: UIView {
    
    
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

    lazy var lightMapView: LightMapView = {
        let comp = LightMapView()
            .setConstraints { build in
                build
                    .setVerticalAlignmentY.equalTo(backButtonView.get, -2)
                    .setTrailing.equalToSafeArea(-24)
                    .setSize.equalToConstant(30)
            }
        return comp
    }()

    lazy var loadingMap: LoadingBuilder = {
        let comp = LoadingBuilder()
            .setStartAnimating()
            .setHideWhenStopped(true)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setConstraints { build in
                build
                    .setAlignmentCenterXY.equalToSafeArea
            }
        return comp
    }()
   
    lazy var containerSearchBlurView: ContainerSearchMapView = {
        let comp = ContainerSearchMapView()
            .setAlpha(0)
            .setConstraints { build in
                build
                    .setTop.equalTo(backButtonView.get, .bottom, 8)
                    .setLeading.setTrailing.equalToSuperView(24)
                    .setHeight.equalToConstant(80)
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
    
//  MARK: - PUBLIC AREA
    func configMapConstraint() {
        mapView.applyConstraint()
    }
    
    
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
        loadingMap.add(insideTo: self)
        containerSearchBlurView.add(insideTo: self)
    }
    
    private func configConstraints() {
        backgroundView.applyConstraint()
        backButtonView.applyConstraint()
        lightMapView.applyConstraint()
        loadingMap.applyConstraint()
        containerSearchBlurView.applyConstraint()
    }
    
}
