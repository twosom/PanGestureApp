//
//  ViewController.swift
//  PanGestureApp
//
//  Created by Hope on 2021/12/12.
//
//

import UIKit

enum DragType {
    case ONLY_X
    case ONLY_Y
    case NONE
}

class ViewController: UIViewController {

    var dragType: DragType = .ONLY_X
    let myView = DraggableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        myView.center = view.center
        myView.backgroundColor = .red
        myView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        /**
         addSubView : 만든 뷰를 올리는 것
         */
        view.addSubview(myView)
    }

    @IBAction
    func selectPanType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            dragType = .ONLY_X
        case 1:
            dragType = .ONLY_Y
        case 2:
            dragType = .NONE
        default:
            break
        }

        myView.dragType = dragType
    }

}
