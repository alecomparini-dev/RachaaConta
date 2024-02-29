//  Created by Alessandro Comparini on 23/02/24.
//

import UIKit
import MapKit
import CoreLocation
import CustomComponentsSDK


public protocol CreateBillViewControllerCoordinator: AnyObject {
    func gotoHome()
}


public class CreateBillViewController: UIViewController {
    public weak var coordinator: CreateBillViewControllerCoordinator?
    
       
    lazy var screen: CreateBillView = {
        let comp = CreateBillView()
        return comp
    }()
    
    
    
    
//  MARK: - LIFE CYCLE
    
    public override func loadView() {
        view = screen
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
//        setupUI()
//        setupMapView()
//        checkLocationAuthorization()
//        mapView.overrideUserInterfaceStyle = .dark
    }
    
        
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configurationsDidAppear()
    }
    
        
//  MARK: - PRIVATE AREA
    private func configure() {
        configDelegate()
    }

    private func configDelegate() {
        screen.lightMapView.delegate = self
        screen.backButtonView.delegate = self
        screen.mapView.setOutput(self)
    }

    private func configurationsDidAppear() {
        screen.configMapConstraint()
    }
    
    private func showContainerSearchMapAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0.5, animations: { [weak self] in
            guard let self else {return}
            screen.containerSearchBlurView.get.alpha = 1
        })
    }
    
   
}


//  MARK: - EXTENSION - CreateBillViewDelegate
extension CreateBillViewController: LightMapViewDelegate {
    
    func lightMapButton() {
        if screen.mapView.get.overrideUserInterfaceStyle == .dark {
            screen.mapView.setOverrideUserInterfaceStyle(.light)
            screen.lightMapView.lightMapButton.setImageButton(ImageViewBuilder(systemName: "moon.fill"))
                .setImageSize(12)
                .setTintColor(Theme.shared.currentTheme.primary)
            return
        }
        screen.mapView.setOverrideUserInterfaceStyle(.dark)
        screen.lightMapView.lightMapButton.setImageButton(ImageViewBuilder(systemName: "sun.max"))
            .setImageSize(12)
            .setTintColor(Theme.shared.currentTheme.onSurface)
    }
    
}


//  MARK: - EXTENSION - BackButtonViewDelegate
extension CreateBillViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoHome()
    }
    
}



//  MARK: - EXTENSION - MapBuilderOutput
extension CreateBillViewController: MapBuilderOutput {
    public func finishLoadingMap() {
        screen.loadingMap.setStopAnimating()
        showContainerSearchMapAnimation()
    }
    
}


