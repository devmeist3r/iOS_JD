//
//  MainVC.swift
//  PokemonGO
//
//  Created by Lucas Inocencio on 17/09/18.
//  Copyright © 2018 Lucas Inocencio. All rights reserved.
//

import UIKit
import MapKit

class MainVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // Variables
    var gerenciadorLocalizacao = CLLocationManager()
    var contador = 0
    var coreDataPokemon: CoreDataPokemon!
    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Recuperar Pokemon
        self.coreDataPokemon = CoreDataPokemon()
        self.pokemons = self.coreDataPokemon.recuperarTodosPokemons()
        
        mapView.delegate = self
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        
        // Exibir pokemons
        Timer.scheduledTimer(withTimeInterval: 8, repeats: true, block: { (timer) in
            
            //espalhar os pokemons
            if let coordenadas = self.gerenciadorLocalizacao.location?.coordinate {
                
                let indice = UInt32(self.pokemons.count)
                let pokemon = self.pokemons[ Int(arc4random_uniform(indice)) ]
                
                let anotacao = PokemonAnotacao(coordenadas: coordenadas, pokemon: pokemon )
                //anotacao.coordinate = coordenadas
                
                let latAleatoria = (Double( arc4random_uniform(200) ) - 100.0) / 50000.0
                let lonAleatoria = (Double( arc4random_uniform(200) ) - 100.0) / 50000.0
                
                anotacao.coordinate.latitude += latAleatoria
                anotacao.coordinate.longitude += lonAleatoria
                self.mapView.addAnnotation( anotacao )
            }
            
        })
    }
    
    func centerPlayer() {
        if let coordinate = gerenciadorLocalizacao.location?.coordinate {
            let region = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(region, animated: true)
        }
    }
    
    @IBAction func centerBtnPressed(_ sender: UIButton) {
        self.centerPlayer()
    }
    
    @IBAction func pokeballPressed(_ sender: UIButton) {
        
    }
    
}

extension MainVC: MKMapViewDelegate, CLLocationManagerDelegate {
    // Verificar se a autorização está negada
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse && status != .notDetermined {
            
            let alertaController = UIAlertController(title: "Permissão de localização",
                                                     message: "Necessário permissão para acesso à sua localização!! por favor habilite.",
                                                     preferredStyle: .alert )
            
            let acaoConfiguracoes = UIAlertAction(title: "Abrir configurações", style: .default , handler: { (alertaConfiguracoes) in
                
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString ) {
                    UIApplication.shared.open( configuracoes as URL )
                }
                
            })
            
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default , handler: nil )
            
            alertaController.addAction( acaoConfiguracoes )
            alertaController.addAction( acaoCancelar )
            
            present( alertaController , animated: true, completion: nil )
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if contador < 3 {
            self.centerPlayer()
            contador += 1
        } else {
            gerenciadorLocalizacao.stopUpdatingLocation()
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let anotacao = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        
        if annotation is MKUserLocation {
            anotacao.image = #imageLiteral(resourceName: "player")
        }else{
            let pokemon = (annotation as! PokemonAnotacao).pokemon
            anotacao.image = UIImage(named: pokemon.nomeImagem! )
        }
        
        var frame = anotacao.frame
        frame.size.height = 40
        frame.size.width  = 40
        anotacao.frame = frame
        
        return anotacao
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let annotation = view.annotation
        let pokemon = (view.annotation as! PokemonAnotacao).pokemon
        
        mapView.deselectAnnotation(annotation, animated: true)
        
        if annotation is MKUserLocation {
            return
        }
        
        if let coordenadas = gerenciadorLocalizacao.location?.coordinate {
            let regiao = MKCoordinateRegion(center: coordenadas, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(regiao, animated: true)
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer) in
            if let coord = self.gerenciadorLocalizacao.location?.coordinate {
                if self.mapView.visibleMapRect.contains(MKMapPoint(coord)) {
                    print("Você pode capturar o Pokemon!!")
                    
                    let context = self.coreDataPokemon.getContext()
                    pokemon.capturado = true
                    
                    do{
                        try context.save()
                        self.mapView.removeAnnotation(view.annotation!)
                        
                        let alertaController = UIAlertController(title: "Parabéns!!",
                                                                 message: "Você capturou o \(pokemon.nome!) ",
                            preferredStyle: .alert )
                        
                        
                        let ok = UIAlertAction(title: "ok", style: .default , handler: nil )
                        alertaController.addAction( ok )
                        self.present( alertaController , animated: true, completion: nil )
                        
                    }catch{}
                    
                }else{
                    
                    let alertaController = UIAlertController(title: "Você não pode Capturar",
                                                             message: "Você precisa se aproximar mais para capturar o \(pokemon.nome!) ",
                        preferredStyle: .alert )
                    
                    
                    let ok = UIAlertAction(title: "ok", style: .default , handler: nil )
                    alertaController.addAction( ok )
                    self.present( alertaController , animated: true, completion: nil )
                    
                }
            }
        })
        
    }
    
    
}
