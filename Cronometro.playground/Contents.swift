import UIKit
import PlaygroundSupport

class CronoViewController: UIViewController{
    
    var labelSeconds: String?
    var labelMinutes: String?
    var labelHoures: String?
    var timer:Timer?
    var count = 0
    var seconds = "00"
    var minutes = "00"
    var houres = "00"
   //var label = UILabel?
    let labelChronoHoure = UILabel()

    var run = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "Chronometer"
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        
        
        
        //LabelHoure
        
                labelChronoHoure.font = UIFont.systemFont(ofSize: 80)
        labelChronoHoure.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelChronoHoure.text = houres
        view.addSubview(labelChronoHoure)
        labelChronoHoure.translatesAutoresizingMaskIntoConstraints = false
        
        
        // label minutes
        let labelChronoMinutes = UILabel()
        labelChronoMinutes.font = UIFont.systemFont(ofSize: 80)
        labelChronoMinutes.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelChronoMinutes.text = houres
        view.addSubview(labelChronoMinutes)
        labelChronoMinutes.translatesAutoresizingMaskIntoConstraints = false
        
        
        //label seconds
        
        let labelChronoSeconds = UILabel()
        labelChronoSeconds.font = UIFont.systemFont(ofSize: 80)
        labelChronoSeconds.textColor = .black
        labelChronoSeconds.text = houres
        view.addSubview(labelChronoSeconds)
        labelChronoSeconds.translatesAutoresizingMaskIntoConstraints = false
        
        
        //label two pontis bettwen minutes and seconds
        
        let labelPMinutesSeconds = UILabel()
        labelPMinutesSeconds.font = UIFont.systemFont(ofSize:80)
        labelPMinutesSeconds.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelPMinutesSeconds.text = ":"
        view.addSubview(labelPMinutesSeconds)
        labelPMinutesSeconds.translatesAutoresizingMaskIntoConstraints = false
        
        //label two points bettwen houres and minutes
        
        let labelPHouresMinutes = UILabel()
        labelPHouresMinutes.font = UIFont.systemFont(ofSize: 80)
        labelPHouresMinutes.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelPHouresMinutes.text = ":"
        view.addSubview(labelPHouresMinutes)
        labelPHouresMinutes.translatesAutoresizingMaskIntoConstraints = false
        
        //Button Start
        let startButton = UIButton(type: .system)
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        startButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 10
        startButton.contentEdgeInsets = UIEdgeInsetsMake(25, 200, 25, 200)
        startButton.addTarget(self, action: #selector(funChronometre(_:)), for: .touchUpInside)
        startButton.tag = 1
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Button Reset
        let resetButton = UIButton(type: .system)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        resetButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        resetButton.clipsToBounds = true
        resetButton.layer.cornerRadius = 10
        resetButton.contentEdgeInsets = UIEdgeInsetsMake(25, 200, 25, 200)
        resetButton.addTarget(self, action: #selector(funChronometre), for: .touchUpInside)
        startButton.tag = 1
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        labelSeconds = labelChronoHoure.text
        labelMinutes = labelChronoHoure.text
        labelHoures = labelChronoHoure.text
        
        
        //Layout
        
        NSLayoutConstraint.activate([
            
            
            labelChronoSeconds.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            labelChronoSeconds.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260),
            
            labelChronoMinutes.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            labelChronoMinutes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            
            
            labelChronoHoure.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            labelChronoHoure.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            labelPHouresMinutes.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            
            labelPHouresMinutes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            
            labelPMinutesSeconds.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            
            labelPMinutesSeconds.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 240),
            
            
            
            startButton.topAnchor.constraint(equalTo: labelPMinutesSeconds.bottomAnchor, constant: 2),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            resetButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 2),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            
            
            ])
    }
    @objc func funChronometre(_ sender: UIButton){
        
        let counte = labelSeconds
        if let intVer = Int(counte!){
            let soma = 1 + intVer
            let somaString = "\(soma)"
            labelSeconds = somaString
            seconds = labelSeconds!
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runing), userInfo: nil, repeats: true)
            
        }
    }
    
    @objc func runing(_ sender: UIButton){
        
       /* print("foo")
        
        if(run == true){
            print("faa")
            seconds = "00"
            minutes = "00"
            
        }else if(run == false){
            while run == false {
                let counte = labelSeconds
                print("fuu")
                if let intVer = Int(counte!) {
                    print("fii")
                    let soma = 1 + intVer
                    let somaString = "\(soma)"
                    labelSeconds = somaString
                    seconds = labelSeconds!
                    print()*/
                    count = count + 1
                    self.labelChronoHoure.text = "\(count)"
                            // labelChronoHoure.text =
               }
      }

func timeString(time:TimeInterval) -> String{

    let hours = Int (time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    return String(format:"%02f:%2f:%02f", hours, minutes, seconds)
    

}

class TimeViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Timer"
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

class MyTabBarController: UITabBarController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let primeiraViewController = UINavigationController(rootViewController: CronoViewController())
        let tabBarItemFirst = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        let segundaViewController = UINavigationController(rootViewController: CronoViewController())
        let tabBarItemScond = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        self.viewControllers = [primeiraViewController, segundaViewController]
    }
}




PlaygroundPage.current.liveView = CronoViewController()
