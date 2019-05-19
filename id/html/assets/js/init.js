  // // LUA event listener
  window.addEventListener('message', function(event) {
    if (event.data.action == 'OpenMenu') {
      $('#wrapper').show();
    } else if (event.data.action == 'CloseMenu') {
      $('#wrapper').hide();
    }
  });