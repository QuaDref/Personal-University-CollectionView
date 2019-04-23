//
//  ProductCollectionVC.swift
//  CollectinView
//
//  Created by Quadref on 17.04.2019.
//  Copyright © 2019 Quadref. All rights reserved.
//

import UIKit

class ProductCollectionVC: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupWith(_ student: Student) {
        self.name.text = student.name
        self.surname.text = student.surname
        if student.photo != nil{
            self.img.image = UIImage(named: student.photo!)
        }
    }
    
    
    func setupWithTeacher(_ teacher: Teacher) {
        self.name.text = teacher.name
        self.surname.text = teacher.surname
        if teacher.photo != nil {
            self.img.image = UIImage(named: teacher.photo!)
        }
    }
}
