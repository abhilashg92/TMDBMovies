//
//  TMDB_MoviesTests.swift
//  TMDB MoviesTests
//
//  Created by Kiwi on 29/07/23.
//

import XCTest
import Combine

@testable import TMDB_Movies

final class TMDB_MoviesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchMovies() throws {
        
        let expectation = XCTestExpectation(description: "Data fetched")

        let service = MockService()
        let vm = VideosViewModel(netWorkService: service)
        vm.fetchMovies()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(vm.movies.count > 0, true)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
    }
    
    func testFetchMoviesFailure() throws {
        let expectation = XCTestExpectation(description: "Data fetched")

        let service = MockService()
        service.success = false
        let vm = VideosViewModel(netWorkService: service)
        vm.fetchMovies()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(vm.movies.count == 0, true )
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5) // Adjust the timeout if needed
    }
    
    func testUseCase() throws {
        let service = MockService()
        let usecase = SearchMoviesUseCase(netWorkSerive: service)
        usecase.searchMovies(searchText: "harry") { result in
            switch result {
            case .success(let moveis):
                XCTAssert(moveis.count > 0)
            case .failure(_):
                XCTAssert(true)
            }
        }
    }
    
    func testUseCaseFailure() throws {
        let service = MockService()
        service.success = false
        let usecase = SearchMoviesUseCase(netWorkSerive: service)
        usecase.searchMovies(searchText: "harry") { result in
            switch result {
            case .success(let moveis):
                XCTAssert(moveis.isEmpty)
            case .failure(let err):
                XCTAssertTrue(true, "\(err.hashValue)")
            }
        }
    }

}



