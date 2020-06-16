//
//  TriePerformanceTests.swift
//  
//
//  Created by marko on 6/16/20.
//

import XCTest
import Trie

final class TriePerformanceTests: XCTestCase {

    private static var cities: [[String: Any]]!

    private var trie: Trie<Character, Int>!

    override class func setUp() {
        super.setUp()

        cities = try! JSONSerialization.jsonObject(with: Data(citiesJSON.utf8)) as! [[String: Any]]
        cities += cities.map { $0.shuffledName() }
        cities += cities.map { $0.shuffledName() }
        cities += cities
            .map { $0.shuffledName() }
            .shuffled()

    }

    override class func tearDown() {
        cities = nil

        super.tearDown()
    }

    override func setUpWithError() throws {
        try super.setUpWithError()

        trie = Trie()
    }

    override func tearDownWithError() throws {
        trie = nil

        try super.tearDownWithError()
    }

    // MARK: - 10 cities

    func testComplete_bestCase_firstLetter_on10Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<10]
        trie.inserting(cities: cities)
        let key = [cities.shortestName.first!]



        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_bestCase_wholeName_on10Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<10]
        trie.inserting(cities: cities)
        let key = cities.shortestName.characters



        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_firstLetter_on10Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<10]
        trie.inserting(cities: cities)
        let key = [cities.longestName.first!]

        
        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_wholeName_on10Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<10]
        trie.inserting(cities: cities)
        let key = cities.longestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    // MARK: - 100 cities

    func testComplete_bestCase_firstLetter_on100Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<10]
        trie.inserting(cities: cities)
        let key = [cities.shortestName.first!]


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_bestCase_wholeName_on100Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<100]
        trie.inserting(cities: cities)
        let key = cities.shortestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_firstLetter_on100Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<100]
        trie.inserting(cities: cities)
        let key = [cities.longestName.first!]


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_wholeName_on100Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<100]
        trie.inserting(cities: cities)
        let key = cities.longestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    // MARK: - 1 000 cities

    func testComplete_bestCase_firstLetter_on1000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<1000]
        trie.inserting(cities: cities)
        let key = [cities.shortestName.first!]


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_bestCase_wholeName_on1000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<1000]
        trie.inserting(cities: cities)
        let key = cities.shortestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_firstLetter_on1000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<1000]
        trie.inserting(cities: cities)
        let key = [cities.longestName.first!]


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_wholeName_on1000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<1000]
        trie.inserting(cities: cities)
        let key = cities.longestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    // MARK: - 10 000 cities

    func testComplete_bestCase_firstLetter_on10_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<10_000]
        trie.inserting(cities: cities)
        let key = [cities.shortestName.first!]


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_bestCase_wholeName_on10_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<10_000]
        trie.inserting(cities: cities)
        let key = cities.shortestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_firstLetter_on10_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<10_000]
        trie.inserting(cities: cities)
        let key = [cities.longestName.first!]


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_wholeName_on10_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<10_000]
        trie.inserting(cities: cities)
        let key = cities.longestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    // MARK: - 100 000 cities

    func testComplete_bestCase_firstLetter_on100_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<100_000]
        trie.inserting(cities: cities)
        let key = [cities.shortestName.first!]


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_bestCase_wholeName_on100_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<100_000]
        trie.inserting(cities: cities)
        let key = cities.shortestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_firstLetter_on100_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<100_000]
        trie.inserting(cities: cities)
        let key = [cities.longestName.first!]


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_wholeName_on100_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<100_000]
        trie.inserting(cities: cities)
        let key = cities.longestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    // MARK: - 1 000 000 cities

    func testComplete_bestCase_firstLetter_on1_000_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<1_000_000]
        trie.inserting(cities: cities)
        let key = [cities.shortestName.first!]


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_bestCase_wholeName_on1_000_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<1_000_000]
        trie.inserting(cities: cities)
        let key = cities.shortestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_firstLetter_on1_000_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<1_000_000]
        trie.inserting(cities: cities)
        let key = [cities.longestName.first!]

        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

    func testComplete_worstCase_wholeName_on1_000_000Entries() {
        // given
        let cities = TriePerformanceTests.cities[0..<1_000_000]
        trie.inserting(cities: cities)
        let key = cities.longestName.characters


        // then
        measure {
            _ = trie.complete(key: key)
        }
    }

}

private extension Dictionary where Key == String, Value == Any {

    var name: String {
        self["name"] as! String
    }

    var id: Int {
        self["id"] as! Int
    }

    func shuffledName() -> [String: Any] {
        var copy = self
        copy["name"] = name.shuffled().string
        return copy
    }

}

private extension Collection where Element == [String: Any] {

    var shortestName: String {
        sorted(by: { $0.name.count < $1.name.count }).first!.name
    }

    var longestName: String {
        sorted(by: { $0.name.count > $1.name.count }).first!.name
    }

}

private extension Trie where Element == Character, ID == Int {

    func inserting(cities: ArraySlice<[String: Any]>) {
        for city in cities {
            inserting(city.name.characters, id: city.id)
        }
    }

}
