//
//  ViewController.swift
//  Contacts
//
//  Created by Булат Хабибуллин on 26.10.2020.
//  Copyright © 2020 Bulat Khabibullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        loadData()
    }
    
    let contacts: [Contact] = [Contact(name: "Askar", surname: "Velmiskin", number: "+7 (934) 342-23-53", photo: #imageLiteral(resourceName: "1.jpeg")),
        Contact(name: "Maria", surname: "Antonova", number: "+7 (934) 342-23-53", photo: #imageLiteral(resourceName: "1.jpeg")),
        Contact(name: "Aleksandr", surname: "Aleshin", number: "+7 (934) 342-23-53", photo: #imageLiteral(resourceName: "1.jpeg")),
        Contact(name: "Oleg", surname: "Volkov", number: "+7 (934) 342-23-53", photo: #imageLiteral(resourceName: "1.jpeg")),
        Contact(name: "Aleksey", surname: "Vafin", number: "+7 (934) 342-23-53", photo: #imageLiteral(resourceName: "1.jpeg")),
        Contact(name: "Rishat", surname: "Latypov", number: "+7 (934) 342-23-53", photo: #imageLiteral(resourceName: "1.jpeg")),
        Contact(name: "Nikita", surname: "Lyapustin", number: "+7 (934) 342-23-53", photo: #imageLiteral(resourceName: "1.jpeg")),
        Contact(name: "Petr", surname: "Pavlov", number: "+7 (934) 342-23-53", photo: #imageLiteral(resourceName: "1.jpeg")),
        Contact(name: "Pavel", surname: "Pavlov", number: "+7 (934) 342-23-53", photo: #imageLiteral(resourceName: "1.jpeg")),
        Contact(name: "Ivan", surname: "Petrov", number: "+7 (934) 342-23-53", photo: #imageLiteral(resourceName: "1.jpeg"))
    ]
    
    private enum Section: Int {
        case A
        case V
        case L
        case P
    }
    
    private struct Cell {
        let contact: Contact
    }

    private struct SectionData {
        let cells: [Cell]
    }

    private var sectionsData: [SectionData]?

    private func loadData() {
        sectionsData = [
            SectionData(cells: [
                .init(contact: contacts[1]),
                .init(contact: contacts[2])
            ]),
            SectionData(cells: [
                .init(contact: contacts[0]),
                .init(contact: contacts[3]),
                .init(contact: contacts[4])
            ]),
            SectionData(cells: [
                .init(contact: contacts[5]),
                .init(contact: contacts[6])
            ]),
            SectionData(cells: [
                .init(contact: contacts[7]),
                .init(contact: contacts[8]),
                .init(contact: contacts[9])
            ])
        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionData = sectionsData?[section] else { return 0 }
        return sectionData.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = sectionsData?[indexPath.section]
        else { fatalError("Load error") }
        return basicCell(for: indexPath, from: tableView, name: cellData.cells[indexPath.row].contact.name,
                         surname: cellData.cells[indexPath.row].contact.surname)
    }
    
    private func basicCell(for indexPath: IndexPath, from tableView: UITableView, name: String, surname: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath)
        cell.textLabel?.text = "\(name) \(surname)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
             case 0:
                 return "A"
             case 1:
                 return "V"
             case 2:
                 return "L"
             case 3:
                 return "P"
             default:
                 return nil
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let contactViewControlller: ContactViewController
                = storyboard?.instantiateViewController(identifier: "contact")
        else { return }

        guard let contact = sectionsData?[indexPath.section].cells[indexPath.row].contact else {return}

        contactViewControlller.loadViewIfNeeded()
        contactViewControlller.setContact(contact: contact)
        show(contactViewControlller, sender: nil)
    }
}

