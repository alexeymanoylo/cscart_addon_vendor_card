<div class="vendor-card{if $mode == "modal"} cm-dialog-opener{elseif $mode == "popup"} vendor-card--popup{/if}"
     data-vendor-card
     data-vendor-id="{$vendor.company_id}"{if $mode == "modal"} data-ca-target-id="vendor_modal_{$block.block_id}_{$vendor.company_id}" data-ca-dialog-class="vendor-modal-dialog"{elseif $mode == "popup"} data-vendor-popup-opener="vendor_popup_{$block.block_id}_{$vendor.company_id}"{/if}>
    <div class="vendor-card__avatar">
    <span class="vendor-card__photo">
      {if $vendor.image}
          {include file="common/image.tpl" images=$vendor.image image_width=88 image_height=88 class="vendor-card__img"}
      {else}
          <span class="vendor-card__initials">{$vendor.initials}</span>
      {/if}
    </span>
        <span class="vendor-card__status{if !$vendor.is_online} vendor-card__status--offline{/if}" title="{if $vendor.is_online}online{else}offline{/if}" aria-label="{if $vendor.is_online}Vendor is online{else}Vendor is offline{/if}" role="status"></span>
    </div>
    <div class="vendor-card__content">
        <div class="vendor-card__main">
            <div class="vendor-card__header">
                <div class="vendor-card__name-row">
                    <div class="vendor-card__name">{$vendor.company}</div>
                    <div class="vendor-card__badges">
                        {if $vendor.is_pro}
                            <div class="vendor-card__badge vendor-card__badge--pro"><img
                                        src="{$images_dir}/addons/vendor_card/pro.svg" class="vendor-card__badge-icon"
                                        alt=""
                                        width="14" height="14">Pro
                            </div>
                        {/if}
                        {if $vendor.is_verified}
                            <div class="vendor-card__badge vendor-card__badge--verified"><img
                                        src="{$images_dir}/addons/vendor_card/verified.svg"
                                        class="vendor-card__badge-icon"
                                        alt="" width="14" height="14">Verified (KYC)
                            </div>
                        {/if}
                    </div>
                </div>
                <div class="vendor-card__meta">
                    <span class="vendor-card__meta-status{if !$vendor.is_online} vendor-card__meta-status--offline{/if}">{if $vendor.is_online}online now{else}offline{/if}</span>
                    <span class="vendor-card__dot">•</span> since {$vendor.timestamp|date_format:"%b %Y"}
                    <span class="vendor-card__dot">•</span> response &lt;1h
                </div>
            </div>
        </div>
        <div class="vendor-card__body">
            {if $vendor.description}
                <p class="vendor-card__bio">{$vendor.description|strip_tags}</p>
            {/if}
            {if $vendor.positive || $vendor.rating || $vendor.orders}
                <div class="vendor-card__stats">
                    {if $vendor.positive}
                        <div class="vendor-card__stat">
                            <span class="vendor-card__stat-value vendor-card__stat-value--positive">{$vendor.positive}%</span>
                            <span class="vendor-card__stat-label">positive</span>
                        </div>
                    {/if}
                    {if $vendor.rating}
                        <div class="vendor-card__stat">
                            <span class="vendor-card__stat-value vendor-card__stat-value--rating">★{$vendor.rating}</span>
                            <span class="vendor-card__stat-label">{$vendor.rating_count} reviews</span>
                        </div>
                    {/if}
                    {if $vendor.orders}
                        <div class="vendor-card__stat">
                            <span class="vendor-card__stat-value">{$vendor.orders}</span>
                            <span class="vendor-card__stat-label">orders</span>
                        </div>
                    {/if}
                </div>
            {/if}
        </div>
    </div>
</div>
