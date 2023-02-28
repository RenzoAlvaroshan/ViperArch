//
//  PostViewCell.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import SnapKit
import UIKit

final class PostViewCell: UICollectionViewCell {
	
	// MARK: - Properties
	
	private let titleLabel: UILabel = UILabel()
	private let bodyLabel: UILabel = UILabel()
	
	// MARK: - Lifecycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
	}
	
	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		let autoLayoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
		let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
		autoLayoutAttributes.frame.size = systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
		return autoLayoutAttributes
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Helpers
	
	func configureView(with title: String, body: String) {
		titleLabel.text = title
		bodyLabel.text = body
		
		layer.borderColor = UIColor.lightGray.cgColor
		layer.borderWidth = 1
		layer.cornerRadius = 8
	}
	
	private func configureUI() {
		contentView.addSubview(titleLabel)
		contentView.addSubview(bodyLabel)
		
		titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
		titleLabel.numberOfLines = 0
		titleLabel.snp.makeConstraints { make in
			make.leading.trailing.top.equalToSuperview().inset(8)
		}
		
		bodyLabel.font = UIFont.systemFont(ofSize: 14)
		bodyLabel.numberOfLines = 0
		bodyLabel.snp.makeConstraints { make in
			make.leading.trailing.bottom.equalToSuperview().inset(8)
			make.top.equalTo(titleLabel.snp.bottom).offset(8)
		}
	}
}
