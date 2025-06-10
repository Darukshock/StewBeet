
# Configuration for GitHub
from config import *

# Import python datapack version
import sys
sys.path.insert(0, "../../")
from advanced_desktop.python_datapack.upgrade import current_version

# Configuration
github_config: dict = {
	"project_name": "PythonDatapackTemplate",
	"version": current_version,
	"build_folder": BUILD_FOLDER,
}

