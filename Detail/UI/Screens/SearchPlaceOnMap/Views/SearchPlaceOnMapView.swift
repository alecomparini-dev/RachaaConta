//  Created by Alessandro Comparini on 23/02/24.
//

import UIKit

import CustomComponentsSDK
import Handler

protocol SearchPlaceOnMapViewDelegate: AnyObject {
    func skipStepButtonTapped()
}

class SearchPlaceOnMapView: UIView {
    weak var delegate: SearchPlaceOnMapViewDelegate?
    
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
            .setAutoLayout { build in
                build.pin.equalToSuperview()
            }
        return comp
    }()
    
    lazy var backButtonView: BackButtonView = {
        let comp = BackButtonView()
            .setAutoLayout { build in
                build
                    .top.equalToSafeArea(8)
                    .leading.equalToSuperview()
                    .size.equalToConstant(50)
            }
        return comp
    }()

    lazy var lightMapView: LightMapView = {
        let comp = LightMapView()
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalTo(backButtonView.get, .centerY, -2)
                    .trailing.equalToSafeArea(-24)
                    .size.equalToConstant(30)
            }
        return comp
    }()

    lazy var loadingMap: LoadingBuilder = {
        let comp = LoadingBuilder()
            .setStartAnimating()
            .setHideWhenStopped(true)
            .setColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSafeArea()
            }
        return comp
    }()
   
    lazy var containerSearchBlurView: ContainerSearchMapView = {
        let comp = ContainerSearchMapView()
            .setAlpha(0)
            .setAutoLayout { build in
                build
                    .top.equalTo(backButtonView.get, .bottom, 8)
                    .leading.trailing.equalToSuperview(24)
                    .height.equalToConstant(80)
            }
        return comp
    }()
    
    lazy var mapView: MapBuilder = {
        let comp = MapBuilder()
            .setPinPointsOfInterest([.restaurant, .bakery, .brewery, .foodMarket, .cafe, .gasStation, .nightlife, .store, .winery, .theater, .movieTheater], 200)
            .setPinNaturalLanguage("fast-food", 200)
            .setOverrideUserInterfaceStyle(.dark)
            .setAutoLayout { build in
                build.pin.equalToSuperview()
            }
        return comp
    }()
    
    
    lazy var skipStepButton: ButtonBuilder = {
        let comp = ButtonBuilder("Pular Etapa")
            .setAlpha(0)
            .setFontFamily(Const.Font.titilliumWebLight, 14)
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setBackgroundColor(Theme.shared.currentTheme.surfaceContainer.withAlphaComponent(0.7))
            .setAutoLayout { build in
                build
                    .bottom.trailing.equalToSafeArea(16)
                    .width.equalToConstant(110)
                    .height.equalToConstant(32)
            }
        comp.get.addTarget(self, action: #selector(skipStepButtonTapped), for: .touchUpInside)
        return comp
    }()
    @objc
    private func skipStepButtonTapped() {
        delegate?.skipStepButtonTapped()
    }
    
    
//  MARK: - PUBLIC AREA
    func configMapAutoLayout() {
        mapView.applyAutoLayout()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
    }
    
    private func addElements() {
        backgroundView.add(insideTo: self)
        mapView.add(insideTo: self)
        backButtonView.add(insideTo: self)
        lightMapView.add(insideTo: self)
        loadingMap.add(insideTo: self)
        containerSearchBlurView.add(insideTo: self)
        skipStepButton.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        backgroundView.applyAutoLayout()
        backButtonView.applyAutoLayout()
        lightMapView.applyAutoLayout()
        loadingMap.applyAutoLayout()
        containerSearchBlurView.applyAutoLayout()
        skipStepButton.applyAutoLayout()
    }
    
}
