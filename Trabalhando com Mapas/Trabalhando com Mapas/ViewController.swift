//
//  ViewController.swift
//  Trabalhando com Mapas
//
//  Created by Lucas Inocencio on 25/08/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocal = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
        
//        //minha casa
//        let latitude: CLLocationDegrees = -15.848494
//        let longitude: CLLocationDegrees = -48.007447
//        
//        let deltaLatitude: CLLocationDegrees = 0.01
//        let deltaLongitude: CLLocationDegrees = 0.01
//        
//        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
//        
//        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
//        
//        
//        mapa.setRegion(regiao, animated: true)
//        
//        let anotacao = MKPointAnnotation()
//        //configurar anotacao
//        anotacao.coordinate = localizacao
//        anotacao.title = "Condominio Arniway"
//        anotacao.subtitle = "Minha casa"
//        
//        mapa.addAnnotation(anotacao)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let localizacaoUsuario: CLLocation = locations.last!
        
        //monsta exibicao do mapa
        let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longitude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude

        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01

        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)

        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)


        mapa.setRegion(regiao, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

