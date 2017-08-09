import Foundation

extension DGif
{
    enum Mark:Int16
    {
        case none
        case hate
        case meh
        case like
    }
    
    enum Status:Int16
    {
        case new
        case loading
        case waiting
        case marked
        case cleaned
    }
}
