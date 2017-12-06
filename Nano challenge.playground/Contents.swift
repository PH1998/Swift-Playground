import UIKit
import PlaygroundSupport

// Segunda classe
class SecondViewController: UIViewController {
    public var scrollView = UIScrollView()
    public var labelText = ""
    public var image: UIImage?
    override func loadView() {
        super.loadView()
        scrollView.frame = self.view.bounds
        scrollView.contentSize =  CGSize(width: 1900, height: 520)
        
        scrollView.isPagingEnabled = true
        scrollView.flashScrollIndicators()

        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false
        
        self.view.addSubview(scrollView)
        
        let label = UILabel()
        label.text = labelText
        label.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
        
        scrollView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let imageView = UIImageView (image: image)
        
        scrollView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // Layout da Segunda classe
        
            NSLayoutConstraint.activate([
                
                self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.scrollView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor),
                self.scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
                self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                
                
                label.centerXAnchor.constraint(equalTo:scrollView.centerXAnchor),
                label.centerYAnchor.constraint(equalTo:scrollView.centerYAnchor),
                
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
                imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 0),
                imageView.widthAnchor.constraint(equalToConstant: 1900),
                imageView.heightAnchor.constraint(equalToConstant: 300),
                
                
                
                ])
            
 
    }
}

// Classe principal
class FirstViewController : UIViewController {
    
    override func loadView() {
        super.loadView()
        // UI dos botões 
        self.view.backgroundColor = .white
        
        let botaoPrincipal = UIButton(type: .custom)
        botaoPrincipal.setImage(UIImage(named: "IMG_0053.JPG"), for: .normal);
        
        botaoPrincipal.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        botaoPrincipal.tag = 0
        
        view.addSubview(botaoPrincipal)
 
        let button1 = UIButton(type: .system)
        button1.setTitle("Homem Aranha", for: .normal)
        button1.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button1.tag = 1
        button1.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        view.addSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("Batman", for: .normal)
        button2.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button2.tag = 2
        button2.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button2)
        
        let button3 = UIButton(type: .system)
        button3.setTitle("DeadPool", for: .normal)
        button3.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button3.tag = 3
        button3.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button3)
        
        let button4 = UIButton(type: .system)
        button4.setTitle("Flash", for: .normal)
        button4.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button4.tag = 4
        button4.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button4)
        // Layout Classe principal
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        botaoPrincipal.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            botaoPrincipal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            botaoPrincipal.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: -150),
            
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 10),
            
            button4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 10)
            
            ])
    }
    // função para imprimir as imagens e textos 
    @objc func openWithNavigation(sender: UIButton) {
        let newVC = SecondViewController()
        switch sender.tag {
        case 0: 
            newVC.labelText = "                                                                                                                                                      A Marvel é um dos universos mais conhecidos do mundo por ter personagens como Homem Aranha,Xmen,Hulk.                                            DC um universo totalmente diferente com herois tão  poderoso quanto a marvel" 
            newVC.image = #imageLiteral(resourceName: "IMG_0043.JPG")
        case 1: 
            newVC.labelText = "                                                                                                                                                                            Homem Aranha um personagem marcado pela marvel por sua popularidade e poderes de aranha                                    O Homem Aranha tem multiuniversos o que permite ter uma visão  maior aranhas diferentes"
            newVC.image = #imageLiteral(resourceName: "IMG_0056.PNG") 
        case 2:
            newVC.labelText = "                                                                                                                                                                     O Batman é um famoso personagem da DC que defende as ruas de Gothan e do Mundo.Porem ...                                               O Coringa fará  de tudo para acabar com os planos do Morcego e do mundo."
            newVC.image = #imageLiteral(resourceName: "IMG_0045.JPG") 
        case 3:
            newVC.labelText = "                                                                                                                                                          O DeadPool é um mercenario louco que apenas faz as suas missões  com propositos pessoais bizarros.                                            Ele é um dos pouco personagens de quadrinho que quebrou a quarta parede"
            newVC.image = #imageLiteral(resourceName: "IMG_0046.JPG") 
        case 4:
            newVC.labelText = "                                                                                                                                                                                           Flash é o velocista mais famoso da DC alcançando velocidades inimagináveis                                                                 O Flash ele é tão  veloz que consegue ultrapassar o espaço e tempo"
            newVC.image = #imageLiteral(resourceName: "IMG_0047.JPG") 
default:
            break
        }
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
    
}

let firstViewController = FirstViewController()

PlaygroundPage.current.liveView = UINavigationController(rootViewController: firstViewController)


