import Foundation
import VlaggenNetworkModels
import Moya

public enum ParameterService {
    /// List of all the parameters.
    case list
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
            case .list:
                return .requestPlain
        }
    }

    public var headers: [String: String]? {
        return [
            "Content-type": "application/json",
        ]
    }
}
