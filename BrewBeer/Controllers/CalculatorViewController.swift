//
//  CalculatorViewController.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 13/10/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var titleLabel: UILabel!
    var resultLabel: UILabel!
    var currentAnswer: UITextField!
    let resp = UITextField()
    var sendButton = [UIButton]()
    var txt: UILabel!
    
    let abv: Double = 0.0
    
    let params = [
        "og": "1.066",
        "fg": "1.014"
    ]
    
    var valores: [String] = []
    
    let originalGravity: UITextField = UITextField(frame: CGRect(x: 40, y: 230, width: 300.00, height: 40.00))
    let finalGravity: UITextField = UITextField(frame: CGRect(x: 40, y: 300, width: 300.00, height: 40.00))

    override func viewDidLoad() {
        super.viewDidLoad()
    
        txt = UILabel()
        txt.text = "Calculates alcohol by volume (abv) in percentage from final and original gravity. To use plato or brix units for gravity, add the °P or °Bx after the value."
        txt.numberOfLines = 0

        view = UIView()
        view.backgroundColor = .systemCyan
        
        view.addSubview(txt)
        displayCalculatorAbvFields(textField: originalGravity, placeHolder: "Original gravity")
        displayCalculatorAbvFields(textField: finalGravity, placeHolder: "Final gravity")

//        let valor = originalGravity.text
//        print(valor ?? "")
        valores.append(originalGravity.text!)
        print(valores[0])
        
        print(originalGravity)
        
        resp.placeholder = "OG"
        view.addSubview(resp)
                
        calculateAlcooholByVolume(dado: "Dado", completionHandler: { abv in
            DispatchQueue.main.async {
                self.resultLabel.text = "Alcohol by volume (ABV) = \n\(abv ?? 0)"
            }
        })
        
//        calculateAlcooholByVolume(dado: "dado") { abv in // trailing closure
//            self.resultLabel.text = "abv: \(abv)"
//        }
        
        resultLabel = UILabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        txt.translatesAutoresizingMaskIntoConstraints = false

        resultLabel.textAlignment = .left
        resultLabel.numberOfLines = 0
        //resultLabel.text = "Alcohol by volume is 0 \(abv)"
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            
            txt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: -10),
            txt.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            txt.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            resultLabel.topAnchor.constraint(equalTo: txt.bottomAnchor,constant: 150),
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
        ])
    }
    
    func displayCalculatorAbvFields(textField: UITextField, placeHolder: String) {
        textField.placeholder = placeHolder
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.backgroundColor = .white
        textField.textColor = UIColor.black
        textField.layer.shadowRadius = 3.0
        textField.keyboardType = .numberPad
        
        self.view.addSubview(textField)
    }
    
    private func calculateAlcooholByVolume(dado: String, completionHandler: @escaping (Double?) -> Void) {
//        let params = [
//            "og": "1.066",
//            "fg": "1.014"
//        ]
        
        guard let url = URL(string: "https://rustybeer.herokuapp.com/calculate/abv") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        
        let task = URLSession.shared.dataTask(
            with: request,
            completionHandler: {
                data, response, error in
                if let error = error {
                    print("The error was: \(error.localizedDescription)")
                } else {
                    //let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                    if let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Double] {
                        print("response json is \(jsonRes)")
                        let abv = jsonRes["abv"]
                        completionHandler(abv)
                    }
                }
            }
        )
        
        task.resume()
    }
}
