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

struct ArchHomeContainer:ArchContainer
{
    typealias A = ArchHome

    var archType: ArchHome.Type = ArchHome.self
}

struct ArchSettings:Arch
{
    typealias V = VSettings
    typealias M = MSession
    typealias C = CSettings
    
    let viewType:V.Type = VSettings.self
    let modelType:M.Type = MSession.self
    let controllerType:C.Type = CSettings.self
}

struct ArchSettingsContainer:ArchContainer
{
    typealias A = ArchSettings
    
    var archType: ArchSettings.Type = ArchSettings.self
}
