import UIKit
import PlaygroundSupport


class TextFieldViewController : UIViewController, UITextFieldDelegate {
    
    var textField : UITextField!
    var textField2 : UITextField!
    var textFiel3 : UITextField!
    var button : UIButton!
    
    
    override func loadView() {
        // Array nomes
        var titulos = ["Preço", "Gasolina", "Álcool", "Relação Eta./Gas.: "]
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        var label = UILabel()
        label.text = titulos[0]
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
        
        let label1 = UILabel()
        label1.text = titulos[1]
        view.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ])
        
        textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.text = ""
        
        
        let label2 = UILabel()
        label2.text = titulos[2]
        view.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label2.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ])
        
        
        //Button na tela
        button = UIButton(type: .system)
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.tintColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        button.backgroundColor = #colorLiteral(red: 0.600000023841858, green: 0.600000023841858, blue: 0.600000023841858, alpha: 1.0)
        button.addTarget(self, action: #selector(updateLabel), for: .touchUpInside)
        
        
        textField2 = UITextField()
        textField2.borderStyle = .roundedRect
        textField2.text = ""
        
        let label3 = UILabel()
        label3.text = titulos[3]
        view.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label3.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            label3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ])
        
        
        let label4 = UILabel()
        label4.text = "oi"
        view.addSubview(label4)
        label4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label4.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            label4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170),
            ])
        
        let label5 = UILabel()
        label5.text = "Resultado"
         UIFont.boldSystemFont(ofSize: 50)
        label5.layer.borderColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        label5.adjustsFontSizeToFitWidth

        label5.layer.cornerRadius = 5
        label5.layer.masksToBounds = true
        label5.layer.borderWidth = 5
        
        view.addSubview(label5)
        label5.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label5.topAnchor.constraint(equalTo: view.topAnchor, constant: 420),
            label5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170),
            ])
        
        
        view.addSubview(textField)
        view.addSubview(textField2)
        view.addSubview(button)
        
     
        
        label = UILabel()
        view.addSubview(label)
        
        
        
        self.view = view
        
        // Layout
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        
        textField2.translatesAutoresizingMaskIntoConstraints = false
        let margins2 = view.layoutMarginsGuide
        
        button.translatesAutoresizingMaskIntoConstraints = false
        let margins3 = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            
            textField.topAnchor.constraint(equalTo: margins.topAnchor, constant: 85),
            textField.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20),
            
            
            textField2.topAnchor.constraint(equalTo: margins2.topAnchor, constant: 155),
            textField2.leadingAnchor.constraint(equalTo: margins2.leadingAnchor, constant: 20),
            textField2.trailingAnchor.constraint(equalTo: margins2.trailingAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: margins3.topAnchor, constant: 210),
            button.leadingAnchor.constraint(equalTo: margins3.leadingAnchor, constant: 130),
            button.trailingAnchor.constraint(equalTo: margins3.trailingAnchor, constant: -150)
            ])
        
        textField2.addTarget(self, action: #selector(updateLabel), for: UIControlEvents.editingChanged)
        
       
        
        updateLabel()
        

        self.view = view
    }
    
    @objc func updateLabel() {
        
    }
}
PlaygroundPage.current.liveView = TextFieldViewController()

