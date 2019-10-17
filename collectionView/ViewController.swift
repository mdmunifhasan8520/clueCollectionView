//
//  ViewController.swift
//  collectionView
//
//  Created by Md Munif Hasan on 17/10/19.
//  Copyright © 2019 Md Munif Hasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    

    @IBOutlet weak var clueCollectionView: UICollectionView!
    
  
    
    var clueAlphabet = ["A", "B", "C","D","E"]
    var userAnswer = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
  

}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    //MARK: collection view datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clueAlphabet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.clueAlphabetLabel.text = clueAlphabet[indexPath.item]
        return cell
    }
    //MARK: collection view delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        userAnswer.append(clueAlphabet[indexPath.item])
        print("Selected item:\(indexPath.item)")
        print("userAnswer:\(userAnswer)")
        cell?.isHidden = true
    }
}
