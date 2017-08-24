import Foundation

class Alpha<T:ViewMain, U:Model<T>>:Arch
{
    let viewType: T.Type = T.self
    let modelType: U.Type = U.self

    typealias V = T
    typealias M = U
    
    init<A:Arch>(arch:A) where A.V == T, A.M == U
    {
        
    }
}

protocol Beta
{
    associatedtype A
    associatedtype B
    
    var archType:Alpha<A, B>.Type { get }
}

// MARK: - Abstract base class
class _AnyPokemonBase<T:Arch>:ArchContainer
{
    typealias A = T

    init() {
        guard type(of: self) != _AnyPokemonBase.self else {
            fatalError("_AnyPokemonBase<power> instances can not be created; create a subclass instance instead")
        }
    }
    
    var archType:A.Type
    {
        fatalError("Must override")
    }
}

// MARK: - Box container class
fileprivate final class _AnyPokemonBox<Base:ArchContainer>: _AnyPokemonBase<Base.A> {
    var base: Base
    init(_ base: Base) { self.base = base }
    
    fileprivate override var archType:Base.A.Type
    {
        return base.archType
    }
}

// MARK: - AnyPokemon Wrapper
final class AnyPokemon<Power:Arch>: ArchContainer {
    private let box: _AnyPokemonBase<Power>
    init<Base:ArchContainer>(_ base: Base) where Base.A == Power {
        box = _AnyPokemonBox(base)
    }
    
    var archType: Power.Type
    {
        return box.archType
    }
}

class testo
{
    func asd()
    {
        let x:Alpha = Alpha(arch:ArchHome())
        
        let a:AnyPokemon = AnyPokemon(ArchSettingsContainer())
        if let b:AnyPokemon = a as? AnyPokemon
        {
            
        }
    }
}
