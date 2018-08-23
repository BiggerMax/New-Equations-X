import UIKit
private let reuseIdentifier = "Cell"
class VolumeCVC: UICollectionViewController {
    let VolumeArray = ["Cube", "Cuboid", "Parallelepiped", "Pyramid", "Frustum of a pyramid", "Cylinder", "Hollow Cylinder", "Cone", "Frustum of a cone", "Sphere", "Zone of a sphere", "Segment of a sphere", "Sector of a sphere", "Sphere with cylinder", "Torus", "Sliced Cylinder", "Ungula", "Barrel"]
    let imageArray = [#imageLiteral(resourceName: "Areas of 3D shapes-1"), #imageLiteral(resourceName: "Areas of 3D shapes-2"), #imageLiteral(resourceName: "Areas of 3D shapes-3"), #imageLiteral(resourceName: "Areas of 3D shapes-4"), #imageLiteral(resourceName: "Areas of 3D shapes-5"), #imageLiteral(resourceName: "Areas of 3D shapes-6"), #imageLiteral(resourceName: "Areas of 3D shapes-7"), #imageLiteral(resourceName: "Areas of 3D shapes-8"), #imageLiteral(resourceName: "Areas of 3D shapes-9"), #imageLiteral(resourceName: "Areas of 3D shapes-10"), #imageLiteral(resourceName: "Areas of 3D shapes-11"), #imageLiteral(resourceName: "Areas of 3D shapes-12"), #imageLiteral(resourceName: "Areas of 3D shapes-13"), #imageLiteral(resourceName: "Areas of 3D shapes-14"), #imageLiteral(resourceName: "Areas of 3D shapes-15"), #imageLiteral(resourceName: "Areas of 3D shapes-16"), #imageLiteral(resourceName: "Areas of 3D shapes-17"), #imageLiteral(resourceName: "Areas of 3D shapes-18")]
    @IBOutlet var CollectionViewInterface: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NumberOfIcons()
    }
    override func viewWillAppear(_ animated: Bool) {
        NumberOfIcons()
    }
    func NumberOfIcons() {
        var NumberOfUnits: Float = 6
        if self.preferredInterfaceOrientationForPresentation.isPortrait {
            NumberOfUnits = 3
        }
        if self.preferredInterfaceOrientationForPresentation.isLandscape {
            NumberOfUnits = 5
        }
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let itemSize = Float(UIScreen.main.bounds.width) / NumberOfUnits
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize(width: Int(itemSize), height: Int(itemSize))
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        CollectionViewInterface.collectionViewLayout = layout
    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        switch UIDevice.current.orientation{
        case .portrait:
            NumberOfIcons()
        case .portraitUpsideDown:
            NumberOfIcons()
        case .landscapeLeft:
            NumberOfIcons()
        case .landscapeRight:
            NumberOfIcons()
        default:
            NumberOfIcons()
        }
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return VolumeArray.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VolumeCell", for: indexPath) as! CollectionViewCell
        cell.vIcone.image = imageArray[indexPath.row]
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        changeID = "\(VolumeArray[indexPath.row])"
        print(changeID)
    }
}
