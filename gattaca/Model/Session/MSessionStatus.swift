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
        case askAuthLocation
        case waitingLocation
        case syncLocation
        case locationDenied
        case ready
    }
}
