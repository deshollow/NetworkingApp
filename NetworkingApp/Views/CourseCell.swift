//
//  CourseCell.swift
//  NetworkingApp
//
//  Created by deshollow on 14.11.2023.
//

import UIKit

final class CourseCell: UITableViewCell {
    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var numberOfLessons: UILabel!
    @IBOutlet weak var numberOfTests: UILabel!
    
    func configure(with course: Course) {
        courseNameLabel.text = course.name
        numberOfLessons.text = "Number of lesson \(course.numberOfLessons)"
        numberOfTests.text = "Number of tests \(course.numberOfTests)"
        
        NetworkManager.shared.fetchImage(from: course.imageUrl) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.courseImage?.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

