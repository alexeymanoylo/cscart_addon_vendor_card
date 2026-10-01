{assign var="vendor_card_mode" value=$block.properties.panel_mode|default:"popup"}
{assign var="vendors" value=1|fn_vendor_card_get_vendors:$block.block_id}
{if $vendors}
    {foreach from=$vendors item="vendor"}
        {if $vendor_card_mode == "popup"}<div class="vendor-card-wrapper">{/if}
        {include file="addons/vendor_card/blocks/vendor_card.tpl" vendor=$vendor mode=$vendor_card_mode}
        {if $vendor_card_mode == "modal"}
            {include file="addons/vendor_card/blocks/vendor_modal.tpl" vendor=$vendor}
        {else}
            {include file="addons/vendor_card/blocks/vendor_popup.tpl" vendor=$vendor}
        {/if}
        {if $vendor_card_mode == "popup"}</div>{/if}
    {/foreach}
{/if}
