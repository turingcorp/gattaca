import Foundation

struct ArchAny<T:Arch>:Arch
{
    let viewType:T.V.Type = T.V.self
    let modelType:T.M.Type = T.M.self
}
