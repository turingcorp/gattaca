import Foundation

class ModelSignature<V>:Signature
{
    init<T:Signature>(signature:T) where T.V == V
    {
        viewType = T.V.self
    }
    
    var viewType:V.Type
}
