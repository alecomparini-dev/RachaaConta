//  Created by Alessandro Comparini on 23/02/24.
//

import UIKit
import MapKit
import CoreLocation
import CustomComponentsSDK


public protocol CreateBillViewControllerCoordinator: AnyObject {
    func gotoHome()
}


public class CreateBillViewController: UIViewController {
    public weak var coordinator: CreateBillViewControllerCoordinator?
    
    private let completer = MKLocalSearchCompleter()
    
    private var mapView: MKMapView!
    private var locationManager: CLLocationManager!
    private var searchController: UISearchController!
    private var places: [MKMapItem] = []
    
   
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
        configure()
//        setupUI()
//        setupMapView()
//        checkLocationAuthorization()
//        mapView.overrideUserInterfaceStyle = .dark
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
        screen.delegate = self
        screen.backButtonView.delegate = self
    }

    
    
    private func setupUI() {
        view.backgroundColor = .white
    }
    
    private func setupMapView() {
        mapView = MKMapView()
        mapView.delegate = self
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        

        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
//        mapView.isUserInteractionEnabled = true
//        mapView.pointOfInterestFilter = .init(including: [.park, .restaurant, .bakery, .cafe, .gasStation, .winery, .brewery, .store])
        
        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2D(latitude: -23.550520, longitude: -46.633308)
//        annotation.title = "São Paulo"
//        annotation.subtitle = "Capital do Estado de São Paulo, Brasil"
//
//        mapView.addAnnotation(annotation)
//        
//        centerMapOnLocation(location: CLLocation(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude))


        
        // Adiciona um gesto de toque ao mapa
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        mapView.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let locationInView = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
        
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
                
        // Adiciona um pino ao mapa com as coordenadas
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = ""
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            print(response)
            guard let response = response else { return }
            let firstResult = response.mapItems.first
        }
        
        
        
    }
    
   
    func searchForNearbyPlaces(_ userLocation: CLLocation) {
//        guard let userLocation = locationManager.location?.coordinate else {return }
    
        let lat = -23.53677880
        let lon = -46.78329660
//        var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon ) , latitudinalMeters: 500, longitudinalMeters: 500)
//        let location = CLLocation(latitude: lat, longitude: lon )
////        mapView.region = region
//        
//        let request = MKLocalSearch.Request()
//        request.naturalLanguageQuery = "qualquer"
//        request.region = region
//        
//        let search = MKLocalSearch(request: request)
//        
//        search.start { (response, error) in
//            guard let response = response, error == nil else {
//                print("Erro na pesquisa de mapa: \(error?.localizedDescription ?? "Desconhecido")")
//                return
//            }
//            
//            // Adicionar marcadores ao mapa
//            for item in response.mapItems {
////                print(item)
//            }
//        }
//        
        
        
        
//        centerMapOnLocation(location: userLocation, distance: 500)
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude ) , latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.region = region
        
//        var requestPOI = MKLocalSearch.Request()
//        requestPOI.naturalLanguageQuery = "fast-food"
//        requestPOI.region = region

        let requestPOI = MKLocalPointsOfInterestRequest(coordinateRegion: region)
        let poiFilter = MKPointOfInterestFilter(including: [.foodMarket, .restaurant, .brewery, .cafe, .bakery, .foodMarket, .nightlife, .gasStation, .store])
        requestPOI.pointOfInterestFilter = poiFilter
        
        // Fazer a solicitação
        let searchPOI = MKLocalSearch(request: requestPOI)
        searchPOI.start { response, error in
            guard let response = response, error == nil else {
                print("Erro ao obter pontos de interesse: \(error?.localizedDescription ?? "Erro desconhecido")")
                return
            }
            
            // Adicionar os resultados ao mapa
            for item in response.mapItems {
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                self.mapView.addAnnotation(annotation)
            }
        }

    }
    
    private func checkLocationAuthorization() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    // MARK: - UISearchBarDelegate
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text, !searchText.isEmpty {
            searchForLocations(query: searchText)
        }
    }
    
    private func searchForLocations(query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let error = error {
                print("Erro ao pesquisar locais: \(error.localizedDescription)")
            } else if let mapItems = response?.mapItems {
                self.places = mapItems
                self.displaySearchResultsOnMap()
            }
        }
    }
    
    private func displaySearchResultsOnMap() {
        mapView.removeAnnotations(mapView.annotations)
        
        for place in places {
            let annotation = MKPointAnnotation()
            annotation.coordinate = place.placemark.coordinate
            annotation.title = place.name
            mapView.addAnnotation(annotation)
        }
        
        if let firstPlace = places.first {
            centerMapOnLocation(location: firstPlace.placemark.location!)
        }
        
    }
    
    private func centerMapOnLocation(location: CLLocation, distance: CLLocationDistance = 1000) {
        let regionRadius: CLLocationDistance = distance
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
   
}



//  MARK: - EXTENSION - CreateBillViewDelegate
extension CreateBillViewController: CreateBillViewDelegate {
    func lightMapButton() {
        if screen.mapView.get.overrideUserInterfaceStyle == .dark {
            screen.mapView.setOverrideUserInterfaceStyle(.light)
            screen.lightMapButton.setImageButton(ImageViewBuilder(systemName: "moon.fill"))
                .setImageSize(12)
                .setTintColor(Theme.shared.currentTheme.primary)
            return
        }
        screen.mapView.setOverrideUserInterfaceStyle(.dark)
        screen.lightMapButton.setImageButton(ImageViewBuilder(systemName: "sun.max"))
            .setImageSize(12)
            .setTintColor(Theme.shared.currentTheme.onSurface)
    }
    
}


//  MARK: - EXTENSION - BackButtonViewDelegate
extension CreateBillViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoHome()
    }
    
}














extension CreateBillViewController: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text ?? "" )
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print(textField.text ?? "" )
        searchForLocations(query: textField.text ?? "" )
    }
    
}


extension CreateBillViewController: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else {
                    return
                }
        
        locationManager.stopUpdatingLocation()
        searchForNearbyPlaces(userLocation)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Erro na localização: \(error.localizedDescription)")
    }
}



extension CreateBillViewController: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("view - didSelect:", view.annotation?.title as Any)
    }
    
    public func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print("annotation:", annotation.title as Any)
    }
    
}




extension CreateBillViewController: MKLocalSearchCompleterDelegate {
    
    public func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        let suggestions = completer.results
        for suggestion in suggestions {
            print("Sugestão: \(suggestion.title)")
        }
    }
 
}


