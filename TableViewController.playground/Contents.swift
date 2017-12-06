//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//Model for TableView
class Category {

    var name: String
    
    init(name:String)
    
    {
        self.name = name // Constructor where name is parameter
    }
}

class FormViewController: UIViewController{

    let sectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        label.text = "Indice da Seção"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Nome da categoria"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    

    let sectionTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    
    }()
    let categoryTextField: UITextField = {
        let categoryField = UITextField()
        categoryField.borderStyle = .roundedRect
        return categoryField

    
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1) // Set my background color
        
        //Setup the secion stack view
        let sectionStackView = UIStackView(frame: self.view.bounds)
        sectionStackView.axis = .horizontal
        sectionStackView.distribution = .fillEqually
        sectionStackView.alignment = .fill
        sectionStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
        
        // Inserting elements into my section stack view
        sectionStackView.addArrangedSubview(sectionLabel)
        sectionStackView.addArrangedSubview(sectionTextField)
        
        
        let categoryStackView = UIStackView(frame: self.view.bounds)
        categoryStackView.axis = .horizontal
        categoryStackView.distribution = .fillEqually
        categoryStackView.alignment = .fill
        categoryStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        categoryStackView.addArrangedSubview(categoryLabel)
        categoryStackView.addArrangedSubview(categoryTextField)
        
        let formStackView = UIStackView(frame: CGRect (x:10 , y:10, width: self.view.frame.width - 20, height:500))
        
        formStackView.axis = .vertical
        formStackView.distribution = .fillEqually
        formStackView.alignment = .fill
        formStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        formStackView.addArrangedSubview(sectionStackView)
        formStackView.addArrangedSubview(categoryStackView)

        
        
        let button = UIButton(type: .roundedRect)
        button.setTitle("SALVAR", for: .normal)
        
        //command to releate the method with the button
        button.addTarget(self, action: #selector(saveCategory), for: .touchUpInside)
        formStackView.addArrangedSubview(button)
    
        
        self.view.addSubview(formStackView)
    }//end of viewDidLoad
    
    //Method to create a category into MyTableViewController
    @objc private func saveCategory(){
        let myTableViewController = self.tabBarController?.viewControllers?.first as! MyTableViewController
        
        
        let section = Int(sectionTextField.text!)
        let categoryName = categoryTextField.text!
        
        myTableViewController.createCategory(section: section!, categoryName: categoryName)
        
    
    }
    
    }//end of FormViewController
    


class MyTableViewController: UITableViewController{

    //Datasource for tableView
    var categoryList = [[Category]]() // Declaration for bidimentional array
    
   //Method to create a new category into my tableView
    func createCategory(section: Int, categoryName: String){
        let newCategory = Category(name: categoryName)
        
        while  (categoryList.count <= section) {
            
            //create new section
            categoryList.append([Category]())

        }
            // add the category into categoryList
            categoryList[section].append(newCategory)
        
self.tableView.reloadData()
        
    }
    override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Category List"
        
        //Creation of Section 0
        categoryList.append([Category]())
        
        //Insert element into section 0
        let category1 = Category(name:"categoria 1")
        
        categoryList[0].append(category1)
        // CategoryList[0][0]
        
        categoryList.append([Category]())
        let category2 = Category(name:"categoria 2")
        categoryList[1].append(category2)
        
        categoryList.append([Category]())
        let category3 = Category(name:"categoria 3")
        categoryList[1].append(category3)
        
        
    }
    
    let label  = UILabel()
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        
        let view = UIView(frame: CGRect (x:10, y: 0, width: tableView.frame.width - 20, height: 44))
    
        let label = UILabel(frame: CGRect (x:10, y: 0, width: tableView.frame.width, height: 44))
        
        label.text = "SeçÃo \(section)"
        view.addSubview(label)
        
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    
        return view
        
        
   
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        if categoryList[section].count == 0{
        
        return 0
        }else{
        return 44
      }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
    return categoryList[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TableCell")
        
        let section = indexPath.section
        let row = indexPath.row
        let category = categoryList[section][row]
        
        cell.textLabel?.text = category.name
        
        return cell
    
    }

    
    }

class MyTabBarControler:UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableViewController = UINavigationController(rootViewController: MyTableViewController())
        let tabBarItem1 = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        tableViewController.tabBarItem = tabBarItem1
        
        
        let formViewController = FormViewController()
        let tabBarItem2 = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
    
        formViewController.tabBarItem = tabBarItem2

        
        self.viewControllers = [tableViewController, formViewController]
    }
}

//PlaygroundPage.current.liveView = MyTableViewController()

PlaygroundPage.current.liveView = MyTabBarControler()
