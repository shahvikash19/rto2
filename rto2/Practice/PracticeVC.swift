//
//  PracticeVC.swift
//  rto2
//
//  Created by Vikas Hareram Shah on 20/12/23.
//

import UIKit
import Alamofire


class PracticeVC: UIViewController {
    
    var arrPractice = [NSDictionary]()

    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.title = ""
        self.navigationItem.title = "Practice"
        practiceAPI()
        }
    
    func practiceAPI() {
        let url = "https://mapi.trycatchtech.com/v3/rto/practice_question_list"
        AF.request(url).responseJSON{ data in
            switch data.result{
            case .success(let succ):
                if let json = succ as? [NSDictionary]{
                    self.arrPractice = json
                    print(json)
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case.failure(let error):
                print (error)
            }
        }
    }
}
extension PracticeVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPractice.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "practiceCVC", for: indexPath) as! practiceCVC
        cell.lblPractice.text = arrPractice[indexPath.item].value(forKey: "question") as? String
        cell.btn1.setTitle(arrPractice[indexPath.row].value(forKey: "option_1") as? String, for: .normal)
        cell.btn2.setTitle(arrPractice[indexPath.row].value(forKey: "option_2") as? String, for: .normal)
        cell.btn3.setTitle(arrPractice[indexPath.row].value(forKey: "option_3") as? String, for: .normal)
       
        cell.answerBtn.setTitle("answer :\(arrPractice[indexPath.row].value(forKey: "answer")!)", for: .normal)
        
        return cell
    }
}

extension PracticeVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = width + 10
        return CGSize(width: width, height: height)
    }
}
