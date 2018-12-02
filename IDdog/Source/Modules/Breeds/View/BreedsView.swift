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
    private var indicator = UIActivityIndicatorView()

	// MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.indicator = UIActivityIndicatorView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 40, height: 40)))
        self.indicator.style = .gray
        self.indicator.center = self.tableView.center
        self.indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.loadBreeds()
        
    }

    // MARK: - BreedsPresenterOutputProtocol
    
    func loadBreeds() {
        self.tableView.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController.init(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
    }
    
    func showLoadingBreeds(loading: Bool, completion: @escaping () -> (Void)) {
        if loading {
            self.indicator.startAnimating()
        } else {
            self.indicator.stopAnimating()
        }
        completion()
    }

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
