//
//  PostsRouterImpl.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import UIKit

final class PostsRouterImpl: PostsRouter {
	
	var entry: EntryPoint?
	
	weak var presenter: PostsPresenter?
	
	static func create() -> PostsRouter {
		let router = PostsRouterImpl()
		
		// Assign VIP
		let view: PostsView = PostsViewController()
		let presenter: PostsPresenter = PostsPresenterImpl()
		var interactor: PostsInteractor = PostsInteractorImpl()
		
		view.presenter = presenter
		
		interactor.presenter = presenter
		
		presenter.router = router
		presenter.view = view
		presenter.interactor = interactor
		
		router.entry = view as? EntryPoint
		
		return router
	}
}
