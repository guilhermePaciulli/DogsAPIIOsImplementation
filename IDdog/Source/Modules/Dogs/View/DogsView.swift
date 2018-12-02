//
//  DogsView.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class DogsView: UIViewController, DogsPresenterOutputProtocol {
    

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Viper Module Properties
	var presenter: DogsPresenterInputProtocol!
    
    // MARK: - Properties
    private var dogsCellReuseIdentifier = "dogCell"
    private var indicator = UIActivityIndicatorView()

	// MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0, blue: 0.1529411765, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8470588235, green: 0, blue: 0.1529411765, alpha: 1)
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Dogs that are " + self.presenter.dogBreedName()
        
        self.presenter.fetchDogs()
        
    }

    // MARK: - DogsPresenterOutputProtocol
    func showError(with message: String) {
        let alert = UIAlertController.init(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
    }
    
    func showLoadingDogs(_ loading: Bool, completion: @escaping () -> (Void)) {
        if loading {
            self.indicator.startAnimating()
        } else {
            self.indicator.stopAnimating()
        }
        completion()
    }
    
    func reloadDogs() {
        self.collectionView.reloadData()
    }

	// MARK: - Private Methods

}

extension DogsView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.dogsCellReuseIdentifier, for: indexPath) as? DogCell {
            self.presenter.didSelectDog(dogImage: cell.dogImage.image ?? #imageLiteral(resourceName: "wanted.png"))
        }
    }
    
}

extension DogsView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.dogsForSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.dogsCellReuseIdentifier, for: indexPath) as? DogCell {
            let dog = self.presenter.dogForIndexPath(indexPath)
            cell.setDog(image: dog)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
