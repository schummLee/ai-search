#!/usr/bin/env python

import sys
import json

def main():
    # Get JSON string from command-line arguments
    json_str = sys.argv[1]

    # Parse JSON string to reconstruct the vector
    title_results = json.loads(json_str)

    # Print the reconstructed vector
    print("Received title results:", title_results)

if __name__ == "__main__":
    main()
