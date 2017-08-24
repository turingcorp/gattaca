import Foundation

struct ArchHome:Arch
{
    typealias V = VHome
    
    let viewType:V.Type = VHome.self
}
