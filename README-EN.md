<div align="right"><a href="https://github.com/mixMugz/An-24"><b>РУССКАЯ ВЕРСИЯ</b></a></div>

<h4 align="center">
  <img alt="Antonov An-24" src="readme-head-en.png">
</h4>

***What's going on in here?*** This is the hub for the An-24 aircraft modification for X-Plane 11 (64bit).
This version is based on files from [Felis Planes](http://felis-planes.com/) and additional editing from [Nikolai Parshukov](https://github.com/parshukov/An24-Felis-for-XP11).
With their official permission and approval, the project continues to live and develop under the GPL3 license.

***Is this an add-on/patch?*** Nope! Although the project is based on the original files, it already has a lot of differences and is no longer compatible with them. Therefore, the revision continues as an independent version. And installed separately. There are no conflicts with original versions and modifications.

***I want to take part! Can I?*** Sure! The modification has the abbreviation CE (Community Edition) and we are happy to see you in the ranks of people improving this aircraft. There is actually a lot of work to do!

***Something doesn't work for me!*** Go to [Issues](https://github.com/mixMugz/An-24/issues) and detail your problem. Be sure to attach LOG.txt and briefly describe how to reproduce the error.

---

What is this modification for and what goals does it pursue?

The global goal is to make an airplane model at the level of payware projects, but with freeware =)
>Be like a @zibo!11

In particular, the primary goals:

1. **VR support.** At the moment, flying in VR and flying an airplane is not possible. This is the primary goal!
2. **Native manipulators.** Based on the first goal, it is necessary to redo all the controls for native manipulators.
3. **Control.** Not all elements are currently available for assignment to buttons / keys. Some are assigned to illogical systems. This needs to be fixed.
4. **Moving to SASL3.** Because SASL2 (on which the plane was originally built) is very bad friends with VR, there is only one solution: moving to SASL3.
5. **Further development.** There are a lot of controversial and incomplete points in the model and we will fix it!

## Installation

Everything brought to its logical conclusion will be laid out in the [release archive](https://github.com/mixMugz/An-24/releases). All the latest changes can be downloaded via *skunkcraft_updaters* or by picking up the source code archive.

1. To install, you need to copy the contents of the archive to your root `X-Plane 11`. The plane will be installed in the folder `\X-Plane 11\Aircraft\Antonov\An-24\`
2. The folder `KLN 90B Navdata` (navbase for KLN) should be at the root of X-Plane 11. If you already have navbase, then you don't need to copy it.
3. The `0.fms` file must be in the folder `X-Plane 11\Output\FMS plans\KLN 90B\`. It is also necessary for the KLN90b to work. If you already have this file from previous or other versions of KLN90b, then you do not need to overwrite it.

## Airplane launch

You can call the APA (GPU) in two ways:

1. We power the network from the battery and set COM2 (overhead) to 131.800 (The service window will appear)
2. Or by clicking on the An-24 menu in the lower left corner and select G.SVC (Service)

Then everything is simple and as usual. Remove window - switch the frequency (if included in the first option).

## Community

A community where you can discuss revision, leave wishes and offer help.

- [VK.com](https://vk.com/an24_ce)
- [Discord](https://discord.gg/tAfXsqV)

## Acknowledgments

Many thanks to Felis for the titanic work on the creation of the aircraft and for the permission to continue to refine it as an opensource project! And also to Nikolay Parshukov for his modification and wonderful ideas that he implemented!

Also many thanks for your participation and help in the project:

- Lionel Zamouth (for invaluable coding help)
- Todir (KLN90B mod)
- Atsamaz Khodov
- Mark Zhuravlev
- community "Leprosorium"

## License

GPL3

All additional modules, existing and subsequent are released under the license of the authors of these modules.
- KLN90B (by Falcon, modified by Todir @ forums.x-plane.org)
