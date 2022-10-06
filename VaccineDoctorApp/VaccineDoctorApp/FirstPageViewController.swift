//
//  FirstPageViewController.swift
//  VaccineDoctorApp
//
//  Created by Deepak Gupta on 27/08/22.
//

import UIKit
import Foundation
//import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif



// MARK: - Welcome
struct Welcome: Codable {
    let d: D
}

// MARK: - D
struct D: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let metadata: Metadata
    let vaccineType, vaccineCode, Name, fromAge: String
    let toAge, durationType: String

    enum CodingKeys: String, CodingKey {
        case metadata = "__metadata"
        case vaccineType = "VaccineType"
        case vaccineCode = "VaccineCode"
        case Name = "Name"
        case fromAge = "FromAge"
        case toAge = "ToAge"
        case durationType = "DurationType"
    }
}

// MARK: - Metadata
struct Metadata: Codable {
    let id, uri: String
    let type: String
}


class FirstPageViewController: UIViewController {
    
  //  @IBOutlet var vaccineType: UILabel!
  //  @IBOutlet var vaccineCode: UILabel!
   // @IBOutlet var name: UILabel!
  //  @IBOutlet var fromAgeToAge: UILabel!
  //  @IBOutlet var duration: UILabel!
    
   
    
   // @IBOutlet var vaccineType: UILabel!
    @IBOutlet var vaccineCode: UILabel!
  //  @IBOutlet var name: UILabel!
   // @IBOutlet var fromAgeToAge: UILabel!
    @IBOutlet var duration: UILabel!
    
    
    @IBOutlet weak var fromAgeToAge: UILabel!
        
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var due: UILabel!
    @IBOutlet weak var date: UILabel!
        
    @IBOutlet weak var vaccineType: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    
    @IBOutlet weak var child: UILabel!
    
    //var t:String=""
    
    //var liveData = CovidCases
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height/2
        
        

        secondImageView.layer.cornerRadius = secondImageView.frame.height/8
        secondImageView.layer.backgroundColor = UIColor.white.cgColor
        secondImageView.layer.shadowColor = UIColor.black.cgColor
        secondImageView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        secondImageView.layer.shadowRadius = 7.0
        secondImageView.layer.shadowOpacity = 0.5
        secondImageView.layer.masksToBounds = false
        
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_VACCINES_CDS/ZCDS_Vaccines?$format=json")!,timeoutInterval: Double.infinity)
        request.addValue("Basic Q1BJQ19ET0NTOkRvd24xb2Fk", forHTTPHeaderField: "Authorization")
        request.addValue("SAP_SESSIONID_NPL_001=bxlNGZHwjbNW5awZQoqWlBrgSico-hHttMoAFjw6Bsk%3d; sap-usercontext=sap-client=001", forHTTPHeaderField: "Cookie")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            print(String(data: data, encoding: .utf8)!)
            
       //     var usrdetail = try JSONDecoder().decode(Result.self, from: usrdata);
     //       DispatchQueue.main.async {
   //             self.Name.text = String(usrdetail.Name)
       //     }

            
            
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()



  //      fetchData()

        // Do any additional setup after loading the view.
    }
    
    
//    func stats() {
////        URLSession.shared.dataTask(with: URL(string:
////            "http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_VACCINES_CDS/ZCDS_Vaccines?$format=json")!, completionHandler: { data, response, error in
////
////            guard let usrdata = data, error==nil else
////            {
////                return
////            }
////
//        var request = URLRequest(url: URL(string: "http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_VACCINES_CDS/ZCDS_Vaccines?$format=json")!,timeoutInterval: Double.infinity)
//        request.addValue("Basic Q1BJQ19ET0NTOkRvd24xb2Fk", forHTTPHeaderField: "Authorization")
//        request.addValue("SAP_SESSIONID_NPL_001=bxlNGZHwjbNW5awZQoqWlBrgSico-hHttMoAFjw6Bsk%3d; sap-usercontext=sap-client=001", forHTTPHeaderField: "Cookie")
//
//        request.httpMethod = "GET"
//
//
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//              guard let data = data else {
//                print(String(describing: error))
//                semaphore.signal()
//                return
//              }
//
//
//            var usrdetail = try JSONDecoder().decode(Result.self, from: usrdata);
//            DispatchQueue.main.async {
//                self.Name.text = String(usrdetail.Name)
//            }
//
//
//        }).resume()
    
    
    @IBAction func addChild(_ sender: Any) {
        let fivePage = (self.storyboard?.instantiateViewController(withIdentifier: "SecondPage_ViewController")as?SecondPage_ViewController)!
        
     //   fivePage.entermobileNumber = MobileNumber!
        
        self.navigationController?.pushViewController(fivePage, animated: true)
    }
    
    
    @IBAction func viewAll(_ sender: Any) {
        
        
        let fivePage = (self.storyboard?.instantiateViewController(withIdentifier: "SecondPageViewController")as?SecondPageViewController)!
        
     //   fivePage.entermobileNumber = MobileNumber!
        
        self.navigationController?.pushViewController(fivePage, animated: true)
        
    }
    
        
    }
    
    
 /*
    func fetchData() {
       let user = "CPIC_DOCS"
        let pass = "Down1oad"
        let loginString = String(format:"%@:%@", user, pass)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        let url = URL(string: "http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_VACCINES_CDS/ZCDS_Vaccines?$format=json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
//        let urlConnection = NSURLConnection(request: request, delegate: self)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {do
            { let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
                let Name = decodedData.d.results[0].Name
                let age = "\(decodedData.d.results[0].fromAge)-\(decodedData.d.results[0].toAge)"
                DispatchQueue.main.async {self.fromAgeToAge.text = age
                self.Name.text = Name
                self.vaccineCode.text = decodedData.d.results[0].vaccineCode
                self.vaccineType.text = decodedData.d.results[0].vaccineType
                self.duration.text = decodedData.d.results[0].durationType
                }
            }
                
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Couldn't print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        
        }.resume()
    }

  */

