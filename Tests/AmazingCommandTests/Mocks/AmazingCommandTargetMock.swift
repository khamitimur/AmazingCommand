final class AmazingCommandTargetMock<T> {
    
    // MARK: - Properties
    
    var invokedExecute = false
    var invokedExecuteParameter: T?
    
    var invokedCanExecute = false
    var invokedCanExecuteParameter: T?
    
    // MARK: - Methods
    
    func execute(_ parameter: T) {
        invokedExecute = true
        invokedExecuteParameter = parameter
    }
    
    func canExecute(_ parameter: T) -> Bool {
        invokedCanExecute = true
        invokedCanExecuteParameter = parameter
        
        return true
    }
}
