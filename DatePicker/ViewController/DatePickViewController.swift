//
//  DatePickViewController.swift
//  DatePicker
//
//  Created by 정준영 on 2023/07/20.
//

import UIKit
import SnapKit

class DatePickViewController: UIViewController {

    @IBOutlet weak var dDayLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    private var date = Date()
    
    let dateStorage = DateStorage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        self.dateStorage.dateCollection.append(
            .init(title: self.inputTextField.text ?? "기념일", date: date)
        )
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerTapped(_ sender: UIButton) {
        let dateChooserAlert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        dateChooserAlert.view.addSubview(datePicker)
        
        datePicker.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(dateChooserAlert.view).inset(20)
            make.bottom.equalTo(dateChooserAlert.view).inset(80)
        }
        
        let cancelAction = UIAlertAction(title: "선택 완료",style: .cancel) { _ in
            self.date = datePicker.date
            self.dDayLabel.text = Date.makeD_Day(date: self.date)
            sender.titleLabel?.text = Date.makeCalendar(date: self.date)
        }
        dateChooserAlert.addAction(cancelAction)
        
        present(dateChooserAlert, animated: true)
    }

}
