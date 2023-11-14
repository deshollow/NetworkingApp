//
//  CoursesViewController.swift
//  NetworkingApp
//
//  Created by deshollow on 14.11.2023.
//

import UIKit

final class CoursesViewController: UITableViewController {
    
    private var courses: [Course] = []
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath)
        guard let cell = cell as? CourseCell else { return UITableViewCell() }
        let course = courses[indexPath.row]
        cell.configure(with: course)
        return cell
    }
}

// MARK: - Networking
extension CoursesViewController {
    func fetchCourses() {
        networkManager.fetch([Course].self, from: Link.coursesURL.url) { [weak self] result in
            switch result {
            case .success(let courses):
                self?.courses = courses
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
