//  Created by Alessandro Comparini on 29/02/24.
//

import UIKit

public protocol CreateBillViewControllerCoordinator: AnyObject {
    func gotoSearchPlaceOnMap()
}

public class CreateBillViewController: UIViewController {
    public weak var coordinator: CreateBillViewControllerCoordinator?
    
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
     
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configDelegate()
    }
    
    private func configDelegate() {
        screen.backButtonView.delegate = self
    }
    
}


//  MARK: - EXTENSION - BackButtonViewDelegate
extension CreateBillViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoSearchPlaceOnMap()
    }
    
}
