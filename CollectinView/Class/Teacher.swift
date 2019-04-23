//
//  Teacher.swift
//  CollectinView
//
//  Created by Quadref on 17.04.2019.
//  Copyright © 2019 Quadref. All rights reserved.
//

import UIKit

class Teacher {
    
    let manager = DataManager.shared
    
    var name: String?
    var surname: String?
    var gender: Gender!
    var positionTeacher: String?
    var photo: String?
    
    init(index: Int) {
        self.gender = manager.getGender()
        let fio = manager.getFioTeacher(gender: gender)
        self.name = fio.name
        self.surname = fio.surname
        self.positionTeacher = manager.getPosition(index: index)
        self.photo = manager.getPhoto(gender: gender)
    }
}
