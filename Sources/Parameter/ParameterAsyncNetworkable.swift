import Foundation
import Moya
import VlaggenNetworkModels

/// See `ParameterService` for documentation about the different endpoints.
public protocol ParameterAsyncNetworkable {
    
    /// List of parameters
    /// - Parameter conditions: Conditions for the parameters to be returned
    /// - Returns: Parameters that conform to the conditions
    func list(conditions: [String: String], completion: @escaping (_ result: Result<[ParameterResponse], MoyaError>) -> Void)
}
