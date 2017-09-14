//
//  ViewController.swift
//  2-201312356DitMap
//
//  Created by D7703_30 on 2017. 9. 14..
//  Copyright © 2017년 D7703_30. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoomToRegion()
        //35.168275, 129.057920
        let a = ViewPoint(coordinate: CLLocationCoordinate2D(latitude: 35.165917, longitude: 129.072605), title: "동의과학대학교", subtitle: "나의 꿈이 자라는곳")
        let b = ViewPoint(coordinate: CLLocationCoordinate2D(latitude: 35.168275, longitude: 129.057920), title: "시민공원", subtitle: "시민공원입니다")
        let c = ViewPoint(coordinate: CLLocationCoordinate2D(latitude: 35.164165, longitude: 129.064930), title: "송상현광장", subtitle: "송상현꺼")
        
        myMapView.addAnnotations([a, b,c])
        myMapView.delegate = self
    }
    func zoomToRegion() {
        
        let location = CLLocationCoordinate2D(latitude: 35.165917, longitude: 129.072605)
        let region = MKCoordinateRegionMakeWithDistance(location, 2000.0, 4000.3)
        myMapView.setRegion(region, animated: true)
    }
    
    // MKMapViewDelegate method
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "myPin"
        
        // an already allocated annotation view
        var annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            //annotationView?.pinTintColor = UIColor.green
            annotationView?.animatesDrop = true
        } else {
            annotationView?.annotation = annotation
        }
        if (annotation.title! == "시민공원")
        {
            let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
            leftIconView.image = UIImage(named:"onepun.jpg" )
            annotationView?.leftCalloutAccessoryView = leftIconView
            annotationView?.pinTintColor = UIColor.black
        }
        if (annotation.title! == "동의과학대학교")
        {
            let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
            leftIconView.image = UIImage(named:"onepun2.png" )
            annotationView?.leftCalloutAccessoryView = leftIconView
            annotationView?.pinTintColor = UIColor.yellow
        }
        if (annotation.title! == "송상현광장")
        {
            let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
            leftIconView.image = UIImage(named:"ss2.jpg" )
            annotationView?.leftCalloutAccessoryView = leftIconView
            annotationView?.pinTintColor = UIColor.blue
        }
        return annotationView
        
       
    }
    
    // callout accessary를 눌렀을때 alert View 보여줌
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let viewAnno = view.annotation //as! ViewPoint
        let placeName = viewAnno?.title
        let placeInfo = viewAnno?.subtitle
        
        let ac = UIAlertController(title: placeName!, message: placeInfo!, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

