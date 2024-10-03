//
//  ViewController.swift
//  BM Excersise
//
//  Created by Ahmed El Gndy on 03/10/2024.
//

import UIKit

class MoviesViewController: UIViewController,UITabBarControllerDelegate {
    
    @IBOutlet var headerTitle: UILabel!
    @IBOutlet var tabBar: UITabBar!
    @IBOutlet var moviesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}
extension MoviesViewController:UITabBarDelegate {
        func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            if let index = tabBar.items?.firstIndex(of: item) {
                print("Selected tab index: \(index)")
                handleTabSelection(index: index)
            }
        }
        func setUpTabBar() {
            tabBar.delegate = self
            tabBar.selectedItem = tabBar.items?.first
            handleTabSelection(index: 0)
        }
        
        func handleTabSelection(index: Int) {
            switch index {
            case 0:
                headerTitle.text = "head number 1 "
            case 1:
                headerTitle.text = "header number 2"
            case 2:
                headerTitle.text = "header number 3"
            default:
                break
            }
        }
    }


    extension MoviesViewController:UICollectionViewDelegate ,UICollectionViewDataSource {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            return cell
        }
    }


    extension MoviesViewController:UICollectionViewDelegateFlowLayout {
        //MARK: items in the row
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let padding: CGFloat = 10 //padding
            let itemsPerRow: CGFloat = 3// number of items
            let totalPadding = padding * (itemsPerRow + 1) // padding between items and edges
            let availableWidth = collectionView.frame.width - totalPadding
            let itemWidth = availableWidth / itemsPerRow
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }



