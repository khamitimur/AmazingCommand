import Foundation

/// Command which execution is handled by a target.
public protocol IAmazingCommand {
    
    // MARK: - Methods
    
    /// Executes the command.
    func execute(_ parameter: Any?)
    
    /// Returns a value that indicates whether the command can be executed with a provided parameter.
    func canExecute(_ parameter: Any?) -> Bool
}

/// Command which execution is handled by a target.
public final class AmazingCommand<Target: AnyObject, Parameter: Any>: IAmazingCommand {
    
    // MARK: - Type Aliases
    
    /// Action that executes the command.
    public typealias ExecuteAction = (Target) -> (Parameter) -> Void
    
    /// Action that returns a value that indicates whether the command can be executed with a provided parameter.
    public typealias CanExecuteAction = (Target) -> (Parameter) -> Bool
    
    // MARK: - Private Properties
    
    private weak var target: Target?
    
    private let executeAction: (Target) -> (Parameter) -> Void
    private let canExecuteAction: ((Target) -> (Parameter) -> Bool)?
    
    // MARK: - Initializers
    
    /// Initializes a new instance.
    /// - Parameters:
    ///   - target: Target that owns actions.
    ///   - executeAction: Action that executes the command.
    ///   - canExecuteAction: Action that returns a value that indicates whether the command can be executed with a provided parameter.
    public init(target: Target,
                executeAction: @escaping (Target) -> (Parameter) -> Void,
                canExecuteAction: ((Target) -> (Parameter) -> Bool)? = nil) {
        self.target = target
        
        self.executeAction = executeAction
        self.canExecuteAction = canExecuteAction
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
        
        executeAction(target)(parameter)
    }
    
    public func canExecute(_ parameter: Any?) -> Bool {
        guard let target = target else {
            return false
        }
        
        guard let canExecuteAction = canExecuteAction else {
            return true
        }
        
        guard let parameter = parameter as? Parameter else {
            return false
        }
        
        return canExecuteAction(target)(parameter)
    }
    
    // MARK: - Private Methods
    
    private func canExecute(target: Target, parameter: Parameter) -> Bool {
        guard let canExecuteAction = canExecuteAction else {
            return true
        }
        
        return canExecuteAction(target)(parameter)
    }
}
