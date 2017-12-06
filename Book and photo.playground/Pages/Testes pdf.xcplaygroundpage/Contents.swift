
import UIKit
import PlaygroundSupport

class ProfileViewController: UIViewController {
    
    public var name: String?
    public var imageDoc: UIImage?
    public var backGroundColor: UIColor = #colorLiteral(red: 0.501960813999176, green: 0.501960813999176, blue: 0.501960813999176, alpha: 1.0)
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = backGroundColor
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
        //if #available(iOSApplicationExtension 11.0, *){
        imageView.image = imageDoc
        //var pdfview: PDFView!
            
        /*pdfview = PDFView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
            
            pdfview.document = pdfdocument
            pdfview.displayMode = PDFDisplayMode.singlePageContinuous
            pdfview.autoScales = true*/
            
            self.view = imageView
        }
    }


class MyCollectionViewCell: UICollectionViewCell {
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.darkText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var img: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        img = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        img.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(img)
        self.addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // CollectionView DataSource
    
    
    private let nameList: [UIImage] = [#imageLiteral(resourceName: "Image.png")]
    
    override func loadView() {
        super.loadView()
        self.collectionView?.backgroundColor = #colorLiteral(red: 0.803921580314636, green: 0.803921580314636, blue: 0.803921580314636, alpha: 1.0)
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
        self.title = "PDF Sobre Jogos & HQs"
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 150, height: 150)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
        
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
        profileViewController.imageDoc = collectionView[indexPath.row]
        profileViewController.name = profileCell.nameLabel.text
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController:CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))

