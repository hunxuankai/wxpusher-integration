"""Offline checks for the distributable skill; never calls WxPusher."""

import argparse
import json
from pathlib import Path
import re
import sys

import yaml


def check(root: Path) -> tuple[int, int]:
    root = root.resolve(strict=True)
    main = (root / 'SKILL.md').read_text(encoding='utf-8')
    header = re.match(r'\A---\n(.*?)\n---(?:\n|$)', main, re.S)
    if not header:
        raise ValueError('SKILL.md must begin with YAML frontmatter')
    meta = yaml.safe_load(header.group(1))
    if not isinstance(meta, dict) or meta.get('name') != root.name:
        raise ValueError('Skill name must match its folder name')
    if not re.fullmatch(r'[a-z0-9]+(?:-[a-z0-9]+)*', meta['name']) or len(meta['name']) > 64:
        raise ValueError('Invalid skill name')
    description = meta.get('description')
    if not isinstance(description, str) or not 1 <= len(description) <= 1024:
        raise ValueError('Description must contain 1-1024 characters')
    metadata = meta.get('metadata')
    if not isinstance(metadata, dict) or not re.fullmatch(r'\d+\.\d+\.\d+', str(metadata.get('version', ''))):
        raise ValueError('Expected metadata.version in major.minor.patch format')
    links = count = 0
    for path in sorted(root.rglob('*')):
        if path.is_symlink():
            raise ValueError(f'Symlink cannot be packaged: {path.relative_to(root)}')
        if not path.is_file():
            continue
        relative = path.relative_to(root)
        if path.suffix not in {'.md', '.yaml'}:
            raise ValueError(f'Unexpected file; review packaging rules before adding: {relative}')
        text = path.read_text(encoding='utf-8')
        if re.search(r'\b(?:AT|SPT|UID)_[A-Za-z0-9]{16,}\b', text):
            raise ValueError(f'Credential/recipient-like value in {relative}; review without printing it')
        if '\ufffd' in text:
            raise ValueError(f'Replacement character in {relative}')
        if path.suffix == '.yaml':
            yaml.safe_load(text)
        else:
            for href in re.findall(r'\]\(([^)]+)\)', text):
                if re.match(r'[a-zA-Z][a-zA-Z0-9+.-]*:', href) or href.startswith('#'):
                    continue
                target = (path.parent / href.split('#', 1)[0]).resolve()
                if not target.is_relative_to(root) or not target.is_file():
                    raise ValueError(f'Broken/outside reference in {relative}: {href}')
                links += 1
            for block in re.findall(r'```json\n(.*?)\n```', text, re.S):
                json.loads(block)
        count += 1
    return count, links


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('skill', nargs='?', type=Path, default=Path(__file__).resolve().parents[1] / 'skills/wxpusher-integration')
    args = parser.parse_args()
    try:
        files, links = check(args.skill)
    except (ValueError, OSError, yaml.YAMLError) as error:
        print(f'FAIL: {error}', file=sys.stderr)
        sys.exit(1)
    print(f'PASS: {files} skill files, {links} local references; YAML, JSON examples and basic credential-shape checks.')
