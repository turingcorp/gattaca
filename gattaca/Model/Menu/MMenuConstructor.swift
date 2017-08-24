import Foundation

class MMenuConstructor:MMenuItemConstructorProtocol
{
    typealias V = VHome
    typealias M = MHome
    typealias C = CHome

    var controller: CHome.Type = CHome.self
}

class MMenuConstructorA:MMenuConstructor
{
    override var controller: CHome.Type = CHome.self
}
