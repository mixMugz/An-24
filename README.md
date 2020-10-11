>**[ENGLISH VERSION](README-EN.md)**

<h4 align="center">
  <img alt="Antonov An-24" src="readme-head-ru.png">
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
2. **Нативные манипуляторы.** Исходя из первой цели - необходимо переделать всё управление на нативные манипуляторы.
3. **Управление.** Не все элементы в данный момент доступны для назначения на кнопки/клавиши. Некоторые назначены на нелогичные команды. Это необходимо исправить.
4. **Переезд в SASL3.** Т.к. SASL2 (на чём изначально построен самолёт) очень плохо дружит с VR, вывод напрашивается один. Переезд в SASL3.
5. **Дальнейшее развитие.** В модели достаточно много спорных и не завершенных моментов. И мы будем это исправлять.

## Установка

Всё доведённое до логического завершения будет выкладываться [релизным архивом](https://github.com/mixMugz/An-24/releases). Все последние изменения можно будет скачать посредством *skunkcraft_updaters* или забрав архив исходных кодов.

1. Для установки необходимо скопировать содержимое архива в корень вашего `X-Plane 11`. Самолет будет установлен в папку `\X-Plane 11\Aircraft\Antonov\An-24\`
2. Папка `KLN 90B Navdata` (навигационная база для KLN) должна лежать в корне X-Plane 11. Если у вас уже есть навигационная база - то копировать её не нужно.
3. Файл 0.fms должен лежать в папке `X-Plane 11\Output\FMS plans\KLN 90B\`. Так-же необходим для работы KLN90b. Если у вас есть уже этот файл от предыдущих или других версий KLN90b, то перезаписывать не надо.

## Запуск самолёта

Вызвать АПА (GPU) можно двумя способами:

1. Запитываем сеть от батареи и настраиваем COM2 (overhead) на 131.800 (Появится окно сервисного обслуживания)
2. Либо кликнув на меню Ан-24 в левом нижнем углу и выбрать СЕРВ (Сервис)

Далее все просто и как обычно. Убрать окно - переключить частоту (если включали по первому варианту).

## Пэйнткит для Ливрей

Для создания ливрей изпользуйте [PaintKit](http://update.hdz.ru/files/an24-paintkit.7z). Удалил с ГИТа из-за ограничений LFS.

## Сообщество

Сообщество где можно обсудить доработку, оставить пожелания и предложить помощь.

- [ВКонтакте](https://vk.com/an24_ce)
- [Discord](https://discord.gg/tAfXsqV)

## Благодарности

Огромная благодарность Felis за титанический труд по созданию самолёта и за разрешение продолжить его дорабатывать как opensource проект! А также Николаю Паршукову за его модификацию и замечательные идеи которые он реализовал!

Также огромное спасибо за участие и помощь в проекте:

- Lionel Zamouth (за неоценимую помощь в кодинге)
- Todir (KLN90B mod)
- Ацамаз Ходов
- Марк Журавлев
- сообществу "Лепрозорий"

## Лицензия

GPL3

Все дополнительные модули, существующие и последующие выпускаются под лицензией авторов этих модулей.
- KLN90B (автор Falcon, модификация Todir @ forums.x-plane.org)
