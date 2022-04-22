"""Creates projects from templates

When creating new projects, you typically end up manually creating the same folders (ex. src/proj/your_project)
and files (ex. readme.md, requirements.txt, src/proj/your_project/__init__.py, etc.). You also have to manually
add the same data to some of the project files (ex. project name at the top of the readme.md).

This script automates the creation of projects by using templates. This is similar but simplier than
cookiecutter (https://github.com/cookiecutter/cookiecutter).

When run, the script finds a specified template folder (ex. /templates/python_project for the given template name "python_project"),
copies all contained files and folders to the git root, and replaces all template tags with the appropriate values in file/folder paths,
file/folder names, and file contents.

Supported template tags:
- project_name
- project_description
- git_root
- git_user_name
- git_user_email

See /templates in this repo for examples
"""
import os
import re
import shutil
import subprocess as sp
from argparse import ArgumentDefaultsHelpFormatter, ArgumentParser

# custom settings
TEMPLATES_FOLDER = "templates"
TAG_PREFIX = "[[{{"
TAG_SUFFIX = "}}]]"

# git info
GIT_ROOT = sp.getoutput("git rev-parse --show-toplevel")
GIT_USER_NAME = sp.getoutput("git config user.name")
GIT_USER_EMAIL = sp.getoutput("git config user.email")

TAG_DATA = {}


def join_paths(paths: list) -> str:
    """Returns a joined list of os paths

    Performs an os.path.join on a list of paths, removing leading slashes to avoid
    os.path.join errprs

    """
    result = ""
    for index, path in enumerate(paths):
        if index == 0:
            result = path
        else:
            if path[0] == "/" or path[0] == "\\":
                path = path[1:]
            result = os.path.join(result, path)

    return result


def replace_tags(file_path: str, tag_data: dict) -> None:
    """Replaces tags within a file"""
    print(f"Replacing tags in {file_path}...")

    # Read contents from file as a single string
    try:
        file_handle = open(file_path, "r", encoding="utf-8")
        file_contents = file_handle.read()
        file_handle.close()
    except UnicodeDecodeError:
        # example: .DS_STORE
        print(f"Skipping tag replacement for non-UTF-8 encoded file: {file_path}")
        return

    # replace tags
    for tag_name, tag_value in tag_data.items():
        pattern = re.compile(re.escape(TAG_PREFIX + tag_name + TAG_SUFFIX), re.IGNORECASE)
        file_contents = pattern.sub(tag_value, file_contents)

    # Write contents to file.
    file_handle = open(file_path, "w", encoding="utf-8")
    file_handle.write(file_contents)
    file_handle.close()


def process_item(template_folder: str, item_path: str, project_name: str, project_description: str) -> None:
    """Replaces tags for a given folder or file"""

    print(f"Processing {item_path}...")

    # get new item path
    new_item_path = re.split(template_folder, item_path, flags=re.IGNORECASE, maxsplit=1)[1]
    # replace tag names in file/folder
    for tag_name, tag_value in TAG_DATA.items():
        pattern = re.compile(re.escape(TAG_PREFIX + tag_name + TAG_SUFFIX), re.IGNORECASE)
        new_item_path = pattern.sub(tag_value, new_item_path)

    new_item_path = join_paths([GIT_ROOT, new_item_path])

    # create folder/file
    if os.path.isdir(item_path):
        if not os.path.exists(new_item_path):
            os.makedirs(new_item_path)
    else:
        if os.path.exists(new_item_path):
            print(f"Deleting existing destination file: {new_item_path}")
            os.remove(new_item_path)

        shutil.copyfile(item_path, new_item_path)

        # replace content
        replace_tags(file_path=new_item_path, tag_data=TAG_DATA)


if __name__ == "__main__":
    # Parse command line arguments
    parser = ArgumentParser(formatter_class=ArgumentDefaultsHelpFormatter)
    parser.add_argument(
        "-t", "--template", required=True, default="python_project", help="Name of your template (ex. python_project)"
    )
    parser.add_argument(
        "-n", "--name", required=True, default="example_app", help="Name of your project (ex. example_app)"
    )
    parser.add_argument(
        "-d",
        "--description",
        required=True,
        default="This is my project description",
        help="Description of your project",
    )
    args = vars(parser.parse_args())

    # Set up parameters
    template = args["template"]
    project_name = args["name"]
    project_description = args["description"]

    TAG_DATA = {
        "project_name": project_name,
        "project_description": project_description,
        "git_root": GIT_ROOT,
        "git_user_name": GIT_USER_NAME,
        "git_user_email": GIT_USER_EMAIL,
    }

    # debug info
    print("tag data:")
    for tag_name, tag_value in TAG_DATA.items():
        print(f"\t{tag_name}={tag_value}")
    print("")

    # get full template folder path
    template_folder = join_paths([GIT_ROOT, TEMPLATES_FOLDER, template])

    # check template
    if not os.path.exists(template_folder):
        raise Exception(f"Template folder not found: {template_folder}")

    if not os.path.isdir(template_folder):
        raise Exception(f"Template folder is not a directory: {template_folder}")

    # process template
    print(f"Creating project from template: {template_folder}")
    for root, subdirectories, files in os.walk(template_folder):
        for subdirectory in subdirectories:
            process_item(
                template_folder=template_folder,
                item_path=join_paths([root, subdirectory]),
                project_name=project_name,
                project_description=project_description,
            )
        for file in files:
            process_item(
                template_folder=template_folder,
                item_path=join_paths([root, file]),
                project_name=project_name,
                project_description=project_description,
            )

    print("Project Creation Complete")
