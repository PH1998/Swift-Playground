import UIKit
import PlaygroundSupport

class ProfileViewController: UIViewController {
    
    public var imagem: UIImage?
    
    override func loadView() {
        super.loadView()
        
        let imageView = UIImageView (image: imagem)
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    
    private let imageList: [UIImage] = [#imageLiteral(resourceName: "Image 11.png")]
    
    public var image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(image)
        
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        image.widthAnchor.constraint(equalToConstant: 690);,
        image.heightAnchor.constraint(equalToConstant: 400),
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewController : UICollectionViewController {
    
    // CollectionView DataSource
    private let nameList: [UIImage] = [#imageLiteral(resourceName: "Image 11.png")]
    
    override func loadView() {
        super.loadView()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
        
        // UIControlerViewCells does not have viewDidLoad method, so we have to set the value directly into the element (nameLabel in this case). It is not usual.
        cell.image.image = nameList[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let profileViewController = ProfileViewController()
        profileViewController.imagem = profileCell.image.image
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController:CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))


