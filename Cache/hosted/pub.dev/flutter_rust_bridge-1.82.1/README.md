# [flutter_rust_bridge](https://github.com/fzyzcjy/flutter_rust_bridge): High-level memory-safe binding generator for Flutter/Dart <-> Rust

[![Rust Package](https://img.shields.io/crates/v/flutter_rust_bridge.svg)](https://crates.io/crates/flutter_rust_bridge)
[![Flutter Package](https://img.shields.io/pub/v/flutter_rust_bridge.svg)](https://pub.dev/packages/flutter_rust_bridge)
[![Stars](https://img.shields.io/github/stars/fzyzcjy/flutter_rust_bridge)](https://github.com/fzyzcjy/flutter_rust_bridge)
[![CI](https://github.com/fzyzcjy/flutter_rust_bridge/actions/workflows/ci.yaml/badge.svg)](https://github.com/fzyzcjy/flutter_rust_bridge/actions/workflows/ci.yaml)
[![Example](https://github.com/fzyzcjy/flutter_rust_bridge/actions/workflows/post_release.yaml/badge.svg)](https://github.com/fzyzcjy/flutter_rust_bridge/actions/workflows/post_release.yaml)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/6afbdad19e7245adbf9e9771777be3d7)](https://app.codacy.com/gh/fzyzcjy/flutter_rust_bridge?utm_source=github.com&utm_medium=referral&utm_content=fzyzcjy/flutter_rust_bridge&utm_campaign=Badge_Grade_Settings)

[<img src="https://github.com/fzyzcjy/flutter_rust_bridge/raw/master/book/flutter_favorite.png" width="200" />](https://flutter.dev/docs/development/packages-and-plugins/favorites)

![Logo](https://github.com/fzyzcjy/flutter_rust_bridge/raw/master/book/logo.png)

Want to combine the best between [Flutter](https://flutter.dev/), a cross-platform hot-reload rapid-development UI toolkit, and [Rust](https://www.rust-lang.org/), a language empowering everyone to build reliable and efficient software? Here it comes!

## 🚀 Advantages

* **Memory-safe**: Never need to think about malloc/free.
* **Feature-rich**: `enum`s with values, platform-optimized `Vec`, possibly recursive `struct`, zero-copy big arrays, opaque types on arbitrary structs/classes, `Stream` (iterator) abstraction, error (`Result`) handling, cancellable tasks, concurrency control, and more. See full features [here](https://fzyzcjy.github.io/flutter_rust_bridge/feature.html).
* **Async programming**: Rust code will never block the Flutter. Call Rust naturally from Flutter's main isolate (thread); sync mode also equally supported.
* **Lightweight**: This is not a huge framework that includes everything, so you are free to use your favorite Flutter and Rust libraries. <sub>For example, state-management with Flutter library (e.g. MobX) can be elegant and simple (contrary to implementing in Rust); implementing a photo manipulation algorithm in Rust will be fast and safe (countrary to implementing in Flutter).</sub>
* **Cross-platform**: Android, iOS, Windows, Linux, MacOS, and Web.
* **Easy to code-review & convince yourself**: This package simply simulates how humans  write boilerplate code. If you want to convince yourself (or your team) that it is safe, there is not much code to look at. No magic at all! ([More about](https://fzyzcjy.github.io/flutter_rust_bridge/safety.html) safety concerns.)
* **Fast**: It is only a thin (though feature-rich) wrapper, without overhead such as protobuf serialization, thus performant. (More [benchmarks](https://github.com/fzyzcjy/flutter_rust_bridge/issues/318#issuecomment-1034536815) later) <small>(Throw away components like thread-pool to make it even faster)</small>
* **Pure-Dart compatible:** Despite the name, this package is 100% compatible with [pure](https://github.com/fzyzcjy/flutter_rust_bridge/blob/master/frb_example/pure_dart/README.md) Dart.

## 💡 User Guide

Check out [the user guide](https://fzyzcjy.github.io/flutter_rust_bridge/) for [show-me-the-code](https://fzyzcjy.github.io/flutter_rust_bridge/quickstart.html), [tutorials](https://fzyzcjy.github.io/flutter_rust_bridge/tutorial_with_flutter.html), [features](https://fzyzcjy.github.io/flutter_rust_bridge/feature.html) and much more.

## 📎 P.S. Achieve ~60 FPS, no matter how janky the Flutter app was due to build/layout

Here is my another open-source library :) https://github.com/fzyzcjy/flutter_smooth.

## ✨ Contributors

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-74-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key) following [all-contributors](https://github.com/all-contributors/all-contributors) specification):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/fzyzcjy"><img src="https://avatars.githubusercontent.com/u/5236035?v=4?s=100" width="100px;" alt="fzyzcjy"/><br /><sub><b>fzyzcjy</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=fzyzcjy" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=fzyzcjy" title="Documentation">📖</a> <a href="#example-fzyzcjy" title="Examples">💡</a> <a href="#ideas-fzyzcjy" title="Ideas, Planning, & Feedback">🤔</a> <a href="#maintenance-fzyzcjy" title="Maintenance">🚧</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Desdaemon"><img src="https://avatars.githubusercontent.com/u/36768030?v=4?s=100" width="100px;" alt="Viet Dinh"/><br /><sub><b>Viet Dinh</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Desdaemon" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Desdaemon" title="Tests">⚠️</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Desdaemon" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/SecondFlight"><img src="https://avatars.githubusercontent.com/u/6700184?v=4?s=100" width="100px;" alt="Joshua Wade"/><br /><sub><b>Joshua Wade</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=SecondFlight" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/smw-wagnerma"><img src="https://avatars.githubusercontent.com/u/66412697?v=4?s=100" width="100px;" alt="Marcel"/><br /><sub><b>Marcel</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=smw-wagnerma" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/rustui"><img src="https://avatars.githubusercontent.com/u/90625190?v=4?s=100" width="100px;" alt="rustui"/><br /><sub><b>rustui</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=rustui" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://adventures.michaelfbryan.com/"><img src="https://avatars.githubusercontent.com/u/17380079?v=4?s=100" width="100px;" alt="Michael Bryan"/><br /><sub><b>Michael Bryan</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Michael-F-Bryan" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://bus710.net"><img src="https://avatars.githubusercontent.com/u/8920680?v=4?s=100" width="100px;" alt="bus710"/><br /><sub><b>bus710</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=bus710" title="Documentation">📖</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://scholar.google.com/citations?user=RbAto7EAAAAJ"><img src="https://avatars.githubusercontent.com/u/1213857?v=4?s=100" width="100px;" alt="Sebastian Urban"/><br /><sub><b>Sebastian Urban</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=surban" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/trobanga"><img src="https://avatars.githubusercontent.com/u/8888869?v=4?s=100" width="100px;" alt="Daniel"/><br /><sub><b>Daniel</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=trobanga" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/AlienKevin"><img src="https://avatars.githubusercontent.com/u/22850071?v=4?s=100" width="100px;" alt="Kevin Li"/><br /><sub><b>Kevin Li</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=AlienKevin" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=AlienKevin" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://valeth.me"><img src="https://avatars.githubusercontent.com/u/3198362?v=4?s=100" width="100px;" alt="Patrick Auernig"/><br /><sub><b>Patrick Auernig</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=valeth" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://antonok.com"><img src="https://avatars.githubusercontent.com/u/22821309?v=4?s=100" width="100px;" alt="Anton Lazarev"/><br /><sub><b>Anton Lazarev</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=antonok-edm" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Unoqwy"><img src="https://avatars.githubusercontent.com/u/65187632?v=4?s=100" width="100px;" alt="Unoqwy"/><br /><sub><b>Unoqwy</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Unoqwy" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://feber.dev"><img src="https://avatars.githubusercontent.com/u/1727318?v=4?s=100" width="100px;" alt="Febrian Setianto"/><br /><sub><b>Febrian Setianto</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=feber" title="Documentation">📖</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Syndim"><img src="https://avatars.githubusercontent.com/u/835035?v=4?s=100" width="100px;" alt="syndim"/><br /><sub><b>syndim</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=syndim" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/sagudev"><img src="https://avatars.githubusercontent.com/u/16504129?v=4?s=100" width="100px;" alt="sagu"/><br /><sub><b>sagu</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=sagudev" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=sagudev" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://bandism.net/"><img src="https://avatars.githubusercontent.com/u/22633385?v=4?s=100" width="100px;" alt="Ikko Ashimine"/><br /><sub><b>Ikko Ashimine</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=eltociear" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/alanlzhang"><img src="https://avatars.githubusercontent.com/u/59032810?v=4?s=100" width="100px;" alt="alanlzhang"/><br /><sub><b>alanlzhang</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=alanlzhang" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=alanlzhang" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/sccheruku"><img src="https://avatars.githubusercontent.com/u/5800058?v=4?s=100" width="100px;" alt="Sai Chaitanya"/><br /><sub><b>Sai Chaitanya</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=sccheruku" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://ares.zone (国内)"><img src="https://avatars.githubusercontent.com/u/40336192?v=4?s=100" width="100px;" alt="Ares Andrew"/><br /><sub><b>Ares Andrew</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=TENX-S" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/raphaelrobert"><img src="https://avatars.githubusercontent.com/u/9882746?v=4?s=100" width="100px;" alt="raphaelrobert"/><br /><sub><b>raphaelrobert</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=raphaelrobert" title="Documentation">📖</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/thomas725"><img src="https://avatars.githubusercontent.com/u/68635351?v=4?s=100" width="100px;" alt="thomas725"/><br /><sub><b>thomas725</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=thomas725" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://dport.me"><img src="https://avatars.githubusercontent.com/u/7816187?v=4?s=100" width="100px;" alt="Daniel Porteous (dport)"/><br /><sub><b>Daniel Porteous (dport)</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=banool" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/w-ensink"><img src="https://avatars.githubusercontent.com/u/46427708?v=4?s=100" width="100px;" alt="Wouter Ensink"/><br /><sub><b>Wouter Ensink</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=w-ensink" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/dbsxdbsx"><img src="https://avatars.githubusercontent.com/u/17372655?v=4?s=100" width="100px;" alt="老董"/><br /><sub><b>老董</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=dbsxdbsx" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=dbsxdbsx" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/lattice0"><img src="https://avatars.githubusercontent.com/u/6632321?v=4?s=100" width="100px;" alt="Lattice 0"/><br /><sub><b>Lattice 0</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=lattice0" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=lattice0" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://soeur.dev"><img src="https://avatars.githubusercontent.com/u/26034975?v=4?s=100" width="100px;" alt="orange soeur"/><br /><sub><b>orange soeur</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=juzi5201314" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Roms1383"><img src="https://avatars.githubusercontent.com/u/21016014?v=4?s=100" width="100px;" alt="Rom's"/><br /><sub><b>Rom's</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Roms1383" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Roms1383" title="Documentation">📖</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Cupnfish"><img src="https://avatars.githubusercontent.com/u/40173605?v=4?s=100" width="100px;" alt="Cupnfish"/><br /><sub><b>Cupnfish</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Cupnfish" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/SoLongAndThanksForAllThePizza"><img src="https://avatars.githubusercontent.com/u/103753680?v=4?s=100" width="100px;" alt="SoLongAnd..."/><br /><sub><b>SoLongAnd...</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=SoLongAndThanksForAllThePizza" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=SoLongAndThanksForAllThePizza" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Stonks3141"><img src="https://avatars.githubusercontent.com/u/82178396?v=4?s=100" width="100px;" alt="Sam Nystrom"/><br /><sub><b>Sam Nystrom</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Stonks3141" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://i.hsfzxjy.site"><img src="https://avatars.githubusercontent.com/u/4702188?v=4?s=100" width="100px;" alt="hsfzxjy"/><br /><sub><b>hsfzxjy</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=hsfzxjy" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://tmpfs.org"><img src="https://avatars.githubusercontent.com/u/238069?v=4?s=100" width="100px;" alt="muji"/><br /><sub><b>muji</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=tmpfs" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Zaitam"><img src="https://avatars.githubusercontent.com/u/71014214?v=4?s=100" width="100px;" alt="Zaitam"/><br /><sub><b>Zaitam</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Zaitam" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/alexthe2"><img src="https://avatars.githubusercontent.com/u/33789063?v=4?s=100" width="100px;" alt="Alex Procelewski"/><br /><sub><b>Alex Procelewski</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=alexthe2" title="Documentation">📖</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=alexthe2" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://matrix.to/#/@vincentherl:matrix.org"><img src="https://avatars.githubusercontent.com/u/5569193?v=4?s=100" width="100px;" alt="Vincent Herlemont"/><br /><sub><b>Vincent Herlemont</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=vincent-herlemont" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/CicadaCinema"><img src="https://avatars.githubusercontent.com/u/52425971?v=4?s=100" width="100px;" alt="CicadaCinema"/><br /><sub><b>CicadaCinema</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=CicadaCinema" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=CicadaCinema" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/rogurotus"><img src="https://avatars.githubusercontent.com/u/61418195?v=4?s=100" width="100px;" alt="rogurotus"/><br /><sub><b>rogurotus</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=rogurotus" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=rogurotus" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/huang12zheng"><img src="https://avatars.githubusercontent.com/u/28038074?v=4?s=100" width="100px;" alt="huang12zheng"/><br /><sub><b>huang12zheng</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=huang12zheng" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=huang12zheng" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://svenstaro.org"><img src="https://avatars.githubusercontent.com/u/1664?v=4?s=100" width="100px;" alt="Sven-Hendrik Haase"/><br /><sub><b>Sven-Hendrik Haase</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=svenstaro" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/ngasull"><img src="https://avatars.githubusercontent.com/u/912991?v=4?s=100" width="100px;" alt="Nicolas Gasull"/><br /><sub><b>Nicolas Gasull</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=ngasull" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/codercengiz"><img src="https://avatars.githubusercontent.com/u/45819755?v=4?s=100" width="100px;" alt="codercengiz"/><br /><sub><b>codercengiz</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=codercengiz" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://www.floeschner.de/"><img src="https://avatars.githubusercontent.com/u/12967904?v=4?s=100" width="100px;" alt="Fabian Löschner"/><br /><sub><b>Fabian Löschner</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=w1th0utnam3" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://gsconrad.com"><img src="https://avatars.githubusercontent.com/u/15874617?v=4?s=100" width="100px;" alt="Gregory Conrad"/><br /><sub><b>Gregory Conrad</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=GregoryConrad" title="Documentation">📖</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=GregoryConrad" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://www.zaynetro.com/"><img src="https://avatars.githubusercontent.com/u/627197?v=4?s=100" width="100px;" alt="Roman Zaynetdinov"/><br /><sub><b>Roman Zaynetdinov</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=zaynetro" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/jsonmona"><img src="https://avatars.githubusercontent.com/u/105187344?v=4?s=100" width="100px;" alt="jsonmona"/><br /><sub><b>jsonmona</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=jsonmona" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/utilForever"><img src="https://avatars.githubusercontent.com/u/5622661?v=4?s=100" width="100px;" alt="Chris Ohk"/><br /><sub><b>Chris Ohk</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=utilForever" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Demezy"><img src="https://avatars.githubusercontent.com/u/38487319?v=4?s=100" width="100px;" alt="._."/><br /><sub><b>._.</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Demezy" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/elliotsayes"><img src="https://avatars.githubusercontent.com/u/7699058?v=4?s=100" width="100px;" alt="elliotsayes"/><br /><sub><b>elliotsayes</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=elliotsayes" title="Documentation">📖</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/temeddix"><img src="https://avatars.githubusercontent.com/u/66480156?v=4?s=100" width="100px;" alt="Kim Dong-Hyun"/><br /><sub><b>Kim Dong-Hyun</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=temeddix" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=temeddix" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Voklen"><img src="https://avatars.githubusercontent.com/u/56766748?v=4?s=100" width="100px;" alt="Alex Gorichev"/><br /><sub><b>Alex Gorichev</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=Voklen" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/nitn3lav"><img src="https://avatars.githubusercontent.com/u/77448526?v=4?s=100" width="100px;" alt="nitn3lav"/><br /><sub><b>nitn3lav</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=nitn3lav" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=nitn3lav" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/polypixeldev"><img src="https://avatars.githubusercontent.com/u/79737178?v=4?s=100" width="100px;" alt="polypixeldev"/><br /><sub><b>polypixeldev</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=polypixeldev" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/anstadnik"><img src="https://avatars.githubusercontent.com/u/40110937?v=4?s=100" width="100px;" alt="Andrii Stadnik"/><br /><sub><b>Andrii Stadnik</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=anstadnik" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/coder0xff"><img src="https://avatars.githubusercontent.com/u/2261949?v=4?s=100" width="100px;" alt="Brent Lewis"/><br /><sub><b>Brent Lewis</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=coder0xff" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=coder0xff" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/erikas-taroza"><img src="https://avatars.githubusercontent.com/u/68450090?v=4?s=100" width="100px;" alt="Erikas Taroza"/><br /><sub><b>Erikas Taroza</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=erikas-taroza" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/escwxyz"><img src="https://avatars.githubusercontent.com/u/124119483?v=4?s=100" width="100px;" alt="J"/><br /><sub><b>J</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=escwxyz" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://monitzer.com"><img src="https://avatars.githubusercontent.com/u/644763?v=4?s=100" width="100px;" alt="Andreas Monitzer"/><br /><sub><b>Andreas Monitzer</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=anlumo" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://satvikpendem.com"><img src="https://avatars.githubusercontent.com/u/42670561?v=4?s=100" width="100px;" alt="Satvik Pendem"/><br /><sub><b>Satvik Pendem</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=satvikpendem" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://phlip9.com"><img src="https://avatars.githubusercontent.com/u/918989?v=4?s=100" width="100px;" alt="Philip Kannegaard Hayes"/><br /><sub><b>Philip Kannegaard Hayes</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=phlip9" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://thesimplekid.com"><img src="https://avatars.githubusercontent.com/u/8606367?v=4?s=100" width="100px;" alt="thesimplekid"/><br /><sub><b>thesimplekid</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=thesimplekid" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/jaiakash"><img src="https://avatars.githubusercontent.com/u/33419526?v=4?s=100" width="100px;" alt="Akash Jaiswal"/><br /><sub><b>Akash Jaiswal</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=jaiakash" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/MnlPhlp"><img src="https://avatars.githubusercontent.com/u/33608297?v=4?s=100" width="100px;" alt="Manuel Philipp"/><br /><sub><b>Manuel Philipp</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=MnlPhlp" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=MnlPhlp" title="Documentation">📖</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/lker-dev"><img src="https://avatars.githubusercontent.com/u/40730443?v=4?s=100" width="100px;" alt="Jonathan"/><br /><sub><b>Jonathan</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=lker-dev" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://lipoic.org"><img src="https://avatars.githubusercontent.com/u/48402225?v=4?s=100" width="100px;" alt="菘菘"/><br /><sub><b>菘菘</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=SiongSng" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://gutenfries.deno.dev"><img src="https://avatars.githubusercontent.com/u/79616833?v=4?s=100" width="100px;" alt="Marc Gutenberger"/><br /><sub><b>Marc Gutenberger</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=gutenfries" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/aran"><img src="https://avatars.githubusercontent.com/u/5295?v=4?s=100" width="100px;" alt="Aran Donohue"/><br /><sub><b>Aran Donohue</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=aran" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/powpingdone"><img src="https://avatars.githubusercontent.com/u/20116021?v=4?s=100" width="100px;" alt="Aidan"/><br /><sub><b>Aidan</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=powpingdone" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/vimaxwell"><img src="https://avatars.githubusercontent.com/u/19898639?v=4?s=100" width="100px;" alt="max"/><br /><sub><b>max</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=vimaxwell" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/DMouayad"><img src="https://avatars.githubusercontent.com/u/82384138?v=4?s=100" width="100px;" alt="Mouayad Alhamwi"/><br /><sub><b>Mouayad Alhamwi</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=DMouayad" title="Documentation">📖</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://blog.nightfeather.dev/"><img src="https://avatars.githubusercontent.com/u/77222233?v=4?s=100" width="100px;" alt="NightFeather"/><br /><sub><b>NightFeather</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=NightFeather0615" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/JustSimplyKyle"><img src="https://avatars.githubusercontent.com/u/68589851?v=4?s=100" width="100px;" alt="SimplyKyle!"/><br /><sub><b>SimplyKyle!</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=JustSimplyKyle" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://www.upsuper.org/"><img src="https://avatars.githubusercontent.com/u/333750?v=4?s=100" width="100px;" alt="Xidorn Quan"/><br /><sub><b>Xidorn Quan</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=upsuper" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/not-holar"><img src="https://avatars.githubusercontent.com/u/58831297?v=4?s=100" width="100px;" alt="Vitalii Hurianov"/><br /><sub><b>Vitalii Hurianov</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_rust_bridge/commits?author=not-holar" title="Documentation">📖</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

More specifically, thanks for all these contributions:

* [Desdaemon](https://github.com/Desdaemon): Support not only simple enums but also enums with fields which gets translated to native enum or sealed freezed class in Dart. Support the Option type as nullable types in Dart. Support Vec of Strings type. Support tuple type. Support comments in code. Add marker attributes for future usage. Add Linux and Windows support for with-flutter example, and make CI works for that. Avoid parameter collision. Overhaul the documentation and add several chapters to demonstrate configuring a Flutter+Rust project in all five platforms. Refactor command module. Precompiled binary CI workflow. Fix bugs. Add support for the Web platform, parallel to the existing mobile/desktop platforms, via WASM and JavaScript as intermediate values. GitHub retry actions. Implement draft of opaque types. Refactor Boxed and Option. Impl list of dates. Parameter defaults. Refactor CLI. Refactor codegen errors.
* [rogurotus](https://github.com/rogurotus): Add Rust opaque types, enabling arbitrary Rust structs to be used as opaque Dart objects by generating wrappers and raw Arc pointers, as well as Dart opaque types, allowing to use any Dart objects in Rust code. Extend `SyncReturn` for more types. Fix generation bug. Fix SyncReturn. Migrate to dart-sys. Update CI. Fix linters.
* [ngasull](https://github.com/ngasull): Make sync mode support whatever types that classical async mode supports. Bump sdk.
* [SecondFlight](https://github.com/SecondFlight): Allow structs and enums to be imported from other files within the crate by creating source graph. Auto-create relevant dir. Fix `store_dart_post_cobject` error with ffigen 6.0.
* [lattice0](https://github.com/lattice0): Implement hierarchy of exceptions. Support methods, such that Rust struct impls can be converted to Dart class methods. StreamSink at any argument.
* [Unoqwy](https://github.com/Unoqwy): Add struct mirrors, such that types in the external crates can be imported and used without redefining and copying.
* [antonok-edm](https://github.com/antonok-edm): Avoid converting syn types to strings before parsing to improve code and be more robust.
* [sagudev](https://github.com/sagudev): Make code generator a `lib`. Add error types. Depend on `cbindgen`. Fix LLVM paths. Update deps. Fix CI errors.
* [surban](https://github.com/surban): Support unit return type. Skip unresolvable modules. Ignore prefer_const_constructors. Non-final Dart fields.
* [Roms1383](https://github.com/Roms1383): Fix build_runner calling bug. Remove global `ffigen` dependency. Improve version check. Fix enum name-variant conflicts. Support Chrono date time and UUID types. Migrate to Rust 1.64 workspace. Update and refactor CI. Update header comments. Code cleanup.
* [GregoryConrad](https://github.com/GregoryConrad): Add doc to setup frb inside a Dart/Flutter library.
* [dbsxdbsx](https://github.com/dbsxdbsx): Allow generating multiple Rust and Dart files. Fix lint. Update doc. Add logging.
* [huang12zheng](https://github.com/huang12zheng): Support type aliases and nested ones. Tweak code generation. Fix rust_build_and_test on Mac. Improve CI logic and cache. Remove bridge field in model.
* [trobanga](https://github.com/trobanga): Add support for `[T;N]` structs. Add `usize` support. Add a cmd argument. Separate dart tests. Fix fallible list case.
* [MnlPhlp](https://github.com/MnlPhlp): Support macros and will auto expand. Allow mirror types in streams.
* [SoLongAndThanksForAllThePizza](https://github.com/SoLongAndThanksForAllThePizza): Refactor and enhance SyncReturn to support more types. Refactor post-release CI.
* [hsfzxjy](https://github.com/hsfzxjy): Fix SyncReturn use-after-free bug.
* [Cupnfish](https://github.com/Cupnfish): Support arrays as function parameters. Allow multi mirror.
* [alanlzhang](https://github.com/alanlzhang): Add generation for Dart metadata. Enhance module parser. Fix enum in struct. Fix linter.
* [temeddix](https://github.com/temeddix): Fix broken CI. Custom num workers. Fix MacOS doc steps. Update doc. Make zero-copy defaultable.
* [Zaitam](https://github.com/Zaitam): Fix when method return struct. Partial migration to Dart 3.
* [erikas-taroza](https://github.com/erikas-taroza): Support list of primitive enums. Make enum camelCase. Warn wrong path. Fix cargo expand.
* [nitn3lav](https://github.com/nitn3lav): nested `struct`s without `Box`.
* [alexthe2](https://github.com/alexthe2): Add Option Datetime. Add empty structs. Improve doc. Add `r#`. Fix mirror enum bug.
* [SiongSng](https://github.com/SiongSng): Finish implementing exception hierarchy. Fix SyncReturn bug.
* [AlienKevin](https://github.com/AlienKevin): Add flutter example for macOS. Add doc for Android NDK bug.
* [banool](https://github.com/banool): Fix pubspec parsing. Fix symbol-stripping doc.
* [coder0xff](https://github.com/coder0xff): Refactor SupportedInnerType. Extra codegen tester.
* [anlumo](https://github.com/anlumo): Fix freezed + methods. Non-clone RustOpaque.
* [NightFeather0615](https://github.com/NightFeather0615): Fix Vec bool.
* [powpingdone](https://github.com/powpingdone): Document JNI init and libc++_static linking.
* [efc-mw](https://github.com/efc-mw): Improve Windows encoding handling.
* [valeth](https://github.com/valeth): Rename callFfi's port.
* [sccheruku](https://github.com/sccheruku): Prevent double-generating utility.
* [jsonmona](https://github.com/jsonmona): Add import.
* [upsuper](https://github.com/upsuper): Refactor delegate-attr.
* [w-ensink](https://github.com/w-ensink): Improve doc. Fix CI. Refactor. Add tests.
* [codercengiz](https://github.com/codercengiz): Fix mirroring bug.
* [Michael-F-Bryan](https://github.com/Michael-F-Bryan): Detect broken bindings.
* [phlip9](https://github.com/phlip9): Fix no-serde compilation.
* [bus710](https://github.com/bus710): Add a case in troubleshooting.
* [Demezy](https://github.com/Demezy): Mention troubleshooting.
* [gutenfries](https://github.com/gutenfries): Bump proc-macros.
* [anstadnik](https://github.com/anstadnik): Check keywords.
* [aran](https://github.com/aran): Fix pubspec. Bump version.
* [Syndim](https://github.com/Syndim): Add a bracket to box.
* [TENX-S](https://github.com/TENX-S): Improve doc. Reproduce a bug.
* [polypixeldev](https://github.com/polypixeldev): Improve doc.
* [CicadaCinema](https://github.com/CicadaCinema): Bump version. Improve doc.
* [w1th0utnam3](https://github.com/w1th0utnam3): Improve message.
* [vincent-herlemont](https://github.com/vincent-herlemont): Loosen version.
* [zaynetro](https://github.com/zaynetro): Improve doc.
* [raphaelrobert](https://github.com/raphaelrobert): Remove oudated doc.
* [DMouayad](https://github.com/DMouayad): Improve doc.
* [elliotsayes](https://github.com/elliotsayes): Improve doc.
* [tmpfs](https://github.com/tmpfs): Improve doc.
* [thomas725](https://github.com/thomas725): Improve doc.
* [juzi5201314](https://github.com/juzi5201314): Improve doc.
* [Voklen](https://github.com/Voklen): Improve doc.
* [svenstaro](https://github.com/svenstaro): Improve doc.
* [utilForever](https://github.com/utilForever): Fix typos.
* [not-holar](https://github.com/not-holar): Fix typos.
* [Stonks3141](https://github.com/Stonks3141): Fix doc credit.
* [vimaxwell](https://github.com/vimaxwell): Fix doc link.
* [lker-dev](https://github.com/lker-dev): Fix doc link.
* [jaiakash](https://github.com/jaiakash): Fix doc link.
* [feber](https://github.com/feber): Fix doc link.
* [satvikpendem](https://github.com/satvikpendem): Little co-work #989.
* [rustui](https://github.com/rustui): Fix a typo.
* [escwxyz](https://github.com/escwxyz): Fix a typo.
* [eltociear](https://github.com/eltociear): Fix a typo.
* [thesimplekid](https://github.com/thesimplekid): Fix a typo.
