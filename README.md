# Resume :crab: :computer: :radio:

[![Build](https://github.com/secretfader/resume/actions/workflows/build.yml/badge.svg)](https://github.com/secretfader/resume/actions/workflows/build.yml)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

The [resume](https://resume.secretfader.com) of engineer, security nerd, event organizer, and public speaker, [Nicholas Young][www].

## Development

Baseline system requirements for developing in this repository are as follows:

* [Git][git]
* [Git LFS][git-lfs]
* [Fedora][fedora] or [Ubuntu][ubuntu] Linux
* [Node.js][nodejs]
* [Zola][zola]

If you're looking for the pre-build script that installs Zola and various Node dependencies, read [`scripts/setup.sh`](scripts/setup.sh).

## Building Static Assets

Most of the workflow used for processing source files into HTML and an [accompanying PDF](scripts/generate-pdf.js) is contained in [`scripts/build.sh`](scripts/build.sh).

## Publishing

At the time of this writing, site artifacts are currently hosted and delivered by Netlify (although work is ongoing to remove that explicit dependency).

## License

Copyright 2019-2023 Nicholas Young. All rights reserved.

Markup and design may be used under the [3-Clause BSD License](LICENSE). However, republishing content without express permission is a violation of applicable laws.

[www]: https://secretfader.com
[git]: https://github.com/git/git
[git-lfs]: https://github.com/git-lfs/git-lfs
[fedora]: https://getfedora.org
[ubuntu]: https://ubuntu.com
[nodejs]: https://github.com/nodejs/node
[zola]: https://github.com/getzola/zola
