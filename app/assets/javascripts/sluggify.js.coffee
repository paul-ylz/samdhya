$ ->
  titleSlug = ->
    $title = $('#page_title').val()
    slug = $title.toLowerCase().replace(/\ /g, '-').replace(/[^a-zA-Z0-9-_]/g, '')
    slug[0..79]

  $('#page_title').on 'keyup', (event) ->
    $slug = $('#page_slug')
    unless $slug.data('changed') == true
      $slug.val titleSlug()

  $('#page_slug').on 'keyup', (event) ->
    $slug = $('#page_slug')
    if $slug.val() != titleSlug()
      $slug.data 'changed', true

    if $slug.val() == ''
      $slug.data 'changed', false
      $slug.val titleSlug()
