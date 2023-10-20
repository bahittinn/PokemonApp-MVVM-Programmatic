//
//  PokemonTest.swift
//  PokemonAppTests
//
//  Created by Bahittin on 19.10.2023.
//

import XCTest

@testable import PokemonApp

final class PokemonTest: XCTestCase {
    
    private var viewModel: PokemonViewModel!
    private var view: PokemonMockHomeView!
    
    override func setUp() {
        super.setUp()
        view = .init()
        viewModel = .init()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_viewDidLoad_InvkoesRequiredMethods() {
        XCTAssertFalse(view.invokeConfigureVC)
        
        view.configureVC()
        
        XCTAssertEqual(view.invokeConfigureVCCount, 1)
    }
    
}
