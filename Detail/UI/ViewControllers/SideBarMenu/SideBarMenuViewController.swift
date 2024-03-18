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
        configWillAppear()
    }
    
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configDelegate()
    }
    
    private func configDelegate() {
        screen.backButtonView.delegate = self
    }
    
    private func configWillAppear() {
        configStyles()
    }
    
    private func configStyles() {
        screen.backgroundView.applyGradient()
        screen.backButtonView.applyNeumorphism()
    }

    
}

//  MARK: - EXTENSION
extension SideBarMenuViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoBack()
    }
    
}
