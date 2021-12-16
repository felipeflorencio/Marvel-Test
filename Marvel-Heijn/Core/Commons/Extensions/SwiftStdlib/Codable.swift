//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

extension Data {
    func decoded<T: Decodable>() throws -> T {
        try JSONDecoder().decode(T.self, from: self)
    }
}

extension Encodable {
    func encoded() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
