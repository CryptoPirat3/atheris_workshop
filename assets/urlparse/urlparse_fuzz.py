#!/usr/bin/env python3

import atheris
import os
import sys

rfc_path = os.path.abspath("/src/rfc3986/")
sys.path.insert(0, "/src/rfc3986/src")


with atheris.instrument_imports():
    from rfc3986 import urlparse
    from rfc3986.exceptions import InvalidPort, InvalidAuthority


def TestOneInput(data):
    
    provider = atheris.FuzzedDataProvider(data)
    uri = provider.ConsumeUnicodeNoSurrogates(1024)

    try:
        result = urlparse(uri)
    except (InvalidAuthority, InvalidPort):
        pass


def main():
    atheris.Setup(sys.argv, TestOneInput)
    atheris.Fuzz()


if __name__ == "__main__":
    main()