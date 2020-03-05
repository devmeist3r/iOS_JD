//
//  PokemonAnnotation.swift
//  PokemonGO
//
//  Created by Lucas Inocencio on 05/07/18.
//  Copyright © 2018 Lucas Inocencio. All rights reserved.
//

import UIKit
import MapKit

class PokemonAnotacao: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    init(coordenadas: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coordenadas
        self.pokemon = pokemon
    }
}
