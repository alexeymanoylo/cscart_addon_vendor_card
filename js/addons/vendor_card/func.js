(function (_, $) {
    function closePopups() {
        $('[data-vendor-popup]').attr('hidden', '');
    }

    function init(context) {
        var $cards = $('[data-vendor-card]', context);
        if (!$cards.length) {
            return;
        }
    }

    $(document).on('click', '[data-vendor-popup-opener]', function (e) {
        e.preventDefault();
        e.stopPropagation();
        var id = $(this).attr('data-vendor-popup-opener');
        var $popup = $('#' + id);
        var hidden = $popup.is('[hidden]');
        closePopups();
        if (hidden) {
            $popup.removeAttr('hidden');
        }
    });

    $(document).on('click', '[data-vendor-popup-close]', function (e) {
        e.preventDefault();
        $(this).closest('[data-vendor-popup]').attr('hidden', '');
    });

    $(document).on('click', function (e) {
        if (!$(e.target).closest('[data-vendor-popup], [data-vendor-popup-opener]').length) {
            closePopups();
        }
    });

    $(document).on('keydown', function (e) {
        if (e.key === 'Escape' || e.keyCode === 27) {
            closePopups();
        }
    });

    $(document).on('click', '.ui-widget-overlay', function () {
        var $dialog = $('.ui-dialog:visible').last();
        if ($dialog.find('[id^="vendor_modal_"]').length) {
            $dialog.find('.ui-dialog-titlebar-close').trigger('click');
        }
    });

    $.ceEvent('on', 'ce.commoninit', function (context) {
        init(context);
    });
}(Tygh._, Tygh.$));
