//
//  MainVC.swift
//  Tesla
//
//  Created by Oybek Iskandarov on 6/4/21.
//

import UIKit
import iCarousel
class MainVC: UIViewController {
    @IBOutlet weak var scroll2: UIScrollView!{
        didSet{
            scroll2.delegate = self
        }
    }
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    var int = 0{
        didSet{

        }
    }
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet var views: [UIView]!
    let myCarousel : iCarousel = {
        let views = iCarousel()
        views.type = .rotary
        return views
    }()
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btnOrder: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = "\(int)"
        pageController.addTarget(self, action: #selector(pageControllerFunc), for: .valueChanged)
        view.addSubview(myCarousel)
        //myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300)
        btnOrder.layer.cornerRadius = 30
        btnOrder.layer.borderWidth = 2
        btnOrder.layer.borderColor = UIColor.red.cgColor
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @IBAction func btnOrder(_ sender: Any) {
        if pageController.currentPage == 0{
            print("0")
        }else if pageController.currentPage == 1{
            print("1")
        }else{
            let vc = ModelSViewController(nibName: "ModelSViewController", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true, completion: nil)
            
            print("2")
        }
    }
    @objc func pageControllerFunc(_ sender: UIPageControl){
        scrollView.setContentOffset(CGPoint(x: CGFloat(sender.currentPage) * view.frame.size.width, y: 0), animated: true)
    }
//    func numberOfItems(in carousel: iCarousel) -> Int {
//        3
//    }
//    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
//        let uiview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        uiview.backgroundColor = .green
//        return uiview
//    }
}

extension MainVC: UIScrollViewDelegate{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        int = pageController.currentPage
        lbl.text = "\(int + 1)"
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        pageController.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
  
    }
}
