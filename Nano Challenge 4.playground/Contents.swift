
import UIKit
import PlaygroundSupport

//Arrays de contatos e seus nomes fonéticos
var contacts = ["Ares", "São Jorge", "Goku", "Kratos", "Zeus","Yudi Ps2","Trakinas","Arrop","Ana Jegue","Zebostola","Pistoleiro Papaco", "Kacét","Criolo Doido", "Jubileu Jones","Ż"]
var contactsFonetico = ["Guerrinha", "Dragao", "kakaroto", "Paizão", "Jaspion", "Bolacha", "Ż"]
var sections : [(index: Int, length: Int, title: String)] = Array()
var contatosVisiveis: Array<String> = []

//Cria os textfields maleáveis
public var textFieldNome: UITextField!
public var textFieldNomeFonetico: UITextField!
public var textFieldSobrenome: UITextField!
public var textFieldTelefone: UITextField!

//Segunda View
class ViewContact: UIViewController {
    
    public var labelTextNome: String?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        
        let labelNome = UILabel()
        labelNome.text = labelTextNome!
        labelNome.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
        view.addSubview(labelNome)
        
        labelNome.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout
        NSLayoutConstraint.activate([
            labelNome.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelNome.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}

//View controller
class addContact: UIViewController, UITextFieldDelegate {
    
    //Tentativa de Utilizar Struct
    public struct addContato {
        var Nome = String()
        var NomeFonetico = String()
        var Sobrenome = String()
        var Numero = String()
    }
    
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //Botão de feito
        let doneBtn = UIBarButtonItem()
        let fontStyle = UIFont(name: "Helvetica", size: 15)
        let att = [NSAttributedStringKey.font: fontStyle]
        
        doneBtn.title = "Done"
        doneBtn.setTitleTextAttributes(att, for: UIControlState.normal)
        doneBtn.setTitleTextAttributes(att, for: UIControlState.highlighted)
        doneBtn.style = UIBarButtonItemStyle.plain
        doneBtn.target = self
        doneBtn.action = #selector(Armazenar)
        
        doneBtn.tintColor = UIColor.blue
        self.navigationItem.rightBarButtonItem = doneBtn
        doneBtn.tag = 1
        
        //Nome na parte de trás do text field
        let placeholder = NSAttributedString(string: "Nome e Sobrenome", attributes:[NSAttributedStringKey.foregroundColor:#colorLiteral(red: 0.600000023841858, green: 0.600000023841858, blue: 0.600000023841858, alpha: 1.0)])
        
        let placeholder3 = NSAttributedString(string: "Nome fonético", attributes:[NSAttributedStringKey.foregroundColor:#colorLiteral(red: 0.600000023841858, green: 0.600000023841858, blue: 0.600000023841858, alpha: 1.0)])
        
        textFieldNome = UITextField()
        textFieldNome.backgroundColor = #colorLiteral(red: 0.803921580314636, green: 0.803921580314636, blue: 0.803921580314636, alpha: 1.0)
        textFieldNomeFonetico = UITextField()
        textFieldNomeFonetico.backgroundColor = #colorLiteral(red: 0.803921580314636, green: 0.803921580314636, blue: 0.803921580314636, alpha: 1.0)
        
        textFieldNome.attributedPlaceholder = placeholder
        textFieldNomeFonetico.attributedPlaceholder = placeholder3
        
        view.addSubview(textFieldNome)
        view.addSubview(textFieldNomeFonetico)
        
        self.view = view
        
        textFieldNome.translatesAutoresizingMaskIntoConstraints = false
        textFieldNomeFonetico.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout
        NSLayoutConstraint.activate([
            
            textFieldNome.topAnchor.constraint(equalTo: view.topAnchor, constant: 85),
            textFieldNome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            textFieldNome.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            textFieldNomeFonetico.topAnchor.constraint(equalTo: textFieldNome.topAnchor, constant: 85),
            textFieldNomeFonetico.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            textFieldNomeFonetico.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
            
            ])
    }
    
    //Função que armazena e da reload na página
    @IBAction func Armazenar (sender: UIButton) {
        
        var Contato = addContato()
        Contato.Nome = textFieldNome.text!
        Contato.NomeFonetico = textFieldNomeFonetico.text!
        
        if Contato.Nome == "" {
            let alert = UIAlertController(title: "Ação Inválida", message:"Preencha ao menos o campo de nome!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Entendido", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        } else {
            contacts.append(Contato.Nome)
            contactsFonetico.append(Contato.NomeFonetico)
            
            Contato.Nome = ""
            Contato.NomeFonetico = ""
            
            let alertController = UIAlertController(title: "Pronto!", message:"Seu contato foi adicionado", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            TableViewController().tableReload()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
        
    }
}

//Table View
class TableViewController : UITableViewController {
    
    @objc func loadList(notification: NSNotification) {
        self.tableView.reloadData()
        self.tableView.reloadSectionIndexTitles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue:"load"), object: nil)
        self.title = "Contatos"
        
        //Botão de adicionar contato
        let plusBtn = UIBarButtonItem()
        let fontStyle = UIFont(name: "Helvetica", size: 20)
        let att = [NSAttributedStringKey.font: fontStyle]
        plusBtn.title = "+"
        plusBtn.setTitleTextAttributes(att, for: UIControlState.normal)
        plusBtn.setTitleTextAttributes(att, for: UIControlState.highlighted)
        plusBtn.style = UIBarButtonItemStyle.plain
        plusBtn.target = self
        plusBtn.action = #selector(openWithNavigation)
        plusBtn.tintColor = UIColor.blue
        self.navigationItem.rightBarButtonItem = plusBtn
        plusBtn.tag = 1
        loadArray()
    }
    
    func loadArray() {
        
        //Ordena o vetor
        contatosVisiveis = contacts
        contatosVisiveis.sort { $0 < $1 }
        var index = 0
        for i in 0 ..< contacts.count{
            let commonPrefix = contatosVisiveis[i].commonPrefix(with: contatosVisiveis[index], options: .caseInsensitive)
            if (commonPrefix.count == 0) {
                let string = contatosVisiveis[index].uppercased()
                let firstCharacter = string[string.startIndex]
                let title = "\(firstCharacter)"
                let newSection = (index: index, length: i - index, title: title)
                sections.append(newSection)
                index = i
            }
        }
    }
    
    func tableReload() {
        sections.removeAll()
        loadArray()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //return sectionsArray.count
        return sections.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].length
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = contatosVisiveis[sections[indexPath.section].index + indexPath.row]
        return cell
    }
    //Coloca titulo na seção
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    //Coloca o texto na Segunda View
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let text = tableView.cellForRow(at: indexPath)?.textLabel?.text else { return }
        let detail = ViewContact()
        detail.labelTextNome = text
        
        navigationController?.pushViewController(detail, animated: true)
    }
    
    //Sidebar
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {return sections.map { $0.title }
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        contacts.remove(at: sections[indexPath.section].index + indexPath.row)
        sections.removeAll()
        loadArray()
        self.tableView.reloadData()
        self.tableView.reloadSectionIndexTitles()
    }
    
    @IBAction func openWithNavigation(sender: UIButton) {
        let newVCaddContact = addContact()
        self.navigationController?.pushViewController(newVCaddContact, animated: true)
    }
    
}

let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = UINavigationController(rootViewController: tableViewController)

