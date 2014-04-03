# scrollToTopGently

すっとページ TOP までスクロールするやつ

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
  - toTopボタンを表示するしきい値
- duration
  - Topへ戻るアニメーションの時間
- skip
  - すっと戻る = true, だらっと戻る = false
- skipTargetTop
  - すっと一気に戻る時のTop位置
- ease
  - String　どのeaseing関数をつかうか
- leftTarget
  - String jQueryのセレクタ
  - リサイズ時にコンテンツ内のどの要素のLEFT位置にボタンを追従させるか指定できる



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