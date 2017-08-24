import Foundation

struct ArchHome:Arch
{
    typealias V = VHome
    typealias M = MHome
    typealias C = CHome
    
    let viewType:V.Type = VHome.self
    let modelType:M.Type = MHome.self
    let controllerType:C.Type = CHome.self
}
