---
layout: post
title: О менеджерах паролей
gh-repo: Avonae/avonae.github.io
gh-badge:
  - follow
tags:
  - Пароли
  - менеджеры паролей
  - безопасность
comments: true
readtime: true
published: true
---

Менеджер паролей — это программа для хранения логинов и паролей в зашифрованном виде. В результате данные будут защищены, а вам достаточно запомнить 1 пароль. В этой заметке я расскажу о 3х менеджерах паролей, которые использовал сам.

Глобально, менеджеры паролей можно поделить на 2 вида: облачные и локальные. Облачные хранят пароли у себя на серверах и поэтому очень удобны; локальные же  менее удобны, зато их нельзя взломать. Я использую KeePass уже 7 лет и не представляю, как жить по-другому.

## Самый надежный — KeePass
Созданный в 2003 году, бесплатный KeePass с годами завоевал множество почитателей. Работает предельно просто: база данных — это зашифрованный файл, открываемый мастер-паролем. Файл можно хранить на флешке или в облаке, типа Яндекс.Диска, тем самым обеспечивая кроссплатформенность. Есть улучшенная версия — KeePassXC, использующий такую же базу данных, но более красивый. Рекомендую попробовать его.

➕Бесплатно; локальная база данных (paranoid mode); доступно множество плагинов

➖Не особо удобен — из коробки нет интеграции с браузером и кроссплатформенности. Нет общих сейфов и немного устаревший интерфейс.

## Разумный компромисс — Bitwarden
Сравнительно новое решение на рынке — бесплатный менеджер паролей с [открытым кодом](https://github.com/bitwarden). Пароли хранит у себя на серверах, но можно сделать собственный. Параноики ликуют. Интерфейс поприятнее чем у KeePass, но всё ещё не очень удобный. Платные тарифы дают доступ к дополнительным функциям. Есть семейный тариф за 40$ в год.

➕Бесплатно, опенсорсно, кроссплатформенно. Есть общие сейфы.

➖Неинтуинивный интерфейс, пароли хранятся в облаке.

## Самый удобный — 1Password
Настоящее интерпрайз решение для хранения паролей. Тут тебе и удобный интерфейс и синхронизация всего со всем и шеринг паролей. Всё красиво и современно. На мой взгляд — лучшее, что есть на рынке. Можно купить семейный тариф за 5$ в месяц. 

➕Удобно, красиво, современно. Кросплатформенно и есть общие сейфы

➖Довольно дорого стоит, не работает в России. Код закрыт и пароли хранятся в облаке.

## Итого
Заведите менеджер паролей. Это реально удобно и безопасно. Только выбирайте тщательно. Например, сервис LastPass [взламывали 4 раза](https://securityintelligence.com/news/lastpass-breaches-cast-doubt-on-password-manager-safety/) и я вам не рекомендую (запрещаю) его использовать. 
Хочу настроить себе сервер для Bitwarden. Всё-таки автозаполнение в браузере и кроссплатформенность делают своё дело. Ждите в следующих сериях!
