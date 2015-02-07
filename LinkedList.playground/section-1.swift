// Playground - noun: a place where people can play

import UIKit

class Node {
  
  var next : Node?
  var data : Int?
  
  func addNode(node : Node) {
    if self.next == nil {
      self.next = node
    } else {
      self.next!.addNode(node)
    }
  }
}

class LinkedList {
  
  var head : Node?
  
  func insertValue(value : Int) {
    var node = Node()
    node.data = value
    
    if self.head == nil {
      self.head = node
    } else {
      insertAtHead(node)
    }
  }
  
  func insertAtHead(node : Node) {
    node.next = self.head
    self.head = node
  }
  
  func insertAtEnd(node : Node) {
    head!.addNode(node)
  }
  
  func insertAtEndWithWhile(node : Node) {
    var nextNode = self.head
    while nextNode!.next != nil {
      nextNode = nextNode!.next
    }
    nextNode!.next = node
  }
}