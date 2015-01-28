# d-lazyimg

> Lazy load images

## Dependencies

Requires `derby-stylus` to support styles.

## Usage

1. Create `images.assets.js` file with datauri images. Use `datauri` module for it:

    ```js
    // File must be named *.assets.js
    var datauri = require('datauri');
    
    module.exports = {
    
      // Logo (full versions to be used with dataimg)
      '/img/logo_blue.svg': datauri(
          __dirname + '/../public/img/logo_blue.svg'),
    
      '/img/logo_white.svg': datauri(
          __dirname + '/../public/img/logo_white.svg'),    
    
      // Backgrounds (we specify minified versions to be used with lazyimg)
    
      '/img/cloudy-hills.jpg': datauri(
          __dirname + '/../public/img/cloudy-hills.min.jpg'),
      '/img/bg_strings.jpg': datauri(
          __dirname + '/../public/img/bg_strings.min.jpg'),
    };
    ```

2. Plug in `d-lazyimg` module and provide datauri assets as an option:

    ```js
    app.use(require('d-lazyimg'), require('./images.assets'));
    ```
    
3. Use `lazyimg` component to do lazy loading of big image:    

    ```html    
    <lazyimg img='/img/cloudy-hills.jpg'>
    ```
    
  It will instantly load the small image `cloudy-hills.min.jpg` you specified in the assets as datauri. Right after that it will start the regular asynchronous loading of the heavy `cloudy-hills.jpg`. When full image finish loading it will transparently switch itself with the minified version. 
  
  Image caching is not affected - if the full image is already in the browser's cache it won't try to load it the second time the server.
  
4. Use `dataimg` to embed the full image as datauri:    

    ```html    
    <dataimg img='/img/logo_blue.svg'>
    ```
