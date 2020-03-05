//
//  ViewController.swift
//  MinhasViagens
//
//  Created by Lucas Inocencio on 19/09/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    var viagem: Dictionary<String, String> = [:]
    var indiceSelecionado: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuraGerenciadorLocalizacao()
        if let indice = indiceSelecionado{
            if indice == -1 { //adicionar
                configuraGerenciadorLocalizacao()
            }else { //listar
                exibirAnotacao(viagem: viagem)
            }
        }
        let reconhecedorGesto = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.marcar(gesture:)))
        reconhecedorGesto.minimumPressDuration = 2
        mapa.addGestureRecognizer(reconhecedorGesto)
        
    }
    
    func exibirLocal( latitude: Double, longitude: Double) {
        let localizaocao = CLLocationCoordinate2DMake(latitude, longitude)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizaocao, span)
        self.mapa.setRegion(regiao, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let localizacaoAtual = locations.last!
        
        //exibir local
        let localizaocao = CLLocationCoordinate2DMake(localizacaoAtual.coordinate.latitude, localizacaoAtual.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizaocao, span)
        self.mapa.setRegion(regiao, animated: true)
        
    }
    
    func exibirAnotacao(viagem: Dictionary<String, String>) {
        if let localViagem = viagem["local"] {
            if let latitudeS = viagem["latitude"] {
                if let longitudeS = viagem["longitude"] {
                    if let latitude = Double(latitudeS) {
                        if let longitude = Double(longitudeS){

                            //Adicionar anotacao
                            let anotacao = MKPointAnnotation()
                            
                            anotacao.coordinate.latitude = latitude
                            anotacao.coordinate.longitude = longitude
                            anotacao.title = localViagem
                            
                            self.mapa.addAnnotation(anotacao)
                            
                            //exibir local
                            exibirLocal(latitude: latitude, longitude: longitude)
                        }
                    }
                }
            }
        }
    }
    
    @objc func marcar(gesture: UIGestureRecognizer){
        if gesture.state == UIGestureRecognizerState.began {
            //Recupera as coordenadas do ponto selecionado
            let pontoSelecionado = gesture.location(in: self.mapa)
            let coordenadas = mapa.convert(pontoSelecionado, toCoordinateFrom: self.mapa)
            let localizacao = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)
            
            //Recuperar endereco
            var localCompleto = ""
            CLGeocoder().reverseGeocodeLocation(localizacao, completionHandler: {(local, erro) in
                if erro == nil {
                    if let dadosLocal = local?.first{
                        if let nome = dadosLocal.name {
                            localCompleto = nome
                        } else {
                            if let endereco = dadosLocal.thoroughfare {
                                localCompleto = endereco
                            }
                        }
                    }
                    //Salvar dados no dispositivo
                    self.viagem = ["local": localCompleto, "latitude": String(coordenadas.latitude), "longitude": String(coordenadas.latitude)]
                    ArmazenamentDados().salvarViagem(viagem: self.viagem)
                    
                    //Exibe anotacao com os dados de endereco
                    self.exibirAnotacao(viagem: self.viagem)
                } else {
                    print(erro)
                }
            })
            

            
        }
    }
    
    func configuraGerenciadorLocalizacao() {
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse {
            let alertaController = UIAlertController(title:"Permissão de localização",
                                                     message:"Necessário permissão para acesso à sua localização! Por favor habilite",
                                                     preferredStyle: .alert )
            let acaoConfiguracoes = UIAlertAction(title:"Abrir configurações", style: .default, handler: {(alertaConfiguracoes) in
                if let configuracoes = NSURL(string: UIApplicationOpenSettingsURLString){
                    UIApplication.shared.open(configuracoes as URL)
                }
            })
            
            let acaoCancelar = UIAlertAction(title:"Cancelar", style: .default, handler: nil)
            
            alertaController.addAction(acaoConfiguracoes)
            alertaController.addAction(acaoCancelar)
            
            present(alertaController, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

