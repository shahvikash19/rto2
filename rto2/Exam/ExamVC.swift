//
//  ExamVC.swift
//  rto2
//
//  Created by Vikas Hareram Shah on 20/12/23.
//

import UIKit
import Alamofire

class ExamVC: UIViewController {
    
    var ExamArr = [NSDictionary]()
    
    var no = 1
   
    var right = 0
    var wrong = 0
    
    
    var currentIndex = 0

   
    @IBOutlet weak var collectionviewExam: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.title = ""
        self.navigationItem.title = "Exam"
        ExamAPI()
       
    }
    func ExamAPI(){
        let url = "https://mapi.trycatchtech.com/v3/rto/exam_question_list"
        AF.request(url).responseJSON{ data in
            switch data.result{
            case .success(let succ):
                if let json = succ as? [NSDictionary]{
                    self.ExamArr = json
                }
                DispatchQueue.main.async {
                    self.collectionviewExam.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }

    var currentIndexPath: IndexPath = IndexPath(item: 0, section: 0)
    
    @IBAction func option1cell(_ sender: Any) {
        
        let nextItem = currentIndexPath.item + 1
        let nextIndexPath = IndexPath(item: nextItem, section: currentIndexPath.section)
        let option1 = "1"
        let ans = ExamArr[currentIndexPath.item].value(forKey: "answer")!
            // Check if the next cell exists.
            if nextItem < ExamArr.count {
                currentIndexPath = nextIndexPath
                collectionviewExam.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
                if option1 == ans as! String {
                   right = right + 1
                }else{
                    wrong = wrong + 1
                }
            }else{
                if option1 == ans as! String {
                   right = right + 1
                    print("Right:\(right)")
                    print("Wrong:\(wrong)")

                }else{
                    wrong = wrong + 1
                    print("Right:\(right)")
                    print("Wrong:\(wrong)")
                }
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as! resultVC
                self.navigationController?.pushViewController(vc, animated: true)
                vc.resRight = right
                vc.resWrong = wrong

            }
        
        let mybutton = UIButton(type: .system)
        mybutton.setTitle("tap me", for: .normal)
        mybutton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(mybutton)
        mybutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mybutton.centerXAnchor.constraint(equalTo: view.centerXAnchor) , (mybutton.centerYAnchor.constraint(equalTo: view.bottomAnchor))])
    }
    @objc func buttonTapped(){
        print("btn tapped")
    }
    
    @IBAction func option2cell(_ sender: Any) {
        let nextItem = currentIndexPath.item + 1
        let nextIndexPath = IndexPath(item: nextItem, section: currentIndexPath.section)
        let option2 = "2"
        let ans = ExamArr[currentIndexPath.item].value(forKey: "answer")!
            // Check if the next cell exists.
            if nextItem < ExamArr.count {
                currentIndexPath = nextIndexPath
                collectionviewExam.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
                if option2 == ans as! String {
                   right = right + 1
                }else{
                    wrong = wrong + 1
                }
            }else{
                if option2 == ans as! String {
                   right = right + 1
                    print("Right:\(right)")
                    print("Wrong:\(wrong)")

                }else{
                    wrong = wrong + 1
                    print("Right:\(right)")
                    print("Wrong:\(wrong)")
                }
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as! resultVC
                self.navigationController?.pushViewController(vc, animated: true)
                vc.resRight = right
                vc.resWrong = wrong

            }
    }
    @IBAction func option3cell(_ sender: Any) {
        let nextItem = currentIndexPath.item + 1
        let nextIndexPath = IndexPath(item: nextItem, section: currentIndexPath.section)
        let option3 = "3"
        let ans = ExamArr[currentIndexPath.item].value(forKey: "answer")!
            // Check if the next cell exists.
            if nextItem < ExamArr.count {
                currentIndexPath = nextIndexPath
                collectionviewExam.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
                if option3 == ans as! String {
                   right = right + 1
                }else{
                    wrong = wrong + 1
                }
            }else{
                if option3 == ans as! String {
                   right = right + 1
                    print("Right:\(right)")
                    print("Wrong:\(wrong)")

                }else{
                    wrong = wrong + 1
                    print("Right:\(right)")
                    print("Wrong:\(wrong)")
                }
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as! resultVC
                self.navigationController?.pushViewController(vc, animated: true)
                vc.resRight = right
                vc.resWrong = wrong

            }
    }
}
extension ExamVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ExamArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionviewExam.dequeueReusableCell(withReuseIdentifier: "ExamCVC", for: indexPath) as! ExamCVC
        cell.examlbl.text = ExamArr[indexPath.row].value(forKey: "question") as? String
        cell.option1.setTitle(ExamArr[indexPath.row].value(forKey: "option_1") as? String, for: .normal)
        cell.option2.setTitle(ExamArr[indexPath.row].value(forKey: "option_2") as? String, for: .normal)
        cell.option3.setTitle(ExamArr[indexPath.row].value(forKey: "option_3") as? String, for: .normal)
        cell.layer.cornerRadius = 10
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionviewExam.frame.width
        let height = width + 2
        return  CGSize(width: height, height: width)
    }
}
