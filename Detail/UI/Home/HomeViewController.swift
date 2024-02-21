//  Created by Alessandro Comparini on 15/02/24.
//

import UIKit
import Presenter

public class HomeViewController: UIViewController {

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
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        screen.clock.startClock()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configDelegate()
    }
    
    private func configDelegate() {
        screen.listBillTableView.setDelegate(delegate: self)
        screen.listBillTableView.setDataSource(dataSource: self)
    }
    
}


//  MARK: - EXTENSION - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    
}


//  MARK: - EXTENSION - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModel.numberOfRowsInSection()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BillTableCellView.identifier)
        
        
        
        return cell ?? UITableViewCell()
        
    }
    
    
    
}
