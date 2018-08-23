import UIKit
import WebKit
class WebViewCV: UIViewController, UIWebViewDelegate, WKNavigationDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://ikg-ds.wixsite.com/developerhelp")!
        let request = NSURLRequest(url: url as URL)
        webView.load(request as URLRequest)
        webView.navigationDelegate = self
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
}
