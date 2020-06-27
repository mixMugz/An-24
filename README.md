<h4 align="center">
  <img alt="Antonov An-24RV (CE)" src="readme-head.png">
</h4>

***Что здесь происходит?*** Это репозиторий модификации самолёта Ан-24РВ для X-Plane 11 (64bit).
Эта версия основана на файлах от [Felis Planes](http://felis-planes.com/) и дополнительной редакции от [Николая Паршукова](https://github.com/parshukov/An24-Felis-for-XP11).
С их официального разрешения и одобрения, проект продолжает жить и развиваться под лицензией GPL3.

***Это дополнение/патч?*** Нет! Хоть проект и основан на оригинальных файлах, но тем не менее уже имеет очень много отличий и уже не совместим с ними. Поэтому доработка продолжается как самостоятельная версия. И устанавливается отдельно. Конфликтов с оригинальными версиями и модификациями нет.

***Я хочу принять участие! Можно?*** Конечно! Модификация имеет абревиатуру CE (Community Edition) и мы с радостью готовы видеть вас в рядах людей улучшающих этот самолёт. Работы на самом деле очень много!

***У меня что-то не работает!*** Пройдите в [Issues](issues) и подробно опишите свою проблему. Не забудьте приложить LOG.txt
и вкратце описать как это воспроизвести.

---

Для чего эта модификация и какие цели преследует?

Глобальная цель - сделать модель самолёта на уровне коммерческих проектов, но со свободным доступом. Be like a @zibo!11

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

Всё доведённое до логического завершения будет в ветке *master* (отсюда и будет сборка с [релизным архивом](releases). Все последние изменения находятся в ветке *dev*.

1. Для установки необходимо скопировать содержимое архива в корень вашего `X-Plane 11`.
   Самолет будет установлен в папку `\X-Plane 11\Aircraft\Antonov\An-24RV\`
2. Папка `KLN 90B Navdata` (навигационная база для KLN) должна лежать в корне X-Plane 11. Если у вас уже есть навигационная база - то копировать её не нужно.
3. Файл 0.fms должен лежать в папке `X-Plane 11\Output\FMS plans\KLN 90B\`. Так-же необходим для работы KLN90b. Если у вас есть уже этот файл от предыдущих или других версий KLN90b, то перезаписывать не надо.

## Запуск самолёта

Вызвать АПА (GPU) можно двумя способами:

1. Запитываем сеть от батареи и настраиваем COM2 (overhead) на 131.800 (Появится окно сервисного обслуживания)
2. Либо кликнув на меню Ан-24 в левом нижнем углу и выбрать СЕРВ (Сервис)

Далее все просто и как обычно. Убрать окно - переключить частоту (если включали по первому варианту).

## Сообщество

This isn't a crazy new idea. Other ecosystems like [Perl's
CPAN](http://perldoc.perl.org/perlmodstyle.html) have been benefiting from a
common readme format for years. Furthermore:

1. The node community is powered by us people and the modules we share. It's our
   documentation that links us together. Our README is the first thing
   developers see and it should be maximally effective at communicating its
   purpose and function.

2. There is much wisdom to be found from the many developers who have written
   many many modules. Common readme aims to distill that experience into a
   common format that stands to benefit us all; especially newer developers!

3. Writing the same boilerplate is a waste of every author's time -- we might as
   well generate the common pieces and let the author focus on the content.

4. Scanning through modules on npm is a part of every node developer's regular
   development cycle. Having a consistent format lets the brain focus on content
   instead of structure.

## The Art of README

For even more background, wisdom, and ideas, take a look at the article that
inspired common-readme:

- [*Art of README*](https://github.com/noffle/art-of-readme).

## Install

With [npm](https://npmjs.org/) installed, run

```shell
npm install -g common-readme
```

You can now execute the `common-readme` command.

## Acknowledgments

A standard readme format for the Node community isn't a new idea. Inspiration
came from many conversations and unrealized efforts in the community:

- <https://github.com/feross/standard/issues/141>
- [richardlitt/standard-readme](https://github.com/RichardLitt/readme-standard)
- [zwei/standard-readme](https://github.com/zcei/standard-readme)

This, in addition to my own experiences evaluating hundreds of node modules and
their READMEs.

I was partly inspired by the audacity of the honey-badger-don't-care efforts of
[standard](https://github.com/feross/standard).

I also did a great deal of Perl archaeology -- it turns out the monks of the
Perl community already did much of the hard work of [figuring out great
READMEs](http://perldoc.perl.org/perlmodstyle.html) and the wisdom around small
module development well over a decade ago.

Thanks to @mafintosh, @andrewosh, and @feross for many long conversations about
readmes and Node.

## See Also

READMEs love [`readme`](https://www.npmjs.com/package/readme)!

## License

ISC