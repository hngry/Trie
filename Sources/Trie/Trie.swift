//
//  Trie.swift
//  
//
//  Created by marko on 6/9/20.
//

public struct Trie<Element: Hashable, ID: Hashable>: Equatable {

    public typealias IDs = Set<ID>
    public typealias Children = [Element: Trie<Element, ID>]

    private let ids: IDs
    private let children: Children

    public init(
        ids: IDs = [],
        children: Children = [:]
    ) {
        self.ids = ids
        self.children = children
    }

    init(_ key: [Element], id: ID) {
        if let (head, tail) = key.decomposed {
            let children = [head: Trie(tail, id: id)]
            self = Trie(children: children)
        } else {
            self = Trie(ids: [id], children: [:])
        }
    }

    @discardableResult
    public func inserting(_ key: [Element], id: ID) -> Trie {
        guard let (head, tail) = key.decomposed else {
            return Trie(ids: ids.union([id]), children: children)
        }
        var newChildren = children
        if let nextTrie = children[head] {
            newChildren[head] = nextTrie.inserting(tail, id: id)
        } else {
            newChildren[head] = Trie(tail, id: id)
        }
        return Trie(ids: ids, children: newChildren)
    }

    public func lookup(key: [Element]) -> Trie? {
        guard let (head, tail) = key.decomposed else { return self }
        guard let subTrie = children[head] else { return nil }
        return subTrie.lookup(key: tail)
    }

    public func complete(key: [Element]) -> [[Element]] {
        return lookup(key: key)?.elements ?? []
    }

    public var hasIds: Bool {
        return ids.isEmpty == false
    }

     public var elements: [[Element]] {
        if hasIds {
            return [[]]
        }
        return children.flatMap { key, value -> [[Element]] in
            value.elements.map { [key] + $0 }
        }
    }
    
}

extension Array {

    var decomposed: (Element, [Element])? {
        return isEmpty ? nil : (self[startIndex], Array(self.dropFirst()))
    }
    
}
