# scrollToTopGently

jquery gently scroll to top plugin

## how to use


### javascript

``` javascript

$(".fr-js-totop").scrollToTopGently({
  topThreshold  : 100,
  duration      : 200,
  skip          : true,
  skipTargetTop : 200
});

```

### option 

- topThreshold
  - (Number) when you scroll down the topThreshold value, the toTop button will appear in the display
- duration
  - (Number) duration of scroll animation
- skip
  - (Bool) use gently scroll = true, use normal scroll = false
- skipTargetTop
  - (Number) target point of gently scroll
- ease
  - (String) ease param, 'easeOutCubic' etc..
- leftTarget
  - (String || jquery selector) the button follow leftTarget Object when the window is resized


--



### html


``` html
<script src="./src/js/jquery-2.0.3.min.js"></script>
<script src="./src/js/jquery.easing.1.3.js"></script>
<script src="./src/coffee/scroll-to-top-gently.js"></script>
<script>
  $(function(){
    $(".fr-js-totop").scrollToTopGently({
      topThreshold  : 100,
      duration      : 200,
      skip          : true,
      skipTargetTop : 200
    });
  })
</script>


<a class="fr-js-totop">to Top</a>

```

--

### sample
 
http://shunyahagiwara.com/open/scroll-to-top-gently/sample.html
