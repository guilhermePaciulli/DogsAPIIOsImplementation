//
//  BreedsView.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class BreedsView: UIViewController, BreedsPresenterOutputProtocol, UITableViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Viper Module Properties
	var presenter: BreedsPresenterInputProtocol!
    
    // MARK: - Properties
    private var breedsCellReuseIdentifier = "breedCell"

	// MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.loadBreeds()
        
    }

    // MARK: - BreedsPresenterOutputProtocol
    
    func loadBreeds() {
        self.tableView.reloadData()
    }

	// MARK: - Private Methods

}

extension BreedsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfBreeds(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: self.breedsCellReuseIdentifier, for: indexPath) as? BreedsCell {
            
            let breed = self.presenter.item(at: indexPath)
            cell.setBreed(breed)
            
            return cell
        }
        return UITableViewCell()
    }
    
}
