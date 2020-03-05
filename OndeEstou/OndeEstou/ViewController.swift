//
//  ViewController.swift
//  OndeEstou
//
//  Created by Lucas Inocencio on 18/09/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    
    @IBOutlet weak var velocidadeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var enderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let localizacaoUsuario = locations.last!
        let longitude = localizacaoUsuario.coordinate.longitude
        let latitude = localizacaoUsuario.coordinate.latitude
        
        longitudeLabel.text = String(longitude)
        latitudeLabel.text = String(latitude)
        
        if localizacaoUsuario.speed > 0 {
            velocidadeLabel.text = String(localizacaoUsuario.speed)
        }
        
        let deltaLat: CLLocationDegrees = 0.01
        let deltaLon: CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaExibicao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLat, deltaLon)
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaExibicao)
        mapa.setRegion(regiao, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(localizacaoUsuario) {(detalhesLocal, erro) in
            if erro == nil {
                if let dadosLocal = detalhesLocal?.first {
                    var throughfare = ""
                    if dadosLocal.thoroughfare != nil {
                        throughfare = dadosLocal.thoroughfare!
                    }
                    
                    var subThroughfare = ""
                    if dadosLocal.subThoroughfare != nil {
                        subThroughfare = dadosLocal.subThoroughfare!
                    }
                    
                    var locality = ""
                    if dadosLocal.locality != nil {
                        locality = dadosLocal.locality!
                    }
                    
                    var subLocality = ""
                    if dadosLocal.subLocality != nil {
                        subLocality = dadosLocal.subLocality!
                    }
                    
                    var postalCode = ""
                    if dadosLocal.postalCode != nil {
                        postalCode = dadosLocal.postalCode!
                    }
                    
                    var country = ""
                    if dadosLocal.country != nil {
                        country = dadosLocal.country!
                    }
                    
                    var administrativeArea = ""
                    if dadosLocal.administrativeArea != nil {
                        administrativeArea = dadosLocal.administrativeArea!
                    }
                    
                    var subAdministrativeArea = ""
                    if dadosLocal.subAdministrativeArea != nil {
                        subAdministrativeArea = dadosLocal.subAdministrativeArea!
                    }
                    
                    self.enderLabel.text = throughfare + " - "
                                            + subThroughfare + " / "
                                            + locality + " / "
                                            + country
                    
                }
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse{
            let alertaControle = UIAlertController(title: "Permissão de localização", message: "Necessário permissão para acesso à sua localização! Por favor habilite", preferredStyle: .alert)
            let acaoConfiguracoes = UIAlertAction(title: "Abrir configurações", style: .default, handler: {(alertaConfiguracoes) in
                if let configuracoes = NSURL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.open( configuracoes as URL)
                }
            })
            
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertaControle.addAction( acaoConfiguracoes )
            alertaControle.addAction( acaoCancelar )
            
            present(alertaControle, animated: true, completion: nil)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

