//
//  SecondMapViewController.swift
//  HajjParamedic
//
//  Created by Sara Alqubaisi on 8/3/18.
//  Copyright © 2018 Sara Alqubaisi. All rights reserved.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}
class SecondMapViewController: UIViewController , MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func SureAlert(_ sender: Any) {
        let alert = UIAlertController(title: "هل أنت متأكد من تشغيل خاصية التحكم بإشارة المرور؟", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "متأكد", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let sourceLocation = CLLocationCoordinate2D(latitude:21.393056 , longitude: 39.39863671)
        let destinationLocation = CLLocationCoordinate2D(latitude:21.607109 , longitude: 39.859119)
        
        let sourcePin = customPin(pinTitle: "Makkah city", pinSubTitle: "", location: sourceLocation)
        let destinationPin = customPin(pinTitle: "Hospital", pinSubTitle: "", location: destinationLocation)
        self.mapView.addAnnotation(sourcePin)
        self.mapView.addAnnotation(destinationPin)
        
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (response, error) in
            guard let directionResonse = response else {
                if let error = error {
                    print("we have error getting directions==\(error.localizedDescription)")
                }
                return
            }
            
            let route = directionResonse.routes[0]
            self.mapView.add(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
        
        self.mapView.delegate = self

        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- MapKit delegates
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
