//
//  Student.swift
//  CollectinView
//
//  Created by Quadref on 17.04.2019.
//  Copyright © 2019 Quadref. All rights reserved.
//

import UIKit

class Student{
    
    let manager = DataManager.shared
    
    var name: String?
    var surname: String?
    var years: Int?
    var gender: Gender!
    var positionStudent: String?
    var photo: String?
    
    init(index: Int) {
        self.gender = manager.getGender()
        let fio = manager.getFioStudent(gender: gender)
        self.name = fio.name
        self.surname = fio.surname
        self.positionStudent = fio.position
        self.years = manager.getYears(index: index)
        self.photo = manager.getPhoto(gender: gender)
    }
}
