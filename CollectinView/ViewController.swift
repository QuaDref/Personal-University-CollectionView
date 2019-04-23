//
//  ViewController.swift
//  CollectinView
//
//  Created by Quadref on 17.04.2019.
//  Copyright © 2019 Quadref. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{
    
    @IBOutlet weak var personalInfo: UICollectionView!
    
    private var students = [Student]()
    private var teachers = [Teacher]()
    
    private var searchStudent = [Student]()
    private var searchTeacher = [Teacher]()
    
    let manager = DataManager.shared
    
    private let searchController  = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Search Conroller
        searchController.searchResultsUpdater = self as! UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        //student
        for index in 0...9 {
            
            let student = Student.init(index: index)
            self.students.append(student)
        }
        
        //teacher
        for index in 0...4 {
            
            let teacher = Teacher.init(index: index)
            self.teachers.append(teacher)
        }
        
        self.personalInfo.reloadData()
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel()
//
//        label.font = UIFont.init(name: "System", size: 19)
//        label.backgroundColor = UIColor.yellow
//        label.text = section == 1 ? "Учителя": "Студенты"
//
//        return label
//    }
    


}

extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //размер для ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: (view.frame.width / 2) - 20, height: 150)
    }
    
    //растояние сверху/снизу
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            if isFiltering {
                return searchStudent.count
            }else{
                return students.count
            }
        }else{
            if isFiltering{
                return searchTeacher.count
            }else{
                return teachers.count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionVC", for: indexPath) as! ProductCollectionVC
        
        var searchS: Student
        var searchT: Teacher
        
        if indexPath.section == 0{
            if isFiltering {
                searchS = searchStudent[indexPath.item]
            }else{
                searchS = students[indexPath.item]
            }
            cell.setupWith(searchS)
        }else{
            if isFiltering {
                searchT = searchTeacher[indexPath.item]
            }else{
                searchT = teachers[indexPath.item]
            }
            cell.setupWithTeacher(searchT)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let testvc = Test()
//        self.navigationController?.pushViewController(testvc, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        if indexPath.section == 0{
            if let student = self.students[indexPath.item] as? Student {
                vc.student = student
            }
        }else{
            if let teacher = self.teachers[indexPath.item] as? Teacher {
                vc.teacher = teacher
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension FirstViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        searchStudent = students.filter({ (students: Student) -> Bool in
            return (students.name!.lowercased().range(of: searchText.lowercased()) != nil)
        })
        searchTeacher = teachers.filter({ (teachers: Teacher) -> Bool in
            return (teachers.name!.lowercased().range(of: searchText.lowercased()) != nil)
        })
        
        personalInfo.reloadData()
    }
}

