{% if (theme.gitalk.client_id) %}
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.css">
<script src="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.js"></script>
<script
    type="text/javascript">
var gitalk = new Gitalk({
    clientID: '{{theme.gitalk.client_id}}',
    clientSecret: '{{theme.gitalk.client_secret}}',
    repo: '{{theme.gitalk.repo}}',
    owner: '{{theme.gitalk.owner}}',
    admin: ['{{theme.gitalk.owner}}'],
    id: location.pathname,      // Ensure uniqueness and length less than 50
    distractionFreeMode: false  // Facebook-like distraction free mode
})

document.getElementById('gitalk-container') && gitalk.render('gitalk-container')
</script>
{% endif %}