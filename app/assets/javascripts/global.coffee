jQuery(document).on 'turbolinks:load', ->
  user_jobs = $('#user_jobs')

  user_jobs.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)

  user_jobs.on 'cocoon:after-insert', (e, added_el) ->
    added_el.effect('highlight', {}, 500)

  user_jobs.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)
