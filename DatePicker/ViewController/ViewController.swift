//
//  ViewController.swift
//  DatePicker
//
//  Created by 정준영 on 2023/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let dateStorage = DateStorage.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        firstCell()
        
    }
    
    private func firstCell() {
        let dateString = "2023-07-17"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString)!
        dateStorage.dateCollection.append(.init(title: "첫 수업", date: date))
    }

    @IBAction func plusButtonTapped(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "DatePickViewController")
        self.show(vc!, sender: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateStorage.dateCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell
        let data = dateStorage.dateCollection[indexPath.row]
        
        cell.dDayLabel.text = Date.makeD_Day(date: data.date)
        cell.dateLabel.text = Date.makeCalendar(date: data.date)
        cell.titleLabel.text = data.title
        return cell
    }
    
    
}

