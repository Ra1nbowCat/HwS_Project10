//
//  ViewController.swift
//  Project1
//
//  Created by Илья Лехов on 18.04.2022.
//

import UIKit

//class ViewController: UITableViewController {
//
//    var pictures = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title = "Storm Viewer"
//        navigationController?.navigationBar.prefersLargeTitles = true
//
//        performSelector(inBackground: #selector(loadingList), with: nil)
//    }
//
//    @objc func loadingList() {
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//        let items = try! fm.contentsOfDirectory(atPath: path)
//
//        for item in items {
//            if item.hasPrefix("nssl"){
//                pictures.append(item)
//            }
//        }
//
//        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pictures.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
//        pictures.sort()
//        cell.textLabel?.text = "Picture \(pictures.firstIndex(of: pictures[indexPath.row])! + 1) of \(pictures.count)"
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
//            vc.selectedImage = pictures[indexPath.row]
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }
//}

class ViewController: UICollectionViewController {
    var pictures = [String]()

    override func viewDidLoad() {
            super.viewDidLoad()

            title = "Storm Viewer"
            navigationController?.navigationBar.prefersLargeTitles = true
        
            performSelector(inBackground: #selector(loadingList), with: nil)
        }
    
        @objc func loadingList() {
            let fm = FileManager.default
            let path = Bundle.main.resourcePath!
            let items = try! fm.contentsOfDirectory(atPath: path)
    
            for item in items {
                if item.hasPrefix("nssl"){
                    pictures.append(item)
                }
            }
    
            collectionView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Weather", for: indexPath) as? WeatherCell else {
            fatalError("Error")
        }
                pictures.sort()
                cell.weatherLabel.text = "Picture \(pictures.firstIndex(of: pictures[indexPath.row])! + 1) of \(pictures.count)"
                return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                    vc.selectedImage = pictures[indexPath.row]
                    navigationController?.pushViewController(vc, animated: true)
                }
    }
}
