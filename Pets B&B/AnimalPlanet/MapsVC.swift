//
//  MapsVC.swift
//  AnimalPlanet
//
//  Created by Apple on 5/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapsVC: UIViewController,CLLocationManagerDelegate {
    // define a location manager object
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    //this will hold my postion
    var postion:CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.requestAlwaysAuthorization()
        
        
        // this class handels functions related to location manager
        locationManager.delegate = self
        
        //start geting updates
        locationManager.startUpdatingLocation()
    }
    // implement functions that start receving updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        postion = locations[0]
        
        print ("lat = \(postion.coordinate.latitude) long = \(postion.coordinate.longitude)")
        locationManager.stopUpdatingLocation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func ZooPin(_ sender: UISegmentedControl) {
            if sender.selectedSegmentIndex == 0
            {
                let locCoord = CLLocationCoordinate2D(latitude: 24.176081, longitude: 55.738492)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = locCoord
                
                annotation.title = "Rating "
                annotation.subtitle = "4.5/5"
                
                mapView.addAnnotation(annotation)
                
            } else if sender.selectedSegmentIndex == 1
            {
                let locCoord = CLLocationCoordinate2D(latitude: 24.5447, longitude: 54.6753)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = locCoord
                
                annotation.title = "Rating "
                annotation.subtitle = "4.5/5"
                
                mapView.addAnnotation(annotation)
                
            }else if sender.selectedSegmentIndex == 2
            {
                let locCoord = CLLocationCoordinate2D(latitude: 25.1321, longitude: 55.1524)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = locCoord
                
                annotation.title = "Rating "
                annotation.subtitle = "3.8/5"
                
                mapView.addAnnotation(annotation)
                
            }else if sender.selectedSegmentIndex == 3
            {
                let locCoord = CLLocationCoordinate2D(latitude: 25.221863, longitude: 55.256207)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = locCoord
                
                annotation.title = "Rating "
                annotation.subtitle = "3/5"
                
                mapView.addAnnotation(annotation)
                
            }
            else
            {
                mapView.mapType = .hybrid
            }
        }
    
    @IBAction func Map(_ sender: Any) {
        mapView.mapType = .standard
    }
    
    @IBAction func Sat(_ sender: Any) {
        mapView.mapType = .satellite
    }
    
    @IBAction func Zoom(_ sender: Any) {
        // if you but 1 it will zoom more
        let span = MKCoordinateSpanMake(0.09, 0.09)
        
         let region = MKCoordinateRegion(center: postion.coordinate, span: span)
        
        mapView.setRegion(region, animated: true)

    }
    @IBAction func zoomOut(_ sender: Any) {
        // if you but 1 it will zoom more
        let span = MKCoordinateSpanMake(1, 1)
        
        let region = MKCoordinateRegion(center: postion.coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        

    }
    @IBAction func Both(_ sender: Any) {
        mapView.mapType = .hybrid
    }
    @IBAction func AlainD(_ sender: Any) {
        //Defining destination
        let latitude:CLLocationDegrees = 24.176081
        let longitude:CLLocationDegrees = 55.738492
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Al-Ain Zoo"
        mapItem.openInMaps(launchOptions: options)
    }
    @IBAction func adD(_ sender: Any) {
        //Defining destination
        let latitude:CLLocationDegrees = 24.5447
        let longitude:CLLocationDegrees = 54.6753
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Emarites Zoo"
        mapItem.openInMaps(launchOptions: options)

    }
    
    @IBAction func dubaiD(_ sender: Any) {
        //Defining destination
        let latitude:CLLocationDegrees = 25.1321
        let longitude:CLLocationDegrees = 55.1524
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Dubai Zoo"
        mapItem.openInMaps(launchOptions: options)

    }
    
    @IBAction func JbrD(_ sender: Any) {
        //Defining destination
        let latitude:CLLocationDegrees = 25.221863
        let longitude:CLLocationDegrees = 55.256207
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Jumerah Zoo"
        mapItem.openInMaps(launchOptions: options)

    }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


