//
//  PostsInteractor.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import SnapKit
import UIKit

protocol PostsInteractor {
	var presenter: PostsPresenter? { get set }
	var posts: [Post] { get }
	func fetchPosts()
	func setPresenter(_ presenter: PostsPresenter)
}
