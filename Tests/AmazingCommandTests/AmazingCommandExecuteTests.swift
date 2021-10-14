import XCTest

@testable import AmazingCommand

final class AmazingCommandExecuteTests: XCTestCase {
    
    // MARK: - Lifecycle
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
    }
    
    // MARK: - Tests
    
    func test_execute_whenValueParameter_whenValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTarget<Int>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!, parameter)
    }
    
    func test_execute_whenValueParameter_whenOptionalValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTarget<Int?>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!, parameter)
    }
    
    func test_execute_whenValueParameter_whenWrongValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTarget<String>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertFalse(target.invokedExecute)
    }
    
    func test_execute_whenValueParameter_whenWrongOptionalValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTarget<String?>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertFalse(target.invokedExecute)
    }
    
    func test_execute_whenOptionalValueParameter_whenValueType() throws {
        // given
        let parameter: Int? = 5
        
        let target = AmazingCommandTarget<Int>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!, parameter)
    }
    
    func test_execute_whenOptionalValueParameterIsNil_whenValueType() throws {
        // given
        let parameter: Int? = nil
        
        let target = AmazingCommandTarget<Int>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertFalse(target.invokedExecute)
    }
    
    func test_execute_whenReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<AmazingCommandParameter>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!.value, parameterValue)
    }
    
    func test_execute_whenReferenceParameter_whenOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<AmazingCommandParameter?>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!!.value, parameterValue)
    }
    
    func test_execute_whenReferenceParameter_whenWrongReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<AnotherAmazingCommandParameter>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertFalse(target.invokedExecute)
    }
    
    func test_execute_whenReferenceParameter_whenWrongOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<AnotherAmazingCommandParameter?>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertFalse(target.invokedExecute)
    }
    
    func test_execute_whenOptionalReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter? = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<AmazingCommandParameter>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!.value, parameterValue)
    }
    
    func test_execute_whenOptionalReferenceParameterIsNil_whenReferenceType() throws {
        // given
        let parameter: AmazingCommandParameter? = nil
        
        let target = AmazingCommandTarget<AmazingCommandParameter>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertFalse(target.invokedExecute)
    }
    
    func test_execute_whenValueParameter_whenReferenceType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTarget<AnotherAmazingCommandParameter>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertFalse(target.invokedExecute)
    }
    
    func test_execute_whenReferenceParameter_whenValueType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameter? = .init(value: parameterValue)
        
        let target = AmazingCommandTarget<Int>()
        let command = AmazingCommand(target: target, executeAction: AmazingCommandTarget.execute)
        
        // when
        command.execute(parameter)
        
        // then
        XCTAssertFalse(target.invokedExecute)
    }
}
