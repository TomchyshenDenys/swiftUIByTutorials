/// Copyright (c) 2022 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest

final class SwiftCalcUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }

    func testPressMemoryPlusAtAppStartShowZeroInDisplay() throws {
        let app = XCUIApplication()
        app.launch()
        let memoryButton = app.buttons["M+"]
        memoryButton.tap()
        let display = app.staticTexts["display"]
        let displayText = display.label
        XCTAssertEqual(displayText, "0")
    }
    
    func testAddingTwoDigits() {
      let app = XCUIApplication()
      app.launch()
      let threeButton = app.buttons["3"]
      threeButton.tap()
      let addButton = app.buttons["+"]
      addButton.tap()
      let fiveButton = app.buttons["5"]
      fiveButton.tap()
      let equalButton = app.buttons["="]
      equalButton.tap()
      let display = app.staticTexts["display"]
      let displayText = display.label
        XCTAssertEqual(displayText, "8.0")
    }
    
    func testSwipeToClearMemory() {
      let app = XCUIApplication()
      app.launch()
      let threeButton = app.buttons["3"]
      threeButton.tap()
      let fiveButton = app.buttons["5"]
      fiveButton.tap()
      let memoryButton = app.buttons["M+"]
      memoryButton.tap()
      let memoryDisplay = app.staticTexts["memoryDisplay"]
      // 1
      XCTAssert(memoryDisplay.exists)
      // 2
      memoryDisplay.swipeLeft()
        // 3
      XCTAssertFalse(memoryDisplay.exists)
    }
}
