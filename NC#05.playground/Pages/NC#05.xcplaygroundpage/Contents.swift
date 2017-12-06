//GUSTAVO GARCIA LEITE
//NC#05

import UIKit
import PDFKit
import PlaygroundSupport

class ProfileViewController: UIViewController {
    
    public var nameIndex = ""
    
    override func loadView() {
        super.loadView()
        
        if #available(iOSApplicationExtension 11.0, *){
            
            var pdfdocument: PDFDocument?
            var pdfview: PDFView!
            
            pdfview = PDFView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
            
            var url = Bundle.main.url(forResource: nameIndex, withExtension: "pdf")
            pdfdocument = PDFDocument(url: url!)
            
            pdfview.document = pdfdocument
            pdfview.displayMode = PDFDisplayMode.singlePageContinuous
            pdfview.autoScales = true
            
            self.view = pdfview
        }
        else {
            print("PDFKit is not supported for versions before iOS 11.0")
        }
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    
    private let colorList: [UIColor] = [#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)]
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = colorList[Int(arc4random_uniform(UInt32(colorList.count)))]
        
        self.addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewController : UICollectionViewController {
    
    // CollectionView DataSource
    private let nameList: [String] = ["Introdução "]
    
    override func loadView() {
        super.loadView()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
        self.title = "PDF Reader"
        nameIndex = "Introdução"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
        
        // UIControlerViewCells does not have viewDidLoad method, so we have to set the value directly into the element (nameLabel in this case). It is not usual.
        cell.nameLabel.text = nameList[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let profileViewController = ProfileViewController()
        
        
        
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController:CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))



