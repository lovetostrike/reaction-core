Template.productSocial.created = ->
  socials = ReactionCore.Collections.Shops.findOne(ReactionCore.shopId).socials
    
  ShareIt.configure
    autoInit: false
    sites: 
      'facebook':
        'xbfml': false
        'appId': socials.facebook.appId
      'twitter': {}
      'pinterest': {}
      'googleplus': {}
    iconOnly: true
    applyColors: false
    faSize: 'fa-lg'
    classes: ''
    
  FB.init(ShareIt.settings.sites.facebook)  
  return
  
Template.productSocial.helpers
  socialData: () ->
    product = selectedProduct()
    current = selectedVariant()
    imgSrc = Session.get('socialImgSrc')
    
    url: window.location.href
    title: current.title
    description: product.description.substring(0, 254)
    facebook:
      description: product.facebookMsg
    twitter:
      title: product.twitterMsg
    pinterest:
      description: product.pinterestMsg
    googleplus:
      itemtype: 'Product'
      description: product.googleplusMsg
    media: imgSrc
    thumbnail: imgSrc