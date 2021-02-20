import Foundation
import VlaggenNetworkModels
import Moya

public enum ParameterService {
    /// List of all the parameters.
    case list(conditions: [String: String])
}

extension ParameterService: TargetType {

    public var path: String {
        switch self {
            case .list:
                return "/api/v1/parameters"
        }
    }

    public var method: Moya.Method {
        switch self {
            case .list:
                return .get
        }
    }

    public var task: Task {
        switch self {
            case .list(let conditions):
                return .requestParameters(parameters: conditions, encoding: URLEncoding.queryString)
        }
    }

    public var headers: [String: String]? {
        return [
            "Content-type": "application/json",
        ]
    }
}
