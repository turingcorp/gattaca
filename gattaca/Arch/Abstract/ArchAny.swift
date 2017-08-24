import Foundation

struct ArchAny<T:Arch>:Arch
{
    let viewType:T.V.Type = T.V.self
}
