import Foundation

extension MGifStrategyDownload
{
    //MARK: private
    
    private func downloadSuccess(gif:DGif)
    {
//        gif.statusWaiting()
        downloadWithDelay()
        
//        NotificationCenter.default.post(
//            name:Notification.gifDownloaded,
//            object:nil)
    }
    
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
            //downloadFailed(gif:gif)
            
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
            //downloadFailed(gif:gif)
            
            return
        }
        
        downloadSuccess(gif:gif)
    }
}
