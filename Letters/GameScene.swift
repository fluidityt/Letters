//
//  GameScene.swift
//  Letters
//
//  Created by Dude Guy  on 12/2/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

  
  typealias Letter = SKLabelNode
  typealias Word   = SKShapeNode // contains [Letter]
  typealias Sentence = SKShapeNode // contains [Word]
  
  
  func makeLetter(_ string: String) -> Letter {
    let newLetter = SKLabelNode(text: string)
    // newLetter.fontName = "Chalkduster"
    newLetter.fontSize = 24
    newLetter.verticalAlignmentMode = .baseline
    newLetter.horizontalAlignmentMode = .center
    
    return newLetter
  }
  
  func makeWord(letters: [Letter]) -> Word {
    
    func widthHeightToRect() -> CGRect {
      var totalLength = CGFloat(0)
      var maxHeight   = CGFloat(0)
      for letter in letters {
        totalLength += letter.frame.width
        if letter.frame.height > maxHeight { maxHeight = letter.frame.height }
      }
      return CGRect(origin: CGPoint(x:0,y:0),
                    size: CGSize(width: totalLength, height: maxHeight))
    }
    let rect = SKShapeNode(rect: widthHeightToRect())
    rect.position = CGPoint(x:-200,y:60)
    
    var nextPoint = CGPoint(x: 0, y: 60)
    for letter in letters {
      
      rect.addChild(letter)
      let width = letter.frame.width
      letter.position = nextPoint
      letter.position.x = nextPoint.x + ((width / 2) - 2)
      nextPoint.x += width
      
    }
  
    
    return rect
  }
  
  func makeSentence(words: [Word]) -> Sentence {
  
    func joinWord() {} // pairs of two?
    
    return Sentence()
  }
  
  override func didMove(to view: SKView) {
    let
    H = makeLetter("H"),
    e = makeLetter("e"),
    l = makeLetter("l"),
    l2 = makeLetter("l"),
    o = makeLetter("o"),
    __ = makeLetter("_"),
    w = makeLetter("w"),
    o2 = makeLetter("o"),
    r = makeLetter("r"),
    d = makeLetter("d"),
    Hello_word = makeWord(letters: [H,e,l,l2,o,__,w,o2,r,d])
    Hello_word.setScale(5)
    addChild(Hello_word)
    
    print("hi")
    
  }
  override func update(_ currentTime: TimeInterval) {
    //    print("yo")
  }
}
