//
//  File.swift
//  
//
//  Created by marko on 6/9/20.
//

import XCTest
import Trie

final class TrieTests: XCTestCase {

    func testInserting_singleElement_shouldCreatedExpectedTrie() {
        // given
        let expectedTrie = Trie<Character, Int>(children: [
            "w": Trie(children: [
                "t": Trie(children: [
                    "f": Trie(ids: [0], children: [:])
                ])
            ])
        ])

        // when
        let trie = Trie<Character, Int>().inserting("wtf".characters, id: 0)

        // then
        XCTAssertEqual(trie, expectedTrie)
    }

    func testInserting_abc_shouldCreatedExpectedTrie() {
        // given
        let expectedTrie = Trie<Character, Int>(ids: [], children: [
            "a": Trie(ids: [0], children: [:]),
            "b": Trie(ids: [1], children: [:]),
            "c": Trie(ids: [2], children: [:])
        ])

        // when
        let trie = Trie<Character, Int>()
            .inserting("a".characters, id: 0)
            .inserting("b".characters, id: 1)
            .inserting("c".characters, id: 2)

        // then
        XCTAssertEqual(trie, expectedTrie)
    }

    func testInserting_overlappingElements_shouldCreatedExpectedTrie() {
        // given
        let expectedTrie = Trie<Character, Int>(ids: [], children: [
            "w": Trie(children: [
                "t": Trie(children: [
                    "f": Trie(ids: [0], children: [:]),
                    "h": Trie(children: [
                        "e": Trie(children: [
                            "c": Trie(children: [
                                "k": Trie(ids: [2], children: [:])
                            ])
                        ])
                    ])
                ]),
                "h": Trie(children: [
                    "a": Trie(children: [
                        "t": Trie(ids: [1], children: [:])
                    ])
                ])
            ])
        ])

        // when
        let trie = Trie<Character, Int>()
            .inserting("wtf".characters, id: 0)
            .inserting("what".characters, id: 1)
            .inserting("wtheck".characters, id: 2)

        // then
        XCTAssertEqual(trie, expectedTrie)
    }

    func testComplete_wt_shouldCompleteAsExpected() {
        // given
        let trie = Trie<Character, Int>(children: [
            "w": Trie(children: [
                "t": Trie(children: [
                    "f": Trie(ids: [0], children: [:]),
                    "h": Trie(children: [
                        "e": Trie(children: [
                            "c": Trie(children: [
                                "k": Trie(ids: [2], children: [:])
                            ])
                        ])
                    ])
                ]),
                "h": Trie(children: [
                    "a": Trie(children: [
                        "t": Trie(ids: [1], children: [:])
                    ])
                ])
            ])
        ])

        // when
        let result = trie.complete(key: "wt".characters)

        // then
        XCTAssertUnorderedEqual(result, ["f".characters, "heck".characters])
    }

}

func XCTAssertUnorderedEqual<T>(_ array1: Array<T>, _ array2: Array<T>, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T: Comparable {
    XCTAssertEqual(array1.sorted(), array2.sorted(), message(), file: file, line: line)
}
