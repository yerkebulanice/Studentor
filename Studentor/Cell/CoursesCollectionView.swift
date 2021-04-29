//
//  CoursesCollectionView.swift
//  Studentor
//
//  Created by Еркебулан on 30.04.2021.
//

import UIKit

class CoursesCollectionView: UICollectionViewCell {
    static let identifider = String(describing: CoursesCollectionView.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    @IBOutlet weak var nameOfCourse: UILabel!
    @IBOutlet weak var nameOfMentor: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var viewCollection: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCollection.layer.cornerRadius = 14
        viewCollection.layer.masksToBounds = true
    }
    
    func addItem(imageId: Int, nameOfCourse: String, nameOfMentor: String){
        self.backgroundImage.image = UIImage(named: "course\(imageId).png")
        self.nameOfCourse.text = nameOfCourse
        self.nameOfMentor.text = "Ментор: \(nameOfMentor)"
    }
    
}
