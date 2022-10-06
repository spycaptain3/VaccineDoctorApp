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

