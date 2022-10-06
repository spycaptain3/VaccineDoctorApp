//
//  SecondPageViewController.swift
//  VaccineDoctorApp
//
//  Created by Deepak Gupta on 24/08/22.
//

import UIKit

class SecondPageViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let childName:[String]=["Dev Choudhary","Aman","Ram","Rahul","Rohan"]
    
    let childImages:[String]=["doctorImage","doctorImage","doctorImage","doctorImage","doctorImage"]
    
    
    @IBAction func details(_ sender: Any) {
        
        
        let fivePage = (self.storyboard?.instantiateViewController(withIdentifier: "thirdPageViewController")as?thirdPageViewController)!
        
     //   fivePage.entermobileNumber = MobileNumber!
        
        self.navigationController?.pushViewController(fivePage, animated: true)
    }
    
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // appointmentsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SecondPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.myImage.image = UIImage(named: childImages[indexPath.row])
        cell.nameChild.text = childName[indexPath.row]
        
        cell.myImage.layer.masksToBounds = true
        cell.myImage.layer.cornerRadius = cell.myImage.frame.height/2

        
//        cell.layer.cornerRadius = 10
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.gray.cgColor
//        cell.layer.shadowOpacity = 20
//        cell.layer.shadowRadius = 20
        cell.layer.cornerRadius = cell.frame.height/8
                    cell.layer.backgroundColor = UIColor.white.cgColor
                    cell.layer.shadowColor = UIColor.gray.cgColor
                    cell.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
                    cell.layer.shadowRadius = 7.0
                    cell.layer.shadowOpacity = 0.5
                    cell.layer.masksToBounds = false

        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width)/2
        return CGSize(width: size, height: size)
    }
}


/*
 
 import UIKit


 import Foundation

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
     let vaccineType, vaccineCode, name, fromAge: String
     let toAge, durationType: String

     enum CodingKeys: String, CodingKey {
         case metadata = "__metadata"
         case vaccineType = "VaccineType"
         case vaccineCode = "VaccineCode"
         case name = "Name"
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

 class ViewController: UIViewController {
     
     @IBOutlet var vaccineType: UILabel!
     @IBOutlet var vaccineCode: UILabel!
     @IBOutlet var name: UILabel!
     @IBOutlet var fromAgeToAge: UILabel!
     @IBOutlet var duration: UILabel!
     
    
     override func viewDidLoad() {
         super.viewDidLoad()

         // Do any additional setup after loading the view.
         //   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
         fetchData()
     }
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
                 let name = decodedData.d.results[0].name
                 let age = "\(decodedData.d.results[0].fromAge)-\(decodedData.d.results[0].toAge)"
                 DispatchQueue.main.async {self.fromAgeToAge.text = age
                 self.name.text = name
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

     /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */

 }
 */
