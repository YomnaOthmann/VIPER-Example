//
//  View.swift
//  VIPER
//
//  Created by Mac on 18/04/2024.
//

import Foundation
import UIKit

class UserViewController: UIViewController, AnyView{
    
    private let usersTableView: UITableView = {
        let table = UITableView()
        table.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.id)
        
       table.isHidden = true
        return table
    }()
    let errorLable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font.withSize(18.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    var presenter: AnyPresenter?
    var users:[User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.delegate = self
        usersTableView.dataSource = self
        view.addSubview(usersTableView)
        view.addSubview(errorLable)
        view.backgroundColor = .white
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        usersTableView.frame = view.bounds
        errorLable.frame = CGRect(x: 0, y: 0, width: 300, height: 60)
        errorLable.center = view.center
    }
    
    func update(with users: [User]) {
        self.users = users
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
            self.usersTableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async { [self] in
            self.errorLable.text = error.components(separatedBy: ".")[0]
            errorLable.isHidden = false
            usersTableView.isHidden = true
        }
    }
    
    
}
extension UserViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.id, for: indexPath) as? UserTableViewCell else{
            return UITableViewCell()
        }
        cell.userName.text = users[indexPath.row].name
        cell.userMail.text = users[indexPath.row].email
        cell.userPhone.text = users[indexPath.row].phone
        return cell
    }
    
    
}
