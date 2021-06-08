//
//  ModelSViewController.swift
//  Tesla
//
//  Created by Oybek Iskandarov on 6/5/21.
//

import UIKit
import CoreData
class ModelSViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet var viewsTop: [UIView]!
    @IBOutlet var scrollViews: [UIView]!
    @IBOutlet var colorsBtn: [UIButton]!
    @IBOutlet var priceCar: [UIButton]!
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet var backgroundViewBtnNext: [UIView]!

    @IBOutlet var descPrice: [UILabel]!
    @IBOutlet var titleLabel: [UILabel]!
    
    @IBOutlet var smallBtnsColors: [UIButton]!
    @IBOutlet weak var bottomPrice: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var scroll: UIScrollView!{
        didSet{
            scroll.delegate = self
        }
    }
    var bigPrice : Int = 0
    var data = [ModelS]()
    var performPr = 55.700
    var longPr = 46.700
    var contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var res = 0.0
    var res2 = 0.0
    var res3 = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageController.addTarget(self, action: #selector(pageControllerFunc), for: .valueChanged)
        for i in smallBtnsColors {
            i.alpha = 0.5
            i.isEnabled = false
        }
        for i in colorsBtn  {
            i.layer.cornerRadius = 22
        }
        for i in smallBtnsColors  {
            i.layer.cornerRadius = 22
        }
        btnNext.layer.cornerRadius = 25
        btnNext.layer.borderWidth = 2
        btnNext.layer.borderColor = UIColor.red.cgColor
        for r in backgroundViewBtnNext {
            r.layer.cornerRadius = 33
            r.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func pageControllerFunc(sender: UIPageControl){
        
       scroll.setContentOffset(CGPoint(x: CGFloat(sender.currentPage) * view.frame.size.width, y: 0), animated: true)
    }
    
//
//    func addData(){
//        guard let entity = NSEntityDescription.entity(forEntityName: "ModelS", in: contex)  else {
//            return
//        }
//        let car = NSManagedObject.init(entity: entity, insertInto: contex)
//        car.setValue(bigPrice, forKey: "price")
//        print(  car.setValue(bigPrice, forKey: "price"))
//        try! contex.save()
//    }
//
//    func fetchData(){
//        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "ModelS")
//        do {
//            if let result = try contex.fetch(request) as? [ModelS]{
//                data = result
//            }
//        } catch  {
//            fatalError()
//        }
//    }
    override func viewWillAppear(_ animated: Bool) {
//        addData()
//        fetchData()
       
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        for i in smallBtnsColors {
            if i.tag == sender.tag{
                i.layer.borderColor = UIColor.red.cgColor
                i.layer.borderWidth = 3
            }else{
                i.layer.borderColor = UIColor.clear.cgColor
                i.layer.borderWidth = 0
            }
        }
    }
    
    @IBAction func colorSelectBtns(_ sender: UIButton) {
        switch sender.tag {
        case 2:
            titleLabel[2].alpha = 1
            descPrice[2].alpha = 1
            titleLabel[3].alpha = 0.5
            descPrice[3].alpha = 0.5
            for w in smallBtnsColors {
                w.alpha = 1
                w.isEnabled = true
            }
            let d = res2 + 1.000
            price.text = "$\(d)00"
            res3 = d
        case 3:
            titleLabel[2].alpha = 0.5
            descPrice[2].alpha = 0.5
            titleLabel[3].alpha = 1
            descPrice[3].alpha = 1
            for o in smallBtnsColors {
                o.layer.borderColor = UIColor.clear.cgColor
                o.layer.borderWidth = 0
                o.isEnabled = false
                o.alpha = 0.5
            }
            let j = res2 + 2.000
            price.text = "$\(j)00"
            res3 = j
        default:
            break
        }
    }
    
    @IBAction func autopilotBtns(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            titleLabel[4].alpha = 1
            descPrice[4].alpha = 1
            titleLabel[5].alpha = 0.5
            descPrice[5].alpha = 0.5
            let d = res3 + 5.000
            price.text = "$\(d)00"
        case 1:
            titleLabel[4].alpha = 0.5
            descPrice[4].alpha = 0.5
            titleLabel[5].alpha = 1
            descPrice[5].alpha = 1
            let d = res3 + 3.000
            price.text = "$\(d)00"
        default:
            break
        }
    }
    
    @IBAction func performPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            titleLabel[0].alpha = 1
            descPrice[0].alpha = 1
            titleLabel[1].alpha = 0.5
            descPrice[1].alpha = 0.5
            price.text = "$\(performPr)00"
            res = performPr
        case 1:
            titleLabel[0].alpha = 0.5
            descPrice[0].alpha = 0.5
            titleLabel[1].alpha = 1
            descPrice[1].alpha = 1
            price.text = "$\(longPr)00"
            res = longPr
        default:
            break
        }

    }

    @IBAction func btnBAck(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func colorsBtns(_ sender: UIButton) {
        let f =  res + 2.000
        price.text = "$\(f)00"
        res2 = f
        for i in colorsBtn {
            if i.tag == sender.tag{
                i.layer.borderColor = UIColor.red.cgColor
                i.layer.borderWidth = 3
            }else{
                i.layer.borderColor = UIColor.clear.cgColor
                i.layer.borderWidth = 0
            }
        }
        switch sender.tag {
        case 0:
            colorName.text = "Pearl Black Multi-Coat"
        case 1:
            colorName.text = "Pearl Light Gray Multi-Coat"
        case 2:
            colorName.text = "Pearl Blue Multi-Coat"
        case 3:
            colorName.text = "Pearl White Multi-Coat"
        case 4:
            colorName.text = "Pearl Red Multi-Coat"
        default:
            colorName.text = "Pearl secect color Multi-Coat"
    }
 }
    
    @IBAction func btnNext(_ sender: Any) {
        scroll.isScrollEnabled = true
        
    }
}
