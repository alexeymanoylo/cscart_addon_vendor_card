<div class="vendor-popup" id="vendor_popup_{$block.block_id}_{$vendor.company_id}" data-vendor-popup hidden>
    <button type="button" class="vendor-popup__close" data-vendor-popup-close aria-label="Close">×</button>
    <div class="vendor-popup__content">
        {include file="addons/vendor_card/blocks/vendor_info.tpl" vendor=$vendor}
    </div>
</div>
