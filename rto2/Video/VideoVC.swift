//
//  VideoVC.swift
//  rto2
//
//  Created by Vikas Hareram Shah on 20/12/23.
//

import UIKit
import Alamofire

class VideoVC: UIViewController {
    var arr = [NSDictionary]()
    
    @IBOutlet weak var tabelviewV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.title = ""
        self.navigationItem.title = "Video"
        VideoAPi()
        
        

        
    }
    func VideoAPi(){
        let url = "https://mapi.trycatchtech.com/v3/rto/all_video_tutorials"
        AF.request(url).responseJSON{ data in
            switch data.result{
            case .success(let succ):
                if let json = succ as? [NSDictionary]{
                    self.arr = json
                }
                
                DispatchQueue.main.async {
                    self.tabelviewV.reloadData()
                }
            case.failure(let error):
                print (error)
            }
        
        }
                
            }
            
        }
        
    

    

extension VideoVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelviewV.dequeueReusableCell(withIdentifier: "videoTVC", for: indexPath) as! videoTVC
        if let url = URL(string: arr[indexPath.row].value(forKey: "url") as? String ?? ""){
            let request = URLRequest(url: url)
            cell.webKit.load(request)
        }
            
            return cell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
        
    }

