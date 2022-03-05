//
//  CustomTableViewTableViewCell.swift
//  BookmarkUIkit
//
//  Created by Saduakas Kalzhan on 01.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    lazy var label : UIButton = {
       let label = UIButton()
        label.setImage(UIImage(named: "vector"), for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.addAction(.init(handler: {_ in
            self.toLink()
        }), for: .touchUpInside)
        return label
    }()
    
    
    lazy var namelabel: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    lazy var linkLabel : UILabel = {
        let link = UILabel()
        return link
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.backgroundColor = .white
            
            self.addSubview(namelabel)
            self.contentView.addSubview(label)
            
                NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalToConstant: 18),
                label.heightAnchor.constraint(equalToConstant: 18),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19),
                label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 42),
                label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
                
                namelabel.widthAnchor.constraint(equalToConstant: 326),
                namelabel.heightAnchor.constraint(equalToConstant: 24),
                namelabel.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 16),
                namelabel.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -11)
                ])}
        
        required init?(coder: NSCoder){
            fatalError("not implemented")
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
}
    
    
    
    func configure (name: LinkModel){
        self.namelabel.text = name.title
        self.linkLabel.text = name.link
    }
    
    
    func toLink(){
        guard let url = URL(string: "https://\(linkLabel.text!)") else {return}
        UIApplication.shared.open(url)
        print("Debug: \(self.linkLabel.text!)")
    }

}
