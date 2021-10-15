import XCTest

@testable import AmazingCommand

final class AmazingCommandCanExecuteTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_canExecute_whenValueParameter_whenValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTargetMock<Int>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenValueParameter_whenOptionalValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTargetMock<Int?>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenValueParameter_whenWrongValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTargetMock<String>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenValueParameter_whenWrongOptionalValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTargetMock<String?>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenOptionalValueParameter_whenValueType() throws {
        // given
        let parameter: Int? = 5
        
        let target = AmazingCommandTargetMock<Int>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenOptionalValueParameterIsNil_whenValueType() throws {
        // given
        let parameter: Int? = nil
        
        let target = AmazingCommandTargetMock<Int>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int> = .init(value: parameterValue)
        
        let target = AmazingCommandTargetMock<AmazingCommandParameterMock<Int>>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!.value, parameterValue)
    }
    
    func test_canExecute_whenReferenceParameter_whenOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int> = .init(value: parameterValue)
        
        let target = AmazingCommandTargetMock<AmazingCommandParameterMock<Int>?>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!!.value, parameterValue)
    }
    
    func test_canExecute_whenReferenceParameter_whenWrongReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int> = .init(value: parameterValue)
        
        let target = AmazingCommandTargetMock<SecondAmazingCommandParameterMock<Int>>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenReferenceParameter_whenWrongOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int> = .init(value: parameterValue)
        
        let target = AmazingCommandTargetMock<SecondAmazingCommandParameterMock<Int>?>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenOptionalReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int>? = .init(value: parameterValue)
        
        let target = AmazingCommandTargetMock<AmazingCommandParameterMock<Int>>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!.value, parameterValue)
    }
    
    func test_canExecute_whenOptionalReferenceParameterIsNil_whenReferenceType() throws {
        // given
        let parameter: AmazingCommandParameterMock<String>? = nil
        
        let target = AmazingCommandTargetMock<AmazingCommandParameterMock<String>>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenValueParameter_whenReferenceType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingCommandTargetMock<AmazingCommandParameterMock<Int>>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenReferenceParameter_whenValueType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int>? = .init(value: parameterValue)
        
        let target = AmazingCommandTargetMock<Int>()
        let command = AmazingCommand(target: target,
                                     executeFunction: AmazingCommandTargetMock.execute,
                                     canExecuteFunction: AmazingCommandTargetMock.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
}
