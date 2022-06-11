//
//  Network.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 09.06.2022.
//
import UIKit
import Foundation

class Network {
    
    func fetchEatData(_ completion: @escaping ([Eat]) -> Void) {
        
        let grechaImage = UIImage(imageLiteralResourceName: "Греча")
        let makaroniImage = UIImage(imageLiteralResourceName: "Макароны")
        let beerImage = UIImage(imageLiteralResourceName: "Пиво")
        let meetImage = UIImage(imageLiteralResourceName: "Шашлык")
        let fishImage = UIImage(imageLiteralResourceName: "Рыба")
        
        let grecha = Eat(name: "Греча", description: "Какой-то рецепт", image: grechaImage)
        let makaroni = Eat(name: "Макароны", description: "Какой-то рецепт", image: makaroniImage)
        let beer = Eat(name: "Пиво", description: "Какой-то рецепт", image: beerImage)
        let meet = Eat(name: "Шашлык", description: "Какой-то рецепт", image: meetImage)
        let fish = Eat(name: "Рыба", description: "Какой-то рецепт", image: fishImage)
        
        let result: [Eat] = [grecha, makaroni, beer, meet, fish]
        
        completion(result)
    }
}
