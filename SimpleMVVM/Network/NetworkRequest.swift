import Foundation

class NetworkRequest {
    static let shared = NetworkRequest()
    
    private let sessionConfiguration = URLSessionConfiguration.default
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    private init() {}
    
    func getData(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completion(.failure(.urlError))
            return
        }
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else {return}
            
            if error == nil, let parsData = data {
                do {
                    let users = try self.decoder.decode([User].self, from: parsData)
                    completion(.success(users))
                } catch {
                    completion(.failure(.canNotParseData))
                }
            } else {
                completion(.failure(.urlError))
            }
        }.resume()
    }
}
