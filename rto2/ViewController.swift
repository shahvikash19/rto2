//
//  ViewController.swift
//  rto2
//
//  Created by Vikas Hareram Shah on 20/12/23.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var label: UILabel!
   
    var image = ["question.png","mastery.png","score.png","youtube.png"]
    var imgname = ["Question Bank","Practice","Exam","Video Tutorial"]
   
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate=self
        collectionView.dataSource=self
    }


}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainPG", for: indexPath) as! MainPG
        cell.layer.cornerRadius = 20
        
        cell.layer.shadowOffset = CGSizeMake(0,3)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
        cell.viewHome.layer.cornerRadius = 10
//        let hexcolour = colourarr[indexPath.row]
//        if  let colour = UIColor(hex: hexcolour){
//            cell.backgroundColor = colour
//
//        }
        cell.imageView.image = UIImage(named: image[indexPath.row])
        cell.labelMPG.text = imgname[indexPath.row]
        
        
        cell.transform = CGAffineTransform(scaleX: 0, y: 0)
                UIView.animate(withDuration: 1, animations: {
                    cell.transform = CGAffineTransform(scaleX: 1, y:1)
                })
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader{
//            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
//            return view
//        }else{
//            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)
//            return view
//        }
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 90, left: 50, bottom: 30, right: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(identifier: "QuestionBank") as! QuestionBank
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = storyboard?.instantiateViewController(identifier: "PracticeVC") as! PracticeVC
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = storyboard?.instantiateViewController(identifier: "ExamVC") as! ExamVC
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = storyboard?.instantiateViewController(identifier: "VideoVC") as! VideoVC

            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            print("error")
        }
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width=((collectionView.frame.width - 20) / 1)
//        let height = width/4
        return CGSize(width: 280, height: 120)
    }
    
}

