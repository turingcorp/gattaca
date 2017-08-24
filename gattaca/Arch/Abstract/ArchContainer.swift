import Foundation

protocol ArchContainer
{
    associatedtype A:Arch
    
    var archType:A.Type { get }
}
