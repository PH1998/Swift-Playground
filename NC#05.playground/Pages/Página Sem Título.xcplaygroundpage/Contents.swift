
//GUSTAVO GARCIA LEITE
//NC#05

import UIKit
import PDFKit
import PlaygroundSupport

class ProfileViewController: UIViewController {
    
    public var pdfdocument: PDFDocument?
    public var name: String?
    
    override func loadView() {
        super.loadView()
        self.title = name
        
        if #available(iOSApplicationExtension 11.0, *){
            
            var pdfview: PDFView!
            
            pdfview = PDFView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
            
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
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.backgroundColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var img: UIImageView = {
        let image = UIImageView()
        //image.translatesAutoresizingMaskIntoConstraints = false
        //image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        img = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        img.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(img)
        self.addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 120).isActive = true
        
        //img.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //img.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // CollectionView DataSource
    private let nameList: [String] = ["Receitas", "Introdução"]
    private var pdfDocument: [PDFDocument] = []
    
    override func loadView() {
        super.loadView()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
        self.title = "PDF Reader"
        
        for i in 0 ... nameList.count - 1 {
            
            let url = Bundle.main.url(forResource: nameList[i], withExtension: "pdf")
            pdfDocument.append(PDFDocument(url: url!)!)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 150, height: 150)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
        
        // UIControlerViewCells does not have viewDidLoad method, so we have to set the value directly into the element (nameLabel in this case). It is not usual.
        cell.nameLabel.text = nameList[indexPath.row]
        if let page = pdfDocument[indexPath.row].page(at: 0) {
            let thumb = page.thumbnail(of: cell.bounds.size, for: PDFDisplayBox.cropBox)
            cell.img.image = thumb
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let profileViewController = ProfileViewController()
        profileViewController.pdfdocument = pdfDocument[indexPath.row] as! PDFDocument
        profileViewController.name = profileCell.nameLabel.text
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController:CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))
