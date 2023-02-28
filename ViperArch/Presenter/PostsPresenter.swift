//
//  PostsPresenter.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import Foundation

protocol PostsPresenter: AnyObject {
	var view: PostsView? { get set }
	var interactor: PostsInteractor? { get set }
	var router: PostsRouter? { get set }
	var userIds: [Int] { get }
	func fetchPosts()
	func didFetch()
	func didFail(with error: String)
	func numberOfSections() -> Int
	func numberOfPosts(in section: Int) -> Int
	func post(for indexPath: IndexPath) -> Post?
}
