import Foundation

struct ArchHome:Arch
{
    typealias V = VHome
    typealias M = MHome
    
    let viewType:V.Type = VHome.self
    let modelType:M.Type = MHome.self
}
