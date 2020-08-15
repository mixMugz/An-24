<div align="right">| <a href="https://github.com/mixMugz/An-24">РУССКАЯ ВЕРСИЯ</a></div>
<h4 align="center">
  <img alt="Antonov An-24" src="readme-head-en.png">
</h4>

***Что здесь происходит?*** Это репозиторий модификации самолёта Ан-24 для X-Plane 11 (64bit).
Эта версия основана на файлах от [Felis Planes](http://felis-planes.com/) и дополнительной редакции от [Николая Паршукова](https://github.com/parshukov/An24-Felis-for-XP11).
С их официального разрешения и одобрения, проект продолжает жить и развиваться под лицензией GPL3.

***Это дополнение/патч?*** Нет! Хоть проект и основан на оригинальных файлах, но, тем не менее, уже имеет очень много отличий и уже не совместим с ними. Поэтому доработка продолжается как самостоятельная версия. И устанавливается отдельно. Конфликтов с оригинальными версиями и модификациями нет.

***Я хочу принять участие! Можно?*** Конечно! Модификация имеет аббревиатуру CE (Community Edition) и мы с радостью готовы видеть вас в рядах людей улучшающих этот самолёт. Работы на самом деле очень много!

***У меня что-то не работает!*** Пройдите в [Issues](https://github.com/mixMugz/An-24/issues) и подробно опишите свою проблему. Не забудьте приложить LOG.txt и вкратце описать, как это воспроизвести.

---

Для чего эта модификация и какие цели преследует?

Глобальная цель - сделать модель самолёта на уровне коммерческих проектов, но со свободным доступом.
>Be like a @zibo!11

Если в частностях, то первоочередные цели:

1. **Поддержка VR.** В данный момент летать в VR и управлять самолётом не представляется возможным. Это первоочередная цель!
2. **Нативные манипуляторы.** Исходя из первой цели - необходимо переделать всё управление
   на нативные манипуляторы.
3. **Управление.** Не все элементы в данный момент доступны для назначения на кнопки/клавиши. Некоторые
   назначены на нелогичные команды. Это необходимо исправить.
4. **Переезд в SASL3.** Т.к. SASL2 (на чём изначально построен самолёт) очень плохо дружит с VR,
   вывод напрашивается один. Переезд в SASL3. Возможно, при наличии возможностей - в XLUA.
5. **Дальнейшее развитие.** В модели достаточно много спорных и не завершенных моментов. И мы будем это исправлять.

## Установка

Всё доведённое до логического завершения будет выкладываться [релизным архивом](https://github.com/mixMugz/An-24/releases). Все последние изменения можно будет скачать посредством *skunkcraft_updaters* или забрав архив исходных кодов.

1. Для установки необходимо скопировать содержимое архива в корень вашего `X-Plane 11`.
   Самолет будет установлен в папку `\X-Plane 11\Aircraft\Antonov\An-24\`
2. Папка `KLN 90B Navdata` (навигационная база для KLN) должна лежать в корне X-Plane 11. Если у вас уже есть навигационная база - то копировать её не нужно.
3. Файл 0.fms должен лежать в папке `X-Plane 11\Output\FMS plans\KLN 90B\`. Так-же необходим для работы KLN90b. Если у вас есть уже этот файл от предыдущих или других версий KLN90b, то перезаписывать не надо.

## Запуск самолёта

Вызвать АПА (GPU) можно двумя способами:

1. Запитываем сеть от батареи и настраиваем COM2 (overhead) на 131.800 (Появится окно сервисного обслуживания)
2. Либо кликнув на меню Ан-24 в левом нижнем углу и выбрать СЕРВ (Сервис)

Далее все просто и как обычно. Убрать окно - переключить частоту (если включали по первому варианту).

## Сообщество

Сообщество где можно обсудить доработку, оставить пожелания и предложить помощь.

- [ВКонтакте](https://vk.com/an24_ce)
- [Discord](https://discord.gg/tAfXsqV)

## Acknowledgments

Many thanks to Felis for the titanic work on the creation of the aircraft and for the permission to continue to refine it as an opensource project! And also to Nikolay Parshukov for his modification and wonderful ideas that he implemented!

Also many thanks for your participation and help in the project:

- Lionel Zamouth (for invaluable coding help)
- Todir (KLN90B mod)
- Atsamaz Khodov
- Mark Zhuravlev
- community "Leprozorium"

## License

GPL3

All additional modules, existing and subsequent are released under the license of the authors of these modules.
- KLN90B (by Falcon, modified by Todir @ forums.x-plane.org)





Antonov An-24
What's going on in here? This is the hub for the An-24 aircraft modification for X-Plane 11 (64bit). This version is based on files from Felis Planes and additional editing from Nikolai Parshukov . With their official permission and approval, the project continues to live and develop under the GPL3 license.

Is this an add-on / patch? Nope! Although the project is based on the original files, it already has a lot of differences and is no longer compatible with them. Therefore, the revision continues as an independent version. And installed separately. There are no conflicts with original versions and modifications.

"I want to take part! Can I?" Sure! The modification has the abbreviation CE (Community Edition) and we are happy to see you in the ranks of people improving this aircraft. There is actually a lot of work to do!

"Something doesn't work for me!" Go to Issues and detail your problem. Be sure to attach LOG.txt and briefly describe how to reproduce the error.

"What is this modification for and what goals does it pursue?"

The global goal is to make an airplane model at the level of payware projects, but with freeware =).

Be like a @zibo! 11

In particular, the primary goals:

VR support. At the moment, flying in VR and flying an airplane is not possible. This is the primary goal!
Native manipulators. Based on the first goal, it is necessary to redo all the controls for native manipulators.
Control. Not all elements are currently available for assignment to buttons / keys. Some are assigned to illogical systems. This needs to be fixed.
Moving to SASL3. Because SASL2 (on which the plane was originally built) is very bad friends with VR, there is only one solution: moving to SASL3. Possibly, subject to availability - in XLUA.
Further development. There are a lot of controversial and incomplete points in the model and we will fix it!
Installation
Everything brought to its logical conclusion will be laid out in the release archive . All the latest changes can be downloaded via skunkcraft_updaters or by picking up the source code archive.

To install, you need to copy the contents of the archive to your root X-Plane 11. The plane will be installed in the folder\X-Plane 11\Aircraft\Antonov\An-24\
The folder KLN 90B Navdata(navbase for KLN) should be at the root of X-Plane 11. If you already have navbase, then you don't need to copy it.
The 0.fms file must be in the folder X-Plane 11\Output\FMS plans\KLN 90B\. It is also necessary for the KLN90b to work. If you already have this file from previous or other versions of KLN90b, then you do not need to overwrite it.
Airplane launch
You can call the APA (GPU) in two ways:

We power the network from the battery and set COM2 (overhead) to 131.800 (The service window will appear)
Or by clicking on the An-24 menu in the lower left corner and select SERVE (Service)
Then everything is simple and as usual. Remove window - switch the frequency (if included in the first option).

Community
A community where you can discuss revision, leave wishes and offer help.

In contact with
Discord
