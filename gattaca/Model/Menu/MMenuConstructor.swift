import Foundation

class MMenuConstructor:MMenuItemConstructorProtocol
{
    typealias V = ViewMain
    typealias M = Model<ViewMain>
    typealias C = Controller<ViewMain, Model<ViewMain>>

    var controller: Controller<ViewMain, Model<ViewMain>>.Type
}

class MMenuConstructorA:MMenuConstructor
{
    override var controller: CHome.Type
    {
        get{
            return CHome.self
        }
        
        set
        {
        
        }
    }
}
