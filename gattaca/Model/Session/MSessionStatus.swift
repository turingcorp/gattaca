import Foundation

extension MSession
{
    enum Status
    {
        case new
        case loading
        case sync
        case loaded
        case authLocation
        case waitingLocation
        case ready
    }
}
