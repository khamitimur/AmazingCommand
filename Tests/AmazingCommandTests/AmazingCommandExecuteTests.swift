import XCTest

@testable import AmazingCommand

final class AmazingCommandExecuteTests: XCTestCase {

    // MARK: - Tests

    func test_execute_whenValueParameter_whenValueType() throws {
        // given
        let parameter: Int = 5

        let target = AmazingCommandTargetMock<Int>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!, parameter)
    }

    func test_execute_whenValueParameter_whenOptionalValueType() throws {
        // given
        let parameter: Int = 5

        let target = AmazingCommandTargetMock<Int?>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!, parameter)
    }

    func test_execute_whenValueParameter_whenWrongValueType() throws {
        // given
        let parameter: Int = 5

        let target = AmazingCommandTargetMock<String>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertFalse(target.invokedExecute)
    }

    func test_execute_whenValueParameter_whenWrongOptionalValueType() throws {
        // given
        let parameter: Int = 5

        let target = AmazingCommandTargetMock<String?>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertFalse(target.invokedExecute)
    }

    func test_execute_whenOptionalValueParameter_whenValueType() throws {
        // given
        let parameter: Int? = 5

        let target = AmazingCommandTargetMock<Int>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!, parameter)
    }

    func test_execute_whenOptionalValueParameterIsNil_whenValueType() throws {
        // given
        let parameter: Int? = nil

        let target = AmazingCommandTargetMock<Int>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertFalse(target.invokedExecute)
    }

    func test_execute_whenReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int> = .init(value: parameterValue)

        let target = AmazingCommandTargetMock<AmazingCommandParameterMock<Int>>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!.value, parameterValue)
    }

    func test_execute_whenReferenceParameter_whenOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int> = .init(value: parameterValue)

        let target = AmazingCommandTargetMock<AmazingCommandParameterMock<Int>?>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!!.value, parameterValue)
    }

    func test_execute_whenReferenceParameter_whenWrongReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int> = .init(value: parameterValue)

        let target = AmazingCommandTargetMock<SecondAmazingCommandParameterMock<Int>>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertFalse(target.invokedExecute)
    }

    func test_execute_whenReferenceParameter_whenWrongOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int> = .init(value: parameterValue)

        let target = AmazingCommandTargetMock<SecondAmazingCommandParameterMock<Int>?>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertFalse(target.invokedExecute)
    }

    func test_execute_whenOptionalReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int>? = .init(value: parameterValue)

        let target = AmazingCommandTargetMock<AmazingCommandParameterMock<Int>>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertTrue(target.invokedExecute)
        XCTAssertEqual(target.invokedExecuteParameter!.value, parameterValue)
    }

    func test_execute_whenOptionalReferenceParameterIsNil_whenReferenceType() throws {
        // given
        let parameter: AmazingCommandParameterMock<String>? = nil

        let target = AmazingCommandTargetMock<AmazingCommandParameterMock<String>>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertFalse(target.invokedExecute)
    }

    func test_execute_whenValueParameter_whenReferenceType() throws {
        // given
        let parameter: Int = 5

        let target = AmazingCommandTargetMock<AmazingCommandParameterMock<Int>>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertFalse(target.invokedExecute)
    }

    func test_execute_whenReferenceParameter_whenValueType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingCommandParameterMock<Int>? = .init(value: parameterValue)

        let target = AmazingCommandTargetMock<Int>()
        let command = AmazingCommand(target: target, executeFunction: AmazingCommandTargetMock.execute)

        // when
        command.execute(parameter)

        // then
        XCTAssertFalse(target.invokedExecute)
    }
}
