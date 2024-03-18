//  Created by Alessandro Comparini on 23/02/24.
//

import UIKit
import MapKit
import CoreLocation
import CustomComponentsSDK


public protocol SearchPlaceOnMapViewControllerCoordinator: AnyObject {
    func gotoHome()
    func gotoCreateBill()
}


public class SearchPlaceOnMapViewController: UIViewController {
    public weak var coordinator: SearchPlaceOnMapViewControllerCoordinator?
    
       
    lazy var screen: SearchPlaceOnMapView = {
        let comp = SearchPlaceOnMapView()
        return comp
    }()
    
    
//  MARK: - LIFE CYCLE
    
    public override func loadView() {
        view = screen
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
     
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configWillAppear()
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
        screen.delegate = self
        screen.map.setOutput(self)
        screen.lightMapButtonView.delegate = self
        screen.backButtonView.delegate = self
    }

    private func configWillAppear() {
        configStyles()
    }

    private func configStyles() {
        screen.backgroundView.applyGradient()
        screen.backButtonView.applyNeumorphism()
    }

    private func configurationsDidAppear() {
        screen.configMapAutoLayout()
        screen.map.show()
    }
    
    private func showComponentsAnimation() {
        UIView.animate(withDuration: 1, delay: 1, animations: { [weak self] in
            guard let self else {return}
            screen.containerSearchBlurView.get.alpha = 1
            screen.skipStepButton.get.alpha = 1
        })
    }
    
}


//  MARK: - EXTENSION - SearchPlaceOnMapViewDelegate
extension SearchPlaceOnMapViewController: SearchPlaceOnMapViewDelegate {
    
    func skipStepButtonTapped() {
        coordinator?.gotoCreateBill()
    }
    
}


//  MARK: - EXTENSION - BackButtonViewDelegate
extension SearchPlaceOnMapViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoHome()
    }
    
}



//  MARK: - EXTENSION - CreateBillViewDelegate
extension SearchPlaceOnMapViewController: LightMapViewDelegate {
    
    func lightMapButton() {
        if screen.map.get.overrideUserInterfaceStyle == .dark {
            screen.map.setOverrideUserInterfaceStyle(.light)
            screen.lightMapButtonView.lightMapButton.setImageButton(ImageViewBuilder(systemName: "moon.fill"))
                .setImageSize(12)
                .setTintColor(Theme.shared.currentTheme.primary)
            return
        }
        screen.map.setOverrideUserInterfaceStyle(.dark)
        screen.lightMapButtonView.lightMapButton.setImageButton(ImageViewBuilder(systemName: "sun.max"))
            .setImageSize(12)
            .setTintColor(Theme.shared.currentTheme.onSurface)
    }
    
}


//  MARK: - EXTENSION - MapBuilderOutput
extension SearchPlaceOnMapViewController: MapBuilderOutput {
    
    public func localizationNotAuthorized() {
        print("não autorizado, solicitar novamente, ou pular etapa")
    }
    
    public func finishLoadingMap() {
        screen.loadingMap.setStopAnimating()
        showComponentsAnimation()
    }
    
}


