//
//  CollectionViewController.swift
//  DiffableDataSourcesProject
//
//  Created by オムラユウキ on 2019/12/17.
//  Copyright © 2019 オムラユウキ. All rights reserved.
//

import UIKit

final class CollectionViewController: UIViewController {
    
    enum Section: CaseIterable {
        case main
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Country>!
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let countryNames = ["Afghanistan",
                            "Albania",
                            "Algeria",
                            "Andorra",
                            "Angola",
                            "Antigua and Barbuda and or and or",
                            "Argentina",
                            "Armenia",
                            "Australia",
                            "Austria",
                            "Azerbaijan",
                            "Bahamas",
                            "Bahrain",
                            "Bangladesh",
                            "Barbados",
                            "Belarus"]
        
        for name in countryNames {
            countries.append(Country(name: name))
        }
        
        dataSource = UICollectionViewDiffableDataSource
            <Section, Country>(collectionView: collectionView) {
                (collectionView: UICollectionView, indexPath: IndexPath, country: Country) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                as? MyCellCollectionViewCell else { fatalError("cannot create new cell") }
                cell.headerLabel.text = "Country"
                cell.descriptionLabel.text = country.name
                let screenWidth = collectionView.frame.size.width
                cell.widthConstraint.constant = (screenWidth/2.0) - (2 * 16.0)
                return cell
        }
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        performSearch(searchQuery: nil)
    }
    
    func performSearch(searchQuery: String?) {
        let filteredCountries: [Country]
        if let searchQuery = searchQuery, !searchQuery.isEmpty {
            filteredCountries = countries.filter { $0.contains(query: searchQuery) }
        } else {
            filteredCountries = countries
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, Country>()
        snapshot.appendSections([.main])
        snapshot.appendItems(filteredCountries, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension CollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        performSearch(searchQuery: searchText)
    }
}
