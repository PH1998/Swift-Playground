//Álbum de fotos

import UIKit
import PlaygroundSupport
//Class principal para receber a imagem na segunda view
class FotoViewController:UIViewController {
    
    public var name: String?
    public var foto: UIImage?
    public var backgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .gray
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: CGRect(x: 150, y: 200, width: 200, height: 400))
        imageView.image = foto
        
        self.view = imageView
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    public var shineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    //Layout
    override init(frame: CGRect) {
        super.init(frame: frame)
        shineImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        shineImageView.contentMode = UIViewContentMode.scaleToFill
        
        self.addSubview(shineImageView)
        self.addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // CollectionView DataSource
    // Estrutura para visualizar as fotos
    private var fotos: [UIImage] =  [#imageLiteral(resourceName: "Imagem JPEG 2.jpeg"),#imageLiteral(resourceName: "Imagem JPEG 3.jpeg"),#imageLiteral(resourceName: "Imagem JPEG 4.jpeg"),#imageLiteral(resourceName: "Imagem PNG.png"),#imageLiteral(resourceName: "Imagem JPEG 5.jpeg"),#imageLiteral(resourceName: "1__#$!@%!#__Imagem PNG 2.png"),#imageLiteral(resourceName: "Imagem JPEG 6.jpeg"),#imageLiteral(resourceName: "Imagem JPEG 8.jpeg")]
    
    override func loadView() {
        super.loadView()
            //Título, size e background
        self.title = "Photo Album"
        
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
    }
    //Tamanho para deixar os PDF por igual
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 150, height: 150)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
            //imprimir as imagens
        cell.shineImageView.image = fotos[indexPath.row]
        return cell
    }
    //Acessar os PDF
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fotoCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let fotoViewController = FotoViewController()
        fotoViewController.foto = fotos[indexPath.row]
        fotoViewController.name = fotoCell.nameLabel.text
        navigationController?.pushViewController(fotoViewController, animated: true)
    }
    @objc func openWithNavigation() {
        let newVC = FotoViewController()
        self.navigationController?.pushViewController(newVC, animated: true )
    }
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController:CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))



