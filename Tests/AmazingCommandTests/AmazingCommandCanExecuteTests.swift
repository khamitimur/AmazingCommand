import XCTest

@testable import AmazingCommand

final class AmazingCommandCanExecuteTests: XCTestCase {
    
    // MARK: - Lifecycle
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
    }
    
    // MARK: - Tests
    
    func test_canExecute_whenValueParameter_whenValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTarget<Int>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenValueParameter_whenOptionalValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTarget<Int?>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenValueParameter_whenWrongValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTarget<String>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenValueParameter_whenWrongOptionalValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTarget<String?>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenOptionalValueParameter_whenValueType() throws {
        // given
        let parameter: Int? = 5
        
        let target = AmazingCommandTarget<Int>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenOptionalValueParameterIsNil_whenValueType() throws {
        // given
        let parameter: Int? = nil
        
        let target = AmazingCommandTarget<Int>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<AmazingCommandParameter>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!.value, parameterValue)
    }
    
    func test_canExecute_whenReferenceParameter_whenOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<AmazingCommandParameter?>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!!.value, parameterValue)
    }
    
    func test_canExecute_whenReferenceParameter_whenWrongReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<AnotherAmazingCommandParameter>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenReferenceParameter_whenWrongOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<AnotherAmazingCommandParameter?>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenOptionalReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter? = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<AmazingCommandParameter>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!.value, parameterValue)
    }
    
    func test_canExecute_whenOptionalReferenceParameterIsNil_whenReferenceType() throws {
        // given
        let parameter: AmazingCommandParameter? = nil
        
        let target = AmazingCommandTarget<AmazingCommandParameter>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenValueParameter_whenReferenceType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTarget<AnotherAmazingCommandParameter>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenReferenceParameter_whenValueType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter? = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<Int>()
        let command = AmazingCommand(target: target,
                                           executeAction: AmazingCommandTarget.execute,
                                           canExecuteAction: AmazingCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
}
