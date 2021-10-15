import Foundation

/// Command which execution is handled by a target.
public protocol IAmazingCommand {
    
    // MARK: - Methods
    
    /// Executes the command with a provided parameter.
    func execute(_ parameter: Any?)
    
    /// Returns a value that indicates whether the command can be executed with a provided parameter.
    func canExecute(_ parameter: Any?) -> Bool
}

/// Command which execution is handled by a target.
public final class AmazingCommand<Target: AnyObject, Parameter: Any>: IAmazingCommand {
    
    // MARK: - Type Aliases
    
    /// Function that executes the command with a provided parameter.
    public typealias ExecuteFunction = (Target) -> (Parameter) -> Void
    
    /// Function that returns a value that indicates whether the command can be executed with a provided parameter.
    public typealias CanExecuteFunction = (Target) -> (Parameter) -> Bool
    
    // MARK: - Private Properties
    
    private weak var target: Target?
    
    private let executeFunction: ExecuteFunction
    private let canExecuteFunction: CanExecuteFunction?
    
    // MARK: - Initializers
    
    /// Initializes a new instance.
    /// - Parameters:
    ///   - target: Target that owns `execute` and `canExecute` functions.
    ///   - executeFunction: Function that executes the command with a provided parameter.
    ///   - canExecuteFunction: Funtion that returns a value that indicates whether the command can be executed with a provided parameter.
    public init(target: Target,
                executeFunction: @escaping ExecuteFunction,
                canExecuteFunction: @escaping CanExecuteFunction) {
        self.target = target
        
        self.executeFunction = executeFunction
        self.canExecuteFunction = canExecuteFunction
    }
    
    /// Initializes a new instance.
    /// - Parameters:
    ///   - target: Target that owns `execute` and `canExecute` functions.
    ///   - executeFunction: Function that executes the command with a provided parameter.
    public init(target: Target,
                executeFunction: @escaping ExecuteFunction) {
        self.target = target
        
        self.executeFunction = executeFunction
        self.canExecuteFunction = nil
    }
    
    // MARK: - IAmazingCommand
    
    public func execute(_ parameter: Any?) {
        guard let target = target,
              let parameter = parameter as? Parameter
        else {
            return
        }
        
        guard canExecute(target: target, parameter: parameter) else {
            return
        }
        
        executeFunction(target)(parameter)
    }
    
    public func canExecute(_ parameter: Any?) -> Bool {
        guard let target = target else {
            return false
        }
        
        guard let canExecuteAction = canExecuteFunction else {
            return true
        }
        
        guard let parameter = parameter as? Parameter else {
            return false
        }
        
        return canExecuteAction(target)(parameter)
    }
    
    // MARK: - Private Methods
    
    private func canExecute(target: Target, parameter: Parameter) -> Bool {
        guard let canExecuteFunction = canExecuteFunction else {
            return true
        }
        
        return canExecuteFunction(target)(parameter)
    }
}
