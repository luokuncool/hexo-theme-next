<script src="//cdn.bootcss.com/jquery.pjax/1.9.6/jquery.pjax.js"></script>
<script src="//cdn.bootcss.com/nprogress/0.2.0/nprogress.min.js"></script>
<script type="text/javascript">
$(document).on('pjax:start', NProgress.start).on('pjax:end', NProgress.done);
$(document).pjax('a[target!="_blank"]', '#pjax-container', {timeout: 8000, fragment: '#pjax-container'});
$(document).on('pjax:complete', function () {
  NexT.motion.integrator.cursor = -1;

  $(document).trigger('bootstrap:before');

  NexT.utils.isMobile() && window.FastClick.attach(document.body);

  NexT.utils.lazyLoadPostsImages();

  NexT.utils.registerBackToTop();

  $('.site-nav-toggle button').on('click', function () {
    var $siteNav = $('.site-nav');
    var ON_CLASS_NAME = 'site-nav-on';
    var isSiteNavOn = $siteNav.hasClass(ON_CLASS_NAME);
    var animateAction = isSiteNavOn ? 'slideUp' : 'slideDown';
    var animateCallback = isSiteNavOn ? 'removeClass' : 'addClass';

    $siteNav.stop()[animateAction]('fast', function () {
      $siteNav[animateCallback](ON_CLASS_NAME);
    });
  });

  CONFIG.fancybox && NexT.utils.wrapImageWithFancyBox();
  NexT.utils.embeddedVideoTransformer();
  NexT.utils.addActiveClassToMenuItem();

  $(document).trigger('motion:before');

  NexT.motion.init();
  if (CONFIG.motion) {
    $('.archive-year').velocity('transition.slideLeftIn');
    CONFIG.motion && NexT.motion.integrator.bootstrap();
  }
  NexT.postDetails.init();
  $(document).trigger('bootstrap:after');

  DUOSHUO.EmbedThread('.ds-thread');
  DUOSHUO.ThreadCount('.ds-thread-count');

  undefined === ga || ga('send', 'pageview');
});
</script>