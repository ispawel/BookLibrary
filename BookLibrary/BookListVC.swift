//
//  BookListVC.swift
//  BookLibrary
//
//  Created by Pavel Isakov on 16.12.2021.
//

import UIKit

class BookListVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!{
    
   
    didSet{
    tableView?.dataSource = self
    tableView?.delegate = self
    }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Book List"
    }
    
    
    
    // перезагрузка таблицы
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    

}



extension BookListVC:UITableViewDataSource, UITableViewDelegate{
    
    //колличество записей
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookBaseClass.shared.booksArray.count
    }
    
    
    
    
    //заполение записей
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
