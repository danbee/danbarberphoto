$(document).ready(function() {
    $('.fancy').fancybox({
        'titlePosition'     : 'inside'
    });

    if ($('#contact_form').length) {
        $('#contact_form').validate({
            rules: {
                'contact[name]': "required",
                'contact[email]': {
                    required: true,
                    email: true
                },
                'contact[message]': "required",
            
            },
            messages: {
                'contact[email]': {
                    email: "Invalid email address."
                }
            }
        });
        console.info('Validation set.');
    }
});
