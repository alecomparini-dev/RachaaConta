//  Created by Alessandro Comparini on 23/02/24.
//

import UIKit

public final class NavigationController: UINavigationController {
    
    private weak var viewControllerToPresent: UIViewController?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    public convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    public func pushViewController<T>(_ viewController: UIViewController) -> T where T: UIViewController {
        if let controller = self.viewControllers.first(where: { $0.isKind(of: type(of: viewController))  }) {
            popToViewController(controller, animated: true)
            return controller as! T
        }
        pushViewController(viewController, animated: true)
        return viewController as! T
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    public func popToViewControllerIfNeeded<T>(_ viewController: AnyClass) -> T? {
        if let controller = viewControllers.first(where: { $0.isKind(of: viewController)  }) {
            popToViewController(controller, animated: true)
            return controller as? T
        }
        return nil
    }
    
    public func present(_ viewControllerToPresent: UIViewController) {
        self.viewControllerToPresent = viewControllerToPresent
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromLeft
        
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        
        let controller = viewControllers.last
        controller?.view.window?.layer.add(transition, forKey: kCATransition)
        controller?.present(viewControllerToPresent, animated: false)
    }
    
    public func dismiss() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight

        viewControllerToPresent?.modalPresentationStyle = .fullScreen
        viewControllerToPresent?.view.window?.layer.add(transition, forKey: kCATransition)
        viewControllerToPresent?.dismiss(animated: false)                
    }
    
    
//  MARK: - PRIVATE AREA
    private func setup() {
        navigationBar.isHidden = true
        navigationController?.isNavigationBarHidden = true
    }
    
}

