//
//  QuestionBank.swift
//  rto2
//
//  Created by Vikas Hareram Shah on 20/12/23.
//

import UIKit
import Alamofire
import Kingfisher

class QuestionBank: UIViewController {
    
    var arr = [NSDictionary]()
    var arr1 = [NSDictionary]()
    

    @IBOutlet weak var tabelviewQ: UITableView!
    @IBOutlet weak var SegMent: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.title = ""
        self.navigationItem.title = "Question Bank"
        tabelviewQ.delegate=self
        tabelviewQ.dataSource=self
//        firstApi()
//         secondApi()
        // Do any additional setup after loading the view.
        
    }
    
    func firstApi() {
        let url = "https://mapi.trycatchtech.com/v3/rto/text_question_list"
        AF.request(url).responseJSON{ data in
            switch data.result{
            case .success(let succ):
                if let json = succ as? [NSDictionary]{
                    self.arr = json
                }
                
                DispatchQueue.main.async {
                    self.tabelviewQ.reloadData()
                }
            case.failure(let error):
                print (error)
            }
        
        }
        
    }
    
    func secondApi() {
        let url = "https://mapi.trycatchtech.com/v3/rto/image_question_list"
        AF.request(url).responseJSON{ data in
            switch data.result{
            case .success(let succ):
                if let json = succ as? [NSDictionary]{
                    self.arr1 = json
                }
                
                DispatchQueue.main.async {
                    self.tabelviewQ.reloadData()
                }
            case.failure(let error):
                print (error)
            }
        
        }
        
        
    }
    

    @IBAction func ssegmentact(_ sender: UISegmentedControl) {
        print("seggg \(sender.selectedSegmentIndex)")
        if sender.selectedSegmentIndex == 0 {
            firstApi()
        } else {
            secondApi()
        }
        
        
        
    }
    
}
extension QuestionBank: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if SegMent.selectedSegmentIndex == 0 {
            return arr.count
        }else {
            return arr1.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if SegMent.selectedSegmentIndex == 0 {
            let cell = tabelviewQ.dequeueReusableCell(withIdentifier: "QuestionssTVC", for: indexPath) as! QuestionssTVC
            cell.labelQ1.text = arr[indexPath.row].value(forKey: "question") as? String
            cell.labelQ2.text = arr[indexPath.row].value(forKey: "answer") as? String
          
            return cell
        } else {
            let cell = tabelviewQ.dequeueReusableCell(withIdentifier: "ImageTVC", for: indexPath) as! ImageTVC
            if let img = arr1[indexPath.row].value(forKey: "image") as? String {
//                cell.imageviewQ.image = UIImage(named: img)
                let url = URL(string: img)
                cell.imageviewQ.kf.setImage(with: url)
            }
            cell.imglabel.text = arr1[indexPath.row].value(forKey: "name") as? String
            return cell
            
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}



