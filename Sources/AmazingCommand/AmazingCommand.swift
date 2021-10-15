import Foundation

/// Command which execution is handled by a target.
public protocol IAmazingCommand {
    
    // MARK: - Methods
    
    /// Executes the command.
    /// - Parameter parameter: A parameter to pass to the `execute` action.
    func execute(_ parameter: Any?)
    
    /// Returns a value that indicates whether the command can be executed with a provided parameter.
    /// - Parameter parameter: A parameter to pass to the `canExecute` action.
    func canExecute(_ parameter: Any?) -> Bool
}

public final class AmazingVoidCommand<Target: AnyObject>: IAmazingCommand {
    
    // MARK: - Type Aliases
    
    /// Action that executes the command.
    public typealias ExecuteAction = (Target) -> () -> Void
    
    /// Action that returns a value that indicates whether the command can be executed with a provided parameter.
    public typealias CanExecuteAction = (Target) -> () -> Bool
    
    // MARK: - Private Properties
    
    private weak var target: Target?
    
    private let executeAction: ExecuteAction
    private let canExecuteAction: CanExecuteAction?
    
    // MARK: - Initializers
    
    /// Initializes a new instance.
    /// - Parameters:
    ///   - target: Target that owns actions.
    ///   - executeAction: Action that executes the command.
    ///   - canExecuteAction: Action that returns a value that indicates whether the command can be executed with a provided parameter.
    public init(target: Target,
                executeAction: @escaping ExecuteAction,
                canExecuteAction: CanExecuteAction? = nil) {
        self.target = target
        
        self.executeAction = executeAction
        self.canExecuteAction = canExecuteAction
    }
    
    // MARK: - IAmazingCommand
    
    public func execute(_ parameter: Any?) {
        guard let target = target else {
            return
        }
        
        executeAction(target)()
    }
    
    public func canExecute(_ parameter: Any?) -> Bool {
        guard let target = target else {
            return false
        }
        
        guard let canExecuteAction = canExecuteAction else {
            return true
        }
        
        return canExecuteAction(target)()
    }
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
    
    private let executeAction: ExecuteAction
    private let canExecuteAction: CanExecuteAction?
    
    // MARK: - Initializers
    
    /// Initializes a new instance.
    /// - Parameters:
    ///   - target: Target that owns actions.
    ///   - executeAction: Action that executes the command.
    ///   - canExecuteAction: Action that returns a value that indicates whether the command can be executed with a provided parameter.
    public init(target: Target,
                executeAction: @escaping ExecuteAction,
                canExecuteAction: CanExecuteAction? = nil) {
        self.target = target
        
        self.executeAction = executeAction
        self.canExecuteAction = canExecuteAction
    }
    
    // MARK: - IAmazingCommand
    
    public func execute(_ parameter: Any?) {
        guard let target = target else {
            return
        }
        
        guard let parameter = parameter as? Parameter else { return }
        
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
}

public extension AmazingCommand where Parameter == Void {
    
    // MARK: - Methods
    
    /// Executes the command.
    func execute() {
        execute(())
    }
    
    /// Returns a value that indicates whether the command can be executed.
    func canExecute() -> Bool {
        canExecute(())
    }
}
