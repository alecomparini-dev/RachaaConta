//  Created by Alessandro Comparini on 04/03/24.
//

import UIKit

public protocol AddEveryoneItensViewControllerCoordinator: AnyObject {
    func gotoTrocar()
}


public class AddEveryoneItensViewController: UIViewController {
    public weak var coordinator: AddEveryoneItensViewControllerCoordinator?
    
    lazy var screen: AddEveryoneItemsView = {
        let comp = AddEveryoneItemsView()
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
extension AddEveryoneItensViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoTrocar()
    }
    
}
