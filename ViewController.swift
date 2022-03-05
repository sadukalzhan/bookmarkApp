//
//  ViewController.swift
//  BookmarkUIkit
//
//  Created by Saduakas Kalzhan on 21.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "back1")
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()




    lazy var textView: UILabel = {
       let textView = UILabel()
        textView.text = "Save all interesting links in one app"
        textView.textColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 36, weight: .bold)
        textView.numberOfLines = 2
      return textView
    }()


    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Let`s start collection", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font =  .systemFont(ofSize: 16, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.addAction(.init(handler: {_ in
            self.buttonDidPressed()
        }), for: .touchUpInside)
        return button
    }()


    func buttonDidPressed(){
        let navigationVC = UINavigationController(rootViewController: TableViewController())
        navigationVC.modalPresentationStyle = .fullScreen
        navigationController?.present(navigationVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(textView)
        view.addSubview(button)
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            textView.widthAnchor.constraint(equalToConstant: 360),
            textView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
            textView.bottomAnchor.constraint(equalTo: button.topAnchor,constant: -24),

            button.widthAnchor.constraint(equalToConstant: 358),
            button.heightAnchor.constraint(equalToConstant: 58),

            button.bottomAnchor.constraint(equalTo: imageView.bottomAnchor,constant: -50),
            button.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: imageView.rightAnchor,constant: -16
                                        )

        ])

        
        
    }


}
