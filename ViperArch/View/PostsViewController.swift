//
//  PostsViewController.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import SnapKit
import UIKit

final class PostsViewController: UIViewController {
	
	// MARK: - Properties
	
	weak var presenter: PostsPresenter?
	
	private let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		configureCollectionView()
		presenter?.fetchPosts()
	}
	
	// MARK: - Helpers
	
	private func configureCollectionView() {
		
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
		flowLayout.minimumLineSpacing = 8
		flowLayout.minimumInteritemSpacing = 8
		flowLayout.scrollDirection = .vertical
		flowLayout.itemSize = CGSize(width: view.bounds.width - 16, height: 50)
		flowLayout.estimatedItemSize = CGSize(width: view.bounds.width - 16, height: 100)
		
		collectionView.collectionViewLayout = flowLayout
		
		collectionView.register(PostViewCell.self, forCellWithReuseIdentifier: "PostCell")
		collectionView.register(PostsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		view.addSubview(collectionView)
		collectionView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
	}
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension PostsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return presenter!.numberOfSections()
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return presenter?.numberOfPosts(in: section) ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as? PostViewCell else {
			fatalError("Unable to dequeue PostCell")
		}
		
		let post = presenter?.post(for: indexPath)
		if let post {
			cell.configureView(with: post.title, body: post.body)
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
		guard kind == UICollectionView.elementKindSectionHeader,
			  let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as? PostsHeaderView else {
			fatalError("Unable to dequeue HeaderView")
		}
		
		if let userId = presenter?.userIds {
			headerView.configureView(with: userId[indexPath.section])
		}
		
		return headerView
	}
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PostsViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: collectionView.bounds.width, height: 50)
	}
}

// MARK: - PostsView

extension PostsViewController: PostsView {
	func displayPosts() {
		collectionView.reloadData()
	}
	
	func displayError(_ message: String) {
		let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default)
		alert.addAction(action)
		present(alert, animated: true)
	}
}
