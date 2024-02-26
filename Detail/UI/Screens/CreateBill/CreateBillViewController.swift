//  Created by Alessandro Comparini on 23/02/24.
//

import UIKit
import MapKit
import CoreLocation
import CustomComponentsSDK

public class CreateBillViewController: UIViewController,  MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate {
    
    private var mapView: MKMapView!
    private var locationManager: CLLocationManager!
    private var searchController: UISearchController!
    private var places: [MKMapItem] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupMapView()
        checkLocationAuthorization()
        setupSearchBar()
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
        mapView.userTrackingMode = .none


    }
    
    private func checkLocationAuthorization() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        
    }
    
    private func setupSearchBar() {
        let textfield = TextFieldBuilder()
            .setBackgroundColor(Theme.shared.currentTheme.surfaceContainer)
            .setDelegate(self)
            .setConstraints { build in
                build
                    .setPinTop.equalToSafeArea
                    .setHeight.equalToConstant(45)
            }
        
        textfield.add(insideTo: self.view)
        textfield.applyConstraint()
        
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
    
    private func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - CLLocationManagerDelegate
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationManager.stopUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Erro na localização: \(error.localizedDescription)")
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
