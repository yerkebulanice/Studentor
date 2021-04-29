//
//  BasicViewController.swift
//  Studentor
//
//  Created by Еркебулан on 30.04.2021.
//

import UIKit

class BasicViewController: UIViewController {
    var arr : [Item] = []
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        testDataConfigure()
    }
    
    func testDataConfigure(){
        arr.append(Item(imageId: 2, nameOfCourse: "Дискретная математика", nameOfMentor: "Умит"))
        arr.append(Item(imageId: 1, nameOfCourse: "Программирование C++", nameOfMentor: "Макс"))
        arr.append(Item(imageId: 3, nameOfCourse: "Основы бизнеса", nameOfMentor: "Джин"))
        arr.append(Item(imageId: 4, nameOfCourse: "Английский язык", nameOfMentor: "Алекс"))
        arr.append(Item(imageId: 6, nameOfCourse: "Теория Информации", nameOfMentor: "Кевин"))
        arr.append(Item(imageId: 5, nameOfCourse: "Алгоритмы", nameOfMentor: "Steve"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(CoursesCollectionView.nib, forCellWithReuseIdentifier: CoursesCollectionView.identifider)
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
    }
    
}

extension BasicViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoursesCollectionView.identifider, for: indexPath) as! CoursesCollectionView
        let item = arr[indexPath.row]
        cell.addItem(imageId: item.imageId, nameOfCourse: item.nameOfCourse, nameOfMentor: item.nameOfMentor)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
    
}

extension BasicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 240)
    }
}

class Item{
    var imageId = 0
    var nameOfCourse = ""
    var nameOfMentor = ""

    convenience init(imageId: Int, nameOfCourse: String,nameOfMentor: String){
        self.init()
        self.imageId = imageId
        self.nameOfCourse = nameOfCourse
        self.nameOfMentor = nameOfMentor
    }
}
