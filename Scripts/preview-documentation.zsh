#!/bin/zsh

##
##  preview-documentation.zsh
##  foundation-kit
##
##  Created by Fang Ling on 2026/3/7.
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##
##    http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.
##

FRAMEWORK_NAME="FoundationFramework"
SYMBOLS_FOLDER=".build/symbol-graphs"

# Extract the symbols
clang \
  -extract-api \
  --product-name=$FRAMEWORK_NAME \
  -o .build/symbol-graphs/$FRAMEWORK_NAME.symbols.json \
  -x c-header Sources/FoundationFrameworkEssentials/**/*.h \
  -I . \
  -isysroot $(xcrun --show-sdk-path) \
  -F $(xcrun --show-sdk-path)/System/Library/Frameworks

# Preview the documentation
$(xcrun --find docc) \
  preview \
  Sources/FoundationFrameworkEssentials/Documentation.docc \
  -o .build/.docc-build \
  --additional-symbol-graph-dir .build/symbol-graphs
