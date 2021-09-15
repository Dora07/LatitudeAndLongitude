
import UIKit

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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
    }
   //DD轉換按鈕
    @IBAction func ConvertDD(_ sender: UIButton)
    {   //收鍵盤
        view.endEditing(true)
        
        //緯度
        //當使用者沒輸入完點轉換就帶入預設值
        //空字串
        let DDLatitudetext = Double(String(DDLatitude1.text ?? ""))
        let DDLongitudetext = Double(String(DDLongitude1.text ?? ""))
        //0.0
        let DDLat1 = Int(DDLatitudetext ?? 0.0)
        let DDLon1 = Int(DDLongitudetext ?? 0.0)
        
        DMMLatitude1.text = "\(DDLat1)"
        DMSLatitude1.text = "\(DDLat1)"
        DMMLongitude1.text = "\(DDLon1)"
        DMSLongitude1.text = "\(DDLon1)"
        
        //緯分
        let DMMLat1 = ((DDLatitudetext ?? 0.0) - Double(DDLat1) * 60)
        let DMMLat1Int = Int(DMMLat1)
        let DMMLon1 = ((DDLongitudetext ?? 0.0) - Double(DDLon1) * 60)
        let DMMLon1Int = Int(DMMLon1)
        
        //%.4f取小數點四位
        DMMLatitude2.text = String(format: "%.4f", DMMLat1)
        DMSLatitude2.text = "\(DMMLat1Int)"
        DMMLongitude2.text = String(format: "%.4f", DMMLon1)
        DMSLongitude2.text = "\(DMMLon1Int)"
        
        //緯秒
        let DMSLat1 = (DMMLat1 - Double(DMMLat1Int)) * 60
        let DMSLon1 = (DMMLon1 - Double(DMMLon1Int)) * 60
        //%.2f取小數點二位
        DMSLatitude3.text = String(format: "%.2f", DMSLat1)
        DMSLongitude3.text = String(format: "%.2f", DMSLon1)
        
    }
    
    
    //DMM轉換按鈕
    @IBAction func ConvertDMM(_ sender: UIButton)
    {
        
        
    }
    
    
    
    
    
    
    
}

