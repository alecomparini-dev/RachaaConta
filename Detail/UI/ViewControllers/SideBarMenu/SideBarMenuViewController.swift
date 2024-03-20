//  Created by Alessandro Comparini on 26/02/24.
//

import UIKit

public protocol SideBarMenuViewControllerCoordinator: AnyObject {
    func gotoBack()
}

public class SideBarMenuViewController: UIViewController {
    public weak var coordinator: SideBarMenuViewControllerCoordinator?

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var screen: SideBarMenuView = {
        let comp = SideBarMenuView()
        return comp
    }()
    
 
    
//  MARK: - LIFE CICLE
    
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
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configDidAppear()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configDelegate()
    }
    
    private func configDelegate() {
        screen.closeMenuButtonView.delegate = self
    }
    
    private func configDidAppear() {
        configStyles()
    }
    
    private func configStyles() {
        screen.applyStyles()
    }

    
}


//  MARK: - EXTENSION - CloseSideBarMenuButtonViewDelegate
extension SideBarMenuViewController: CloseSideBarMenuButtonViewDelegate {

    func closeSideBarMenuButtonTapped() {
        coordinator?.gotoBack()
    }
    
}



//  MARK: - EXTENSION - BackButtonViewDelegate
extension SideBarMenuViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoBack()
    }
    
}
