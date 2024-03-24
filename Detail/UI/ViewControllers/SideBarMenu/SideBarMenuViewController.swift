//  Created by Alessandro Comparini on 26/02/24.
//

import UIKit
import CustomComponentsSDK

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
        configDiddLayoutSubviews()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configWillAppear()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configDidAppear()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configDelegate()
        configProfilePicture()
    }
    
    private func configProfilePicture() {
        screen.profilePicture.setChooseSource(viewController: self) { build in
            build
                .setOpenCamera("Câmera") { imageViewBuilder in
                    print("Camera")
                }
                .setOpenGallery("Galeria") { [weak self] imageViewBuilder in
                    guard let self else {return}
                    screen.profilePicture.applyShadow()
                    screen.boxProfile.setBackgroundColor(Theme.shared.currentTheme.surfaceContainerHighest)
                }
        }
    }
    
    private func configDelegate() {
        screen.delegate = self
        screen.closeMenuButtonView.delegate = self
    }
    
    private func configWillAppear() {
        
    }
    
    private func configDidAppear() {
        screen.closeMenuButtonView.applyStyles()
    }
    
    private func configDiddLayoutSubviews() {
        screen.applyStyles()
        screen.boxProfile.apply()
    }

    
}


//  MARK: - EXTENSION - CloseSideBarMenuButtonViewDelegate
extension SideBarMenuViewController: SideBarMenuViewDelegate {
    
    func closeMenuRightViewTapped() {
        coordinator?.gotoBack()
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
