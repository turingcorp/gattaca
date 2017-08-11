import Foundation

class MHomeItem
{
    let url:URL
    private(set) weak var gif:DGif?
    
    init(url:URL, gif:DGif)
    {
        self.url = url
        self.gif = gif
    }
}
