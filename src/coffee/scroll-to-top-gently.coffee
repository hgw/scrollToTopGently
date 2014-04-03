###
  scrollToTopGently

  @require jQuery
  @require jQuery Easing v1.3
###
$.scrollToTopGently = (element, options) ->

  defaults =
    version : "0.1"
    leftTarget : null
    topThreshold  : 100
    duration      : 200
    skip          : true
    skipTargetTop : 200 # 200pxまで一気に移動
    ease          : "easeOutExpo"

  isInitialized = false
  isActive  = false
  $window   = null
  $body     = null
  $leftTarget = null

  plugin = this
  plugin.settings = {}

  # jq elements
  $element  = $(element)


  # constructor
  plugin.init = ->
    if isInitialized then return

    isInitialized = true
    plugin.settings = $.extend {}, defaults, options
    initialize()
    return @



  # -----------------------------------------------
  # private
  # -----------------------------------------------
  initialize = ->
    console.log "[scrollToTopGently] init"

    $element.hide()
    $element.css
      position : "fixed"


    $window = $ window
    $body   = $('body')


    if plugin.settings.leftTarget
      $leftTarget = $ leftTarget
    else
      $leftTarget = $body

    $window.off "scroll.scrollToTopGently"
    $window.on "scroll.scrollToTopGently",(e)=>
      scrollTop = $window.scrollTop()
      if !isActive and scrollTop > plugin.settings.topThreshold
        isActive = true
        $element.fadeIn 250

      else if isActive and scrollTop <= plugin.settings.topThreshold
        isActive = false
        $element.fadeOut 250


    # リサイズ位置の調整
    $window.on "resize.scrollToTopGently", =>
      doResetLeftPosition()

    setTimeout =>
      doResetLeftPosition()
    , 1
    addScrollButtonEvent()


  # --------------------------------------------

  addScrollButtonEvent = ->
    # クリックしたらtoTopへ
    removeMouseWheelCancel()

    $element.off "click.scrollToTopGently"
    $element.on "click.scrollToTopGently",(e)=>
      $element.off "click.scrollToTopGently"
      doScrollTop()
      addMouseWheelCancel()
      e.preventDefault()
      false


  # スクロールを実行
  doScrollTop = ->
    if plugin.settings.skip
      # スキップして一気に上へ
      $('html,body').stop(false, true).animate
        scrollTop: plugin.settings.skipTargetTop
      , 0, plugin.settings.ease

      # そこからじわじわ積める
      setTimeout =>
        $('html,body').animate { scrollTop: 0 }, plugin.settings.duration, plugin.settings.ease, =>
          addScrollButtonEvent()
      ,1
    else
      # スキップせずにダラーっとスクロール
      $('html,body').stop(false, true).animate
        scrollTop: 0
      , plugin.settings.duration, plugin.settings.ease, =>
        addScrollButtonEvent()


  # スクロール中にmouseWheelされたらキャンセル
  addMouseWheelCancel = ->
    $body.on "mousewheel.scrollToTopGently", =>
      $body.off "mousewheel.scrollToTopGently"
      $('html,body').stop(true, false)
      addScrollButtonEvent()

  # mousewheelイベントを削除
  removeMouseWheelCancel = ->
    $body.off "mousewheel.scrollToTopGently"


  doResetLeftPosition = ->
    targetLeftNum = $leftTarget.offset().left + $leftTarget.width() - $element.width()
    targetLeftNum = Math.floor(targetLeftNum)
    targetBottomNum = 50

    $element.css
      "left" : targetLeftNum
      "bottom" : targetBottomNum





  # -----------------------------------------------
  # PUBLIC
  plugin.version = ->
    console.log("Version: #{plugin.settings.version}")

  plugin.init()


$.fn.scrollToTopGently = (options) ->
  this.each ->
    if undefined == $(this).data 'scrollToTopGently'
      plugin = new $.scrollToTopGently this, options
      $(this).data 'scrollToTopGently', plugin
