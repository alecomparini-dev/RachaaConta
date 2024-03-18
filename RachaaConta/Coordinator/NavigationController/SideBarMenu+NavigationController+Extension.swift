//  Created by Alessandro Comparini on 27/02/24.
//

import UIKit

extension NavigationController {
    
    public func present(_ viewControllerToPresent: UIViewController) {
        self.viewControllerToPresent = viewControllerToPresent
        animationOpenMenu()
        let controller = viewControllers.last
        controller?.present(viewControllerToPresent, animated: false)
    }
    
    public func dismiss() {
        animationCloseMenu()
        viewControllerToPresent?.dismiss(animated: false)
    }
    
    
    //  MARK: - PRIVATE AREA
    private func animationOpenMenu() {
        let controller = viewControllers.last
        configAnimation(controller, viewControllerToPresent, .moveIn, .fromLeft, duration: 0.8)
    }
    
    private func animationCloseMenu() {
        configAnimation(viewControllerToPresent, viewControllerToPresent, .reveal, .fromRight)
    }
    
    private func configAnimation(_ transitionVC: UIViewController?, _ fullScreenVC: UIViewController?, _ type: CATransitionType, _ subType: CATransitionSubtype ,duration: CGFloat = 0.5) {
        
        guard let transitionVC, let fullScreenVC else {return}
        
        let transition = CATransition()
        transition.duration = duration
        transition.subtype = subType
        transition.type = type
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        fullScreenVC.modalPresentationStyle = .fullScreen
        transitionVC.view.window?.layer.add(transition, forKey: kCATransition)
        
    }
}
