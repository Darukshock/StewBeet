
# 🌐 stewbeet.plugins.auto.lang_file

📄 **Source Code**: [stewbeet/plugins/auto/lang_file/__init__.py](../../python_package/stewbeet/plugins/auto/lang_file/__init__.py) 🔗

## 📋 Overview
The `auto.lang_file` plugin automatically generates language files for datapacks.<br>
It scans all functions and loot tables for hardcoded text strings, extracts them into<br>
translation keys, replaces the original text with `translate` text component keys, and generates<br>
a comprehensive `en_us.json` language file for internationalization support.

## 🎯 Purpose
- 🌐 Automatically generates language files from hardcoded text
- 🔄 Converts `"text"` text component keys to `"translate"` keys
- 📝 Extracts text strings from functions and loot tables
- 🏷️ Creates standardized translation keys with project namespacing
- 🧹 Cleans and validates text content for language file inclusion
- 🚀 Enables internationalization support for datapacks

## 🔗 Dependencies
- **✅ Required**: Beet context with functions and/or loot tables
- **✅ Required**: Project ID for translation key namespacing
- **📍 Position**: Should run after content generation but before finalization
- **🔧 Optional**: Existing `en_us.json` language file (will be merged)
- **📋 Related**: Works with any plugins that generate text content

## ⚙️ Configuration

### 🎯 Basic Example Configuration
```yaml
# No configuration required - plugin runs automatically
# Processes all functions and loot tables by default
```

### 📋 Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| Text Extraction | automatic | Enabled | Scans all "text" fields in JSON content |
| Key Generation | automatic | Project-based | Uses project ID for translation key prefixes |
| Parallel Processing | automatic | 32 workers | Multi-threaded file processing for performance |
| Language Target | constant | `en_us` | Generates English language file by default |

## ✨ Features

### 🔍 Text Extraction Engine
Scans content for hardcoded text using regex patterns: [`utils.py#L9-L16`](../../python_package/stewbeet/plugins/auto/lang_file/utils.py#L9-L16)
- 📝 Uses advanced regex to find `"text": "value"` patterns
- 🔄 Handles escaped characters and various quote styles
- 📍 Tracks text positions for accurate replacement
- 🎯 Processes both single and double quoted strings

### 🏷️ Translation Key Generation
Creates standardized translation keys with project namespacing: [`utils.py#L37-L48`](../../python_package/stewbeet/plugins/auto/lang_file/utils.py#L37-L48)
- 🧹 Cleans text by removing special characters and normalizing case
- 📏 Limits key length to 64 characters for compatibility
- 🔧 Uses project ID prefix for unique namespacing
- ✅ Validates keys to ensure they contain meaningful content

### 🔄 Content Replacement System
Replaces hardcoded text with translate components: [`utils.py#L69-L91`](../../python_package/stewbeet/plugins/auto/lang_file/utils.py#L69-L91)
- 🔄 Converts `"text": "value"` to `"translate": "key"`
- 📍 Processes matches in reverse order to maintain position accuracy
- 🧹 Handles escape sequences and special characters properly
- ✅ Preserves JSON structure and formatting during replacement

### 🚀 Parallel Processing System
Efficiently processes multiple files using multi-threading: [`__init__.py#L19-L28`](../../python_package/stewbeet/plugins/auto/lang_file/__init__.py#L19-L28)
- ⚡ Uses up to 32 worker threads for fast processing
- 📊 Processes both functions and loot tables simultaneously
- 🎨 Provides colored progress indicators during execution
- 🔧 Optimizes worker count based on file quantity

### 📋 Language File Management
Generates and updates the English language file: [`__init__.py#L30-L32`](../../python_package/stewbeet/plugins/auto/lang_file/__init__.py#L30-L32)
- 📝 Creates `minecraft:en_us` language resource
- 🔄 Merges with existing language data if present
- 💾 Uses proper JSON formatting for compatibility
- 🌐 Sets up foundation for multi-language support

### 🧹 Content Validation System
Ensures only meaningful text gets processed: [`utils.py#L75-L81`](../../python_package/stewbeet/plugins/auto/lang_file/utils.py#L75-L81)
- ✅ Skips text without alphanumeric characters
- 🔍 Validates minimum key length requirements
- 🚫 Excludes Unicode escapes and template variables
- 🎯 Prevents duplicate keys with conflicting values 

