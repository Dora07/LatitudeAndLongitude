
import UIKit
import MapKit

class ViewController: UIViewController
{
//經緯度十進位TextField
    @IBOutlet weak var DDLatitude1: UITextField!
    @IBOutlet weak var DDLongitude1: UITextField!
   //經緯度度分(DMM)TextField
    @IBOutlet weak var DMMLatitude1: UITextField!
    @IBOutlet weak var DMMLatitude2: UITextField!
    @IBOutlet weak var DMMLongitude1: UITextField!
    @IBOutlet weak var DMMLongitude2: UITextField!
    //經緯度度分(DMS)TextField
    @IBOutlet weak var DMSLatitude1: UITextField!
    @IBOutlet weak var DMSLatitude2: UITextField!
    @IBOutlet weak var DMSLatitude3: UITextField!
    @IBOutlet weak var DMSLongitude1: UITextField!
    @IBOutlet weak var DMSLongitude2: UITextField!
    @IBOutlet weak var DMSLongitude3: UITextField!
    //Apple map
    @IBOutlet weak var MapView: MKMapView!
    //地標Textfield
    @IBOutlet weak var PlaceTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
    }
   //DD轉換按鈕
    @IBAction func ConvertDD(_ sender: UIButton)
    {   //收鍵盤
        view.endEditing(true)
        
        //經緯度
        //當使用者沒輸入完點轉換就帶入預設值空字串或0.0
        //空字串
        let DDLatitudeText = Double(String(DDLatitude1.text ?? ""))
        let DDLongitudeText = Double(String(DDLongitude1.text ?? ""))
        //0.0
        let DDLat1 = Int(DDLatitudeText ?? 0.0)
        let DDLon1 = Int(DDLongitudeText ?? 0.0)
        
        DMMLatitude1.text = "\(DDLat1)"
        DMSLatitude1.text = "\(DDLat1)"
        DMMLongitude1.text = "\(DDLon1)"
        DMSLongitude1.text = "\(DDLon1)"
        
        //經緯分
        let DMMLat2 = ((DDLatitudeText ?? 0.0) - Double(DDLat1)) * 60
        let DMMLat2Int = Int(DMMLat2)
        let DMMLon2 = ((DDLongitudeText ?? 0.0) - Double(DDLon1)) * 60
        let DMMLon2Int = Int(DMMLon2)
        
        //%.4f取小數點四位
        DMMLatitude2.text = String(format: "%.4f", DMMLat2)
        DMSLatitude2.text = "\(DMMLat2Int)"
        DMMLongitude2.text = String(format: "%.4f", DMMLon2)
        DMSLongitude2.text = "\(DMMLon2Int)"
        
        //經緯秒
        let DMSLat1 = (DMMLat2 - Double(DMMLat2Int)) * 60
        let DMSLon1 = (DMMLon2 - Double(DMMLon2Int)) * 60
        //%.2f取小數點二位
        DMSLatitude3.text = String(format: "%.2f", DMSLat1)
        DMSLongitude3.text = String(format: "%.2f", DMSLon1)
        
        //設定地圖遵照經緯度DD,如果沒有就設定為台灣
        MapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: (DDLatitudeText ?? 23.973875), longitude: (DDLongitudeText ?? 120.982025)),latitudinalMeters: 1000,longitudinalMeters: 1000 )
        
        
    }
    
    
    //DMM轉換按鈕
    @IBAction func ConvertDMM(_ sender: UIButton)
    {
        
        //收鍵盤
            view.endEditing(true)
        
        //當使用者沒輸入完點轉換就帶入預設值
        //空字串
        let DMMLatitude1Text =  Double(String(DMMLatitude1.text ?? ""))
        let DMMLatitude2Text =
            Double((String(DMMLatitude2.text ?? "")))
        let DMMLongitude1Text = Double(String(DMMLongitude1.text ?? ""))
        let DMMLongitude2Text = Double(String(DMMLongitude2.text ?? ""))
        
        //0.0轉換經緯度
        let DDLat1 = (DMMLatitude1Text ?? 0.0) + (DMMLatitude2Text ?? 0.0) / 60
        let DDLon1 = (DMMLongitude1Text ?? 0.0) + (DMMLongitude2Text ?? 0.0) / 60
        
        DDLatitude1.text = String(format: "%.6f", DDLat1)
        DMSLatitude1.text = DMMLatitude1.text
        DDLongitude1.text = String(format: "%.6f", DDLon1 )
        DMSLongitude1.text = DMMLongitude1.text
        
        //經緯分
        let DMLatInt = Int(DMMLatitude2Text ?? 0.0)
        let DMLonInt = Int(DMMLongitude2Text ?? 0.0)
        DMSLatitude2.text = "\(DMLatInt)"
        DMSLongitude2.text = "\(DMLonInt)"
        
        //經緯秒
        let DMSLat1 = ((DMMLatitude2Text ?? 0.0) - Double(DMLatInt)) * 60
        let DMSLon1 = ((DMMLongitude2Text ?? 0.0) - Double(DMLonInt)) * 60
        DMSLatitude3.text = String(format: "%.2f", DMSLat1)
        DMSLongitude3.text = String(format: "%.2f", DMSLon1)
        
        //設定地圖遵照經緯度DD
        MapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: DDLat1 , longitude: DDLon1 ), latitudinalMeters: 1000, longitudinalMeters: 1000)
        
    }
    
    
    
    @IBAction func ConvertDMS(_ sender: UIButton)
    {
        
        
        //收鍵盤
            view.endEditing(true)
        
        //DMS經緯度轉DMM經緯度
        DMSLatitude1.text = DMMLatitude1.text
        DMSLongitude1.text = DMMLongitude1.text
        
        //DMS經緯分＋經緯秒轉DMS經緯分
        let DMSLat2 = Double(String(DMSLatitude2.text ?? ""))
        let DMSLat3 = Double(String(DMSLatitude3.text ?? ""))
        let DMMLat2 = (DMSLat2 ?? 0.0) + (DMSLat3 ?? 0.0) / 60
    
        let DMSLon2 = Double(String(DMSLongitude2.text ?? ""))
        let DMSLon3 = Double(String(DMSLongitude3.text ?? ""))
        let DMMLon2 = (DMSLon2 ?? 0.0 ) + (DMSLon3 ?? 0.0) / 60
        DMMLatitude2.text = String(format: "%.4f", DMMLat2)
        DMMLongitude2.text = String(format: "%.4f", DMMLon2)
        
        //DMM經緯度+經緯分轉DD經緯度
        
        let DMMLat1 = Double(String(DMMLatitude1.text ?? ""))
        let DMMLon1 = Double(String(DMMLongitude1.text ?? ""))
        let DDLat1 =  (DMMLat2 ?? 0.0) + (DMMLat1 ?? 0.0 ) / 60
        let DDLon1 = (DMMLon2 ?? 0.0) +
            (DMMLon1 ?? 0.0 ) / 60
        DDLatitude1.text = String(format: "%.6f", DDLat1)
        DDLongitude1.text = String(format: "%.6f", DDLon1)
        
        //設定地圖遵照經緯度DD
        MapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: DDLat1 , longitude: DDLon1), latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        
        
    }
    
    //新增地標
    @IBAction func LocationAdd(_ sender: UIButton)
    {   //收鍵盤
        view.endEditing(true)
        
        //經緯度
        let Latitude = Double(String(DDLatitude1.text ?? ""))
        let Longitude = Double(String(DDLongitude1.text ?? ""))
        //地標
        let Point = MKPointAnnotation()
        Point.title = PlaceTextField.text
        Point.coordinate = CLLocationCoordinate2D(latitude: (Latitude ?? 0.0), longitude: (Longitude ?? 0.0 ))
        
        MapView.addAnnotation(Point)
        
        
        
    }
    
    
    
    
    
    //清除所有內容按鈕
    
    
    @IBAction func ClearAll(_ sender: UIButton)
    {   //DD
        DDLatitude1.text = ""
        DDLongitude1.text = ""
        //DMM
        DMMLatitude1.text = ""
        DMMLatitude2.text = ""
        DMMLongitude1.text = ""
        DMMLongitude2.text = ""
        //DMS
        DMSLatitude1.text = ""
        DMSLatitude2.text = ""
        DMSLatitude3.text = ""
        DMSLongitude1.text = ""
        DMSLongitude2.text = ""
        DMSLongitude3.text = ""
        
        //設定回到台灣
        MapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.973875, longitude: 120.982025), latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        
        
    }
    
    
    
    
    
}

