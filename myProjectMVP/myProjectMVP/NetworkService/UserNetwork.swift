//
//  UserNetwork.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 11.06.2022.
//

import Foundation
import UIKit

class UserNetwork {
    
    func fetchUserData(_ completion: @escaping (User) -> Void) {
        
        let userImage = UIImage(imageLiteralResourceName: "Шашлык")
        
        let man = User(name: "Владимир", phone: "+79994445522", adress: "dog@mail.com", imageUser: userImage)
        
        let resultUser: User = man
        
        completion(resultUser)
    }
}
