//
//  PostsInteractorImpl.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import Foundation

final class PostsInteractorImpl: PostsInteractor {
	
	var presenter: PostsPresenter?
	
	private(set) var posts: [Post] = []
	
	private let apiService: APIService = APIServiceImpl()
	
	func fetchPosts() {
		apiService.fetchPosts { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let posts):
				self.posts = posts
				self.presenter?.didFetch()
			case .failure(let error):
				self.presenter?.didFail(with: error.localizedDescription)
			}
		}
	}
	
	func setPresenter(_ presenter: PostsPresenter) {
		self.presenter = presenter
	}
}
