import UIKit

extension CHome
{
    //MARK: private
    
    private func shareLink()
    {
        guard
            
            let item:MHomeItem = model.items.first,
            let identifier:String = item.gif?.identifier,
            let url:URL = MGiphy.factoryShareGifUrl(
                identifier:identifier)
            
        else
        {
            return
        }
        
        share(url:url)
    }
    
    private func shareGif()
    {
        model.downloadGif
        { (url:URL?) in
            
            DispatchQueue.main.async
            { [weak self] in
                
                self?.asyncShareGif(url:url)
            }
        }
    }
    
    private func asyncShareGif(url:URL?)
    {
        guard
            
            let url:URL = url
            
        else
        {
            let message:String = String.localizedController(
                key:"CHome_errorShareGif")
            VAlert.messageFail(message:message)
            
            return
        }
        
        share(url:url)
    }
    
    private func shareMp4()
    {
        guard
            
            let item:MHomeItem = model.items.first
            
        else
        {
            return
        }
        
        let url:URL = item.url
        share(url:url)
    }
    
    private func share(url:URL)
    {
        let activity:UIActivityViewController = UIActivityViewController(
            activityItems:[url],
            applicationActivities:nil)
        
        if let popover:UIPopoverPresentationController = activity.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.any
        }
        
        present(activity, animated:true, completion:nil)
    }
    
    //MARK: internal
    
    func share()
    {
        let alert:UIAlertController = UIAlertController(
            title:String.localizedController(key:"CHome_alertShareTitle"),
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"CHome_alertShareCancel"),
            style:
            UIAlertActionStyle.cancel)
        
        let actionGif:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"CHome_alertShareGif"),
            style:UIAlertActionStyle.default)
        { [weak self] (action:UIAlertAction) in
            
            self?.shareGif()
        }
        
        let actionMp4:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"CHome_alertShareMp4"),
            style:UIAlertActionStyle.default)
        { [weak self] (action:UIAlertAction) in
            
            self?.shareMp4()
        }
        
        let actionLink:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"CHome_alertShareLink"),
            style:UIAlertActionStyle.default)
        { [weak self] (action:UIAlertAction) in
            
            self?.shareLink()
        }
        
        alert.addAction(actionGif)
        alert.addAction(actionMp4)
        alert.addAction(actionLink)
        alert.addAction(actionCancel)
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(alert, animated:true, completion:nil)
    }
}
