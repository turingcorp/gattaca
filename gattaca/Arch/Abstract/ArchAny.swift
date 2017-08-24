import Foundation

struct ArchAny<V>:Arch
{
    init<T:Arch>(arch:T) where T.V == V
    {
        viewType = arch.viewType
    }
    
    var viewType:V.Type
}
