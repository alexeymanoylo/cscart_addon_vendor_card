<?php
if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_vendor_card_get_initials($company)
{
    $company = trim($company);
    if ($company === '') {
        return '';
    }
    $words = preg_split('/\s+/u', $company);
    $words = array_values(array_filter($words, function ($w) { return $w !== ''; }));
    if (count($words) >= 2) {
        $first = preg_replace('/^[^\p{L}\p{N}]+/u', '', $words[0]);
        $second = preg_replace('/^[^\p{L}\p{N}]+/u', '', $words[1]);
        $first = mb_substr($first, 0, 1, 'UTF-8');
        $second = mb_substr($second, 0, 1, 'UTF-8');
        return mb_strtoupper($first . $second, 'UTF-8');
    }
    $clean = preg_replace('/[^\p{L}\p{N}]+/u', '', $words[0]);
    if (mb_strlen($clean, 'UTF-8') >= 2) {
        return mb_strtoupper(mb_substr($clean, 0, 2, 'UTF-8'), 'UTF-8');
    }
    return mb_strtoupper(mb_substr($words[0], 0, 1, 'UTF-8'), 'UTF-8');
}

function fn_vendor_card_get_vendors($limit = 1, $offset = null)
{
    $limit = (int) $limit;
    if ($limit <= 0) {
        $limit = 1;
    }
    static $counter = 0;
    if ($offset === null) {
        $offset = $counter++;
    }
    $offset = (int) $offset;
    $total = (int) db_get_field('SELECT COUNT(*) FROM ?:companies WHERE status = ?s', 'A');
    if ($total > 0) {
        $offset = $offset % $total;
    }
    $vendors = db_get_array(
        'SELECT c.company_id, c.company, c.city, c.country, c.phone, c.timestamp, d.company_description as description'
        . ' FROM ?:companies as c'
        . ' LEFT JOIN ?:company_descriptions as d ON d.company_id = c.company_id AND d.lang_code = ?s'
        . ' WHERE c.status = ?s ORDER BY c.company_id ASC LIMIT ?i OFFSET ?i',
        CART_LANGUAGE,
        'A',
        $limit,
        $offset
    );
    foreach ($vendors as &$vendor) {
        $vendor['initials'] = fn_vendor_card_get_initials($vendor['company']);
        $vendor['is_online'] = false;
        $vendor['positive'] = '98';
        $vendor['rating'] = '4.9';
        $vendor['rating_count'] = '320';
        $orders = db_get_field('SELECT COUNT(*) FROM ?:orders WHERE company_id = ?i', $vendor['company_id']);
        $vendor['orders'] = $orders ? (string) $orders : '';
        $logos = fn_get_logos($vendor['company_id']);
        $vendor['image'] = $logos['theme']['image'] ?? null;
        $vendor['is_pro'] = true;
        $vendor['is_verified'] = true;
    }
    unset($vendor);
    return $vendors;
}
