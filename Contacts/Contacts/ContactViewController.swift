//
//  ContactViewController.swift
//  Contacts
//
//  Created by Булат Хабибуллин on 26.10.2020.
//  Copyright © 2020 Bulat Khabibullin. All rights reserved.
//

struct Contact {
    let name: String
    let surname: String
    let number: String
    let photo: UIImage?
}

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var image: UIImageView!
    private var contact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.cornerRadius = image.frame.size.width / 2
    }
    
    func setContact(contact: Contact) {
        image.image = contact.photo
        nameLabel.text = "\(contact.name) \(contact.surname)"
        numberLabel.text = contact.number
    }
}

