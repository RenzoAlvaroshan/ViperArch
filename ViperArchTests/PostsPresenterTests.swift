//
//  PostsPresenterTests.swift
//  PostsPresenterTests
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import XCTest
@testable import ViperArch

final class PostsPresenterTests: XCTestCase {
	var interactor: PostsInteractorMock!
	var presenter: PostsPresenterImpl!
	var view: PostsViewMock!

	override func setUp() {
		super.setUp()
		interactor = PostsInteractorMock()
		view = PostsViewMock()
		presenter = PostsPresenterImpl()
		presenter.view = view
		presenter.interactor = interactor
	}

	override func tearDown() {
		interactor = nil
		view = nil
		presenter = nil
		super.tearDown()
	}

	func testFetchPosts() {
		// Given
		let posts = [Post(userId: 1, id: 1, title: "Test title", body: "Test body")]
		interactor.posts = posts

		// When
		presenter.fetchPosts()
		presenter.didFetch()

		// Then
		XCTAssertTrue(interactor.fetchPostsCalled)
		XCTAssertTrue(view.displayPostsCalled)
		XCTAssertFalse(view.displayErrorCalled)
	}

	func testFetchPostsWithError() {
		// Given
		let error = NSError(domain: "test", code: 0, userInfo: nil)
		interactor.error = error

		// When
		presenter.fetchPosts()
		presenter.didFail(with: "mock no connection")

		// Then
		XCTAssertTrue(interactor.fetchPostsCalled)
		XCTAssertFalse(view.displayPostsCalled)
		XCTAssertTrue(view.displayErrorCalled)
	}
}

class PostsInteractorMock: PostsInteractor {
	var presenter: PostsPresenter?
	var posts: [Post] = []
	var error: Error?
	var fetchPostsCalled = false

	func fetchPosts() {
		fetchPostsCalled = true
		if let error = error {
			presenter?.didFail(with: error.localizedDescription)
		} else {
			presenter?.didFetch()
		}
	}

	func setPresenter(_ presenter: PostsPresenter) {
		self.presenter = presenter
	}
}

class PostsViewMock: PostsView {
	var presenter: PostsPresenter?
	var displayPostsCalled = false
	var displayErrorCalled = false

	func displayPosts() {
		displayPostsCalled = true
	}

	func displayError(_ message: String) {
		displayErrorCalled = true
	}
}
