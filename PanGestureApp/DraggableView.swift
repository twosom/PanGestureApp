//
// Created by Hope on 2021/12/12.
//

import UIKit

class DraggableView: UIView {

    var dragType: DragType = .ONLY_X

    init() {
        super.init(frame: .zero)

        let uiPanGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        addGestureRecognizer(uiPanGestureRecognizer)

    }

    /**
     코드로 만드는 부분이 아니라 인터페이스 빌더로 만드는 부분의 생성자
     - Parameter coder:
     */
    required
    init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    func dragging(_ pan: UIPanGestureRecognizer) {
        switch pan.state {
            /**
             began: 누르는 순간
         */
        case .began:
            print("began")

            /**
             눌러서 움직일 때
             */
        case .changed:
            /**
             pan.translation 움직인 만큼에 대한 값을 알려줌.
             파라미터에는 어딜 기준으로 할 것인지를 넘겨줌.
             */
            let delta: CGPoint = pan.translation(in: superview)

            switch dragType {
            case .ONLY_X:
                center.x += delta.x

            case .ONLY_Y:
                center.y += delta.y

            case .NONE:
                center.x += delta.x
                center.y += delta.y
            }
            /**
             움직인 후에는 translation 초기화
             */
            pan.setTranslation(.zero, in: superview)

            /**
             ended: 끝났을 때
             cancelled: 취소 되었을 때
             */
        case .ended, .cancelled:
            print("ended cancelled")

            if frame.minX < 0 {
                frame.origin.x = 0
            }


            if frame.minY < 0 {
                frame.origin.y = 0
            }


            if let superview: UIView = superview {

                if frame.maxX > superview.frame.maxX {
                    frame.origin.x = superview.frame.maxX - frame.width
                }


                if frame.maxY > superview.frame.maxY {
                    frame.origin.y = superview.frame.maxY - frame.height
                }

            }


        default:
            break
        }
    }
}
