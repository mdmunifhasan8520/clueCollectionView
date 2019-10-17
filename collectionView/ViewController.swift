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
    
    @IBOutlet weak var answerCollectionView: UICollectionView!
    
    
    var clueAlphabet = ["A","B","C","D","E","Z","Q","R"]
    var originalAnswer = [""]
    var userAnswer = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
  

}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    //MARK: collection view datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return clueAlphabet.count
        
        if collectionView == self.answerCollectionView {
            return originalAnswer.count
        } else {
            return clueAlphabet.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.answerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCell", for: indexPath) as! AnswerCollectionViewCell
            cell.answerAlphabetLabel.text = originalAnswer[indexPath.item]
            //cell.answerAlphabetLabel.text = ""
           
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClueCell", for: indexPath) as! ClueCollectionViewCell
            cell.clueAlphabetLabel.text = clueAlphabet[indexPath.item]
            return cell
        }
       
    }
    //MARK: collection view delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.answerCollectionView {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.isHidden = true
            print("user answer indexPath.item\(indexPath.item)")
            //clueAlphabet[indexPath.item]
            
        } else {
            let cell = collectionView.cellForItem(at: indexPath)
            
            userAnswer.append(clueAlphabet[indexPath.item])
            cell?.isHidden = true
            //print("userAnswer:\(userAnswer)")
            updateUI()
            
        }
    }
    
    func updateUI() {
       // print("...updating")
        originalAnswer.removeAll()
        originalAnswer.insert(contentsOf: userAnswer, at: 0)
        self.answerCollectionView.reloadData()
        //print("originalAnswer:\(originalAnswer)")
    }
}
