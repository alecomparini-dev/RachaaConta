//  Created by Alessandro Comparini on 29/02/24.
//

import UIKit

public protocol CreateBillViewControllerCoordinator: AnyObject {
    func gotoSearchPlaceOnMap()
    func gotoAddEveryoneItems()
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
        configDidLoad()
    }
     
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configDidLayoutSubviews()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configWillAppear()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
//  MARK: - PRIVATE AREA
    private func configDidLoad() {
        configDelegate()
    }
    
    private func configDidLayoutSubviews() {
        screen.backButtonView.applyNeumorphism()
        screen.underline.applyShadow()
    }

    private func configWillAppear() {
        screen.backgroundView.applyGradient()
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            screen.addAddressButton.applyNeumorphism()
            screen.saveButton.style.applyNeumorphism()
        }
    }

    private func configDelegate() {
        screen.delegate = self
        screen.backButtonView.delegate = self
    }
    
    
    
}


//  MARK: - EXTENSION - BackButtonViewDelegate
extension CreateBillViewController: CreateBillViewDelegate {
    func addAddressButtonTapped() {

    }
    
    func saveButtonTapped() {
        coordinator?.gotoAddEveryoneItems()
    }
    
    
    
}


//  MARK: - EXTENSION - BackButtonViewDelegate
extension CreateBillViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoSearchPlaceOnMap()
    }
    
}
