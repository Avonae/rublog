---
layout: post
title: Wireguard VPN с веб-интерфейсом без мучений
subtitle: И сидеть в нормальном интернете
gh-repo: Avonae/avanae.github.io
gh-badge: [follow]
tags: [VPN, Обход блокировок, Свободный интернет, Мануал, Linux]
comments: true
---

Всем привет.

Это еще один пост про VPN на своем сервере. Сегодня мы установим Wireguard VPN с удобным веб-интерфейсом, позволяющим создавать конфиги для друзей через браузер. Я сам пользуюсь таким решением и еще 20 моих знакомых.

Основные проблемы с VPN возникают во время поиска достойного провайдера VPS, которому можно заплатить российской картой. Выбирайте какой нравится, мне понравился TimeWeb, в котором всё уже готово. Правда я видел в комментариях его ругали, поэтому как вариант использовать Firstbyte. Он стоит 300р и чуть геморройнее регистрация, но там можно указать левую почту и рандомный телефон, взяв всё из генератора личностей.

Далее будет 2 шага: аренда сервера и создание клиентов для себя и друзей.

## Аренда сервера

Переходим к аренде сервера. Выбирайте любого понравившегося провайдера. Если у вас есть иностранная карта, могу порекомендовать mvps.net, у них есть <a href="https://www.mvps.net/vps-app/wireguard" target="_blank">готовое VPN решение</a>.
![Я выбрал польшу](./_images/wgVPN/0.png)

## Создание клиентов

Установка сервера закончена, осталось подключить клиенты — телефоны и компьютеры. Их может быть сколько угодно, у нас неограниченный трафик. <a href="https://www.wireguard.com/install/" target="_blank">Установите Wireguard</a> на устройства.

[media:{"items":[{"title":"Письмо от хостера","image":{"render":"\n<img\n    class=\"andropov_image \"\n    air-module=\"module.andropov\"\n    data-andropov-type=\"image\"\n    data-image-src=\"https://leonardo.osnova.io/fb04076d-a7b2-5884-989b-a8352f4c3c7a/\"\n    data-image-name=\"\"\n            style=\";background-color: #f2f2f1;\"            src=\"data:image/gif;base64,R0lGODlhAQABAJAAAP8AAAAAACH5BAUQAAAALAAAAAABAAEAAAICBAEAOw==\"/>","type":"image","data":{"uuid":"fb04076d-a7b2-5884-989b-a8352f4c3c7a","width":565,"height":395,"size":27319,"type":"png","color":"f2f2f1","hash":"","external_service":[]}}}]}]

[media:{"items":[{"title":"Окно авторизации","image":{"render":"\n<img\n    class=\"andropov_image \"\n    air-module=\"module.andropov\"\n    data-andropov-type=\"image\"\n    data-image-src=\"https://leonardo.osnova.io/7028f1d0-26a1-51f9-be4e-6afe2f0a08d2/\"\n    data-image-name=\"\"\n            style=\";background-color: #fafafa;\"            src=\"data:image/gif;base64,R0lGODlhAQABAJAAAP8AAAAAACH5BAUQAAAALAAAAAABAAEAAAICBAEAOw==\"/>","type":"image","data":{"uuid":"7028f1d0-26a1-51f9-be4e-6afe2f0a08d2","width":330,"height":348,"size":8483,"type":"png","color":"fafafa","hash":"","external_service":[]}}}]}]

[media:{"items":[{"title":"Созданный клиент в веб-интерфейсе","image":{"render":"\n<img\n    class=\"andropov_image \"\n    air-module=\"module.andropov\"\n    data-andropov-type=\"image\"\n    data-image-src=\"https://leonardo.osnova.io/110df3ba-afbe-5201-afd3-dced0a8fda40/\"\n    data-image-name=\"\"\n            style=\";background-color: #f3f3f3;\"            src=\"data:image/gif;base64,R0lGODlhAQABAJAAAP8AAAAAACH5BAUQAAAALAAAAAABAAEAAAICBAEAOw==\"/>","type":"image","data":{"uuid":"110df3ba-afbe-5201-afd3-dced0a8fda40","width":782,"height":169,"size":7566,"type":"png","color":"f3f3f3","hash":"","external_service":[]}}}]}]

[media:{"items":[{"title":"Слева: активация мобильного приложения, справа — скриншот с 2ip.ru","image":{"render":"\n<img\n    class=\"andropov_image \"\n    air-module=\"module.andropov\"\n    data-andropov-type=\"image\"\n    data-image-src=\"https://leonardo.osnova.io/28c5360d-a8db-5915-8389-b071b9c45638/\"\n    data-image-name=\"\"\n            style=\";background-color: #1b1b1b;\"            src=\"data:image/gif;base64,R0lGODlhAQABAJAAAP8AAAAAACH5BAUQAAAALAAAAAABAAEAAAICBAEAOw==\"/>","type":"image","data":{"uuid":"28c5360d-a8db-5915-8389-b071b9c45638","width":2001,"height":546,"size":109249,"type":"png","color":"1b1b1b","hash":"","external_service":[]}}}]}]

Подобным образом надо создать конфиги для всех устройств.

## Заключение

Это раздел для продвинутых. Тут будут необязательные настройки и мои рассуждения.

## Зачем это все?

Бесплатный сыр бывает только в мышеловке. Если вы используете бесплатный VPN, то спросите себя — на чем он зарабатывает? Бесплатные VPN сервисы <a href="https://privacysavvy.com/vpn/guides/free-vpns-sell-information/" target="_blank">продают ваши данные</a> рекламодателям. Вы вообще ничего не знаете о том, что делают с вашим трафиком и никак этим не управляете. В дополнение, правительство стремится заблокировать популярные VPN сервисы. 

Свой VPN сервер гарантирует вам не только стабильный канал, но и уменьшенную вероятность блокировки. Я пишу уменьшенную вероятность, но не гарантированную защиту — так как правительство постоянно создает новые методы противодействию обходу блокировок. Wireguard — довольно популярный протокол и его легко обнаружить. Как защитить свой сервис от блокировки мы рассмотрим в следующих статьях.

## Вопросы безопасности

Считается, что иметь сервер с выделенным IP-адресом и авторизацией по паролю небезопасно. Но пароль, который генерирует хостер достаточно хорош. Вы можете убедиться сами — например, для взлома пароля zYq6FV3j понадобится <a href="https://www.passwordmonster.com/" target="_blank">тысяча лет</a>. В общем, это можно выкинуть из головы, если не хотите заморачиваться.

Но в идеале всё-таки аутентификацию по паролю отключить и оставить только по ключу. Ключ — по сути своей, это просто длинный пароль, который хранится у нас на компьютере. Для настройки авторизации по ключу:

[media:{"items":[{"title":"Авторизоваться по паролю не вышло","image":{"render":"\n<img\n    class=\"andropov_image \"\n    air-module=\"module.andropov\"\n    data-andropov-type=\"image\"\n    data-image-src=\"https://leonardo.osnova.io/4917d20e-6e78-5b2f-a6b2-4c0158548e6d/\"\n    data-image-name=\"\"\n            style=\";background-color: #151519;\"            src=\"data:image/gif;base64,R0lGODlhAQABAJAAAP8AAAAAACH5BAUQAAAALAAAAAABAAEAAAICBAEAOw==\"/>","type":"image","data":{"uuid":"4917d20e-6e78-5b2f-a6b2-4c0158548e6d","width":412,"height":66,"size":5380,"type":"png","color":"151519","hash":"","external_service":[]}}}]}]

## Обновления

По умолчанию, автоматические обновления (unattended upgrades) системы уже включены. Проверить их можно командой <b>systemctl status unattended-upgrades --no-pager -l</b>

Можно еще создать пользователя чтобы не сидеть под рутом..:)

Если появились вопросы — пишите в комментариях, буду рад помочь. Подписывайтесь на мой <a href="https://t.me/Press_Any" target="_blank">телеграм-канал</a> — в нем я пишу полезные статьи и рассказываю истории из мира IT.