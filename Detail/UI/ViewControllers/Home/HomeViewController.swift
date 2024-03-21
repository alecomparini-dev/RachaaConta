//  Created by Alessandro Comparini on 15/02/24.
//

import UIKit
import CustomComponentsSDK
import Presenter

public protocol HomeViewControllerCoordinator: AnyObject {
    func gotoCreateBill()
    func gotoSideBarMenu()
}


public class HomeViewController: UIViewController {
    
    public weak var coordinator: HomeViewControllerCoordinator?

    var myView: UIView!
    
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
        configDidAppear()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configDidLoad() {
        fetchBills()
    }
    
    public func configDidLayoutSubviews() {
        screen.createBillButtonFloat.applyNeumorphism()
        screen.openSideBarMenuButtonView.configStyles()
        screen.filterBillView.configure()
    }
    
    private func configWillAppear() {
        configDelegate()
        screen.backgroundView.applyGradient()
        screen.clock.startClock()
        
    }
    
    private func configDidAppear() {
        
    }

    public func fetchBills() {
        homeViewModel.fetchBills()
    }
    
    private func configDelegate() {
        screen.delegate = self
        screen.openSideBarMenuButtonView.delegate = self
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

//  MARK: - EXTENSION - ButtonSideBarMenuViewDelegate
extension HomeViewController: OpenSideBarMenuButtonViewDelegate {

    func openSideBarMenuButtonTapped() {
        coordinator?.gotoSideBarMenu()
    }
    
}



//  MARK: - EXTENSION - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {

    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeViewModel.heightForRowAt(indexPath.row)
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        screen.topViewAnimation.setInitialOffsetScroll(scrollView)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        screen.topViewAnimation.animation(scrollView)
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
    
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        print("chamou")
    }

    
    
}
