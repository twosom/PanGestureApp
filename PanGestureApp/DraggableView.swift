//
// Created by Hope on 2021/12/12.
//

import UIKit

class DraggableView: UIView {

    init() {
        super.init(frame: .zero)

        let uiPanGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        addGestureRecognizer(uiPanGestureRecognizer)

    }

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
            break
            /**
             눌러서 움직일 때
             */
        case .changed:
            /**
             pan.translation 움직인 만큼에 대한 값을 알려줌.
             파라미터에는 어딜 기준으로 할 것인지를 넘겨줌.
             */
            let delta: CGPoint = pan.translation(in: superview)
            /**
             움직인 만큼 값 적용
             */
            center.x += delta.x
            center.y += delta.y
            /**
             움직인 후에는 translation 초기화
             */
            pan.setTranslation(.zero, in: superview)
            break
            /**
             ended: 끝났을 때
             cancelled: 취소 되었을 때
             */
        case .ended, .cancelled:
            print("ended cancelled")
            break

        default:
            break
        }
    }
}
