//
//  BookListVC.swift
//  BookLibrary
//
//  Created by Pavel Isakov on 16.12.2021.
//

import UIKit
class BookListVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //поле вызова пикера
    @IBOutlet weak var selectBookForDelTF: UITextField!
    
    var pickerView = UIPickerView()
    let bookArrayTitleForPicker = BookBaseClass.shared.booksArray

    //снисок книг
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView?.dataSource = self
            tableView?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Book List"
        pickerView.delegate = self
        pickerView.dataSource = self
        selectBookForDelTF.inputView = pickerView
        selectBookForDelTF.textAlignment = .center
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookArrayTitleForPicker.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //установка значений в заколовки
    @objc func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookArrayTitleForPicker[row].name
    }
    //передача выбранного значения пикера в текстовое поле
    @objc func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectBookForDelTF.text = bookArrayTitleForPicker[row].name
        selectBookForDelTF.resignFirstResponder()
    }
    // перезагрузка таблицы
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    //кнопка удаления выбранной записи
    @IBAction func delButton(_ sender: UIButton) {
        BookBaseClass.shared.delBook()
    } 
}
let bookListVC = BookListVC()
extension BookListVC:UITableViewDataSource, UITableViewDelegate{
    
    //колличество записей
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookBaseClass.shared.booksArray.count
    } 
    //заполение записей таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        if  let dCell = tableView.dequeueReusableCell(withIdentifier: "dCell"){
            cell = dCell
        }else{
            cell = UITableViewCell()
        }   
        cell.textLabel?.text = BookBaseClass.shared.booksArray[indexPath.row].name
        return cell
    }
    
    //высота строк
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


