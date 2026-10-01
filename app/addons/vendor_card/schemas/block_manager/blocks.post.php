<?php
if (!defined('BOOTSTRAP')) { die('Access denied'); }

$schema['vendor_card'] = array(
    'content' => array(),
    'templates' => array(
        'addons/vendor_card/blocks/entry.tpl' => array(
            'name' => 'Vendor Card',
        ),
    ),
    'settings' => array(
        'panel_mode' => array(
            'type' => 'selectbox',
            'values' => array(
                'popup' => 'vendor_card.panel_mode.popup',
                'modal' => 'vendor_card.panel_mode.modal',
            ),
            'default_value' => 'popup',
        ),
    ),
    'wrappers' => 'blocks/wrappers',
    'cache' => false,
);

return $schema;
