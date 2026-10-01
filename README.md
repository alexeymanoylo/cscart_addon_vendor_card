# vendor_card — Карточка продавца (CS-Cart Multi-Vendor)

Блок «Карточка продавца»: аватар (или инициалы) + имя. Клик → расширенная информация в двух режимах: **modal** и **popup**.

## Как установить аддон

1. Скопировать папки `app`, `design`, `js`, `var` из архива в корень CS-Cart.
2. **Add-ons → Downloaded add-ons → Vendor Card → Install**.
3. Очистить кэш: `admin.php?cc&ctpl` или **Website → Themes → Clear cache**.

## Где добавить блок

**Website → Themes → Layouts → Main → Homepage → Add block → Vendor Card → Save.**

## Как переключить modal / popup

В **Website → Themes → Layouts → блок Vendor Card → Settings → Panel mode** выберите `Popup` / `Modal` (по умолчанию `Popup`).

Для теста также можно hard-code в `design/themes/responsive/templates/addons/vendor_card/blocks/entry.tpl`:

```smarty
{assign var="vendor_card_mode" value=$block.properties.panel_mode|default:"popup"}
```

## Какой компонент использует встроенные механизмы CS-Cart

- **modal** — встроенный (`cm-dialog-opener` + `data-ca-target-id`). Закрытие: `Esc`, крестик, клик по фону.
- **popup** — собственная реализация без встроенного `modal/popup` механизма и без сторонних библиотек. Якорь на карточке, закрытие: `Esc`, клик вне, повторный клик, странице не мешает.

## Структура аддона

```text
app/addons/vendor_card/
├── addon.xml
├── func.php
├── icon.png
└── schemas/block_manager/blocks.post.php
design/themes/responsive/
├── css/addons/vendor_card/styles.less
├── media/images/addons/vendor_card/
│   ├── pro.svg
│   └── verified.svg
└── templates/addons/vendor_card/
    ├── blocks/
    │   ├── entry.tpl
    │   ├── vendor_card.tpl
    │   ├── vendor_info.tpl
    │   ├── vendor_modal.tpl
    │   └── vendor_popup.tpl
    └── hooks/index/
        ├── scripts.post.tpl
        └── styles.post.tpl
js/addons/vendor_card/func.js
var/langs/en+ru/addons/vendor_card.po
```

## Примечания

- Нет аватара → инициалы (PHP `mb_substr`). Пустые поля скрываются.
- Адаптив без горизонтального скролла.
- JavaScript изолирован, переинициализация через `ce.commoninit`.
