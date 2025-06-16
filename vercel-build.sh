#!/bin/bash

# Instalar Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Checar versão
flutter --version

# Build
flutter build web
