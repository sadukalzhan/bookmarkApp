//
//  TableViewController.swift
//  BookmarkUIkit
//
//  Created by Saduakas Kalzhan on 01.03.2022.
//

import UIKit



class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var links: [LinkModel] = Storage.linkModels
    
    lazy var text1: UILabel = {
        let text = UILabel()
        text.text = "Bookmark App"
        text.textColor = .black
        text.font = .systemFont(ofSize: 17, weight: .semibold)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var text2: UILabel = {
        let text = UILabel()
        text.text = "Save you first     bookmark"
        text.textColor = .black
        text.font = .systemFont(ofSize: 36, weight: .bold)
        text.textAlignment = .center
       text.numberOfLines = 2
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Add bookmark", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  .systemFont(ofSize: 16, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.addAction(.init(handler: {_ in
            self.addAlert()
        }), for: .touchUpInside)
        return button
    }()
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
      
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    lazy var tableLabel: UILabel = {
        let text = UILabel()
        text.text = "List"
        text.textColor = .black
        
        text.font = .systemFont(ofSize: 17, weight: .semibold)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    
    func addAlert(){
        let aController = UIAlertController(title: "Change", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) {_ in
            }
        let action = UIAlertAction(title: "Save", style: .default) {[weak aController] _ in
            guard let title = aController?.textFields?[0].text, !title.isEmpty else {return}
            guard let link = aController?.textFields?[1].text, !link.isEmpty else {return}
            self.addNewLinkToArray(title: title, link: link)
            
        }
         
            aController.addAction(action)
            aController.addAction(cancel)
            self.present(aController, animated: true, completion: nil)
        
        aController.addTextField{ field in
            field.placeholder = "Title"
        }
        
        aController.addTextField{ field in
            field.placeholder = "Link"
        }
        
    }
    
    
    
    func addNewLinkToArray(title: String, link: String){
        self.links.append(LinkModel(title: title, link: link))
        Storage.linkModels.append(LinkModel(title: title, link: link))
        self.tableView.reloadData()
        checkLink()
      
    }
    
    
    func checkLink(){
        if links.isEmpty{
            tableView.isHidden = true
            text2.isHidden = false
            text1.isHidden = false
            tableLabel.isHidden = true
        }else{
            tableView.isHidden = false
            text2.isHidden = true
            tableLabel.isHidden = false
            text1.isHidden = true
            
        }
    }
    

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            
            links.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Storage.linkModels.remove(at: indexPath.row)
            
            checkLink()
            
        } else if editingStyle == .insert {
        }
    }
    

    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        links.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        cell.configure(name: links[indexPath.row])
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLink()
        
     
        
        view.backgroundColor = .white
        view.addSubview(text1)
        view.addSubview(text2)
        view.addSubview(button)
        view.addSubview(tableView)
        view.addSubview(tableLabel)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "names")
        
        NSLayoutConstraint.activate([
            text1.topAnchor.constraint(equalTo: view.topAnchor, constant: 56),
            text1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 56),
            tableLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            text2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            text2.rightAnchor.constraint(equalTo: view.rightAnchor),
            text2.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            
            button.widthAnchor.constraint(equalToConstant: 358),
            button.heightAnchor.constraint(equalToConstant: 58),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -50),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80
                                          ),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -108),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
}
