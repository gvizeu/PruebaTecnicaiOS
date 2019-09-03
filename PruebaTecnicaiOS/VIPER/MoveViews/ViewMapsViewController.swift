//
//  ViewController.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Vizeu on 07/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import UIKit
import MapKit

class ViewMapsViewController: UIViewController {

    let initialLocation = CLLocation(latitude: 50.0345391, longitude: 19.1786628)
    var artworks: [Artwork] = []

    let oneValue = 3

    @IBOutlet weak var myMaps: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        centerMapOnLocation(location: initialLocation)

        // show artwork on map
        addHundredMarks()
        myMaps.addAnnotations(self.artworks)

        // Do any additional setup after loading the view.
    }

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        myMaps.setRegion(coordinateRegion, animated: true)
    }

    func addHundredMarks() {
        for mark in 1...100 {
            let artwork = Artwork(title: "Somewhere",
                                  locationName: "write description",
                                  discipline: "Sculpture",
                                  coordinate: CLLocationCoordinate2D(latitude: 50.0345391,
                                                                     longitude: 19.1786628 + Double(mark) * 0.001))
            self.artworks.append(artwork)
            let artwork2 = Artwork(title: "Somewhere",
                                  locationName: "write description",
                                  discipline: "Sculpture",
                                  coordinate: CLLocationCoordinate2D(latitude: 50.0345391 + Double(mark) * 0.001,
                                                                     longitude: 19.1786628 ))
            self.artworks.append(artwork2)
        }
    }

    func doingSomething() -> Int {
       return 1 + 1
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D

    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate

        super.init()
    }

    var subtitle: String? {
        return locationName
    }
}
