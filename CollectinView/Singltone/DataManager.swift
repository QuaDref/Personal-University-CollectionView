//
//  DataManager.swift
//  CollectinView
//
//  Created by Quadref on 17.04.2019.
//  Copyright © 2019 Quadref. All rights reserved.
//

import UIKit

class DataManager{
    
    //Teacher mass
    let surnameT = [
        "Иванов", "Левин", "Травелла", "Гетто", "Батон"
    ]
    let positionT = [
        "Биолог", "Геометрия", "История", "География", "Математика", "Химия", "Литература"
    ]
    
    //Student mass
    let surname = [
        "Опранов", "Олмин", "Полин", "Литерин", "Гирин", "Килента", "Гартер", "Кумарин", "Линтест", "Моськин"
    ]
    let years = [
        17, 18, 19, 20, 21
    ]
    
    let position = ["студент", "студентка"]
    
    //Info for student and teacher
    let photo1 = [
        "1.jpg", "3.jpg", "7.jpg", "11.jpg", "12.jpg"
    ]
    let photo2 = [
        "2.png", "4.jpg", "5.jpg", "6.jpg", "8.jpg", "9.jpg", "14.jpeg", "13.jpg", "15.jpg", "16.jpg"
    ]
    let genders = [
        "мужской", "женский"
    ]
    
    let nameBoy = [
        "Кирил", "Богдан", "Олег", "Рефат", "Ахтем", "Алим", "Вова", "Мустафа", "Зиннур", "Гирей"
    ]
    let nameGirl = [
        "Оля", "Катя", "Вика", "Настя", "Афифе", "Даша", "Юля", "Августина", "Кира", "Вита"
    ]
    
    static let shared = DataManager()
    
    //all personal
    func getPhoto(gender: Gender) -> String{
        if gender.rawValue == "мужской" {
            return photo2[Int.random(in: 0...9)]
        }else{
            return photo1[Int.random(in: 0...4)]
        }
    }
    
    func getNameBoy(index: Int) -> String {
        return self.nameBoy[index]
    }
    
    func getNameGirl(index: Int) -> String {
        return self.nameGirl[index]
    }
    
    //Student
    func getSurnameStudent(index: Int) -> String {
        return self.surname[index]
    }
    
    func getYears(index: Int) -> Int {
        return self.years[Int.random(in: 0...4)]
    }
    
    func getFioStudent(gender: Gender) -> (name: String?, surname: String?, position: String?){
        if gender == .male{
            return (self.nameBoy[Int.random(in: 0...9)], self.surname[Int.random(in: 0...4)], self.position[0])
        }else{
            return (self.nameGirl[Int.random(in: 0...9)], self.surname[Int.random(in: 0...4)], self.position[1])
        }
    }
    
    //Teacher
    func getSurnameTeacher(index: Int) -> String {
        return self.surnameT[index]
    }
    
    func getPosition(index: Int) -> String {
        return self.positionT[index]
    }
    
    func getGender() -> Gender {
        return Gender(rawValue: genders[Int.random(in: 0...1)])!
    }
    
    func getFioTeacher(gender: Gender) -> (name: String?, surname: String?){
        if gender == .male{
            return (self.nameBoy[Int.random(in: 0...9)], self.surnameT[Int.random(in: 0...4)])
        }else{
            return (self.nameGirl[Int.random(in: 0...9)], self.surnameT[Int.random(in: 0...4)])
        }
    }
}
