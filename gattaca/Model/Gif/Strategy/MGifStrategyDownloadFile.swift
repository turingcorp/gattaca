import Foundation

extension MGifStrategyDownload
{
    //MARK: internal
    
    func saveGifData(gif:DGif, data:Data)
    {
        guard
            
            let identifier:String = gif.identifier,
            let directory:URL = MGif.directory(),
            let gifPath:URL = MGif.factoryPath(
                identifier:identifier,
                directory:directory)
            
        else
        {
            return
        }
        
        do
        {
            try data.write(
                to:gifPath,
                options:Data.WritingOptions.atomicWrite)
        }
        catch
        {
            return
        }
        
        model.gifReady(gif:gif)
    }
}
