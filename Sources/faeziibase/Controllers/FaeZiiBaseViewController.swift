//
//  FaeZiiBaseViewController.swift
//  
//
//  Created by Faerae on 23/11/22.
//

import UIKit

import UIKit
import LBTATools

private typealias `Self` = FaeZiiBaseViewController

open class FaeZiiBaseViewController: UIViewController {
    // MARK: - Open Variables

    open var shouldAttachScrollView: Bool { return true }

    // MARK: Open Functions

    @objc dynamic open func initializeUI() {}
    @objc dynamic open func updateViews() {}
    @objc dynamic open func setupViews() {}
    @objc dynamic open func setupActions() {}
    @objc dynamic open func fetchData() {}
    @objc dynamic open func updateButtonState() {}

    // MARK: - Properties

    lazy var scrollView: BaseScrollView = {
        let scrollView = BaseScrollView()

        return scrollView
    }()

    var contentView: UIView {
        return scrollView.contentView
    }

    // MARK: - Life Cycles

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        if shouldAttachScrollView {
            attachScrollView()
        }
        initializeUI()
        setupViews()
        setupActions()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateViews()
    }
}

// MARK: - Helpers
extension Self {
    private func attachScrollView() {
        view.addSubview(scrollView)
        scrollView.fillSuperviewSafeAreaLayoutGuide()
    }
}
