# Linux-webp

##### Webp images are relatively new image format developed by Google, this is a significantly smaller image size, without losing much of quality in comparison with jpeg. By reducing the image sizes we can reduce the bandwidth usage and improve page loading speed significantly. In my case we are redusing image size to 25 to 20% from the original image size.

##### We need to mitigate couple of issues using webp images. 
##### 1) webp images supported by most of newer browsers, however we need to support older browsers, in my case about 10% users coming from browsers without webp support.
##### 2) To convert existing web application to use webp or both webp and jpeg involved in lot of time.

This example is for a LEMP stack, taken from one of our Wordpress site
We can easily overcome this issue with the following steps
1) convert all existing jpg,png,.. images to webp // I have used cwebp
When naming webp images we simply add webp extension for the current image, example  wo.jpg to wo.jpg.webp
webpcon.sh
2) add listner to add remove webp images when any changes to jpg,png images // I have used inotifywait
webpwatch.sh
3) changes to nginx config to check browser support for webp and serve webp for newer browsers and jpeg/png for older browsers
mysite.com.conf
