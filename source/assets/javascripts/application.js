// Loads all Semantic javascripts from embedded 'semantic/dist'
// depends on sprockets.append_path 'assets/semantic/dist' in config.rb

// = require semantic


// context sidebar
$('.ui.sidebar.left')
  .sidebar({
    context: $('.bottom.pushable'),
    dimPage: false,
    transition: 'push',
    closable: false
  })
  .sidebar('attach events', '.menu .item.toggle')
  // .sidebar('attach events', '.button.toggle')
;

$('.ui.sidebar.right')
  .sidebar({
    context: $('.bottom.pushable'),
    dimPage: false,
    transition: 'overlay'
  })
  .sidebar('attach events', '.menu .item.toggle2')
;

$('.ui.accordion.test1')
  .accordion({
    exclusive: false
  })
;


$('.sortable.table')
  .tablesort()
;

$('.ui.dropdown')
  .dropdown()
;

$('.menu .item')
  .tab()
;