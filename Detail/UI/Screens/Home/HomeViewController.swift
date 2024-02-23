//  Created by Alessandro Comparini on 15/02/24.
//

import UIKit
import Presenter

public protocol HomeViewControllerCoordinator: AnyObject {
    func gotoCreateBill()
}


public class HomeViewController: UIViewController {
    
    public weak var coordinator: HomeViewControllerCoordinator?

    let animationThreshold: CGFloat = 150.0
    var originalAnimatedViewY: CGFloat!
    var animatedView: UIView!
    
    
    var delta = 0
    var initialOffset: CGFloat?
    var lastContentOffset: CGFloat = 0.0
    
    
    private let homeViewModel: HomeViewModel
    
    public init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var screen: HomeView { _screen }
    
    private lazy var _screen: HomeView = {
        let comp = HomeView()
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
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configDelegate()
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
        fetchBills()
        
        animatedView = screen.topBlur.get
        animatedView.frame =  CGRect(origin: .zero, size: CGSize(width: 200, height: 500))
        
    }
    
    public func fetchBills() {
        homeViewModel.fetchBills()
    }
    
    private func configurationsDidAppear() {
        screen.clock.startClock()
        screen.configFilterBillView()
        NeumorphismTextFieldView.set(screen.filterBillView.filterTextField)
    }
    
    private func configDelegate() {
        screen.delegate = self
        screen.listBillTableView.setDelegate(delegate: self)
        screen.listBillTableView.setDataSource(dataSource: self)
    }
    
}



//  MARK: - EXTENSION - HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    
    func createBillButtonFloatTapped() {
        coordinator?.gotoCreateBill()
    }
    
    
}



//  MARK: - EXTENSION - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {

    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeViewModel.heightForRowAt(indexPath.row)
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if initialOffset == nil {
            initialOffset = scrollView.contentOffset.y
        }
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentOffset = scrollView.contentOffset.y
        
        if currentOffset < lastContentOffset {
//            print("Scroll para baixo")
        } else if currentOffset > lastContentOffset {
//            print("Scroll para cima")
        }
        
        lastContentOffset = currentOffset
        
        guard let initialOffset else {return}
        
        let invert = false
        
        if invert {
            let animationInit: CGFloat = 125
            let animationFinal: CGFloat = 0
            let animationThreshold: CGFloat = animationInit - animationFinal

            let rolou = (currentOffset - initialOffset)
            
            let completed = (rolou/animationThreshold)
            
            if rolou >= 0 {
                screen.height.constant = max( min( animationInit - (animationThreshold*completed), animationThreshold), animationFinal)
            } else {
                screen.height.constant = animationInit
            }
            return
        }
        
        
        //NORMAL JÁ FUNCIONANDO
        let animationInit: CGFloat = 0
        let animationFinal: CGFloat = -125
        let animationThreshold: CGFloat = animationInit - animationFinal
        
        let rolou = (currentOffset - initialOffset)
        let completed = (rolou/animationThreshold)
        
        
        if rolou > 0 {
            screen.height.constant = min((animationThreshold)*completed, animationThreshold)
        } else {
            screen.height.constant = animationInit
        }
        
        
        
        
    }
    
}


//  MARK: - EXTENSION - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModel.numberOfRowsInSection()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BillTableCellView.identifier) as? BillTableCellView
        
        cell?.setupCell(homeViewModel.getBill(indexPath.row))
        
        return cell ?? UITableViewCell()
        
    }
    
    
    
    
}
