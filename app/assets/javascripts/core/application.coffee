window.SCart          ?= {}
window.SCart.Classes  ?= {}

class SCart.Application
  constructor: ->
    @alert ?= new SCart.Classes.Alert
    Turbolinks.ProgressBar ?= Turbolinks.enableProgressBar();

  start: =>
    $(document).on('ready page:load', @afterRenderPage)

  afterRenderPage: =>
    @initializePlugins()
    @bindClasses()

  bindClasses: ($parent = $('body')) =>
    $parent.find("[data-class-binder]").each (k, el) =>
      $.each $(el).data("class-binder").split(" "), (index, className) =>
        unless $(el).hasClass(className)
          new SCart.Classes[className]({el: el})
          $(el).addClass(className)

  initializePlugins: =>