//
//  ViewController.swift
//  PanGestureApp
//
//  Created by Hope on 2021/12/12.
//
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = DraggableView()
        myView.center = view.center
        myView.backgroundColor = .red
        myView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)

        /**
         addSubView : 만든 뷰를 올리는 것
         */
        view.addSubview(myView)
    }


}
