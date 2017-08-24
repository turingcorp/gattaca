import Foundation

class ArchAny<B:Arch>:ArchContainer
{
    typealias A = B
    
    var archType: B.Type
    
    required init() {
        archType = B.self
    }
}

protocol ArchAnyHelper
{
//    init(container:B)
//    {
//        super.init()
//        archType = container.archType
//    }
}

extension ArchAnyHelper
{
    func arch<U:Arch, T:ArchAny<U>>(archType:U.Type) -> T
    {
        return T()
    }
}

class ArchDefinition:ArchAnyHelper
{
}

class alpha<A:ArchDefinition>
{
    init()
    {
        let helper = ArchDefinition()
        let x = [helper.arch(archType: ArchHome.self), helper.arch(archType: ArchSettings.self)] as [Any]
        
        let y:ArchAny? = x[0] as? ArchAny
    }
}
