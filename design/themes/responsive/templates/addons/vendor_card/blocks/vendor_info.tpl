<h3 class="vendor-info__title">{$vendor.company}</h3>
{if $vendor.description}<p class="vendor-info__bio">{$vendor.description|strip_tags}</p>{/if}
{if $vendor.city || $vendor.country}<p
        class="vendor-info__location">{$vendor.city}{if $vendor.city && $vendor.country}, {/if}{$vendor.country}</p>{/if}
{if $vendor.phone}<p class="vendor-info__phone">{$vendor.phone}</p>{/if}
<p class="vendor-info__since">since {$vendor.timestamp|date_format:"%b %Y"}</p>
{if $vendor.positive || $vendor.rating || $vendor.orders}
    <div class="vendor-info__stats">
        {if $vendor.positive}
            <div class="vendor-info__stat">
                <span class="vendor-info__stat-value vendor-info__stat-value--positive">{$vendor.positive}%</span>
                <span class="vendor-info__stat-label">positive</span>
            </div>
        {/if}
        {if $vendor.rating}
            <div class="vendor-info__stat">
                <span class="vendor-info__stat-value vendor-info__stat-value--rating">★{$vendor.rating}</span>
                <span class="vendor-info__stat-label">{$vendor.rating_count} reviews</span>
            </div>
        {/if}
        {if $vendor.orders}
            <div class="vendor-info__stat">
                <span class="vendor-info__stat-value">{$vendor.orders}</span>
                <span class="vendor-info__stat-label">orders</span>
            </div>
        {/if}
    </div>
{/if}
