//
//  PostsPresenterImpl.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import Foundation

final class PostsPresenterImpl: PostsPresenter {
	
	var view: PostsView?
	var interactor: PostsInteractor?
	var router: PostsRouter?
	
	var userIds: [Int] {
		let userIds = Set(interactor?.posts.map { $0.userId } ?? [])
		return Array(userIds)
	}
	
	func fetchPosts() {
		interactor?.fetchPosts()
	}
	
	func didFetch() {
		self.view?.displayPosts()
	}
	
	func didFail(with error: String) {
		self.view?.displayError(error)
	}
	
	func numberOfSections() -> Int {
		let userIds = Set(interactor?.posts.map { $0.userId } ?? [])
		return userIds.count
	}
	
	func numberOfPosts(in section: Int) -> Int {
		let userIds = Array(Set(interactor?.posts.map { $0.userId } ?? []))
		let userId = userIds[section]
		return interactor?.posts.filter { $0.userId == userId }.count ?? 0
	}
	
	func post(for indexPath: IndexPath) -> Post? {
		let userIds = Array(Set(interactor?.posts.map { $0.userId } ?? []))
		let userId = userIds[indexPath.section]
		let posts = interactor?.posts.filter { $0.userId == userId } ?? []
		return posts[indexPath.row]
	}
}
