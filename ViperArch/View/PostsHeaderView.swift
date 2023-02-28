//
//  PostsHeaderView.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import SnapKit
import UIKit

final class PostsHeaderView: UICollectionReusableView {
	
	// MARK: - Properties

	let titleLabel: UILabel = UILabel()

	// MARK: - Lifecycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Helpers

	func configureView(with userId: Int) {
		titleLabel.text = "User ID: \(userId)"
	}

	private func configureUI() {
		addSubview(titleLabel)
		titleLabel.snp.makeConstraints { make in
			make.leading.trailing.equalToSuperview().inset(8)
			make.top.bottom.equalToSuperview()
		}
	}
}
