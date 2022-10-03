//
//  AddNewBookVC.swift
//  BookLibrary
//
//  Created by Pavel Isakov on 16.12.2021.
//

import UIKit

//struct KeysDefaults {
//    static let keyBookName = "bookName"
//    static let keyBookDate = "bookDate"
//}

class AddNewBookVC: UIViewController {
    
    var delPicker = UIPickerView()
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var bookNameTF: UITextField!
    @IBOutlet weak var bookDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add new book"
        datePicker?.addTarget(self, action: #selector(AddNewBookVC.dateChanged(datePicker:)), for: .valueChanged)
        addTapGestureToHideKeyboard()
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatted = DateFormatter()
        dateFormatted.dateFormat = "dd.MM.yyyy"
        bookDateLabel.text = dateFormatted.string(from: datePicker.date)
        view.endEditing(true)
    }

    @IBAction func addButton(_ sender: UIButton) {
        let bookName = bookNameTF.text!
        let bookDate = bookDateLabel.text
        
        // проверка на присутвие данных
        if !bookName.isEmpty && bookDate != nil {
            
            // передача данных и их последущее сохраение методом
            BookBaseClass.shared.saveBook(bookName: bookName, bookData: bookDate!)
            
            //переход на таблицу книг
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // метод скрытия клавиатуры
    func addTapGestureToHideKeyboard() {
            let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
            view.addGestureRecognizer(tapGesture)
        }
    func tapGesture() {
        bookNameTF.resignFirstResponder()
        }
}


