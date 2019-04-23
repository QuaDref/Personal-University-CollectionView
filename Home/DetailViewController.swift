//
//  DetailViewController.swift
//  CollectinView
//
//  Created by Quadref on 17.04.2019.
//  Copyright © 2019 Quadref. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var years: UILabel!
    

    var image = UIImage()
    
    var student: Student?
    var teacher: Teacher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.student != nil{
            self.newWindow(student!)
        }
        
        if self.teacher != nil {
            self.newWindowTeacher(teacher!)
        }
    }
    
    func newWindow(_ student: Student) {
        self.name.text = student.name
        self.surname.text = student.surname
        self.gender.text = student.gender.rawValue
        self.position.text = student.positionStudent
        self.years.text = "\(student.years ?? 0)"
        if student.photo != nil{
            self.img.image = UIImage(named: student.photo!)
        }
    }
    
    func newWindowTeacher(_ teacher: Teacher) {
        self.name.text = teacher.name
        self.surname.text = teacher.surname
        self.gender.text = teacher.gender.rawValue
        if teacher.photo != nil{
            self.img.image = UIImage(named: teacher.photo!)
        }
        self.position.text = teacher.positionTeacher
        self.years.isHidden = true
        
    }
    

    

}
