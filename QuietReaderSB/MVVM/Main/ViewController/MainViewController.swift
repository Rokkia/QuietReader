//
//  MainViewController.swift
//  QuietReaderSB
//
//  Created by Rokkia on 2020/8/3.
//  Copyright © 2020 hzj. All rights reserved.
//

import Cocoa
import SnapKit

fileprivate let kIdentifier = "BookItemIdentifier"

class MainViewController: BaseViewController{
    
    fileprivate lazy var bookCollectView: NSCollectionView = {
        let cv = NSCollectionView()
        let layout = NSCollectionViewFlowLayout()
        layout.itemSize = NSSize(width: 80, height: 100)
        layout.sectionInset = NSEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        layout.minimumLineSpacing = 20.0
        layout.minimumInteritemSpacing = 20.0
        cv.collectionViewLayout = layout
        cv.layer?.backgroundColor = NSColor.black.cgColor
        cv.register(MainBookItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(kIdentifier))
        // 没有这句话 didselected将不会被执行
        cv.isSelectable = true
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNotiObserver()
        self.initViews()
    }
    // MARK: initviews
    func initViews() {
        let scrollView = NSScrollView()
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        // 没有这三句话 collectview 将不能滑动
        let tempView = NSClipView()
        tempView.documentView = self.bookCollectView
        scrollView.contentView = tempView;
    }
    
    // MARK: NOTI
    func addNotiObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleStateNoti), name: NSNotification.Name(rawValue: kNOTIMAINSTATE), object: nil)
    }
    
    @objc func handleStateNoti(_ notification: NSNotification){
        if let t = notification.userInfo?[kNOTIMAINISTATEKEY] as? MainState {
            if t == MainState.bookshelf {
                print(MainState.bookshelf)
            }else{
                print(MainState.shop)
            }
        }
    }
    // MARK: handle方法
}

extension MainViewController: NSCollectionViewDelegate, NSCollectionViewDataSource{
    // MARK: CollectView Delegate
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        print(indexPaths)
//        collectionView.deselectItems(at: indexPaths)
    }
    // MARK CollectView DataSource
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: kIdentifier), for: indexPath)
        collectionView.item(at: indexPath)
        item.view.backgroundColor = NSColor.white
        return item
    }
}
